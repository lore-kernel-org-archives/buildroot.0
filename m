From: Qais Yousef <qais.yousef@arm.com>
Date: Tue, 24 Nov 2020 16:41:17 +0000
Subject: [Buildroot] [PATCH 2/2] package/bcc: new package
In-Reply-To: <f9f16fa3-dcd6-7848-5b16-226b51557cf8@gmail.com>
References: <20200824181740.12878-1-jugurtha.belkalem@smile.fr>
 <20200824181740.12878-2-jugurtha.belkalem@smile.fr>
 <20201004181215.2w225cjecin4pm6r@e107158-lin.cambridge.arm.com>
 <f9f16fa3-dcd6-7848-5b16-226b51557cf8@gmail.com>
Message-ID: <20201124164117.nn2uuwfmyotlv6jv@e107158-lin.cambridge.arm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain

On 11/03/20 23:34, Romain Naour wrote:
> Hello Qais,
> 
> Sorry for my late reply.

And sorry for my late reply too. I was off for 2 weeks.

> 
> Le 04/10/2020 ??? 20:12, Qais Yousef a ???crit???:
> > Hi Jugurtha
> > 
> > I am very late to the party and missed earlier reviews. So apologies in advance
> > if any of my comments was already brought up/addressed.
> > 
> > Can you keep me on CC on future posting and any other related discussion
> > please?
> 
> I'm reworking the series and I'm adding you in Cc for each patch.
> Jugurtha is not available at the moment, but he is still interested by BCC.

Great. Thanks for that. I will allocate time to review it soon.

> 
> > 
> > On 08/24/20 20:17, Jugurtha BELKALEM wrote:
> >> bcc is a front-end tool for eBPF :
> >> https://github.com/iovisor/bcc/blob/master/README.md.
> >> eBPF is the most powerful Linux tracer, and bcc
> >> allows to write eBPF scripts in C and PYTHON3.
> >>
> >> bcc can help to troubleshoot issues quickly on
> >> embedded systems (as long as Linux kernel
> >> version >= 4.1).
> >>
> >> bcc can also make it easy to create observabilty tools,
> >> SDN configuration, ddos mitigation, intrusion detection
> >> and secure containers. More information is available at:
> >> http://www.brendangregg.com/ebpf.html.
> > 
> > There's the brand new ebpf website too
> > 
> > 	http://www.ebpf.io
> 
> Link updated, thanks!
> 
> > 
> >>
> >> BCC can be tested on the target :
> >> $ mount -t debugfs none /sys/kernel/debug
> > 
> > I wonder if this something we can automatically append to /etc/fstab when this
> > package is enabled..
> 
> Sure, but this is a fstab customization. I don't think the bcc package should
> change the /etc/fstab.
> 
> > 
> >> $ mkdir -p /lib/modules/KERNEL_VERSION/build
> >> $ cd /lib/modules/KERNEL_VERSION//build
> >> $ cp /sys/kernel/kheaders.tar.xz .
> >> $ unxz kheaders.tar.xz
> >> $ tar xf kheaders.tar
> > 
> > All the above is unnecessary. BCC automatically does this if it detects
> > /sys/kernel/kheaders.tar.xz is present. I had to enable BR2_PACKAGE_TAR for BCC
> > to handle this correctly. I guess busybox::tar is too limited to work with BCC
> > commands.
> 
> Indeed, thanks for the info.
> Now I see:
> https://github.com/iovisor/bcc/blob/v0.17.0/src/cc/frontends/clang/kbuild_helper.cc#L172
> 
> What was the error you get with busybox's tar ?

Sadly I completely forgot. I can try to reproduce it. If you managed to resolve
this in a different way, it works for me.

> bcc doesn't use advenced tar option that is not supported by busybox's tar.
> 
> # tar --help
> BusyBox v1.31.1 (2020-05-01 00:37:37 CEST) multi-call binary.
> 
> Usage: tar c|x|t [-hvokO] [-f TARFILE] [-C DIR] [-T FILE] [-X FILE] [--exclude
> PATTERN]... [FILE]...
> 
> Create, extract, or list files from a tar file
> 
> 	c	Create
> 	x	Extract
> 	t	List
> 	-f FILE	Name of TARFILE ('-' for stdin/out)
> 	-C DIR	Change to DIR before operation
> 	-v	Verbose
> 	-O	Extract to stdout
> 	-o	Don't restore user:group
> 	-k	Don't replace existing files
> 	-h	Follow symlinks
> 	-T FILE	File with names to include
> 	-X FILE	File with glob patterns to exclude
> 	--exclude PATTERN	Glob pattern to exclude
> 

