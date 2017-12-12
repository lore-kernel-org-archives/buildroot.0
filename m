From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 Dec 2017 19:32:06 +0200
Subject: [Buildroot] [PATCH] wolfssl: new package
In-Reply-To: <1513098237-18245-1-git-send-email-sergio.prado@e-labworks.com>
References: <1513098237-18245-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20171212173206.vablwxvwcpjfrffn@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sergio,

On Tue, Dec 12, 2017 at 03:03:57PM -0200, Sergio Prado wrote:
> The wolfSSL embedded SSL library is a lightweight and portable
> SSL/TLS library.
> 
> Tested on Beaglebone Black.

How have you tested this library?

> Build-tested with test-pkg script.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  DEVELOPERS                   |  1 +
>  package/Config.in            |  1 +
>  package/wolfssl/Config.in    |  9 +++++++++
>  package/wolfssl/wolfssl.hash |  6 ++++++
>  package/wolfssl/wolfssl.mk   | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 61 insertions(+)
>  create mode 100644 package/wolfssl/Config.in
>  create mode 100644 package/wolfssl/wolfssl.hash
>  create mode 100644 package/wolfssl/wolfssl.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 77e3344fa4dc..54ba8ceb2a64 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1541,6 +1541,7 @@ F:	package/mongodb/
>  F:	package/stella/
>  F:	package/tunctl/
>  F:	package/ubus/
> +F:	package/wolfssl/
>  
>  N:	Simon Dawson <spdawson@gmail.com>
>  F:	boot/at91bootstrap3/
> diff --git a/package/Config.in b/package/Config.in
> index cb2141b8f3c8..1455ca6ddc1a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1046,6 +1046,7 @@ menu "Crypto"
>  	source "package/tinydtls/Config.in"
>  	source "package/trousers/Config.in"
>  	source "package/ustream-ssl/Config.in"
> +	source "package/wolfssl/Config.in"
>  endmenu
>  
>  menu "Database"
> diff --git a/package/wolfssl/Config.in b/package/wolfssl/Config.in
> new file mode 100644
> index 000000000000..3c62db13c57b
> --- /dev/null
> +++ b/package/wolfssl/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_WOLFSSL
> +	bool "wolfssl"
> +	help
> +	  The wolfSSL embedded SSL library (formerly CyaSSL) is a
> +	  lightweight, portable, C-language-based SSL/TLS library
> +	  targeted at IoT, embedded, and RTOS environments primarily
> +	  because of its size, speed, and feature set.
> +
> +	  https://www.wolfssl.com/
> diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
> new file mode 100644
> index 000000000000..26534038f62d
> --- /dev/null
> +++ b/package/wolfssl/wolfssl.hash
> @@ -0,0 +1,6 @@
> +# Locally computed:
> +sha256 0e0750705ceb0b42d83e609a1c35c3203734af50a92b15e2706bc06a6e50a439  v3.12.2-stable.tar.gz
> +
> +# Hash for license files:
> +sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> +sha256 74adaaef40b96c71378b6daa3feb8ccd4a1bfd9b76debf3f3f29cf3a0e86c9a0  LICENSING
> diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
> new file mode 100644
> index 000000000000..9f3362bf6a42
> --- /dev/null
> +++ b/package/wolfssl/wolfssl.mk
> @@ -0,0 +1,44 @@
> +################################################################################
> +#
> +# wolfssl
> +#
> +################################################################################
> +
> +WOLFSSL_VERSION = 3.12.2
> +WOLFSSL_SITE = https://github.com/wolfSSL/wolfssl/archive
> +WOLFSSL_SOURCE = v$(WOLFSSL_VERSION)-stable.tar.gz
> +
> +WOLFSSL_LICENSE = GPL-2.0
> +WOLFSSL_LICENSE_FILES = COPYING LICENSING
> +
> +WOLFSSL_DEPENDENCIES = host-pkgconf
> +
> +WOLFSSL_AUTORECONF = YES

Please add a comment explaining with autoreconf is needed.

> +WOLFSSL_CONF_OPTS += --disable-examples
> +
> +ifeq ($(BR2_PACKAGE_NGINX),y)
> +WOLFSSL_CONF_OPTS += --enable-nginx
> +else
> +WOLFSSL_CONF_OPTS += --disable-nginx
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIGHTTPD),y)
> +WOLFSSL_CONF_OPTS += --enable-lighty
> +else
> +WOLFSSL_CONF_OPTS += --disable-lighty
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT),y)
> +WOLFSSL_CONF_OPTS += --enable-wpas --enable-sha512
> +else
> +WOLFSSL_CONF_OPTS += --disable-wpas
> +endif

This is strange. Usually a package using SSL/TLS library needs to be aware of 
the library, not the other way around. Can you explain what is the effect of 
these configure options?

baruch

> +ifeq ($(BR2_ARM_CPU_ARMV8A),y)
> +WOLFSSL_CONF_OPTS += --enable-armasm
> +else
> +WOLFSSL_CONF_OPTS += --disable-armasm
> +endif
> +
> +$(eval $(autotools-package))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
