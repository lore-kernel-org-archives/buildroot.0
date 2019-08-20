From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Aug 2019 00:48:01 +0200
Subject: [Buildroot] [RFC PATCH v3] package/util-linux: build programs
 and libraries in separate packages
In-Reply-To: <20190509220403.6422-1-unixmania@gmail.com>
References: <20190509220403.6422-1-unixmania@gmail.com>
Message-ID: <e922c9e6-7c20-c3ee-d621-429fb8a07892@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Carlos,

 A colleague of mine bumped into this issue, so I decided to finally try to
apply it :-) Also, we discussed this briefly at the hackaton two weeks ago, but
we didn't fully come to a conclusion then.

 However, while looking at it, I think I came up with a better (i.e. less
invasive idea). It started when I wanted to improve the commit message...

On 10/05/2019 00:04, unixmania at gmail.com wrote:
> From: Carlos Santos <unixmania@gmail.com>
> 
> The findmount and lsblk utilities need udev to work correctly but cannot
> be built with udev support because the packages providing libudev (eudev
> and systemd) depend on util-linux, creating a chicken-egg problem. 

 This is not at all limited to udev. So I wanted to rewrite this as:

----
The different tools and libraries in util-linux have a lot of optional
dependencies. When we want to support those optional dependencies, we can easily
generate dependency cycles. For instance, findmount and lsblk need udev to work
correctly, but eudev and systemd both depend on util-linux already.

Normal distros (e.g. Debian) solve this by building twice: first a minimal
package that has no dependencies at all, then build the packages that depend on
util-linux, and finally rebuild util-linux with all bells and whistles.
----

 ... and then I thought: why can't we do the same?


 So, the idea is to keep the util-linux package as is, and only introduce a new
util-linux-minimal package (instead of util-linux-libs). Or maybe it should
still be called util-linux-libs, since it really will only provide libraries.

 BTW, in either case, we have to make sure that the libraries that are built by
util-linux-minimal/libs really have no optional dependencies. For dynamic
linking, there is no problem because the interfaces (headers and exported
symbols in .so files) don't change due to optional dependencies. But for static
linking, it does obviously make a difference... Ideally we should be able to
verify that the configuration that is used by whatever is built by
util-linux-minimal really is identical to the full build, but I don't see a way
to do such a check...


 More about this proposal below, in addition to some other minor comments.

 Since I already started applying some of my proposed changes, and since the
rebase was a little bit tricky, I'll resend a v4 which does not implement my
util-linux-minimal proposal yet. You might not want to use that but instead
start from scratch, but it's good to have it as a reference. And anyway, you
might just disagree with my proposal. The things I already changed in v4 are
indicated with "(fixed)" below.

> Solve
> it by means of the following changes:
> 
> - Split util-linux into three packages:
>   - util-linux-libs, providing lib{blkid,fdisk,mount,smartcols,uuid}.
>   - util-linux-programs, providing both the aforementioned libs and the
>     programs.
>   - util-linux, a dummy package that drives configuration and building
>     of the other ones.
> - Add blind selections for -libs and -programs, i.e. they are indirectly
>   selected according to the util-linux options.
> - Make util-linux have build dependencies on util-linux-{libs,programs}
>   if they are selected.
> - host-util-linux has a build depencency on either host-util-linux-libs

 dependency (fixed)

>   or host-util-linux-programs (not on both, since they are installed on
>   the same destination).
> - Make eudev and systemd have build dependencies on util-linux-libs.

 This and the following point could be split off in separate patches: one for
systemd, one for eudev, and one for the optional dependency on udev.

>   This can be extended to other packages in the future but is not needed
>   right now because the configuration options are backward-compatible.
> - Make util-linux-programs have an optional build dependency on the
>   package that provides libudev (either eudev or systemd), if it is
>   selected.
> 
> util-linux-libs is installed on STAGING_DIR by default and on TARGET_DIR
> if util-linux-programs is not selected. Conversely, util-linux-programs
> installs on TARGET_DIR by default and on STAGING_DIR if util-linux-libs
> is not selected. This prevents installing the libraries twice on the
> same destination, which would confuse check-uniq-files.
> 
> With this approach we don't need to patch configuration files neither
> change other packages besides eudev and systemd. Other packages that
> require util-linux libraries and whose libraries can be used by
> util-linux programs can be updated later. We also don't need to change
> any existing defcconfig, since all configuration options are kept in
> the dummy util-linux package.
> 
> The main drawback of this approach is that util-linux-rebuild, as wel as
> -reinstall, -reconfigure and even -dirclean targets do not have real
> effect. It's necessary to use util-linux-libs-rebuild, for instance, but
> this is a reasonable price to pay for the solution.

 My proposal would avoid this issue too.

> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=11811

 The Fixes would only apply to the patch that really adds the optional
dependency on udev.

> Signed-off-by: Carlos Santos <unixmania@gmail.com>

 You forgot an empty line above the Sob (fixed).


> ---
> Changes v2->v3:
> - Fix typos that ruined the conditional installations on TARGET_DIR and
>   STAGING_DIR, as pointed by Yann E. Morin.
> Changes v1->v2:
> - Prevent double installation of the libraries.
> - Drop the intrusive patches and AUTORECONF
> - Move the the programs to a separate package
> - Convert util-linux into a dummy package that drives the other ones.
> - Keep configurations and dependencies backward-compatible, except for
>   eudev and systemd.
> - Make BR2_PACKAGE_UTIL_LINUX_LIBS a blind option
[snip]
> diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
> new file mode 100644
> index 0000000000..48d3373bb4
> --- /dev/null
> +++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
> @@ -0,0 +1,91 @@
> +################################################################################
> +#
> +# util-linux-libs
> +#
> +################################################################################
> +
> +UTIL_LINUX_LIBS_VERSION = $(UTIL_LINUX_VERSION)
> +UTIL_LINUX_LIBS_SOURCE = $(UTIL_LINUX_SOURCE)
> +UTIL_LINUX_LIBS_SITE = $(UTIL_LINUX_SITE)
> +UTIL_LINUX_LIBS_DL_SUBDIR = $(UTIL_LINUX_DL_SUBDIR)
> +
> +# README.licensing claims that some files are GPL-2.0 only, but this is not true.
> +# Some files are GPL-3.0+ but only in tests. rfkill uses an ISC-style license.
> +UTIL_LINUX_LIBS_LICENSE = LGPL-2.1+ (libblkid, libfdisk, libmount, libsmartcols), BSD-3-Clause (libuuid)
> +UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
> +	Documentation/licenses/COPYING.BSD-3-Clause \
> +	Documentation/licenses/COPYING.LGPL-2.1-or-later

 You could define a UTIL_LINUX_COMMON_LICENSE{,_FILES} in util-linux.mk and
reuse that here.

> +UTIL_LINUX_LIBS_INSTALL_STAGING = YES
> +# Prevent installing the libraries twice on TARGET_DIR
> +UTIL_LINUX_LIBS_INSTALL_TARGET = $(if $(BR2_PACKAGE_UTIL_LINUX_PROGRAMS),NO,YES)

 With my proposal, this could just become NO, because the full util-linux would
always be built as well.

> +UTIL_LINUX_LIBS_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)

 Do we really need host-pkgconf? We shouldnt, since there are no dependencies...

> +UTIL_LINUX_LIBS_CONF_OPTS += \
> +	--disable-rpath \
> +	--disable-makeinstall-chown
> +UTIL_LINUX_LIBS_LINK_LIBS = $(TARGET_NLS_LIBS)
> +
> +# systemd depends on util-linux so we enable systemd support

 enable -> disable?

> +# (which needs systemd to be installed)
> +UTIL_LINUX_LIBS_CONF_OPTS += \
> +	--without-systemd \
> +	--with-systemdsystemunitdir=no

 We should also do an explicit --disable/--without for all options that are not
covered below, so at least --without-python --without-ncurses.

> +
> +HOST_UTIL_LINUX_LIBS_DEPENDENCIES = host-pkgconf
> +HOST_UTIL_LINUX_LIBS_CONF_OPTS = --disable-makeinstall-chown

 Actually, I don't think we ever need host-util-linux-libs. At least for the
time being, there is no recursive dependency issue for host-util-linux because
we disable most optional dependencies. It can still be added if really required.

> +
> +# We also don't want the host-python dependency
> +HOST_UTIL_LINUX_LIBS_CONF_OPTS += --without-python
> +
> +# Prevent the installation from attempting to move shared libraries from
> +# ${usrlib_execdir} (/usr/lib) to ${libdir} (/lib), since both paths are
> +# the same when merged usr is in use.
> +ifeq ($(BR2_ROOTFS_MERGED_USR),y)
> +UTIL_LINUX_LIBS_CONF_OPTS += --bindir=/usr/bin --sbindir=/usr/sbin --libdir=/usr/lib
> +endif
> +
> +# Unfortunately, the util-linux does LIBS="" at the end of its
> +# configure script. So we have to pass the proper LIBS value when
> +# calling the configure script to make configure tests pass properly,
> +# and then pass it again at build time.
> +UTIL_LINUX_LIBS_CONF_ENV += LIBS="$(UTIL_LINUX_LIBS_LINK_LIBS)"
> +UTIL_LINUX_LIBS_MAKE_OPTS += LIBS="$(UTIL_LINUX_LIBS_LINK_LIBS)"
> +
> +# libmount optionally uses selinux
> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT)$(BR2_PACKAGE_LIBSELINUX),yy)
> +UTIL_LINUX_LIBS_DEPENDENCIES += libselinux

 Darn! The circular dependency that my colleague hit is one that involves
