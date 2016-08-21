From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Aug 2016 15:20:28 +0200
Subject: [Buildroot] [PATCH] ncurses: fix wide-char enabled compilation
 for noMMU targets
In-Reply-To: <20160731082850.GA30195@waldemar-brodkorb.de>
References: <20160731082850.GA30195@waldemar-brodkorb.de>
Message-ID: <20160821132027.GA5780@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar, All,

On 2016-07-31 10:28 +0200, Waldemar Brodkorb spake thusly:
> For noMMU targets -D_XOPEN_SOURCE_EXTENDED must be explicitely
> passed to the preprocessor to allow cchar_t usage.
> 
> Fixes:
> http://autobuild.buildroot.net/results/5bb34ff490c70eea5e4fb497e5228ca1319fffdc/
> http://autobuild.buildroot.net/results/8ba1410ed3ffb4954ccc4b7c3996d1839d677bef/
> http://autobuild.buildroot.net/results/26ee52ad549b7ef75c9ce4b2eae94f9312cea775/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/ncurses/Config.in  |    2 --
>  package/ncurses/ncurses.mk |    4 ++++
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ncurses/Config.in b/package/ncurses/Config.in
> index 44713f9..8c8acde 100644
> --- a/package/ncurses/Config.in
> +++ b/package/ncurses/Config.in
> @@ -13,8 +13,6 @@ if BR2_PACKAGE_NCURSES
>  config BR2_PACKAGE_NCURSES_WCHAR
>  	bool "enable wide char support"
>  	depends on BR2_USE_WCHAR
> -	# Build broken @ curses.priv.h with bad declarations
> -	depends on !(BR2_bfin && BR2_BINFMT_FLAT)
>  	help
>  	  Enable wide char & UTF-8 support in ncurses libraries
>  
> diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
> index bef57c5..412f548 100644
> --- a/package/ncurses/ncurses.mk
> +++ b/package/ncurses/ncurses.mk
> @@ -57,8 +57,12 @@ NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_FORM) += form
>  
>  ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
>  NCURSES_CONF_OPTS += --enable-widec
> +# for noMMU we need to set it explicitely, fixes cchar_t problem
> +NCURSES_CPPFLAGS += -D_XOPEN_SOURCE_EXTENDED

As noticed by Thomas, I don't think this is the correct solution.

If you look at configure.in, you'll see they have a test to decide
whether _XOPEN_SOURCE_EXTENDED is needed or not. For targets with an
MMU, this test is checked, while it is not for a noMMU target. (Yes, for
an MMU platform, the test concludes that defining it is not needed.)

I think the correct solution would be to see why this test does not pass
for noMMU.

Adn the reason it does not is that it decides to add -D_XOPEN_SOURCE=500
to CPPFLAGS when calling CF_XOPEN_SOURCE(500) (line 697 in configure.in)

The function checks for ${host_os} for various well-known values. One
interesting well-known value is (sxerpt from aclocal.m4):

    6504 case $host_os in #(vi
    [...]
    6534 linux*|gnu*|mint*|k*bsd*-gnu) #(vi
    6535     CF_GNU_SOURCE
    6536     ;;
    [...]
    6561 *)
    6562     AC_CACHE_CHECK(if we should define _XOPEN_SOURCE,cf_cv_xopen_source,[
    [...]
    6587 esac

See the value on line 6534? It is only about 'linux*'. But then when you
look at how we call ./configure:

    ./configure \
        --target=m68k-buildroot-uclinux-uclibc \
        --host=m68k-buildroot-uclinux-uclibc \
        [...]

So, host_os=uclinux-uclibc and then it does not match 'linux*' and then
CF_XOPEN_SOURCE falls back to the generic case, which checks wrong for
uclinux.

So, the coirrect solution would seem to be to fix CF_XOPEN_SOURCE to
also include 'uclinux*' in the case, above.

And indeed, doing so does fix the build. ;-)

I'll send a patch shortly (after I clean up all my dirty traces in
configure...). In the meantime, I've marked your patch as rejected in
patchwork.

Thanks for triggering this investigation on my side! ;-)

Regards,
Yann E. MORIN.

>  NCURSES_LIB_SUFFIX = w
>  
> +NCURSES_CONF_ENV += CPPFLAGS="$(NCURSES_CPPFLAGS)"
> +
>  define NCURSES_LINK_LIBS_STATIC
>  	for lib in $(NCURSES_LIBS-y:%=lib%); do \
>  		ln -sf $${lib}$(NCURSES_LIB_SUFFIX).a \
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
