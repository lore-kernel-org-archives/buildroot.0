From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 May 2014 01:02:40 +0200
Subject: [Buildroot] uboot.pbl - make 'include' issue
In-Reply-To: <20140501004716.5a27705a@skate>
References: <OFB2294D5B.F4E5AC38-ON86257CCA.00752EA9-86257CCA.00753202@rockwellcollins.com>
 <20140430223910.GF3336@free.fr> <20140501004716.5a27705a@skate>
Message-ID: <20140430230240.GH3336@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Ryan, All,

On 2014-05-01 00:47 +0200, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Thu, 1 May 2014 00:39:10 +0200, Yann E. MORIN wrote:
> 
> > Yes, that's not so surprising:
> > 
> >   - the $(eval $(generic-package)) use the $(pkgname) macro, which uses
> >     the $(pkgdir) macro
> > 
> >   - the $(pkgdir) macro is defined as thus:
> >         pkgdir = $(dir $(lastword $(MAKEFILE_LIST)))
> > 
> >   - and $(MAKEFILE_LIST) contains the _last_ Makefile that was parsed
> > 
> >   - but the pkg-inra expects that the last Makefile parsed be the
> >     current Makefile
> > 
> > Since you include other Makefiles from uboot.mk:
> >     boot/uboot/ppc-freescale/uboot-ppc-freescale.mk
> > 
> > then $(MAKEFILE_LIST) will end up with that when you call the usual eval
> > above, from which the generic-package derives the $(pkgdir) to be
> > "boot/uboot/ppc-freescale", and thus the $(pkgname) to be
> > "ppc-freescale", and not the "uboot" you expect.
> 
> I haven't looked at the details, but linux/linux.mk seems to be doing
> the exact same thing with the "Linux extensions" for real-time, and
> doesn't appear to have any problem. It does:
> 
> include $(sort $(wildcard linux/linux-ext-*.mk))
> 
> $(eval $(generic-package))
> 
> So by the time generic-package is expanded, the last included makefile
> is not linux.mk. And still the thing works.

Indeed, but the includes are all in the same directory, so pkgdir still
return "linux" and thus the pkgname is correct.

In Ryan's case, the included Makefiles are in sub-dirs of uboot, so
pkgdir returns that last sub-dir, hence the wrong pkgname.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
