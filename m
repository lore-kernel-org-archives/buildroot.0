From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Sep 2016 23:33:48 +0200
Subject: [Buildroot] [PATCH v5 1/1] package/rpm: switch to version
 4.12.0.1
In-Reply-To: <20160909163708.31980-1-james.knight@rockwellcollins.com>
References: <20160909163708.31980-1-james.knight@rockwellcollins.com>
Message-ID: <b35ba70e-9552-577c-0bea-4a50e6b5fe4a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-09-16 18:37, James Knight wrote:
> The provided switches from the RPM5 implementation to rpm.org's stream.
[snip]
> diff --git a/package/rpm/0001-configure.ac-use-link-instead-of-compile-for-gcc-fla.patch b/package/rpm/0001-configure.ac-use-link-instead-of-compile-for-gcc-fla.patch
> new file mode 100644
> index 0000000..e3c5da9
> --- /dev/null
> +++ b/package/rpm/0001-configure.ac-use-link-instead-of-compile-for-gcc-fla.patch
> @@ -0,0 +1,35 @@
> +From 840152e36365026631e9fb649eef7f830b074797 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Sat, 10 Oct 2015 23:17:44 +0200
> +Subject: [PATCH 1/2] configure.ac: use link instead of compile for gcc flags
> + test
> +
> +The logic that tests whether gcc supports or not certain flags uses
> +AC_COMPILE_IFELSE(). However, when checking for stack smashing
> +protection support, an AC_LINK_IFELSE() test is needed, since the
> +build might work but not the link stage if certain libraries are
> +missing for proper stack smashing protection support.
> +
> +Therefore, this commit switches to use AC_LINK_IFELSE().
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 It's weird that you get this patch from Thomas while he isn't mentioned in the
commit message. I thought it was because we had rpm4 before, but it turns out
our initial commit for rpm was already rpm5. So it would be interesting to
mention in the commit message where this comes from.

 More importantly, however: you should add your own Sob.

 Oh, and there's an active upstream at
https://github.com/rpm-software-management/rpm
Could you submit it there (if still relevant)?

 Same for the other patch.

> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index bb368a9..6ffd472 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -43,7 +43,7 @@ if test "$GCC" = yes; then
> +     echo
> +     for flag in $cflags_to_try; do
> +         CFLAGS="$CFLAGS $flag -Werror"
> +-        AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[return 0;]])],[
> ++        AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[return 0;]])],[
> +                 echo "   $flag"
> +                 RPMCFLAGS="$RPMCFLAGS $flag"
> +         ],[])
> +-- 
> +2.6.1
> +

[snip]

> diff --git a/package/rpm/Config.in b/package/rpm/Config.in
> index 2be646a..e80a69a 100644
> --- a/package/rpm/Config.in
> +++ b/package/rpm/Config.in
> @@ -1,28 +1,21 @@
> -comment "rpm needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> -	depends on BR2_USE_MMU # fork()
> +comment "rpm needs a uClibc or glibc toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL

 Could you mention in the commit message what fails on musl? Makes fixing it
later easier.

>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> -
> -comment "rpm needs a toolchain w/ gcc >= 5"
> -	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5 && BR2_sh
> +	depends on BR2_USE_MMU
>  
>  config BR2_PACKAGE_RPM
>  	bool "rpm"
> -	# triggers internal compiler error
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_sh
> +	depends on !BR2_TOOLCHAIN_USES_MUSL # __fxstat64, _D_EXACT_NAMELEN
> +	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt

 or libnss

>  	depends on BR2_USE_MMU # fork()
> -	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> -	select BR2_PACKAGE_BEECRYPT
> +	select BR2_PACKAGE_BEECRYPT if !BR2_PACKAGE_LIBNSS
> +	select BR2_PACKAGE_BERKELEYDB
> +	select BR2_PACKAGE_FILE
>  	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
> -	select BR2_PACKAGE_NEON
> -	select BR2_PACKAGE_NEON_SSL
> -	select BR2_PACKAGE_NEON_XML
> -	select BR2_PACKAGE_NEON_ZLIB
> -	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_POPT
>  	select BR2_PACKAGE_ZLIB
>  	help
> -	  The RPM package management system.
> +	  The RPM Package Manager (RPM).
>  
> -	  http://rpm5.org
> +	  http://www.rpm.org/
> diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
> index 0665746..e579fa4 100644
> --- a/package/rpm/rpm.hash
> +++ b/package/rpm/rpm.hash
> @@ -1,2 +1,2 @@
> -# Locally calculated
> -sha256	34a959c0ed670cadcdc52c6025e822fac6f5d1015e3b75123f53ebe53b923e98	rpm-5.2.0.tar.gz
> +# From http://rpm.org/wiki/Releases/4.12.0.1
> +sha1 d416bdb249b246b00b2d5d34c66e7f5a68a62524 rpm-4.12.0.1.tar.bz2
> diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
> index 7f346b2..a022ae9 100644
> --- a/package/rpm/rpm.mk
> +++ b/package/rpm/rpm.mk
> @@ -4,61 +4,67 @@
>  #
>  ################################################################################
>  
> -RPM_VERSION_MAJOR = 5.2
> -RPM_VERSION = $(RPM_VERSION_MAJOR).0
> -RPM_SITE = http://rpm5.org/files/rpm/rpm-$(RPM_VERSION_MAJOR)
> -RPM_DEPENDENCIES = host-pkgconf zlib beecrypt neon popt openssl
> -RPM_LICENSE = LGPLv2.1
> -RPM_LICENSE_FILES = COPYING.LIB
> +RPM_VERSION_MAJOR = 4.12
> +RPM_VERSION = $(RPM_VERSION_MAJOR).0.1
> +RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
> +RPM_SITE = http://rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
> +RPM_DEPENDENCIES = host-pkgconf berkeleydb file popt zlib
> +RPM_LICENSE = GPLv2

 Confirmed that it's v2 only.

 The library can actually be distributed under LGPLv2 (only), but I don't think
