From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 23 Dec 2014 14:02:00 +0100
Subject: [Buildroot] [PATCH 1/3] bdwgc: add patch automatically
 detecting for NO_GETCONTEXT need
In-Reply-To: <20141221231731.7bdd1631@free-electrons.com>
References: <1418492588-22122-1-git-send-email-s.martin49@gmail.com>
 <20141217213602.GC4293@free.fr>
 <20141221231731.7bdd1631@free-electrons.com>
Message-ID: <20141223130200.GC4152@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-21 23:17 +0100, Thomas Petazzoni spake thusly:
> On Wed, 17 Dec 2014 22:36:02 +0100, Yann E. MORIN wrote:
> 
> > The first I could find was GNU Pth (dead since 2006), and then ruby. And
> > they both use that:
> > 
> >     AC_CHECK_FUNCS([getcontext setcontext])
> > 
> > which would automatically define HAVE_getcontext and HAVE_setcontext if
> > they are available, but that's macro definitions, not available in
> > configure, so we could not do the following:
> > 
> > > ++AC_MSG_RESULT($need_no_getcontext)
> > > ++if test x$need_no_getcontext = xyes ; then
> > > ++  CFLAGS="$CFLAGS -DNO_GETCONTEXT"
> > > ++  CPPFLAGS="$CPPFLAGS -DNO_GETCONTEXT"
> > > ++fi
> 
> Well, you can do:
> 
> 	AC_CHECK_FUNCS([getcontext], [has_getcontext=yes])
> 	AC_CHECK_FUNCS([setcontext], [has_setcontext=yes])

Using AC_CHECK_FUNCS is not enough, because uClibc declares prototypes
for getcontext/setcontext, but there might be no implementation of them.

So we have to attempt a link.

> if test x${has_getcontext} != xyes -o x${has_setcontext} != xyes; then
> 	CFLAGS="$CFLAGS -DNO_GETCONTEXT"
> 	CPPFLAGS="$CPPFLAGS -DNO_GETCONTEXT"
> fi
> 
> You need two tests because AC_CHECK_FUNCS() runs the action-if-found if
> at least one of the functions are found.

Yup.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
