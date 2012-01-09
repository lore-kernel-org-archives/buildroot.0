From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 9 Jan 2012 08:12:57 +0100
Subject: [Buildroot] [PATCH] Static build changes
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C60E4498@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C60E4498@ex-mb1.corp.adtran.com>
Message-ID: <201201090812.57114.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 20 December 2011 17:11:54 ANDY KENNEDY wrote:
> The affected files are:
> 
> Makefile
> package/ethtool/ethtool.mk
> package/htop/htop.mk
> package/i2c-tools/i2c-tools.mk
> package/kexec/kexec.mk
> package/libgcrypt/libgcrypt.mk
> package/libgpg-error/libgpg-error.mk
> package/makedevs/makedevs.mk
> package/mtd/mtd.mk
> package/ncurses/ncurses.mk
> package/portmap/portmap.mk
> package/proftpd/proftpd.mk
> toolchain/uClibc/uclibc.mk

 This part of the log message is redundant.  It shows up in the git shortlog.
However, it is useful to include a remark that this doesn't fix the issue
for all packages.

> In the system I am building, we want to use all static applications in
> place of using eglibc for the target.  I prefer to use uClibC for
> busybox, and the applications you see above.  To prevent from having
> dynamically linked applications, without having installed libraries, I
> have modified these to either not install the application (in the case
> of uClibC installing ldconfig, libgcrypt installing iconv, etc), or
> build the target binary static.  In the case of a couple of libraries,
> the install was modified to prevent the libraries from being installed
> to the target when all that is needed is for another application being
> installed.
> 
> Signed-off-by: Andy Kennedy <Andy.Kennedy@Adtran.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> 
> ---
> diff -Naur a/Makefile b/Makefile
> --- a/Makefile  2011-12-14 15:54:04.000000000 -0600
> +++ b/Makefile  2011-12-20 09:39:59.000000000 -0600
> @@ -236,7 +236,10 @@
>  endif
> 
>  ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
> -BASE_TARGETS += uclibc-configured host-binutils cross_compiler uclibc-target-utils kernel-headers
> +BASE_TARGETS += uclibc-configured host-binutils cross_compiler kernel-headers
> +ifneq ($(BR2_PREFER_STATIC_LIB),y)
> +BASE_TARGETS += uclibc-target-utils
> +endif
>  else
>  BASE_TARGETS += uclibc
>  endif
> diff -Naur a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
> --- a/package/ethtool/ethtool.mk        2011-12-14 15:54:04.000000000 -0600
> +++ b/package/ethtool/ethtool.mk        2011-12-20 09:41:40.000000000 -0600
> @@ -7,4 +7,8 @@
>  ETHTOOL_VERSION = 3.0
>  ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool/
> 
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +ETHTOOL_CONF_ENV += LDFLAGS+=-static
> +endif

 Wouldn't it be more convenient if this was added globally to 
TARGET_LDFLAGS in Makefile.in?  The -static is anyway just a hint,
it doesn't force the linker to link statically.

> +
>  $(eval $(call AUTOTARGETS))
> diff -Naur a/package/htop/htop.mk b/package/htop/htop.mk
> --- a/package/htop/htop.mk      2011-12-14 15:54:04.000000000 -0600
> +++ b/package/htop/htop.mk      2011-12-20 09:44:06.000000000 -0600
> @@ -11,4 +11,9 @@
>  HTOP_AUTORECONF = YES
>  HTOP_CONF_OPT += --disable-unicode
> 
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +HTOP_CONF_ENV += LDFLAGS+="--static -lpthread"
> +HTOP_CONF_OPT += "'--enable-static' --disable-shared"
 Is this needed?  The $(PKG)_CONFIGURE_CMDS of Makefile.autotools.in
already includes $(SHARED_STATIC_LIBS_OPTS).

> +endif
> +
>  $(eval $(call AUTOTARGETS))
> diff -Naur a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
> --- a/package/i2c-tools/i2c-tools.mk    2011-12-14 15:54:04.000000000 -0600
> +++ b/package/i2c-tools/i2c-tools.mk    2011-12-20 09:44:25.000000000 -0600
> @@ -8,6 +8,10 @@
>  I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
>  I2C_TOOLS_SITE = http://dl.lm-sensors.org/i2c-tools/releases/
> 
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +I2C_TOOLS_CONF_OPTS += LDFLAGS+=-static
> +endif
> +
>  define I2C_TOOLS_BUILD_CMDS
>   $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
>  endef
> diff -Naur a/package/kexec/kexec.mk b/package/kexec/kexec.mk
> --- a/package/kexec/kexec.mk    2011-12-14 15:54:04.000000000 -0600
> +++ b/package/kexec/kexec.mk    2011-12-20 09:45:47.000000000 -0600
> @@ -14,6 +14,11 @@
>  KEXEC_CONF_OPT += --without-zlib
>  endif
> 
> +# This does not build kdump static (for some reason)
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +KEXEC_CONF_ENV += LDFLAGS+=-static CFLAGS+=-static
 I haven't tested, but as far as I can see in the Makefiles, the only
