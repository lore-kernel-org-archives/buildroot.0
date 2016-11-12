From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Nov 2016 22:01:40 +0100
Subject: [Buildroot] Enable option of nodeJS 4.1.2 in buildroot 2015.11
In-Reply-To: <20161111150017.29e032b5@free-electrons.com>
References: <CALD51P8hSabOW+SdV0Ycc46Ar4Pqn0jZuyazKhUUQcqKvsg6qA@mail.gmail.com>
 <20161111043706.nrzzr7ca5nybi2ir@tarshish>
 <20161111150017.29e032b5@free-electrons.com>
Message-ID: <20161112210140.GA3700@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-11-11 15:00 +0100, Thomas Petazzoni spake thusly:
> On Fri, 11 Nov 2016 06:37:06 +0200, Baruch Siach wrote:
> 
> > That's because nodejs 4.1.2 on Buildroot 2015.11 (and 6.7.0 on current master) 
> > depends on BR2_ARM_CPU_HAS_VFPV2:
> > 
> > config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
> >         bool
> >         # On supported architectures other than ARM, no special requirement
> >         default y if !BR2_arm
> >         # On ARM, at least ARMv6+ with VFPv2+ is needed
> >         default y if !BR2_ARM_CPU_ARMV5 && BR2_ARM_CPU_HAS_VFPV2
> > 
> > The comment seems indicates that BR2_ARM_CPU_HAS_VFPV3 should also be fine. 
> > You may try changing this line to
> > 
> >         default y if !BR2_ARM_CPU_ARMV5 && (BR2_ARM_CPU_HAS_VFPV2 || BR2_ARM_CPU_HAS_VFPV3)
> > 
> > Yann, you added this dependency in commit f443386c5d. Is that the right fix?

Not really: if VFPv3 is enabled, so is VFPv2, see the conditions:
	https://git.buildroot.org/buildroot/tree/arch/Config.in.arm#n21

and see the reasons below...

> I'm wondering if BR2_ARM_CPU_HAS_VFPV3 shouldn't select
> BR2_ARM_CPU_HAS_VFPV2, and ditto for V4 selecting V3.

Unless I'm mistaken, that's already the case, and has been so at least
since 2013:

    5f959a1c arch: improve ARM floating point support and add support for EABIhf

   21 config BR2_ARM_CPU_HAS_VFPV3
   22 	bool
   23 	select BR2_ARM_CPU_HAS_VFPV2
   [--SNIP--]
   30 config BR2_ARM_CPU_HAS_VFPV4
   31 	bool
   32 	 select BR2_ARM_CPU_HAS_VFPV3

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
