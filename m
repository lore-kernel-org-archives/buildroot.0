From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 13 Nov 2016 11:12:17 +0200
Subject: [Buildroot] Enable option of nodeJS 4.1.2 in buildroot 2015.11
In-Reply-To: <20161113095304.3dcd95f6@free-electrons.com>
References: <CALD51P8hSabOW+SdV0Ycc46Ar4Pqn0jZuyazKhUUQcqKvsg6qA@mail.gmail.com>
 <20161111043706.nrzzr7ca5nybi2ir@tarshish>
 <20161111150017.29e032b5@free-electrons.com>
 <20161112210140.GA3700@free.fr>
 <20161113095304.3dcd95f6@free-electrons.com>
Message-ID: <20161113091217.xe7pjf5mhtzfppff@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Nov 13, 2016 at 09:53:04AM +0100, Thomas Petazzoni wrote:
> On Sat, 12 Nov 2016 22:01:40 +0100, Yann E. MORIN wrote:
> 
> > > > Yann, you added this dependency in commit f443386c5d. Is that the right fix?  
> > 
> > Not really: if VFPv3 is enabled, so is VFPv2, see the conditions:
> > 	https://git.buildroot.org/buildroot/tree/arch/Config.in.arm#n21
> > 
> > and see the reasons below...
> > 
> > > I'm wondering if BR2_ARM_CPU_HAS_VFPV3 shouldn't select
> > > BR2_ARM_CPU_HAS_VFPV2, and ditto for V4 selecting V3.  
> > 
> > Unless I'm mistaken, that's already the case, and has been so at least
> > since 2013:
> > 
> >     5f959a1c arch: improve ARM floating point support and add support for EABIhf
> > 
> >    21 config BR2_ARM_CPU_HAS_VFPV3
> >    22 	bool
> >    23 	select BR2_ARM_CPU_HAS_VFPV2
> >    [--SNIP--]
> >    30 config BR2_ARM_CPU_HAS_VFPV4
> >    31 	bool
> >    32 	 select BR2_ARM_CPU_HAS_VFPV3
> 
> I don't see how I could miss this. But then, why did Lijun had issues
> selecting NodeJS, and Baruch proposal to add || BR2_ARM_CPU_HAS_VFPV3
> solved it?

Actually Lijun had to add BR2_ARM_CPU_MAYBE_HAS_VFPV3. That's apparently 
because 2015.11 predated Yann's commit f52692ed64c64 (arch/arm: add option to 
enable an optional VFP unit). So BR2_ARM_CPU_HAS_VFPV3 was not selected and 
hence neither BR2_ARM_CPU_HAS_VFPV2.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
