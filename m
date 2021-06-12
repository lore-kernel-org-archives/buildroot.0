From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 11:51:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/bitcoin: unset the NDEBUG flag
In-Reply-To: <eIIz4qpp1iCjP9F8wSbhB85GxfrjYh4LnxsTUDodko@cp4-web-032.plabs.ch>
References: <eIIz4qpp1iCjP9F8wSbhB85GxfrjYh4LnxsTUDodko@cp4-web-032.plabs.ch>
Message-ID: <20210612095128.GP168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dick, All,

On 2021-06-11 20:06 +0000, Dick Olsson via buildroot spake thusly:
> Since https://git.buildroot.net/buildroot/commit/?id=5a8c50fe05afacc3cbe8e7347e238da9f242fab0
> all packages are now built with NDEBUG, which broke Bitcoin builds.
> 
> Bitcoin is using assert(...) extensively with the assumption of it
> never being a noop at runtime. So we cannot build with NDEBUG.
> See: https://github.com/bitcoin/bitcoin/blob/0.21/src/compat/assumptions.h
> 
> Signed-off-by: Dick Olsson <hi@senzilla.io>
> ---
>  package/bitcoin/bitcoin.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
> index 5f1684879c..27fc2d5051 100644
> --- a/package/bitcoin/bitcoin.mk
> +++ b/package/bitcoin/bitcoin.mk
> @@ -13,6 +13,9 @@ BITCOIN_CPE_ID_VENDOR = bitcoin
>  BITCOIN_CPE_ID_PRODUCT = bitcoin_core
>  BITCOIN_DEPENDENCIES = host-pkgconf boost libevent
>  BITCOIN_MAKE_ENV = BITCOIN_GENBUILD_NO_GIT=1
> +# Bitcoin is using assert(...) extensively with the assumption of it
> +# never being a noop at runtime. So we cannot build with NDEBUG.
> +BITCOIN_CONF_ENV = CFLAGS="-UNDEBUG" CXXFLAGS="-UNDEBUG"

That's insufficient, because that will entirely override the original
CFLAGS/CXXFLAGS the autotools infra is passing:

    https://git.buildroot.org/buildroot/tree/package/pkg-autotools.mk#n180

with CFLAGS et al. inherited from TARGET_CONFIGURE_OPTS:

    https://git.buildroot.org/buildroot/tree/package/Makefile.in#n252

In this case, since you override the infra-provided flags, the -DNDEBUG
is not present in the flags, so it is not surprising that it works.

So, the proper solution is to extend them.

Additionally, I thing we should also override CPPFLAGS.

    BITCOIN_CONF_ENV = \
        CPPFLAGS="$(TARGET_CPPFLAGS) -UNDEBUG" \
        CFLAGS="$(TARGET_CFLAGS) -UNDEBUG" \
        CXXFLAGS="$(TARGET_CXXFLAGS) -UNDEBUG"

Can you check this is still working, and if so respin a patch?

An alternative solution, *iff* the above does not work, would be to
filter out -DNDEBUG, like so:

    BITCOIN_CONF_ENV = \
        CPPFLAGS="$(filter-out -DNDEBUG,$(TARGET_CPPFLAGS))" \
        CFLAGS="$(filter-out -DNDEBUG,$(TARGET_CFLAGS))" \
        CXXFLAGS="$(filter-out -DNDEBUG,$(TARGET_CXXFLAGS))"

Regards,
Yann E. MORIN.

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
