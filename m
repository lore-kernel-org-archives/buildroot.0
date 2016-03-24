From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Thu, 24 Mar 2016 14:08:56 +0100
Subject: [Buildroot] syslinux using host compiler.
In-Reply-To: <20160324135053.0d3b6b49@free-electrons.com>
References: <20160324103941.GM22286@hermes.click-hack.org>
 <20160324135053.0d3b6b49@free-electrons.com>
Message-ID: <20160324130856.GQ22286@hermes.click-hack.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 24, 2016 at 01:50:53PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 24 Mar 2016 11:39:41 +0100, Gilles Chanteperdrix wrote:
> 
> > I am new to buildroot, and have been working for a couple of weeks
> > with it, and everything seems to be working fine so far.
> 
> Great :-) Glad to see you on this mailing list!
> 
> > I have a question however: why is syslinux (and grub2 for that
> > matter, I guess) built with the host toolchain?
> 
> For grub2, it is actually using the target compiler, see the comment in
> grub2.mk:

Ok, I thought I saw grub selected BR2_HOSTARCH_NEEDS_IA32_COMPILER
too, must I have misread.

> 
> # Grub2 is kind of special: it considers CC, LD and so on to be the
> # tools to build the native tools (i.e to be executed on the build
> # machine), and uses TARGET_CC, TARGET_CFLAGS, TARGET_CPPFLAGS,
> # TARGET_LDFLAGS to build the bootloader itself. However, to add to
> # the confusion, it also uses NM, OBJCOPY and STRIP to build the
> # bootloader itself; none of these are used to build the native
> # tools.
> 
> > I can understand that some tools (such as isohybrid) need to be
> > executed on the host, but the final binaries are for the target. So,
> > does not that call for having a separate host-syslinux and syslinux
> > packages like other packages do? 
> 
> We used to have a host-syslinux package, but it was removed in commit
> ac7f60d87266c30753cb45b820dc48ec834941c6 as it was no longer needed.
> 
> > The current setup only works if the host is x86.
> 
> No, because syslinux selects BR2_HOSTARCH_NEEDS_IA32_COMPILER, which
> ensures you have a working x86 32-bits compiler on your host machine. If
> you don't, then Buildroot will not even start the build.

I meant you can not build syslinux if your host is arm for instance,
and you have an arm/x86 cross-compilation toolchain.

> 
> The reason why we're using the host compiler rather than the target
> compiler is because syslinux must be built as 32-bits x86 code, even if
> your target system is x86_64.

Yes, but AFAIK, gcc for x86_64 always supports the -m32 switch. To
build 32 bits host binaries, you need a multilib installation with a
32 bits glibc, but a bootloader should not use anything in the glibc.

> 
> > I am using an x86_64 toolchain generated with ct-ng, did not enable
> > multilib, and syslinux seems to have no problem compiling with that
> > toolchain, which seems normal, since the boot code should not be
> > using the libc anyway.
> 
> Are you sure you're using this target compiler to build syslinux, and
> not your host compiler? Back in 2014, when commit
> 09e7b4c89159a3e48f463b0a22e649c4fc12f4b3 was done, it wouldn't build
> with a x86-64 only compiler.

Yes, I am sure of it. The only "trick" I had to apply was to force
LD="$(TARGET_LD) -m elf_i386". Now buildroot complains later because
isohybrid in the host directory is not compiled with the proper
rpath, but I guess it means we need host-syslinux.

> 
> If that actually works, then patches are welcome. But in this case, we
> will indeed probably need separate host-syslinux and syslinux packages,
> as you suggested.

Yes. Ok, will work on the patch.

Regards.

-- 
					    Gilles.
https://click-hack.org
