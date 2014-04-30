From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 May 2014 00:47:16 +0200
Subject: [Buildroot] uboot.pbl - make 'include' issue
In-Reply-To: <20140430223910.GF3336@free.fr>
References: <OFB2294D5B.F4E5AC38-ON86257CCA.00752EA9-86257CCA.00753202@rockwellcollins.com>
 <20140430223910.GF3336@free.fr>
Message-ID: <20140501004716.5a27705a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 1 May 2014 00:39:10 +0200, Yann E. MORIN wrote:

> Yes, that's not so surprising:
> 
>   - the $(eval $(generic-package)) use the $(pkgname) macro, which uses
>     the $(pkgdir) macro
> 
>   - the $(pkgdir) macro is defined as thus:
>         pkgdir = $(dir $(lastword $(MAKEFILE_LIST)))
> 
>   - and $(MAKEFILE_LIST) contains the _last_ Makefile that was parsed
> 
>   - but the pkg-inra expects that the last Makefile parsed be the
>     current Makefile
> 
> Since you include other Makefiles from uboot.mk:
>     boot/uboot/ppc-freescale/uboot-ppc-freescale.mk
> 
> then $(MAKEFILE_LIST) will end up with that when you call the usual eval
> above, from which the generic-package derives the $(pkgdir) to be
> "boot/uboot/ppc-freescale", and thus the $(pkgname) to be
> "ppc-freescale", and not the "uboot" you expect.

I haven't looked at the details, but linux/linux.mk seems to be doing
the exact same thing with the "Linux extensions" for real-time, and
doesn't appear to have any problem. It does:

include $(sort $(wildcard linux/linux-ext-*.mk))

$(eval $(generic-package))

So by the time generic-package is expanded, the last included makefile
is not linux.mk. And still the thing works.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
