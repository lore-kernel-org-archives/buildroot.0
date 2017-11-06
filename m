From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 6 Nov 2017 06:49:05 +0200
Subject: [Buildroot] [PATCH] libssh2: revert to previous crypto defaults
In-Reply-To: <20171105213402.26615-1-peter@korsgaard.com>
References: <20171105213402.26615-1-peter@korsgaard.com>
Message-ID: <20171106044905.dmcl4skovwtypj63@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sun, Nov 05, 2017 at 10:34:02PM +0100, Peter Korsgaard wrote:
> The recent crypto handling change (commit 04a1031d3: package/libssh2: Add
> selectable crypto libraries) had the unfortunate side effect that it no
> longer automatically selects the most suitable crypto backend (E.G.  one
> where the dependency is already enabled), so all users not wanting to use
> the mbedtls backend need to explicitly configure this.
> 
> Fix this by inverting the logic so the crypto backend sub options use
> 'depends on' their dependencies instead of 'select', so only the available
> backends are displayed.
> 
> Like before, default to openssl if no crypto backend dependencies are
> currently enabled.

The CHANGES file needs an update. It currently says:

  The default is mbedtls, even if you didn't have mbedtls selected before.

baruch

> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/libssh2/Config.in | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libssh2/Config.in b/package/libssh2/Config.in
> index f2d32a90ae..90c38813b3 100644
> --- a/package/libssh2/Config.in
> +++ b/package/libssh2/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBSSH2
>  	bool "libssh2"
> +	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_MBEDTLS || BR2_PACKAGE_LIBGCRYPT)
>  	help
>  	  libssh2 is a client-side C library implementing the SSH2
>  	  protocol as defined by Internet Drafts: SECSH-TRANS(22),
> @@ -17,16 +18,15 @@ choice
>  
>  config BR2_PACKAGE_LIBSSH2_MBEDTLS
>  	bool "mbedtls"
> -	select BR2_PACKAGE_MBEDTLS
> +	depends on BR2_PACKAGE_MBEDTLS
>  
>  config BR2_PACKAGE_LIBSSH2_LIBGCRYPT
>  	bool "gcrypt"
> -	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt -> libgpg-error
> -	select BR2_PACKAGE_LIBGCRYPT
> +	depends on BR2_PACKAGE_LIBGCRYPT
>  
>  config BR2_PACKAGE_LIBSSH2_OPENSSL
>  	bool "openssl"
> -	select BR2_PACKAGE_OPENSSL
> +	depends on BR2_PACKAGE_OPENSSL
>  
>  endchoice
>  endif

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
