From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Aug 2020 09:25:05 +0200
Subject: [Buildroot] [PATCH v2] package/apcupsd: add -lstdc++ for ARC7*
 and SPARC
In-Reply-To: <20200812171821.2517-1-Evgeniy.Didin@synopsys.com>
References: <20200812171821.2517-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20200817072505.GM24264@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Evgeniy, James, All,

On 2020-08-12 20:18 +0300, Evgeniy Didin spake thusly:
> For some reason apcupsd is not building for ARC700 and SPARC,
> adding "-lstdc++" solves the issue.

So, as Thomas already replied, this is not an acceptable explanation.

The real question is "why are they forgetting to link with -lstdc++ when
linking a C++ program to begin with?"

And the reason is that they are using gcc to do the link line-wrapping
by me for readability):

    $ make V=
    /home/ymorin/dev/buildroot/O/host/bin/sparc-linux-gcc -static .obj/options.o \
        .obj/device.o .obj/reports.o .obj/action.o .obj/apcupsd.o .obj/apcnis.o \
        /home/ymorin/dev/buildroot/O/build/apcupsd-3.14.14/src/drivers/libdrivers.a \
        /home/ymorin/dev/buildroot/O/build/apcupsd-3.14.14/src/drivers/apcsmart/libapcsmartdrv.a \
        /home/ymorin/dev/buildroot/O/build/apcupsd-3.14.14/src/lib/libapc.a \
        -o apcupsd -lsupc++ -lpthread

Why are they using 'sparc-linux-gcc'?

Buildroot passes LD='.../sparc-linux-ld' so it's not us passing an
inappropriate value.

So, investigating further, it turns out that in fact, apcusd is not
really an autotools package, since it only uses autoconf and not
automake, so their Makefiles are a not traditional... :-/

That aside, their autoconf/configure.in has this gem:


   816 if test -n "$GCC"; then
   817    # Starting with GCC 3.0, you must link C++ programs against either
   818    # libstdc++ (shared by default), or libsupc++ (always static).  If
   819    # you care about binary portability between Linux distributions,
   820    # you need to either 1) build your own GCC with static C++ libraries
   821    # or 2) link using gcc and libsupc++.  We choose the latter since
   822    # CUPS doesn't (currently) use any of the stdc++ library.
   823    #
   824    # Previous versions of GCC do not have the reliance on the stdc++
   825    # or g++ libraries, so the extra supc++ library is not needed.
   826    AC_MSG_CHECKING(if libsupc++ is required)
   827
   828    SUPC="`$CXX -print-file-name=libsupc++.a 2>/dev/null`"
   829    case "$SUPC" in
   830    libsupc++.a*)
   831       # Library not found, so this is an older GCC...
   832       LD="$CXX"
   833       AC_MSG_RESULT(no)
   834       ;;
   835    *)
   836       # This is gcc 3.x, and it knows of libsupc++, so we need it
   837       LIBS="$LIBS -lsupc++"
   838       LD="$CC"
   839       AC_MSG_RESULT(yes)
   840
   841       # See if this system has a broken libsupc++ that requires
   842       # a workaround (FreeBSD 5.x, 6.x)
   843       case $host in
   844          *-*-freebsd*)
   845             AC_MSG_CHECKING(if libsupc++ is missing __terminate_handler)
   846             nm -C --defined-only "$SUPC" 2>/dev/null | grep __terminate_handler > /dev/null
   847             if test $? -eq 0 ; then
   848                AC_MSG_RESULT(no)
   849             else
   850                AC_MSG_RESULT(yes -- will attempt workaround)
   851                LIBEXTRAOBJ="$LIBEXTRAOBJ libsupc++fix.cpp"
   852             fi
   853             ;;
   854       esac
   855       ;;
   856    esac
   857 fi

So, they are trying to outsmart the compiler in some funky ways...
This is so not good... :-(

Notice that they already have a workaround for a missing symbol, not
unlike the situation we have...

And now we can also see where the explicit -lsupc++ comes from, and
indeed the configure steps properly reports it as well:

    checking if libsupc++ is required... yes

So, the real fix IMNSHO would be to use gcc to do the actual link, and
get rid of this ugliness above, probably by changing the condition in
an upstream-acceptable way:

    if test -n "$GCC" && test -z "$LD"; then
        # Their big comment as-is, followed by:
        # 
        # But don;t do that is the user was smart enough to provide
        # their own LD

But even then, I'm not sure that would be upstreamable either, because
LD *is* already earlier in the configure.in:

   147 dnl Default linker is gcc
   148 if test x$LD = x ; then
   149    LD="$CC"
   150 fi

So this hunk would probably have to go after this big if, above:

    if test -n "$GCC" && test -z "$LD"; then
        [...]
    fi

    dnl Default linker is gcc
    if test x$LD = x ; then
        LD="$CC"
    fi

Rejoice, for we now know why we have the issue! ;-)

Regards,
Yann E. MORIN.

> Fixes:
> http://autobuild.buildroot.org/results/3be/3bedf404de0ea42ee3ba624cded65d310a847af9//
> http://autobuild.buildroot.org/results/6ab/6ab4e8021aad13bc153a6c22e87a77bf2bdc21e0//
> 
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com
> ---
> Changes since v1:
> -Removed commented lines
> 
>  package/apcupsd/apcupsd.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/apcupsd/apcupsd.mk b/package/apcupsd/apcupsd.mk
> index 410bce9aec..d2001419d6 100644
> --- a/package/apcupsd/apcupsd.mk
> +++ b/package/apcupsd/apcupsd.mk
> @@ -18,6 +18,10 @@ APCUPSD_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libusb`"
>  endif
>  endif
>  
> +ifeq ($(BR2_arc770d)$(BR2_arc750d)$(BR2_sparc),y)
> +APCUPSD_CONF_ENV += LIBS+="-lstdc++"
> +endif
> +
>  ifeq ($(BR2_PACKAGE_APCUPSD_APCSMART),y)
>  APCUPSD_CONF_OPTS += --enable-apcsmart
>  else
> -- 
> 2.16.2
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
