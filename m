From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Oct 2015 14:34:14 +0200
Subject: [Buildroot] [PATCH v4 1/4] package/rpm: bump to version 4.12.0.1
In-Reply-To: <1444076819-10228-1-git-send-email-james.knight@rockwellcollins.com>
References: <1444076819-10228-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20151011143414.4bf27c78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James,

On Mon,  5 Oct 2015 16:26:56 -0400, James Knight wrote:
> The provided "bump" (suggested by Baruch Siach) switches from the rpm5
> implementation to rpm.org's more active stream.
> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>

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
> +RPM_LICENSE_FILES = COPYING
>  
> -RPM_CONF_ENV = \
> -	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/beecrypt -I$(STAGING_DIR)/usr/include/neon -DHAVE_MUTEX_THREAD_ONLY" \
> -	ac_cv_va_copy=yes
> -
> -RPM_CONF_OPTS = \
> -	--disable-build-versionscript \
> +RPM_CONF_OPTS += \
> +	--disable-largefile \
>  	--disable-rpath \
> -	--without-selinux \
> -	--without-python \
> -	--without-perl \
> -	--with-openssl=external \
> -	--with-zlib=external \
> -	--with-libbeecrypt=$(STAGING_DIR) \
> -	--with-popt=external
> +	--enable-python=no \
> +	--with-external-db \
> +	--with-gnu-ld \
> +	--without-cap \
> +	--without-hackingdocs
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
> +RPM_DEPENDENCIES += beecrypt
> +RPM_CONF_OPTS += --with-beecrypt
> +RPM_CONFIGURATION += -I$(STAGING_DIR)/usr/include/beecrypt

This should be named RPM_CFLAGS instead, it's more logical and
consistent with what we do in other packages.

Also, I had some issues building your package with uClibc and musl:

 - the check for -fstack-protector doesn't work properly. I've written
   a patch to fix this (attached). You need to set RPM_AUTORECONF = YES
   to use this patch.

 - uclibc and musl don't provide __fxstat64(). I've written a fix that
   works for uclibc (attached). But it doesn't work as is for musl
   since musl doesn't provide a __MUSL__ symbol, so you need to do a
   proper configure.ac check.

 - when building with musl, _D_EXACT_NAMELEN is missing.

So could you rework this package to make it work with musl/uclibc or
alternatively mark it as not available for these C libraries if you are
not interested in supporting this use case.

In the mean time, I'll mark your patches as "Changes Requested" in
patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-configure.ac-use-link-instead-of-compile-for-gcc-fla.patch
Type: text/x-patch
Size: 1251 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151011/a1e09a21/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-fts-add-quirk-for-__fxstat64-on-uclibc.patch
Type: text/x-patch
Size: 840 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151011/a1e09a21/attachment-0001.bin>
