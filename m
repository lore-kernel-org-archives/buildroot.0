From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 May 2014 00:42:59 +0200
Subject: [Buildroot] uboot.pbl - make 'include' issue
In-Reply-To: <20140430223910.GF3336@free.fr>
References: <OFB2294D5B.F4E5AC38-ON86257CCA.00752EA9-86257CCA.00753202@rockwellcollins.com>
 <20140430223910.GF3336@free.fr>
Message-ID: <20140430224259.GG3336@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, Thomas, All,

On 2014-05-01 00:39 +0200, Yann E. MORIN spake thusly:
> On 2014-04-30 16:20 -0500, Ryan Barnett spake thusly:
> > I have recently been working on trying to get support for the u-boot.pbl 
> > image format into buildroot. I submitted an initial patch set back in 
> > October and was given feedback to break out the boot/uboot/uboot.mk into 
> > processor specific architectures. Thomas Petazzoni and I did some initial 
> > work to split these out and he provide an example. I have been trying to 
> > take this work that he did and submit an updated patch set. However, I 
> > have hit a roadblock for which I can't seem to debug or figure out what is 
> > going wrong.
> > 
> > When I breakout defines and variables in boot/uboot/uboot.mk into separate 
> > files and add the following line:
> > 
> > include boot/uboot/*/*.mk
> > 
> > Once I add this to uboot.mk, the rules for uboot no longer work. Using any 
> > configuration, I can no longer do anything like this:
> > 
> > make uboot
> > make uboot-dirclean
> > 
> > Running the above yields the following error:
> > 
> > make[1]: *** No rule to make target `uboot'.  Stop.
> > make: *** [_all] Error 2
> 
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

For reference, here is the applicable part of the make manual,
demonstrating the exact behaviour you observe:
    https://www.gnu.org/software/make/manual/make.html#index-MAKEFILE_005fLIST-_0040r_007b_0028list-of-parsed-makefiles_0029_007d-550

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