[...]

> >>  menu "Debugging, profiling and benchmark"
> >> +	source "package/bcc/Config.in"
> >>  	source "package/blktrace/Config.in"
> >>  	source "package/bonnie/Config.in"
> >>  	source "package/cache-calibrator/Config.in"
> >> diff --git a/package/bcc/0001-fix-aarch64-cross-compile.patch b/package/bcc/0001-fix-aarch64-cross-compile.patch
> >> new file mode 100644
> >> index 0000000..6b42797
> >> --- /dev/null
> >> +++ b/package/bcc/0001-fix-aarch64-cross-compile.patch
> >> @@ -0,0 +1,65 @@
> >> +From 5a5b0f04484e00c88e7be902101367d6d591fb96 Mon Sep 17 00:00:00 2001
> >> +From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> >> +Date: Thu, 2 May 2019 11:06:23 +0200
> >> +Subject: [PATCH] cmake/luajit: Provide the target architecture to luaJIT while
> >> + cross-compiling
> > 
> > Is this luajit required to enable Lua front-end to BCC? Given python is the
> > most common front-end, I'd argue to make this an extra option that is only
> > enabled if the user selects it in the menu. Same way BPF backend in LLVM is
> > only compiled in if selected. IMHO that's a better default behavior.
> 
> As far I can see in other packaging, BCC is using luajit as lua interpreter
> https://src.fedoraproject.org/rpms/bcc/blob/master/f/bcc.spec
> 
> I'm agree that python is the most common front-end. I'll try to add a sub option
> to enable or disable it.

I think a sub option is the better way to go. Thanks!

[...]