python, and python is an optional dependency of libselinux, so that is not going
to be avoided by this patch...

 So, on second thought, maybe we should simply not support util-linux-libs in
static-only scenarios. That allows us to just disable all optional dependencies
while building util-linux-libs and still be safe. And since both eudev and
systemd already depend on !static, the immediate use case is still covered.


> +UTIL_LINUX_LIBS_CONF_OPTS += --with-selinux
> +else
> +UTIL_LINUX_LIBS_CONF_OPTS += --without-selinux
> +endif
> +
> +# Disable utilities
> +UTIL_LINUX_LIBS_CONF_OPTS += \
> +	--disable-all-programs \
> +	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),--enable-libblkid,--disable-libblkid) \
> +	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBFDISK),--enable-libfdisk,--disable-libfdisk) \
> +	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),--enable-libmount,--disable-libmount) \
> +	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS),--enable-libsmartcols,--disable-libsmartcols) \
> +	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBUUID),--enable-libuuid,--disable-libuuid)

 I think it's better to really keep it minimal, i.e. only build the ones that
are really required by the packages that depend on it. So only libblkid and
libmount. That makes it a little bit easier to manually check that those really
have no optional dependency on anything that is not covered here.

> +
> +# In the host version of util-linux-libs, we only require libuuid and libmount
> +# (plus libblkid as an indirect dependency of libmount). So disable libfdisk
> +# and libsmartcols, unless BR2_PACKAGE_HOST_UTIL_LINUX is set.
> +HOST_UTIL_LINUX_LIBS_CONF_OPTS += \
> +	--enable-libblkid \
> +	$(if $(BR2_PACKAGE_HOST_UTIL_LINUX),--enable-libfdisk,--disable-libfdisk) \
> +	--enable-libmount \
> +	$(if $(BR2_PACKAGE_HOST_UTIL_LINUX),--enable-libsmartcols,--disable-libsmartcols) \
> +	--enable-libuuid \
> +	--without-ncurses \
> +	--without-ncursesw \
> +	--without-tinfo
> +
> +# Install libmount Python bindings
> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT)$(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),yy)
> +UTIL_LINUX_LIBS_CONF_OPTS += --with-python --enable-pylibmount
> +UTIL_LINUX_LIBS_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
> +UTIL_LINUX_LIBS_CONF_OPTS += --without-python --disable-pylibmount
> +endif
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> diff --git a/package/util-linux/0001-rtcwake-use-poweroff-if-shutdown-is-not-found.patch b/package/util-linux/util-linux-programs/0001-rtcwake-use-poweroff-if-shutdown-is-not-found.patch
> similarity index 100%
> rename from package/util-linux/0001-rtcwake-use-poweroff-if-shutdown-is-not-found.patch
> rename to package/util-linux/util-linux-programs/0001-rtcwake-use-poweroff-if-shutdown-is-not-found.patch
> diff --git a/package/util-linux/0002-agetty-fix-output-of-escaped-characters.patch b/package/util-linux/util-linux-programs/0002-agetty-fix-output-of-escaped-characters.patch
> similarity index 100%
> rename from package/util-linux/0002-agetty-fix-output-of-escaped-characters.patch
> rename to package/util-linux/util-linux-programs/0002-agetty-fix-output-of-escaped-characters.patch
> diff --git a/package/util-linux/0003-setarch-fix-obscure-sparc32bash-use-case.patch b/package/util-linux/util-linux-programs/0003-setarch-fix-obscure-sparc32bash-use-case.patch
> similarity index 100%
> rename from package/util-linux/0003-setarch-fix-obscure-sparc32bash-use-case.patch
> rename to package/util-linux/util-linux-programs/0003-setarch-fix-obscure-sparc32bash-use-case.patch
> diff --git a/package/util-linux/0004-ldattach-Check-for-value-of_HAVE_STRUCT_TERMIOS_C_ISPEED.patch b/package/util-linux/util-linux-programs/0004-ldattach-Check-for-value-of_HAVE_STRUCT_TERMIOS_C_ISPEED.patch
> similarity index 100%
> rename from package/util-linux/0004-ldattach-Check-for-value-of_HAVE_STRUCT_TERMIOS_C_ISPEED.patch
> rename to package/util-linux/util-linux-programs/0004-ldattach-Check-for-value-of_HAVE_STRUCT_TERMIOS_C_ISPEED.patch
> diff --git a/package/util-linux/su.pam b/package/util-linux/util-linux-programs/su.pam
> similarity index 100%
> rename from package/util-linux/su.pam
> rename to package/util-linux/util-linux-programs/su.pam
> diff --git a/package/util-linux/util-linux-programs/util-linux-programs.hash b/package/util-linux/util-linux-programs/util-linux-programs.hash
> new file mode 120000
> index 0000000000..dc1b2f866a
> --- /dev/null
> +++ b/package/util-linux/util-linux-programs/util-linux-programs.hash
> @@ -0,0 +1 @@
> +../util-linux.hash
> \ No newline at end of file
> diff --git a/package/util-linux/util-linux-programs/util-linux-programs.mk b/package/util-linux/util-linux-programs/util-linux-programs.mk
> new file mode 100644
> index 0000000000..a8a88d9c34
> --- /dev/null
> +++ b/package/util-linux/util-linux-programs/util-linux-programs.mk
> @@ -0,0 +1,261 @@
> +################################################################################
> +#
> +# util-linux-programs
> +#
> +################################################################################
> +
> +UTIL_LINUX_PROGRAMS_VERSION = $(UTIL_LINUX_VERSION)
> +UTIL_LINUX_PROGRAMS_SOURCE = $(UTIL_LINUX_SOURCE)
> +UTIL_LINUX_PROGRAMS_SITE = $(UTIL_LINUX_SITE)
> +UTIL_LINUX_PROGRAMS_DL_SUBDIR = $(UTIL_LINUX_DL_SUBDIR)
> +
> +# README.licensing claims that some files are GPL-2.0 only, but this is not true.
> +# Some files are GPL-3.0+ but only in tests. rfkill uses an ISC-style license.
> +UTIL_LINUX_PROGRAMS_LICENSE = GPL-2.0+, BSD-4-Clause, LGPL-2.1+ (libblkid, libfdisk, libmount, libsmartcols), BSD-3-Clause (libuuid) ISC (rfkill)
> +UTIL_LINUX_PROGRAMS_LICENSE_FILES = README.licensing \
> +	Documentation/licenses/COPYING.BSD-3-Clause \
> +	Documentation/licenses/COPYING.BSD-4-Clause-UC \
> +	Documentation/licenses/COPYING.GPL-2.0-or-later \
> +	Documentation/licenses/COPYING.ISC \
> +	Documentation/licenses/COPYING.LGPL-2.1-or-later
> +# Prevent installing the libraries twice on STAGING_DIR

 There is no need to prevent such a thing.

 However, there should instead be an "optional" dependency on util-linux-libs to
