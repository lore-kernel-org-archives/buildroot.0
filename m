From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 16 Jul 2017 07:42:20 +0300
Subject: [Buildroot] [PATCH 1/1] flip libressl and openssl dependency
 logic
In-Reply-To: <20170715202943.16855-1-Adamduskett@outlook.com>
References: <20170715202943.16855-1-Adamduskett@outlook.com>
Message-ID: <20170716044220.5ekbpgkv2lt7fyng@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Sat, Jul 15, 2017 at 04:29:43PM -0400, Adam Duskett wrote:
> As it currently sits, if you have libressl selected and run make,
> you will get this error message:
> 
> package/openssl/Config.in:1:error: recursive dependency detected!
> symbol BR2_PACKAGE_OPENSSL is selected by BR2_PACKAGE_LIBRESSL
> symbol BR2_PACKAGE_LIBRESSL depends on BR2_PACKAGE_OPENSSL
> 
> If you instead add "depends on !BR2_PACKAGE_LIBRESSL" to Openssl and remove
> "depends on !BR2_PACKAGE_OPENSSL" from libressl, the error goes away.
> 
> This also has the added benefit of putting Libressl below OpenSSL in the
> menuconfig, as Peter originally wanted.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  package/Config.in            | 2 +-
>  package/libressl/Config.in   | 1 -
>  package/libressl/libressl.mk | 1 +
>  package/openssl/Config.in    | 2 ++
>  4 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/Config.in b/package/Config.in
> index b48ab5e..463ed3e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -989,9 +989,9 @@ menu "Crypto"
>  	source "package/libuecc/Config.in"
>  	source "package/mbedtls/Config.in"
>  	source "package/nettle/Config.in"
> +	source "package/openssl/Config.in"
>  	# libressl is a openssl replacement
>  	source "package/libressl/Config.in"
> -	source "package/openssl/Config.in"
>  	source "package/rhash/Config.in"
>  	source "package/tinydtls/Config.in"
>  	source "package/trousers/Config.in"
> diff --git a/package/libressl/Config.in b/package/libressl/Config.in
> index 0a1c9e2..f827e24 100644
> --- a/package/libressl/Config.in
> +++ b/package/libressl/Config.in
> @@ -1,6 +1,5 @@
>  config BR2_PACKAGE_LIBRESSL
>  	bool "libressl"
> -	depends on !BR2_PACKAGE_OPENSSL
>  	help
>  	  LibreSSL is a version of the TLS/crypto stack forked from
>  	  OpenSSL in 2014, with goals of modernizing the codebase,
> diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
> index ccd236d..a4d4098 100644
> --- a/package/libressl/libressl.mk
> +++ b/package/libressl/libressl.mk
> @@ -18,3 +18,4 @@ LIBRESSL_POST_INSTALL_TARGET_HOOKS += LIBRESSL_REMOVE_BIN
>  endif
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))

The reason for this change is not mentioned in the commit log. Is it intended?

baruch

> diff --git a/package/openssl/Config.in b/package/openssl/Config.in
> index e08b648..315a40d 100644
> --- a/package/openssl/Config.in
> +++ b/package/openssl/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_OPENSSL
>  	bool "openssl"
> +	depends on !BR2_PACKAGE_LIBRESSL
>  	select BR2_PACKAGE_ZLIB
>  	help
>  	  A collaborative effort to develop a robust, commercial-grade, fully
>  	  featured, and Open Source toolkit implementing the Secure Sockets

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
