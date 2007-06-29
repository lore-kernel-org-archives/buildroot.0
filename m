From: Ben Dooks <ben@fluff.org>
Date: Fri, 29 Jun 2007 14:52:00 +0100
Subject: [Buildroot] ARM EABI builds
In-Reply-To: <4684084E.3080606@gmail.com>
References: <20070626133327.GA5989@trinity.fluff.org>
	<468182D7.30509@gmail.com>
	<20070626222500.GP31791@trinity.fluff.org>
	<20070627081954.GR31791@trinity.fluff.org>
	<4682A1F7.3020402@gmail.com>
	<20070628103443.GT31791@trinity.fluff.org>
	<4684084E.3080606@gmail.com>
Message-ID: <20070629135159.GD3856@trinity.fluff.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 28, 2007 at 12:13:18PM -0700, Tom wrote:
> Ben Dooks wrote:
> >>We need to keep in mind that the same gcc toolchain can support several 
> >>subarchitectures, thus this naming would be somewhat misleading (for 
> >>example, in our cases it did produce both ARMv4 (in the kernel) and 
> >>ARMv5 (in user libs)).
> >
> >Yes, the naming would indicate the default cpu the compiler is configured
> >for. The gcc docs[1] indicate the --with-cpu= option only sets the
> >default cpu to compile for. Unfortunately this affects how it produces
> >libgcc.
> >
> >I don't see why you would end up producing ARMv4 kernel when producing
> >an ARMv5 user space. Either you are producing a kernel to run on the 
> >same arch as your userspace (the kernel will correctly assign -mcpu=<x>)
> >when it is building.
> > 
> Why? Because of the bug: Configured all builds with ARM920T:
> Buildroot creates "incorrect" toolchain, "incorrect" toolchain fails to 
> build uclibc in ARMv4 only  but uses ARMv5. However, it did build a 
> kernel in ARMv4 fine.
> 
> 
> >>To me it would be great if the gcc toolchain always printed out whatever 
> >>the default SUBTARGET / CPU is as part of its specs. (It does this only 
> >>if one is passed with the --with-cpu option, so if it's not passed, you 
> >>can't easily find the default.) This would have helped me immensely to 
> >>find the --with-cpu workaround, but I am afraid this is not really a 
> >>buildroot issue.
> >
> >It is part of a problem with gcc where libgcc is being built for some
> >arbitrary default, instead of one suitable for each architecture that
> >can be selected at run-time.
> >
> >The problem with buildroot is that it gives you a choice of ARM cpus.
> >If you select ARM920T, then you have an expectation of being able
> >to run the binaries produced on an ARM920T, which currently if EABI
> >is also selected is impossible.
> 
> Yes, I agree. I like your solution in 
> http://busybox.net/bugs/view.php?id=1406 .
> 
> >
> >I did think about adding -mcpu=<cpu> to the build CFLAGS, but that
> >is not going to help with the problem that libgcc is not going to
> >be compiled correctly.
> >
> Why not? The kernel image, built with the same "incorrect" toolchain, 
> must have used only ARMv4 instructions. If it hadn't, I would have never 

1) the kernel passed -march= and -mcpu= to the compiler
2) the kernel does not use libgcc.a to provide compiler support

this ensures the kernel will not build code which cannot be run on
the target system. if you look at arch/arm/Makefile you'll see an
number of compiler configurations based on arch and compiler version
being used. In fact, if another compiler came along, it is entirely
possible the kernel could be modified to use that instead.

passing -mcpu= to the application builds will ensure that the application
is built for the correct cpu, but unfortunately there is the possibility
that libgcc (built as part of the compiler build) will have been configured
with invalid instructions.

> gotten far enough to even execute vprintf, libc. I would suspect that 
> the kernel does a better job of setting -mcpu, -mtune. Thus these 
> options should work for libc too. What makes you think that it wouldn't 
> work for libc, have you tried? (PS: Even if it did, bug #1406 is 
> probably the better fix, in particular as buildroot users might use its 
> toolchain to build their own code w/o always setting these options)

the configuration for gcc's default build for userland must be for the
lowest common denominator that the build is going to run on, otherwise
libgcc will be produced with invalid instructions.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
