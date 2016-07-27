From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jul 2016 23:32:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/transmission: Fix compilation
 when using system libminiupnpc with libutp disabled
In-Reply-To: <20160717154436.GI3614@free.fr>
References: <1467868386-32591-1-git-send-email-bernd.kuhls@t-online.de>
 <20160712164247.GB3680@free.fr> <20160717154436.GI3614@free.fr>
Message-ID: <20160727233258.244d4c8b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 17:44:36 +0200, Yann E. MORIN wrote:

> So it means that headers from the internal libutp will always be used,
> even if an external one is found. This is probably not very good...
> 
> Instead, I think the fix is probably something like:
> 
>     --- configure.ac(revision 14736)
>     +++ configure.a c)(working copy)
>     @@ -358,6 +358,10 @@
>          else
>            AC_MSG_ERROR("Unable to build uTP support -- C++ compiler not found")
>          fi
>     +else
>     +    # For the system libminiupnpc with UTC disabled,
>     +    # point to our bundled UTP headers
>     +    LIBUTP_CFLAGS="-I\$(top_srcdir)/third-party/"
>      fi
>      AC_SUBST(LIBUTP_CFLAGS)
>      AC_SUBST(LIBUTP_LIBS)
>     @@ -457,7 +461,7 @@
>          LIBUPNP_LIBS_QT="\$\${TRANSMISSION_TOP}/third-party/miniupnp/libminiupnp.a"
>      else
>          AC_DEFINE([SYSTEM_MINIUPNP])
>     -    LIBUPNP_CFLAGS="" 
>     +    LIBUPNP_CFLAGS="${LIBUTP_CFLAGS}"
>          LIBUPNP_LIBS="-lminiupnpc"
>          LIBUPNP_LIBS_QT="-lminiupnpc"
>      fi
> 
> Can you test and respin if OK, please?  Thanks! :-)

Bernd, I'll mark your patch as Changes Requested in patchwork. Could
you respin a new version that takes into account Yann's comment?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
