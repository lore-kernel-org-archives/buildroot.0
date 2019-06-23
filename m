From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 20:23:08 +0200
Subject: [Buildroot] [PATCH v2,1/1] gnuchess: needs -fPIC
In-Reply-To: <20190113141329.4d526438@windsurf.home>
References: <20190112175505.14348-1-fontaine.fabrice@gmail.com>
 <20190113141329.4d526438@windsurf.home>
Message-ID: <20190623202308.536031c8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Jan 2019 14:13:29 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> I'm sorry but this doesn't make sense to me. -fPIC is for Position
> Independent Code, which is needed when building shared libraries. Here
> we are building with -static on Cortex-M which doesn't even have
> support for shared libraries. So building with -fPIC doesn't make sense
> I believe. It seems to be more a workaround than a real fix.
> 
> Perhaps this should be discussed with upstream binutils, or at least a
> proper investigation be done about those relocation types ?

OK, so I had a closer look into this, finally.

What happens from my understanding is that building gnuchess with
optimization enabled (at least -O2) causes some movt/movw instructions
to be generated in the move.o object file:

380:       f240 0c00       movw    ip, #0
388:       f2c0 0c00       movt    ip, #0

These instructions refer to a global variable called PawnHashKey,
declared in another C file. Because of it being a global variable, a
relocation is added for those instructions:

00000380  00003f2f R_ARM_THM_MOVW_AB 00000000   PawnHashKey
00000388  00003f30 R_ARM_THM_MOVT_AB 00000000   PawnHashKey
00000464  00003f2f R_ARM_THM_MOVW_AB 00000000   PawnHashKey
00000470  00003f30 R_ARM_THM_MOVT_AB 00000000   PawnHashKey

And the problem is that those special relocation types are not
understood by elf2flt.

If you change the optimization flag to -O0, then the problem doesn't
occur because these movt/movw instructions are not generated. The fact
that -fPIC also works around the problem is probably due to the fact
that in a Position Independent logic, such relocations maybe don't
exist (?) or perhaps it was pure luck that the generated code was
different.

Interestingly, Romain Naour also faced this issue a while ago when
building binutils on Cortex-M, and that lead to commit
49f574237983ae2e69e4a4c43df7be98902a63be. Romain reported a bug to
binutils (https://sourceware.org/bugzilla/show_bug.cgi?id=20552), but
now I believe that the bug report is incorrect: the actual issue is in
elf2flt.

For example, the Linux kernel module loading code has support for these
relocation types:

  https://elixir.bootlin.com/linux/v4.5/source/arch/arm/kernel/module.c#L258

so they seem to be legitimate.

Therefore I guess the issue is in elf2flt, and I reported a bug at
https://github.com/uclinux-dev/elf2flt/issues/11.

In the mean time, I'm not sure what to do. Indeed, we don't care about
gnuchess on Cortex-M, but the same issue affects building binutils,
which may be a bit more important (for libbfd).

Should we simply add a work-around in gnuchess, to build in -O0 for the
time being ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
