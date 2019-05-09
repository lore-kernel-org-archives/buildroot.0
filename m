From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 May 2019 20:03:15 +0200
Subject: [Buildroot] [RFC PATCH v2] package/util-linux: build programs
 and libraries in separate packages
In-Reply-To: <20190509143039.24045-1-unixmania@gmail.com>
References: <20190509143039.24045-1-unixmania@gmail.com>
Message-ID: <20190509180315.GA2787@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2019-05-09 11:30 -0300, unixmania at gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> The findmount and lsblk utilities need udev to work correctly but cannot
> be built with udev support because the packages providing libudev (eudev
> and systemd) depend on util-linux, creating a chicken-egg problem. Solve
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
>   or host-util-linux-programs (not on both, since they are installed on
>   the same destination).
> - Make eudev and systemd have build dependencies on util-linux-libs.
>   This can be extended to other packages in the future but is not needed
>   right now because the configuration options are backward-compatible.
> - Make util-linux-programs have an optional build dependency on the
>   package that provides libudev (either eudev or systemd), if it is
>   selected.

To be honest, I was at first very reluctant at lloking into that patch,
and your explanations of it make it appear more nasty than it really is.
It *is* a sneaky trick you're playing with the install-target/staging
conditions, and I am not too happy with it, that's for sure.

But otherwise, it is interesting what you came up with.

I even think you could have gone a bit further, and completely hide the
split, so packages would still only have to know about util-linux and
never have to worry about the backing -libs and -programs. See below...

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

I agree that this drawback is not too big of a problem. It is
unavoidable, whatever the solution we choose, this one or the previous.

[--SNIP--]
> diff --git a/package/eudev/Config.in b/package/eudev/Config.in
> index 2220265a55..2df94fb68c 100644
> --- a/package/eudev/Config.in
> +++ b/package/eudev/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_EUDEV
>  	depends on !BR2_STATIC_LIBS # kmod
>  	select BR2_PACKAGE_HAS_UDEV
>  	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBS

This select can go away altogether if ...

>  	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID

... the BR2_PACKAGE_UTIL_LINUX_LIBBLKID (and the others) do the select,
like you did for programs.

I.e. a package that wants a library just has to do:

    config BR2_PACKAGE_EUDEV
        select BR2_PACKAGE_UTIL_LINUX
        select BR2_PACKAGE_UTIL_LINUX_LIBBLKID

and then:

    config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
        select BR2_PACKAGE_UTIL_LINUX_LIBS

So, the complexity and duality of util-linux.

>  	select BR2_PACKAGE_KMOD
>  	help
> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> index d88e010c28..5590049fcc 100644
> --- a/package/eudev/eudev.mk
> +++ b/package/eudev/eudev.mk
> @@ -18,7 +18,8 @@ EUDEV_CONF_OPTS = \
>  	--enable-kmod \
>  	--enable-blkid
>  
> -EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
> +# eudev requires only the util-linux libraries at build time
> +EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux-libs kmod
>  EUDEV_PROVIDES = udev
>  
>  ifeq ($(BR2_ROOTFS_MERGED_USR),)
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 92ffc7cc5a..3aa5ced46c 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -23,6 +23,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
>  	select BR2_PACKAGE_DBUS # runtime dependency only
>  	select BR2_PACKAGE_LIBCAP
>  	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBS

Ditto as eudev, of course.

>  	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>  	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
>  	select BR2_PACKAGE_UTIL_LINUX_BINARIES
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index edc4a9ecc1..292a97fb40 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -9,13 +9,15 @@ SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
>  SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
>  SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
>  SYSTEMD_INSTALL_STAGING = YES
> +
> +# systemd requires only the util-linux libraries at build time
>  SYSTEMD_DEPENDENCIES = \
>  	$(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
>  	host-gperf \
>  	host-intltool \
>  	kmod \
>  	libcap \
> -	util-linux
> +	util-linux-libs
>  
>  SYSTEMD_PROVIDES = udev
>  
> diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> index a5a137bfe0..6fa873ac40 100644
> --- a/package/util-linux/Config.in
> +++ b/package/util-linux/Config.in
> @@ -9,6 +9,9 @@ menuconfig BR2_PACKAGE_UTIL_LINUX
>  
>  if BR2_PACKAGE_UTIL_LINUX
>  
> +config BR2_PACKAGE_UTIL_LINUX_LIBS
> +	bool
> +
>  config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>  	bool "libblkid"
>  	depends on BR2_USE_MMU # fork()

Here you would add the select BR2_PACKAGE_UTIL_LINUX_LIBS (and on the
other libs symbols, too).

[--SNIP--]
> diff --git a/package/util-linux/util-linux-libs/util-linux-libs.hash b/package/util-linux/util-linux-libs/util-linux-libs.hash
> new file mode 120000
> index 0000000000..dc1b2f866a
> --- /dev/null
> +++ b/package/util-linux/util-linux-libs/util-linux-libs.hash
> @@ -0,0 +1 @@
> +../util-linux.hash
> \ No newline at end of file
> diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
> new file mode 100644
> index 0000000000..b6af22f2ce
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
> +UTIL_LINUX_LIBS_INSTALL_STAGING = YES
> +# Prevent installing the libraries twice on TARGET_DIR
> +UTIL_LINUX_LIBS_INSTALL_TARGET = if($(BR2_PACKAGE_UTIL_LINUX_PROGRAMS),NO,YES)

How can that even work? It's gonna be either 'if(y,NO,YES)' or
'if(,NO,YES)' , but never just 'YES' or just 'NO'.

Note that you have the exact same issue in the -programs case...

[--SNIP--]
> diff --git a/package/util-linux/util-linux-programs/util-linux-programs.mk b/package/util-linux/util-linux-programs/util-linux-programs.mk
> new file mode 100644
> index 0000000000..e215fe7187
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
> +UTIL_LINUX_PROGRAMS_INSTALL_STAGING = if($(BR2_PACKAGE_UTIL_LINUX_LIBS),NO,YES)

... here.

So, this is otherwise a big patch, and I obviously did not review it in
its entirety.

But otherwise it looks OK-ish, even if I am still not entirely happy
with this trick...

Still, I'd like we get some feedback from upstream about a way to
actually split the package. Did you get any? I tried looking at their
github tracker, and could not see any relevant activity...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
