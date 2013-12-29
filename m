From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Sun, 29 Dec 2013 12:58:53 +0000
Subject: [Buildroot] Analysis of build failures, december 26th
In-Reply-To: <20131227103511.2c218d17@skate>
References: <20131227073009.1283F101A83@stock.ovh.net>
 <20131227103511.2c218d17@skate>
Message-ID: <E6BF041E97966E4DB955F0DF883AD2D685F39E91@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> >        arc |               e2fsprogs-1.42.8 | NOK |
> http://autobuild.buildroot.net/results/05493d9d27e18e1d17ae7e6feec978ec50a09e
> 31/
> 
> Seems to be a uClibc issue on ARC:
> 
> e4defrag.c:203:12: error: conflicting types for 'posix_fadvise'
> 
> Mischa, can you have a look?
> 
OK, I will have a look. 

> 
> >        arc |                   iozone-3_414 | NOK |
> http://autobuild.buildroot.net/results/f23f3fc5ece6ce19fb5a0fb0748d4d5db9975d
> f7/
> 
> The package uses pthread_setaffinity_np(), which is only available in NPTL.
> Options:
> 
>  */ change iozone to not use pthread_setaffinity_np()
> 
>  */ have an additional kconfig knob that tells whether the thread
>     implementation is NPTL or not and disallow iozone when !NPTL
>

I believe it has been suggested before to introduce HAS_PTHREADS_NATIVE and let it depend on this.
http://patchwork.ozlabs.org/patch/258714/
http://patchwork.ozlabs.org/patch/290224/

Back then you were reworking internal toolchain build infrastructure; do you want me to make a new patch that introduces this (and also adds an option for external toolchain where applicable?)

> >        arc |                   libogg-1.3.0 | NOK |
> http://autobuild.buildroot.net/results/d3a2a7c07aa1afc7e5f8582ac33199ee76d5c7
> 9f/
> >        arc |                   libogg-1.3.0 | NOK |
> http://autobuild.buildroot.net/results/8f9343313f4ac9c64d2f8c1f637d3dc0525b8c
> cb/
> 
> ARC compiler problem:
> 
> {standard input}: Assembler messages:
> {standard input}:886: Error: operand out of range (-130 is not between -128
> and 127)
> 
> Mischa, what action should we take?
>
> >        arc |                  ffmpeg-0.8.15 | NOK |
> http://autobuild.buildroot.net/results/e3f7caf853d61c2f06969dbb780c2d7e5ad116
> a5/
> 
> ARC gcc compiler error:
> 
> libavcodec/snow.c:921:1: internal compiler error: in arc_ifcvt, at
> config/arc/arc.c:8530
> 
> Mischa, should I mark ffmpeg as !BR2_arc for the moment, until the compiler
> issues are resolved?

1st issue is about length of some instructions being counted incorrectly, which makes compiler select short branch instructions where they don't fit,
2nd issue is about if-conversion trying to predicate instructions that cannot be predicated.

I have been filing internal bug reports for these and I believe both issues are fixed. We just need to update git commit ID for gcc, binutils, etc.
Let me discuss which exact release should be used and get back to you (i.e. I'll submit a patch with version bump of the tools). 
Everyone is out for the holiday season now, so it may take another week or so.

Mischa