we install that separately so it doesn't matter.

> +RPM_LICENSE_FILES = COPYING
>  
> -RPM_CONF_ENV = \
> -	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/beecrypt -I$(STAGING_DIR)/usr/include/neon -DHAVE_MUTEX_THREAD_ONLY" \
> -	ac_cv_va_copy=yes
> +# 0001-configure.ac-use-link-instead-of-compile-for-gcc-fla.patch
> +RPM_AUTORECONF = YES
>  
> -RPM_CONF_OPTS = \
> -	--disable-build-versionscript \
> +RPM_CONF_OPTS += \

 Why += ?

> +	--disable-largefile \

 Why disable? Probably needs a comment in commit message or in .mk file.

>  	--disable-rpath \
> -	--without-selinux \
> -	--without-python \
> -	--without-perl \
> -	--with-openssl=external \
> -	--with-zlib=external \
> -	--with-libbeecrypt=$(STAGING_DIR) \
> -	--with-popt=external
> +	--enable-python=no \

 Doesn't --without-python or --disable-python work?

> +	--with-external-db \
> +	--with-gnu-ld \
> +	--without-cap \
> +	--without-hackingdocs \
> +	--without-lua
>  
> -ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
> -RPM_DEPENDENCIES += gettext
> +ifeq ($(BR2_PACKAGE_ACL),y)
> +RPM_DEPENDENCIES += acl
> +RPM_CONF_OPTS += --with-acl
> +else
> +RPM_CONF_OPTS += --without-acl
>  endif
>  
> -ifeq ($(BR2_PACKAGE_PCRE),y)
> -RPM_DEPENDENCIES += pcre
> -RPM_CONF_OPTS += --with-pcre=external
> +ifeq ($(BR2_PACKAGE_BEECRYPT),y)

 Small nit: since Config.in selects beecrypt if !libnss, it makes more sense to
make it similar here, i.e. ifeq ($(BR2_PACKAGE_LIBNSS),y).

> +RPM_DEPENDENCIES += beecrypt
> +RPM_CONF_OPTS += --with-beecrypt
> +RPM_CFLAGS += -I$(STAGING_DIR)/usr/include/beecrypt
>  else
> -RPM_CONF_OPTS += --with-pcre=none
> +RPM_DEPENDENCIES += libnss
> +RPM_CONF_OPTS += --without-beecrypt
> +RPM_CFLAGS += -I$(STAGING_DIR)/usr/include/nss -I$(STAGING_DIR)/usr/include/nspr
>  endif
>  
> -ifeq ($(BR2_PACKAGE_FILE),y)
> -RPM_DEPENDENCIES += file
> -RPM_CONF_OPTS += --with-file=external
> +ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
> +RPM_DEPENDENCIES += gettext
> +RPM_CONF_OPTS += --with-libintl-prefix=$(STAGING_DIR)/usr
>  else
> -RPM_CONF_OPTS += --with-file=none
> +RPM_CONF_OPTS += --without-libintl-prefix
>  endif
>  
> -# xz payload support needs a toolchain w/ C++
> -ifeq ($(BR2_PACKAGE_XZ)$(BR2_INSTALL_LIBSTDCPP),yy)
> -RPM_DEPENDENCIES += xz
> -RPM_CONF_OPTS += --with-xz=external
> +ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
> +RPM_DEPENDENCIES += libarchive
> +RPM_CONF_OPTS += --with-archive
>  else
> -RPM_CONF_OPTS += --with-xz=none
> +RPM_CONF_OPTS += --without-archive
>  endif
>  
> -ifeq ($(BR2_PACKAGE_BZIP2),y)
> -RPM_CONF_OPTS += --with-bzip2
> -RPM_DEPENDENCIES += bzip2
> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +RPM_DEPENDENCIES += libselinux
> +RPM_CONF_OPTS += --with-selinux
> +else
> +RPM_CONF_OPTS += --without-selinux
>  endif
>  
> -RPM_MAKE = $(MAKE1)
> -
> -RPM_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) program_transform_name= install
> +RPM_CONF_ENV += \
> +	ac_cv_prog_cc_c99='-std=gnu99' \

 Doesn't configure detect this? Add a comment why not.


 Regards,
 Arnout

> +	CFLAGS="$(TARGET_CFLAGS) $(RPM_CFLAGS)"
>  
>  $(eval $(autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
