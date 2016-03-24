From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 15:12:01 +0100
Subject: [Buildroot] syslinux using host compiler.
In-Reply-To: <20160324130856.GQ22286@hermes.click-hack.org>
References: <20160324103941.GM22286@hermes.click-hack.org>
 <20160324135053.0d3b6b49@free-electrons.com>
 <20160324130856.GQ22286@hermes.click-hack.org>
Message-ID: <20160324151201.7e05fd28@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Mar 2016 14:08:56 +0100, Gilles Chanteperdrix wrote:

> > For grub2, it is actually using the target compiler, see the comment in
> > grub2.mk:
> 
> Ok, I thought I saw grub selected BR2_HOSTARCH_NEEDS_IA32_COMPILER
> too, must I have misread.

grub yes, not grub2. But your original comment was about grub2, hence I
looked at grub2. But you are right, grub is like syslinux, we use the
host compiler.

> > No, because syslinux selects BR2_HOSTARCH_NEEDS_IA32_COMPILER, which
> > ensures you have a working x86 32-bits compiler on your host machine. If
> > you don't, then Buildroot will not even start the build.
> 
> I meant you can not build syslinux if your host is arm for instance,
> and you have an arm/x86 cross-compilation toolchain.

Correct, but the fact that you select BR2_HOSTARCH_NEEDS_IA32_COMPILER
will test that you have a host compiler capable of producing x86 32
bits binaries. So if you're building on ARM, it will simply abort at
the beginning of the build. Of course, it would be nicer if we could be
on any host architecture, but on the other hand, virtually everyone is
using x86/x86-64 as build machines, so it wasn't really worth putting
more efforts to fix this.

> > The reason why we're using the host compiler rather than the target
> > compiler is because syslinux must be built as 32-bits x86 code, even if
> > your target system is x86_64.
> 
> Yes, but AFAIK, gcc for x86_64 always supports the -m32 switch. To
> build 32 bits host binaries, you need a multilib installation with a
> 32 bits glibc, but a bootloader should not use anything in the glibc.

Completely agree with the theory. In practice, I remember seeing some
problems, like it was anyway trying to build some actual user-space
applications with -m32. But (1) my analysis at the time might have been
wrong and (2) syslinux was upgraded several times since then so maybe
they have changed/fixed things. But that definitely doesn't mean I'm
not interested in seeing patches improving this stuff.

> > > I am using an x86_64 toolchain generated with ct-ng, did not enable
> > > multilib, and syslinux seems to have no problem compiling with that
> > > toolchain, which seems normal, since the boot code should not be
> > > using the libc anyway.
> > 
> > Are you sure you're using this target compiler to build syslinux, and
> > not your host compiler? Back in 2014, when commit
> > 09e7b4c89159a3e48f463b0a22e649c4fc12f4b3 was done, it wouldn't build
> > with a x86-64 only compiler.
> 
> Yes, I am sure of it. The only "trick" I had to apply was to force
> LD="$(TARGET_LD) -m elf_i386". Now buildroot complains later because
> isohybrid in the host directory is not compiled with the proper
> rpath, but I guess it means we need host-syslinux.

OK.

> > If that actually works, then patches are welcome. But in this case, we
> > will indeed probably need separate host-syslinux and syslinux packages,
> > as you suggested.
> 
> Yes. Ok, will work on the patch.

Great!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
