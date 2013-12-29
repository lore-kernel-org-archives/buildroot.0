From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 18:06:27 +0100
Subject: [Buildroot] Analysis of build failures, december 26th
In-Reply-To: <E6BF041E97966E4DB955F0DF883AD2D685F39E91@de02wembxa.internal.synopsys.com>
References: <20131227073009.1283F101A83@stock.ovh.net>
 <20131227103511.2c218d17@skate>
 <E6BF041E97966E4DB955F0DF883AD2D685F39E91@de02wembxa.internal.synopsys.com>
Message-ID: <20131229180627.2633245f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Sun, 29 Dec 2013 12:58:53 +0000, Mischa Jonker wrote:

> > Seems to be a uClibc issue on ARC:
> > 
> > e4defrag.c:203:12: error: conflicting types for 'posix_fadvise'
> > 
> > Mischa, can you have a look?
> > 
> OK, I will have a look. 

Thanks!

> > The package uses pthread_setaffinity_np(), which is only available in NPTL.
> > Options:
> > 
> >  */ change iozone to not use pthread_setaffinity_np()
> > 
> >  */ have an additional kconfig knob that tells whether the thread
> >     implementation is NPTL or not and disallow iozone when !NPTL
> >
> 
> I believe it has been suggested before to introduce HAS_PTHREADS_NATIVE and let it depend on this.
> http://patchwork.ozlabs.org/patch/258714/
> http://patchwork.ozlabs.org/patch/290224/
> 
> Back then you were reworking internal toolchain build infrastructure; do you want me to make a new patch that introduces this (and also adds an option for external toolchain where applicable?)

After thinking about it, I believe it's a little bit too heavy to add
yet another Kconfig knob to know whether the toolchain has NPTL support
or not. Since for the moment, only iozone is affected by this problem,
I believe an iozone-specific solution is better.

So I've just sent a patch against iozone that adds a dummy empty
pthread_setaffinity_np() function when the uClibc doesn't use NPTL.
Since most likely the absence of NPTL is going to be on non-SMP
architectures, it's not a big problem to not have
pthread_setaffinity_np().

Let me know what you think about it.

> 1st issue is about length of some instructions being counted incorrectly, which makes compiler select short branch instructions where they don't fit,
> 2nd issue is about if-conversion trying to predicate instructions that cannot be predicated.
> 
> I have been filing internal bug reports for these and I believe both issues are fixed. We just need to update git commit ID for gcc, binutils, etc.
> Let me discuss which exact release should be used and get back to you (i.e. I'll submit a patch with version bump of the tools). 
> Everyone is out for the holiday season now, so it may take another week or so.

Sure, no problem.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