place where LDFLAGS is not used for linking is for kdump...  So if it
anyway doesn't work, you can just as well leave out the -static from the
CFLAGS.

> +endif
> +
>  define KEXEC_REMOVE_LIB_TOOLS
>         rm -rf $(TARGET_DIR)/usr/lib/kexec-tools
>  endef
> diff -Naur a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
> --- a/package/libgcrypt/libgcrypt.mk    2011-12-14 15:54:04.000000000 -0600
> +++ b/package/libgcrypt/libgcrypt.mk    2011-12-20 09:46:12.000000000 -0600
> @@ -9,6 +9,12 @@
>  LIBGCRYPT_SITE = ftp://ftp.gnupg.org/gcrypt/libgcrypt
>  LIBGCRYPT_INSTALL_STAGING = YES
> 
> +ifneq ($(BR2_PREFER_STATIC_LIB),y)
> +LIBGCRYPT_INSTALL_TARGET = YES
> +else
> +LIBGCRYPT_INSTALL_TARGET = NO
> +endif

 There should also be a global solution for this.  When you prefer static
libs, then none of the libraries should be installed.  Something like
FOO_INSTALL_LIBRARIES = YES
that sets INSTALL_STAGING and INSTALL_TARGET, perhaps?  (Note that this is
not required for acceptance of this specific patch, just a general remark.)

> +
>  LIBGCRYPT_CONF_ENV = \
>         ac_cv_sys_symbol_underscore=no
>  LIBGCRYPT_CONF_OPT = \
[snip]
> diff -Naur a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
> --- a/package/ncurses/ncurses.mk        2011-12-14 15:54:04.000000000 -0600
> +++ b/package/ncurses/ncurses.mk        2011-12-20 09:51:11.000000000 -0600
> @@ -29,7 +29,6 @@
>  NCURSES_DEPENDENCIES = host-ncurses
>  
>  NCURSES_CONF_OPT = \
> -       --with-shared \
>         --without-cxx \
>         --without-cxx-binding \
>         --without-ada \
> @@ -41,8 +40,17 @@
>         --enable-echo \
>         --enable-const \
>         --enable-overwrite \
> -       --enable-broken_linker \
> +       --enable-broken_linker
> +
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +NCURSES_CONF_OPT += \
> +       --without-shared \
> +       --enable-static
> +else
> +NCURSES_CONF_OPT += \
> +       --with-shared \
>         --disable-static
> +endif

 This is already done by $(PKG)_CONFIGURE_CMDS, so just removing the
--with-shared and --enable-static should be sufficient.

[snip]
> diff -Naur a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
> --- a/package/proftpd/proftpd.mk        2011-12-14 15:54:04.000000000 -0600
> +++ b/package/proftpd/proftpd.mk        2011-12-20 09:52:25.000000000 -0600
> @@ -12,7 +12,6 @@
>                 ac_cv_func_setgrent_void=yes
> 
>  PROFTPD_CONF_OPT = --localstatedir=/var/run \
> -               --disable-static \
>                 --disable-curses \
>                 --disable-ncurses \
>                 --disable-facl \
> @@ -20,6 +19,15 @@
>                 --enable-shadow \
>                 --with-gnu-ld
> 
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +PROFTPD_CONF_ENV += LDFLAGS+=--static
> +PROFTPD_CONF_OPT += --enable-static \
> +                   --enable-builtin-getaddrinfo \
> +                   --enable-builtin-getnameinfo
> +else
> +PROFTPD_CONF_OPT += --disable-static
> +endif

 Same here.

> +
>  define PROFTPD_MAKENAMES
>         $(MAKE1) CC="$(HOSTCC)" CFLAGS="" LDFLAGS="" -C $(@D)/lib/libcap _makenames
>  endef
> diff -Naur a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
> --- a/toolchain/uClibc/uclibc.mk        2011-12-14 15:54:04.000000000 -0600
> +++ b/toolchain/uClibc/uclibc.mk        2011-12-20 09:53:49.000000000 -0600
> @@ -480,6 +480,7 @@
>                 install_runtime
>         touch -c $@
> 
> +ifneq ($(BR2_PREFER_STATIC_LIB),y)
>  $(TARGET_DIR)/usr/bin/ldd: $(cross_compiler)
>         $(MAKE1) -C $(UCLIBC_DIR) CC=$(TARGET_CROSS)gcc \
>                 CPP=$(TARGET_CROSS)cpp LD=$(TARGET_CROSS)ld \
> @@ -487,7 +488,6 @@
>                 PREFIX=$(TARGET_DIR) utils install_utils
>         touch -c $@
> 
> -ifneq ($(BR2_PREFER_STATIC_LIB),y)
>  UCLIBC_TARGETS=$(TARGET_DIR)/lib/libc.so.0
>  endif

 I'm not sure if I agree with this change.  Prefer static does not mean 
force static, so the dynamic linker stuff should still be present.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
