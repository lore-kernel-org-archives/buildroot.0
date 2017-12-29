From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Dec 2017 23:57:57 +0100
Subject: [Buildroot] [PATCH 2/2] systemd: bump to 236, convert to meson
In-Reply-To: <20171229215243.6273-2-Adamduskett@outlook.com>
References: <20171229215243.6273-1-Adamduskett@outlook.com>
 <20171229215243.6273-2-Adamduskett@outlook.com>
Message-ID: <20171229225757.GS3176@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2017-12-29 16:52 -0500, Adam Duskett spake thusly:
> systemd is no longer a autotools package, as such, it has now been converted
> over to meson.

I would have preferred that we do the switch in two steps:

  - first, the switch over to meson without bumping the version, so that
    we really get the grasps if what htis implies relative to the
    buildsystem itself,

  - second, a version bump.

> Changes include:
>   - Changing all the options from --enable/disable to -Doption=true/false
>   - Remove --without-python (no longer an option)
>   - Add -Dsplit-user=true, without this option, rootprefix is set to /usr
>     explicitly.
>   - Change rootprefix from blank to /
>   - Remove all of the ac_cv_path_ variables, these are now set properly in
>     meson.build by default.
>   - Change systemd from a autotools package to a generic package
>   - Add sha256sum's for the license files.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  .../systemd/0002-build-check-for-ln-relative.patch |  98 ---------
>  ...h => 0002-fix-am-path-libgcrypt-no-found.patch} |   0
>  package/systemd/systemd.hash                       |   5 +-
>  package/systemd/systemd.mk                         | 242 ++++++++++-----------
>  4 files changed, 123 insertions(+), 222 deletions(-)
>  delete mode 100644 package/systemd/0002-build-check-for-ln-relative.patch
>  rename package/systemd/{0003-fix-am-path-libgcrypt-no-found.patch => 0002-fix-am-path-libgcrypt-no-found.patch} (100%)
> 
> diff --git a/package/systemd/0002-build-check-for-ln-relative.patch b/package/systemd/0002-build-check-for-ln-relative.patch
> deleted file mode 100644
> index 817ce5010a..0000000000
> --- a/package/systemd/0002-build-check-for-ln-relative.patch

So they are not longer using ln --relative in their install steps?
Or does meson provide a sane fallback?

OK, so from our IRC discussion: they still use it from their meson.build
file, so you need to patch it out, similarly to what we were doing so
far.

[--SNIP--]
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 9f286fd54b..91e65e690d 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -4,20 +4,20 @@
>  #
>  ################################################################################
>  
> -SYSTEMD_VERSION = 234
> +SYSTEMD_VERSION = 236
>  SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
>  SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
>  SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
>  SYSTEMD_INSTALL_STAGING = YES
>  SYSTEMD_DEPENDENCIES = \
> +	host-gperf \

Speaking od gperf, upstream claims they require gperf 3.1, but we only
have gperf 3.0.4.

What's going on with that?

>  	host-intltool \
> -	libcap \
> -	util-linux \
> +	host-meson \
>  	kmod \
> -	host-gperf
> +	libcap \
> +	util-linux

Please, don't re-ordr depednencies needlessly... If you're really
bothered, please do it in a separate patch...

But did you forget to add host-ninja, too? Ah, it's a dependency of
host-meson...

But as I understand, meson can have different backends, of which ninja,
right? If so I think the package should be responsible to also depend on
host-ninja.

But feel free to correct me! ;-)

>  SYSTEMD_PROVIDES = udev
> -SYSTEMD_AUTORECONF = YES
>  
>  # Make sure that systemd will always be built after busybox so that we have
>  # a consistent init setup between two builds
> @@ -26,268 +26,243 @@ SYSTEMD_DEPENDENCIES += busybox
>  endif
>  
>  SYSTEMD_CONF_OPTS += \
> -	--with-rootprefix= \
> -	--enable-blkid \
> -	--enable-static=no \
> -	--disable-manpages \
> -	--disable-ima \
> -	--disable-libcryptsetup \
> -	--disable-efi \
> -	--disable-gnuefi \
> -	--disable-ldconfig \
> -	--disable-tests \
> -	--disable-coverage \
> -	--with-default-dnssec=no \
> -	--without-python
> +	--prefix=/usr \
> +	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
> +	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf \
> +	-Dsplit-user=true \
> +	-Drootprefix='/' \
> +	-Dblkid=true \
> +	-Dman=false \
> +	-Dima=false \
> +	-Dlibcryptsetup=false \
> +	-Defi=false \
> +	-Dgnu-efi=false \
> +	-Dldconfig=false \
> +	-Ddefault-dnssec=no
>  
>  SYSTEMD_CFLAGS = $(TARGET_CFLAGS) -fno-lto
>  
> -# Override paths to a few utilities needed at runtime, to
> -# avoid finding those we would install in $(HOST_DIR).
> -SYSTEMD_CONF_ENV = \
> -	CFLAGS="$(SYSTEMD_CFLAGS)" \
> -	ac_cv_path_KILL=/usr/bin/kill \
> -	ac_cv_path_KMOD=/usr/bin/kmod \
> -	ac_cv_path_KEXEC=/usr/sbin/kexec \
> -	ac_cv_path_SULOGIN=/usr/sbin/sulogin \
> -	ac_cv_path_MOUNT_PATH=/usr/bin/mount \
> -	ac_cv_path_UMOUNT_PATH=/usr/bin/umount

So those are now always correctly set even when they are present in
host/bin/ (or host/sbin) ?

> @@ -398,4 +372,26 @@ define SYSTEMD_INSTALL_INIT_SYSTEMD
>  	$(SYSTEMD_INSTALL_NETWORK_CONFS)
>  endef
>  
> -$(eval $(autotools-package))
> +SYSTEMD_NINJA_OPTS = $(if $(VERBOSE),-v)
> +
> +define SYSTEMD_CONFIGURE_CMDS
> +	rm -rf $(@D)/build
> +	mkdir -p $(@D)/build
> +	$(TARGET_MAKE_ENV) meson $(SYSTEMD_CONF_OPTS) $(@D) $(@D)/build
> +endef
> +
> +define SYSTEMD_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) ninja $(SYSTEMD_NINJA_OPTS) -C $(@D)/build

And this is where you should also pass the number of parallel jobs,
otherwise ninja will use all the CPUs available.

> +endef
> +
> +define SYSTEMD_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) ninja $(SYSTEMD_NINJA_OPTS) \
> +		-C $(@D)/build install

I guess ditto the number of jobs...

> +endef
> +
> +define SYSTEMD_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) ninja $(SYSTEMD_NINJA_OPTS) \
> +		-C $(@D)/build install

Ditto again...

Regards,
Yann E. MORIN.

> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.14.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