> >> diff --git a/package/bcc/Config.in b/package/bcc/Config.in
> >> new file mode 100644
> >> index 0000000..cf03927
> >> --- /dev/null
> >> +++ b/package/bcc/Config.in
> >> @@ -0,0 +1,49 @@
> >> +config BR2_PACKAGE_BCC
> >> +	bool "bcc"
> >> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> >> +	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
> >> +	depends on BR2_TOOLCHAIN_USES_GLIBC # hardcode GNU tuple (x86_64-unknown-linux-gnu)
> >> +	depends on BR2_LINUX_KERNEL # needs kernel sources on the target
> > 
> > This dependency on building the kernel in buildroot is not user friendly. For
> > example I never build the kernel in buildroot, and certainly would like to be
> > able to enable this package without having to build the kernel in buildroot.
> 
> IIRC this option was adde because we used a previous version of BCC (0.8) with a
> kernel 4.x (at the time CONFIG_IKHEADERS didn't exist).
> But still, if we don't enforce building a kernel to select BCC it's the user
> responsibility to install the kernel sources (manually, rootfsoverlay or by a
> post build script).
> 
> I'll remove this constrain.

Thanks. IMO relying on users reading the documentation to enable kernel
support is a better option.

> 
> > 
> >> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # clang
> >> +	depends on BR2_TOOLCHAIN_HAS_THREADS # clang
> >> +	depends on BR2_INSTALL_LIBSTDCPP # clang
> > 
> >> +	select BR2_PACKAGE_AUDIT # runtime
> > 
> > This..
> > 
> >> +	select BR2_PACKAGE_CLANG
> >> +	select BR2_PACKAGE_ELFUTILS
> >> +	select BR2_PACKAGE_FLEX # needs FlexLexer.h
> > 
> >> +	select BR2_PACKAGE_IPERF3 # runtime
> > 
> > .. this..
> > 
> >> +	select BR2_PACKAGE_LLVM_BPF
> >> +	select BR2_PACKAGE_LUAJIT
> > 
> >> +	select BR2_PACKAGE_NETPERF # runtime
> > 
> > .. and this look odd to me. Can you expand which runtime requires them?
> 
> for example, netperf is one of recommanded program for BCC.
> They are listed in debian/control
> https://github.com/iovisor/bcc/blob/v0.17.0/debian/control#L13
> 
> I don't remenber about audit, Jugurtha ?

I think this is a specific use case for a class of people who would like to use
BCC. I don't think we should impose netperf on them as a requirement. They can
enable it independently if they want it, no?

If you see a big value in enabling these packages automatically, can we hide
them behind another sub option at least?

Image bloat is a problem I faced in the past, and being able to have the bare
minimum only is always good to have.

> 
> > 
> >> +	select BR2_PACKAGE_PYTHON3
> >> +	select BR2_PACKAGE_XZ # Decompress kernel headers required by BCC
> > 
> > If you replace XZ with TAR, you should find that BCC automatically handles the
> > ikheader.tar.xz for you. There's now BPF Type Format (BTF) option in the kernel
> > that could replace the dependency on the headers. Haven't played much with that
> > yet though. BTF requires a tool called pahole. We can handle this support later
> > I guess.
> 
> There is no package that provide pahole tool. Indeed this can be done later.

+1

> 
> > 
> >> +	help
> >> +	  BPF Compiler Collection (BCC)
> >> +
> >> +	  BCC is a toolkit for creating efficient kernel tracing and
> >> +	  manipulation programs, and includes several useful tools and
> >> +	  examples. It makes use of extended BPF (Berkeley Packet
> >> +	  Filters), formally known as eBPF, a new feature that was
> >> +	  first added to Linux 3.15. Much of what BCC uses requires
> >> +	  Linux 4.1 and above.
> >> +
> >> +	  Note: Before using bcc, you need either need to :
> >> +	  - For kernel_ver = [4.1, 5.2) : Copy kernel source code
> >> +	  to target folder /lib/module/<kernel_ver>/build.
> >> +	  - Or kernel_ver >= 5.2 : Compile kernel with CONFIG_IKHEADERS
> >> +	  and use generated headers under /sys/kernel/kheaders.tar.xz
> >> +	  to populate /lib/module/<kernel_ver>/build.
> >> +
> >> +	  That's because the clang frontend build eBPF code at runtime.
> >> +
> >> +	  https://github.com/iovisor/bcc
> >> +
> >> +comment "bcc needs a Linux kernel to be built"
> >> +	depends on !BR2_LINUX_KERNEL
> > 
> > I must remove this to compile this patch. This hard dependency is not required
> > IMHO. You can still auto fix up the kernel if you like if the user is building
> > the kernel and has enabled BCC. Just keep in mind it's a fast moving target, so
> > the set of configs might require a bit of maintenance. Given it's all
> > documented in BCC website, I personally think it's better to leave correct
> > kernel configuration to the user to follow the right instructions from BCC
> > website rather than automatically handle it for them.
> 
> You mean the bcc.mk shouldn't handler kernel options for BCC ?

Yep.

> 
> Ok to remove this constraint on the Linux kernel.

Thanks!

[...]

> > 
> >> +
> >> +define BCC_LINUX_CONFIG_FIXUPS
> >> +	# Enable kernel support for eBPF
> >> +	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF)
> >> +	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_SYSCALL)
> >> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CLS_BPF)
> >> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_ACT_BPF)
> >> +	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_JIT)
> >> +	# [for Linux kernel versions 4.1 through 4.6]
> >> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HAVE_BPF_JIT)
> >> +	# [for Linux kernel versions 4.7 and later]
> >> +	$(call KCONFIG_ENABLE_OPT,CONFIG_HAVE_EBPF_JIT)
> >> +	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_EVENTS)
> >> +	# [for Linux kernel versions 5.2 and later]
> >> +	$(call KCONFIG_ENABLE_OPT,CONFIG_IKHEADERS)
> >> +	# For running bcc networking examples on vanilla kernel
> >> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_SCH_SFQ)
> >> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_ACT_POLICE)
> >> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_ACT_GACT)
> >> +	$(call KCONFIG_ENABLE_OPT,CONFIG_DUMMY)
> >> +	$(call KCONFIG_ENABLE_OPT,CONFIG_VXLAN)
> >> +endef
> > 
> > This will be a big maintenance headache. New dependency can come up and configs
> > like CONFIG_NET_* are not essential and seem to be specific to your usage.
> > 
> > I'm not in favour of them personally, but if you want them the list need to
> > shrink to the bare minimum and depend on user building the kernel in buildroot
> > IMO.
> 
> As you said, bcc is moving fast and requires different kernel option depending
> on the kernel version or tool/example that will be running on the target.
> Agree it's may be a big maintenance headache.
> 
> But on otherhand I find userfriendly to enable CONFIG_BPF to CONFIG_IKHEADERS
> option. OK to drop kernel options for networking examples.
> 
> Thanks for your review!

Thanks for taking care of the issues and sending a new version too! I'll review
as soon as I can.

Cheers

--
Qais Yousef
