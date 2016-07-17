From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2016 17:44:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/transmission: Fix compilation
 when using system libminiupnpc with libutp disabled
In-Reply-To: <20160712164247.GB3680@free.fr>
References: <1467868386-32591-1-git-send-email-bernd.kuhls@t-online.de>
 <20160712164247.GB3680@free.fr>
Message-ID: <20160717154436.GI3614@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2016-07-12 18:42 +0200, Yann E. MORIN spake thusly:
> On 2016-07-07 07:13 +0200, Bernd Kuhls spake thusly:
> > Fixes
> > http://autobuild.buildroot.net/results/b79/b79e51140cb0320554a58ce59dcb33f53cd9211a/
> > 
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Well, I withdraw this review of mine... :-(

See below...

[--SNIP--]
> > +diff -uNr transmission-2.92.org/configure.ac transmission-2.92/configure.ac
> > +--- transmission-2.92.org/configure.ac	2016-03-06 21:23:45.336198393 +0100
> > ++++ transmission-2.92/configure.ac	2016-07-06 22:27:25.809613723 +0200
> > +@@ -333,6 +333,7 @@
> > +     want_utp_default="no"
> > + fi
> > + 
> > ++LIBUTP_CFLAGS="-I\$(top_srcdir)/third-party/"

So it means that headers from the internal libutp will always be used,
even if an external one is found. This is probably not very good...

Instead, I think the fix is probably something like:

    --- configure.ac(revision 14736)
    +++ configure.a c)(working copy)
    @@ -358,6 +358,10 @@
         else
           AC_MSG_ERROR("Unable to build uTP support -- C++ compiler not found")
         fi
    +else
    +    # For the system libminiupnpc with UTC disabled,
    +    # point to our bundled UTP headers
    +    LIBUTP_CFLAGS="-I\$(top_srcdir)/third-party/"
     fi
     AC_SUBST(LIBUTP_CFLAGS)
     AC_SUBST(LIBUTP_LIBS)
    @@ -457,7 +461,7 @@
         LIBUPNP_LIBS_QT="\$\${TRANSMISSION_TOP}/third-party/miniupnp/libminiupnp.a"
     else
         AC_DEFINE([SYSTEM_MINIUPNP])
    -    LIBUPNP_CFLAGS="" 
    +    LIBUPNP_CFLAGS="${LIBUTP_CFLAGS}"
         LIBUPNP_LIBS="-lminiupnpc"
         LIBUPNP_LIBS_QT="-lminiupnpc"
     fi

Can you test and respin if OK, please?  Thanks! :-)

Regards,
Yann E. MORIN.

> > + AC_ARG_ENABLE([utp],
> > +               AS_HELP_STRING([--enable-utp],[build ?TP support]),
> > +               [want_utp=${enableval}],
> > +@@ -346,7 +347,6 @@
> > +         AC_DEFINE([WITH_UTP],[1])
> > +         build_utp="system"
> > +     elif test "x$CXX" != "x"; then
> > +-        LIBUTP_CFLAGS="-I\$(top_srcdir)/third-party/"
> > +         LIBUTP_LIBS="\$(top_builddir)/third-party/libutp/libutp.a"
> > +         LIBUTP_LIBS_QT="\$\${TRANSMISSION_TOP}/third-party/libutp/libutp.a"
> > +         if test "x$libutp_extra_libs" != "x" ; then
> > -- 
> > 2.8.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
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
