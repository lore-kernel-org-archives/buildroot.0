From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jun 2021 21:58:50 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/bitcoin: unset the NDEBUG
 flag
In-Reply-To: <ZbTvPhursXFsHDblON1mtNTQnG937Il2N0wYa3ReI@cp4-web-037.plabs.ch>
References: <ZbTvPhursXFsHDblON1mtNTQnG937Il2N0wYa3ReI@cp4-web-037.plabs.ch>
Message-ID: <20210613195850.GT168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dick, All,

On 2021-06-13 18:45 +0000, Dick Olsson via buildroot spake thusly:
> Since https://git.buildroot.net/buildroot/commit/?id=5a8c50fe05afacc3cbe8e7347e238da9f242fab0
> all packages are now built with NDEBUG, which broke Bitcoin builds.
> 
> Bitcoin is using assert(...) extensively with the assumption of it
> never being a noop at runtime. So we cannot build with NDEBUG.
> See: https://github.com/bitcoin/bitcoin/blob/0.21/src/compat/assumptions.h
> 
> Signed-off-by: Dick Olsson <hi@senzilla.io>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> Revision 2:
> 
> - Fixed review item by Yann
> - Properly include all target flags
> 
> Revision 3:
> 
> - Fixed tab indentation
> ---
>  package/bitcoin/bitcoin.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
> index 5f1684879c..409c9a61c9 100644
> --- a/package/bitcoin/bitcoin.mk
> +++ b/package/bitcoin/bitcoin.mk
> @@ -13,6 +13,12 @@ BITCOIN_CPE_ID_VENDOR = bitcoin
>  BITCOIN_CPE_ID_PRODUCT = bitcoin_core
>  BITCOIN_DEPENDENCIES = host-pkgconf boost libevent
>  BITCOIN_MAKE_ENV = BITCOIN_GENBUILD_NO_GIT=1
> +# Bitcoin is using assert(...) extensively with the assumption of it
> +# never being a noop at runtime. So we cannot build with NDEBUG.
> +BITCOIN_CONF_ENV = \
> +	CPPFLAGS="$(TARGET_CPPFLAGS) -UNDEBUG" \
> +	CFLAGS="$(TARGET_CFLAGS) -UNDEBUG" \
> +	CXXFLAGS="$(TARGET_CXXFLAGS) -UNDEBUG"
>  BITCOIN_CONF_OPTS = \
>  	--disable-bench \
>  	--disable-wallet \
> -- 
> 2.30.2
> 
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
