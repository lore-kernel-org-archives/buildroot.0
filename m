From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 23:17:31 +0100
Subject: [Buildroot] [PATCH 1/3] bdwgc: add patch automatically
 detecting for NO_GETCONTEXT need
In-Reply-To: <20141217213602.GC4293@free.fr>
References: <1418492588-22122-1-git-send-email-s.martin49@gmail.com>
 <20141217213602.GC4293@free.fr>
Message-ID: <20141221231731.7bdd1631@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 17 Dec 2014 22:36:02 +0100, Yann E. MORIN wrote:

> The first I could find was GNU Pth (dead since 2006), and then ruby. And
> they both use that:
> 
>     AC_CHECK_FUNCS([getcontext setcontext])
> 
> which would automatically define HAVE_getcontext and HAVE_setcontext if
> they are available, but that's macro definitions, not available in
> configure, so we could not do the following:
> 
> > ++AC_MSG_RESULT($need_no_getcontext)
> > ++if test x$need_no_getcontext = xyes ; then
> > ++  CFLAGS="$CFLAGS -DNO_GETCONTEXT"
> > ++  CPPFLAGS="$CPPFLAGS -DNO_GETCONTEXT"
> > ++fi

Well, you can do:

	AC_CHECK_FUNCS([getcontext], [has_getcontext=yes])
	AC_CHECK_FUNCS([setcontext], [has_setcontext=yes])

if test x${has_getcontext} != xyes -o x${has_setcontext} != xyes; then
	CFLAGS="$CFLAGS -DNO_GETCONTEXT"
	CPPFLAGS="$CPPFLAGS -DNO_GETCONTEXT"
fi

You need two tests because AC_CHECK_FUNCS() runs the action-if-found if
at least one of the functions are found.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
