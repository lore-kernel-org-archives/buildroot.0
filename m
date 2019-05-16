From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 16 May 2019 21:43:20 +0200
Subject: [Buildroot] [PATCH 2/2] package/mono: add libunwind optional
 dependency
In-Reply-To: <20190516082910.5ed9ab2c@windsurf>
References: <20190515204721.18722-1-fontaine.fabrice@gmail.com>
 <20190515204721.18722-2-fontaine.fabrice@gmail.com>
 <20190516082910.5ed9ab2c@windsurf>
Message-ID: <CAPi7W82iu7AYsC0NzXHTiMFvR-4Q6+rfpzPHy_ZLHMn=hZZf0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le jeu. 16 mai 2019 ? 08:29, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> On Wed, 15 May 2019 22:47:21 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > +_Unwind_GetIP is used in build_stack_trace however this function can be
> > +provided by libunwind so check for it to avoid the following build
> > +failure:
> > +
> > +/home/buildroot/autobuild/run/instance-1/output/host/lib/gcc/arm-buildroot-linux-musleabihf/7.4.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: ./.libs/libmini.a(libmini_la-mini-exceptions.o): in function `build_stack_trace':
> > +/home/buildroot/autobuild/run/instance-1/output/build/mono-5.20.1.27/mono/mini/mini-exceptions.c:365: undefined reference to `_Unwind_GetIP'
> > +collect2: error: ld returned 1 exit status
>
> I am really not familiar with _Unwind_GetIP, and I haven't done much
> research, but it seems like _Unwind_GetIP is also provided by libgcc.
>
> Did you make some further research to understand what is
> _Unwind_GetIP ? Or was your analysis just based on "mono needs
> _Unwind_GetIP, it's provided by libunwind, let's link with it" ?
My analysis was based on the fact that the build failures occured only
when libunwind was built before mono.
I traced back this error to the installation of unwind.h by libunwind
which contains the following definition of _Unwind_GetIP:
extern unsigned long _Unwind_GetIP (struct _Unwind_Context *);

However, libunwind implements _Unwind_GetIP in src/unwind/GetIP.c only
if --enable-cxx-exceptions is defined.

On his side, mono includes unwind.h if it's available:
#ifdef HAVE_UNWIND_H
#include <unwind.h>
#endif

unwind.h and _Unwind_GetIP can also be provided by glibc but that's
not the cause of this build failure on musl.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
