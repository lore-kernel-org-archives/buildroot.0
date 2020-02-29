From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Feb 2020 17:47:34 +0100
Subject: [Buildroot] [PATCH v2,
 1/3] package/libarchive: security bump to version 3.4.2
In-Reply-To: <20200228221236.1982482-1-fontaine.fabrice@gmail.com>
References: <20200228221236.1982482-1-fontaine.fabrice@gmail.com>
Message-ID: <20200229164734.GQ8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-02-28 23:12 +0100, Fabrice Fontaine spake thusly:
> - Fix CVE-2020-9308: archive_read_support_format_rar5.c in libarchive
>   before 3.4.2 attempts to unpack a RAR5 file with an invalid or
>   corrupted header (such as a header size of zero), leading to a SIGSEGV
>   or possibly unspecified other impact.
> - Add new mbedtls optional dependency and use --with-nettle to enable
>   nettle support, see
>   https://github.com/libarchive/libarchive/commit/f96a71144b7725ca4a94d84bd27d7dca8c2f58d2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I applied to master, but I forcefulyl disable the new optional
dependency to mbedtls for master (as it is a new feature).

Care to resend a update patch that just adds the new mbedtls dependency?

Thanks!

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>  - Add --without-mbedtls to host variant
> 
>  package/libarchive/libarchive.hash |  2 +-
>  package/libarchive/libarchive.mk   | 11 ++++++++++-
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
> index b01d6368a5..9da4eb3baa 100644
> --- a/package/libarchive/libarchive.hash
> +++ b/package/libarchive/libarchive.hash
> @@ -1,4 +1,4 @@
>  # From https://www.libarchive.de/downloads/sha256sums
> -sha256  fcf87f3ad8db2e4f74f32526dee62dd1fb9894782b0a503a89c9d7a70a235191  libarchive-3.4.1.tar.gz
> +sha256  b60d58d12632ecf1e8fad7316dc82c6b9738a35625746b47ecdcaf4aed176176  libarchive-3.4.2.tar.gz
>  # Locally computed:
>  sha256  e1e3d4ba9d0b0ccba333b5f5539f7c6c9a3ef3d57a96cd165d2c45eaa1cd026d  COPYING
> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
> index e256b72289..b7ae5fb0cf 100644
> --- a/package/libarchive/libarchive.mk
> +++ b/package/libarchive/libarchive.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBARCHIVE_VERSION = 3.4.1
> +LIBARCHIVE_VERSION = 3.4.2
>  LIBARCHIVE_SITE = https://www.libarchive.de/downloads
>  LIBARCHIVE_INSTALL_STAGING = YES
>  LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause, CC0-1.0, OpenSSL, Apache-2.0
> @@ -84,8 +84,16 @@ else
>  LIBARCHIVE_CONF_OPTS += --without-lzo2
>  endif
>  
> +ifeq ($(BR2_PACKAGE_MBEDTLS),y)
> +LIBARCHIVE_DEPENDENCIES += mbedtls
> +LIBARCHIVE_CONF_OPTS += --with-mbedtls
> +else
> +LIBARCHIVE_CONF_OPTS += --without-mbedtls
> +endif
> +
>  ifeq ($(BR2_PACKAGE_NETTLE),y)
>  LIBARCHIVE_DEPENDENCIES += nettle
> +LIBARCHIVE_CONF_OPTS += --with-nettle
>  else
>  LIBARCHIVE_CONF_OPTS += --without-nettle
>  endif
> @@ -123,6 +131,7 @@ HOST_LIBARCHIVE_CONF_OPTS = \
>  	--without-libiconv-prefix \
>  	--without-xml2 \
>  	--without-lzo2 \
> +	--without-mbedtls \
>  	--without-nettle \
>  	--without-openssl \
>  	--without-lzma
> -- 
> 2.25.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
