From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 May 2013 18:11:17 +0200
Subject: [Buildroot] [PATCH] ecryptfs-utils: new package
In-Reply-To: <CAOPBCFV6vC4KRgvLdWFpsB43HisCd-pb5ji0hzqY07qEHo2Evw@mail.gmail.com>
References: <CAOPBCFV6vC4KRgvLdWFpsB43HisCd-pb5ji0hzqY07qEHo2Evw@mail.gmail.com>
Message-ID: <20130531181117.493b7f80@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marcin Bis,

Thanks!

Your patch is line-wrapped, could you use 'git send-email' to send
patches? More comments below.

On Fri, 31 May 2013 17:49:15 +0200, Marcin Bis wrote:

> diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
> new file mode 100644
> index 0000000..b1b2ec0
> --- /dev/null
> +++ b/package/ecryptfs-utils/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_ECRYPTFS_UTILS
> +    bool "ecryptfs-utils"
> +    select BR2_PACKAGE_KEYUTILS
> +    select BR2_PACKAGE_LIBNSS

You need to propagate the dependencies of libnss and keyutils here, so:

	depends on BR2_USE_MMU # keyutils
	depends on !BR2_avr32 && !BR2_microblaze # keyutils
	depends on BR2_LARGEFILE # libnss
	depends on BR2_TOOLCHAIN_HAS_THREADS # libnss -> libnspr

and then, add a comment like:

comment "ecryptfs-utils requires a toolchain with largefile and thread support"
	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS

> +    help

Indentation should be one tab here.

> +      eCryptfs is a POSIX-compliant enterprise cryptographic
> +      filesystem for Linux. It is stacked on top of any other
> +      Linux filesystem, it stores cryptographic metadata in the header
> +      of each file written.
> +
> +      The eCryptfs kernel module is available in all Linux kernels
> +      since version 2.6.19. This package provides userspace utilities
> +      needed to mount eCryptfs.
> +
> +      Files are encrypted using a passphrase. Consider building openssl
> +      for another method.
> +
> +      http://ecryptfs.org

And one tab + two spaces here.

> diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk
> b/package/ecryptfs-utils/ecryptfs-utils.mk
> new file mode 100644
> index 0000000..8c656ba
> --- /dev/null
> +++ b/package/ecryptfs-utils/ecryptfs-utils.mk
> @@ -0,0 +1,25 @@
> +#############################################################
> +#
> +# ecryptfs-utils
> +#
> +##############################################################
> +
> +ECRYPTFS_UTILS_VERSION         = 103
> +ECRYPTFS_UTILS_SOURCE          =
> ecryptfs-utils_$(ECRYPTFS_UTILS_VERSION).orig.tar.gz
> +ECRYPTFS_UTILS_SITE            =
> https://launchpad.net/ecryptfs/trunk/$(ECRYPTFS_UTILS_VERSION)/+download
> +ECRYPTFS_UTILS_LICENSE         = GPLv2+
> +ECRYPTFS_UTILS_LICENSE_FILES   = COPYING
> +
> +ECRYPTFS_UTILS_DEPENDENCIES    = keyutils libnss

Apparently, ecryptfs-utils can be built without libnss, and use gcrypt
instead. Maybe it would be worth supporting this possibility. But it's
not mandatory to get your patch accepted.

> +ECRYPTFS_UTILS_CONF_OPT        += --disable-pywrap --disable-pam --disable-nls

No need for the += here.

Please don't pass --disable-nls. It will be passed automatically when
locale support is not enabled.

> +#Needed for build system to find pk11func.h and libnss3.so
> +ECRYPTFS_UTILS_CONF_ENV +=
> NSS_CFLAGS="-I$(STAGING_DIR)/usr/include/nss
> -I$(STAGING_DIR)/usr/include/nspr" \
> +    NSS_LIBS="-lnss3"
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +    #openssl will be found by configure
> +    ECRYPTFS_UTILS_DEPENDENCIES += openssl
> +endif

Please disable explicitly openssl support when it's not available, to
make sure it doesn't mis-detect the OpenSSL for the host. So, something
like:

ifeq ($(BR2_PACKAGE_OPENSSL),y)
	ECRYPTFS_UTILS_CONF_OPT += --enable-openssl
	ECRYPTFS_UTILS_DEPENDENCIES += openssl
else
	ECRYPTFS_UTILS_CONF_OPT += --disable-openssl
endif

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
