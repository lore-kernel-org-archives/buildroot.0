From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Oct 2020 10:22:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/transmission: fix build with UTP
In-Reply-To: <20201017215231.GU3466@scaer>
References: <20201017192651.3739425-1-fontaine.fabrice@gmail.com>
 <20201017215231.GU3466@scaer>
Message-ID: <CAPi7W83Ey2Eq5nVyaZb8VcVYzY2Hm2zfziCG=bkGqJRd7+NaHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le sam. 17 oct. 2020 ? 23:52, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>
> Fabrice, All,
>
> On 2020-10-17 21:26 +0200, Fabrice Fontaine spake thusly:
> > Update first patch to fix build of transmission 3.00 with UTP
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/bbfb61cf911fb29dcc02626f6eb47fff9e5e64f5
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/transmission/0001-fix-utypes.patch | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/package/transmission/0001-fix-utypes.patch b/package/transmission/0001-fix-utypes.patch
> > index 96403a6c36..e0bc633bd4 100644
> > --- a/package/transmission/0001-fix-utypes.patch
> > +++ b/package/transmission/0001-fix-utypes.patch
> > @@ -6,10 +6,13 @@ The corresponding upstream bug report (unfixed) can be found here:
> >  https://trac.transmissionbt.com/ticket/5232
> >
> >  Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
> > +[Fabrice: remove HAVE_STDBOOL_H as it is never defined since
> > +https://github.com/transmission/transmission/commit/f27596238d37f14477cc474c62c52eb53c4dcea6]
> > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> >
> >  --- transmission-2.82.org/third-party/libutp/utypes.h        2013-08-09 04:47:43.000000000 +0200
> >  +++ transmission-2.82/third-party/libutp/utypes.h    2014-01-02 20:17:18.000000000 +0100
> > -@@ -35,8 +35,15 @@
> > +@@ -35,8 +35,11 @@
> >   typedef const char * cstr;
> >   typedef char * str;
> >
> > @@ -20,11 +23,7 @@ Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
> >  +//typedef uint8 bool;
> >  +//#endif
> >  +#ifndef __cplusplus
> > -+#ifdef HAVE_STDBOOL_H
> >  +#include <stdbool.h>
> > -+#else
> > -+typedef uint8 bool;
> > -+#endif
>
> If HAVE_STDBOOL_H is never defined, then presumably we always take the
> else clause path, no?
Yes, we always take the else clause path and this is the root cause of
the build failure with transmission 3.00.
transmission 3.00 unconditionally includes stdbool.h so our patch on
libutp must also include it unconditionally instead of defining it to
uint8 if HAVE_STDBOOL_H is not defined.
>
> Regards,
> Yann E. MORIN.
>
> >  +#endif
> >
> >   #endif //__UTYPES_H__
> > --
> > 2.28.0
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
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
Best Regards,

Fabrice