make sure they are overwritten. So:

UTIL_LINUX_PROGRAMS_DEPENDENCIES += \
	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs)

 The same goes for my -minimal proposal but then with UTIL_LINUX_DEPENDENCIES.

> +UTIL_LINUX_PROGRAMS_INSTALL_STAGING = $(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),NO,YES)
> +UTIL_LINUX_PROGRAMS_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
> +UTIL_LINUX_PROGRAMS_CONF_OPTS += \
> +	--disable-rpath \
> +	--disable-makeinstall-chown
> +UTIL_LINUX_PROGRAMS_LINK_LIBS = $(TARGET_NLS_LIBS)
> +
> +# udev support, provided by either eudev or systemd

 As mentioned, this should go into a separate patch (i.e. patch 4/4).


[snip]

> +UTIL_LINUX_EXTRACT_CMDS =
> +HOST_UTIL_LINUX_EXTRACT_CMDS =
> +
> +# util-linux-libs installs on STAGING_DIR only, for build time,
> +# util-linux-programs installs on TARGET_DIR only, for run time.
> +# We may need both.
> +UTIL_LINUX_DEPENDENCIES = \
> +	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,) \
> +	$(if $(BR2_PACKAGE_UTIL_LINUX_PROGRAMS),util-linux-programs,)
> +
> +# In the host version we need either host-util-linux-programs or
> +# host-util-linux-libs, only.
> +HOST_UTIL_LINUX_DEPENDENCIES = \
> +	host-util-linux-$(if $(BR2_PACKAGE_HOST_UTIL_LINUX),programs,libs)
> +
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))
> +
> +include $(UTIL_LINUX_PKGDIR)util-linux-libs/util-linux-libs.mk
> +include $(UTIL_LINUX_PKGDIR)util-linux-programs/util-linux-programs.mk

 Using $(UTIL_LINUX_PKGDIR) makes sense for an external package, but it makes it
harder to read for an internal package. So just use package/util-linux/...


 Regards,
 Arnout
