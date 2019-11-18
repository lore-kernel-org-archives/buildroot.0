From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 23:47:22 +0100
Subject: [Buildroot] [PATCH 1/2] package/gmpc: needs -lm
In-Reply-To: <20191118234238.363e7c04@gmx.net>
References: <20191029214046.14722-1-fontaine.fabrice@gmail.com>
 <20191108220442.4b596996@windsurf>
 <20191108222841.4ff8debf@gmx.net>
 <c16fab60-ebf2-106e-962f-c2595472803d@mind.be>
 <20191117212001.6907f54a@gmx.net> <20191117214818.4d68ae6f@gmx.net>
 <df61ba8d-99d4-f16b-50ed-3e7ae28e4962@mind.be>
 <20191118234238.363e7c04@gmx.net>
Message-ID: <20191118234722.21f79c8f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding Thomas Preston in the loop. Thomas: one of your patch causes
some regression, see below.

On Mon, 18 Nov 2019 23:42:38 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> > >>>>> On Tue, 29 Oct 2019 22:40:45 +0100
> > >>>>> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> > >>>>>  
> > >>>>>> gmpc forgets to link with -lm:
> > >>>>>>
> > >>>>>> /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips-linux-gnu/5.3.0/../../../../mips-linux-gnu/bin/ld: GmpcVolume.o: undefined reference to symbol 'ceil@@GLIBC_2.0'
> > >>>>>> /home/buildroot/autobuild/instance-2/output-1/host/mips64el-buildroot-linux-gnu/sysroot/soft-float/el/lib64/libm.so.6: error adding symbols: DSO missing from command line
> > >>>>>>
> > >>>>>> Fixes:
> > >>>>>>  - http://autobuild.buildroot.org/results/a79e0487135ad90530595d5c6ecc32f9c8cea7c4
> > >>>>>>
> > >>>>>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>  
> > >>>>>
> > >>>>> We need to understand why this is happening now. This package has not
> > >>>>> been modified since July 2017, but suddenly, on October 21, 2019, it
> > >>>>> started failing like this. Why? Was there a change in one of the
> > >>>>> dependencies, that is no longer linked with libm, and that causes this
> > >>>>> problem ?  
> > >>>
> > >>>  It started because of RELRO, I think.
> > >>>  
> > >>>>
> > >>>> Maybe the same cause/problem as in the libv4l case regarding libatomic,
> > >>>> evaluating vs. not evaluationg the *.la files (see [1])?  
> > >>>
> > >>>  And this one because of PIC_PIE.  
> > >>
> > >> Any hints to one/more related commits (so I can check by reverting if it
> > >> changes/fix the problems)?
> > >>
> > >> Are the RELRO/PIC_PIE options related to evaluating *.la files?  
> > >
> > > Did a quick search by the date (October 21, 2019) and the info from the libv4l
> > > case [1] and would suspect the commit 'pkgconf: Add pkgconf system lib and
> > > include path' [2], will do a test with this commit reverted....  
> >
> >  Good point. Also there's a failure without PIC_PIE or RELRO [3].  
> 
> Can confirm, reverting [2] fixes the libv4l and the gmpc linking problems...

Thanks for the investigation Peter!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
