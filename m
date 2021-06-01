From: Qais Yousef <qais.yousef@arm.com>
Date: Tue, 1 Jun 2021 16:34:04 +0100
Subject: [Buildroot] [PATCHv6 4/5] package/bpftrace: new package
In-Reply-To: <c321bb8a-cc46-c271-bf1d-650b6a8dce18@mind.be>
References: <20201220151203.2206747-1-romain.naour@gmail.com>
 <20201220151203.2206747-4-romain.naour@gmail.com>
 <c321bb8a-cc46-c271-bf1d-650b6a8dce18@mind.be>
Message-ID: <20210601153404.sbbo4qowugmdtisk@e107158-lin.cambridge.arm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout

Thanks for having a look! Sorry I was away all of last week.

On 05/20/21 22:58, Arnout Vandecappelle wrote:
> 
> 
> On 20/12/2020 16:12, Romain Naour wrote:
> [snip]
> > diff --git a/package/bpftrace/0001-cmake-link-ast-resources-parser-as-static-libraries.patch b/package/bpftrace/0001-cmake-link-ast-resources-parser-as-static-libraries.patch
> > new file mode 100644
> > index 0000000000..d99b97c3a4
> > --- /dev/null
> > +++ b/package/bpftrace/0001-cmake-link-ast-resources-parser-as-static-libraries.patch
> > @@ -0,0 +1,71 @@
> > +From 960d2b69975462e445733482ac8d6ea319d3c5b2 Mon Sep 17 00:00:00 2001
> > +From: Romain Naour <romain.naour@gmail.com>
> > +Date: Thu, 5 Nov 2020 01:19:54 +0100
> > +Subject: [PATCH] cmake: link ast, resources parser as static libraries
> 
>  Why is this needed?

In my original posting I added

	install(TARGETS parser LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

Which Romain suggested building as static is a better option.

The problem IIRC was that these libraries weren't installed correctly on the
target.

> 
>  Has the patch been sent upstream?

I don't think there was an attempt to do that yet.

If Romain doesn't get a chance to address your review comments soon enough I'll
address them and post a new version. Both of us have been driving this during
our free time on the weekends.

Thanks for the review.

Cheers

--
Qais Yousef

> 
> > +
> > +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> 
> [snip]]
> > diff --git a/package/bpftrace/Config.in b/package/bpftrace/Config.in
> > new file mode 100644
> > index 0000000000..f627725afe
> > --- /dev/null
> > +++ b/package/bpftrace/Config.in
> > @@ -0,0 +1,40 @@
> > +config BR2_PACKAGE_BPFTRACE_ARCH_SUPPORTS
> > +	bool
> > +	default y if BR2_aarch64 || BR2_aarch64_be
> > +	default y if BR2_x86_64
> 
>  You can add
> 
> 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # bcc
> 
> here as well. The point of _ARCH_SUPPORTS is to make it easier for dependent
> packages to express the arch dependency, so that should include recursive arch
> dependencies.
> 
> > +
> > +config BR2_PACKAGE_BPFTRACE
> > +	bool "bpftrace"
> > +	depends on BR2_PACKAGE_BPFTRACE_ARCH_SUPPORTS
> > +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # bcc
> > +	depends on BR2_TOOLCHAIN_USES_GLIBC # bcc
> > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # bcc, clang
> 
>  We write this as # bcc -> clang
> 
> 
> > +	depends on BR2_INSTALL_LIBSTDCPP # bcc, clang
> > +	select BR2_PACKAGE_BCC
> > +	select BR2_PACKAGE_LIBBPF
> > +	# LLVM RTTI mendatory: https://github.com/iovisor/bpftrace/issues/1156
> > +	select BR2_PACKAGE_LLVM_RTTI
> 
>  Again, I prefer an explicit select BR2_PACKAGE_LLVM
> 
> > +	help
> > +	  bpftrace is a high-level tracing language for Linux enhanced
> > +	  Berkeley Packet Filter (eBPF) available in recent Linux
> > +	  kernels (4.x).
> > +
> > +	  bpftrace uses LLVM as a backend to compile scripts to
> > +	  BPF-bytecode and makes use of BCC for interacting with the
> > +	  Linux BPF system, as well as existing Linux tracing
> > +	  capabilities: kernel dynamic tracing (kprobes), user-level
> > +	  dynamic tracing (uprobes), and tracepoints. The bpftrace
> > +	  language is inspired by awk and C, and predecessor tracers
> > +	  such as DTrace and SystemTap.
> > +
> > +	  It's highly recommended to NOT strip bpftrace binary.
> > +	  To do so, add "bpftrace" to BR2_STRIP_EXCLUDE_FILES.
> > +	  See:
> > +	    https://bugzilla.redhat.com/show_bug.cgi?id=1865787
> > +
> > +	  https://www.github.com/iovisor/bpftrace
> > +
> > +comment "bpftrace needs a glibc toolchain w/ C++, gcc >= 4.8"
> > +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> > +	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP \
> > +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> > diff --git a/package/bpftrace/bpftrace.hash b/package/bpftrace/bpftrace.hash
> > new file mode 100644
> > index 0000000000..b48d9555fd
> > --- /dev/null
> > +++ b/package/bpftrace/bpftrace.hash
> > @@ -0,0 +1,3 @@
> > +# locally calculated
> > +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> > +sha256  1f08661bac9dfa7d3d76b54b3b4d1738b02c3847049da90a5cff25093a9dc9c9  bpftrace-487dd815bfe4a24908950552f35ef17d6653b2f8.tar.gz
> > diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
> > new file mode 100644
> > index 0000000000..0d8640a184
> > --- /dev/null
> > +++ b/package/bpftrace/bpftrace.mk
> > @@ -0,0 +1,21 @@
> > +################################################################################
> > +#
> > +# bpftrace
> > +#
> > +################################################################################
> > +
> > +# upcoming 0.12 version.
> > +BPFTRACE_VERSION = 487dd815bfe4a24908950552f35ef17d6653b2f8
> > +BPFTRACE_SITE = $(call github,iovisor,bpftrace,$(BPFTRACE_VERSION))
> > +BPFTRACE_LICENSE = Apache-2.0
> > +BPFTRACE_LICENSE_FILES = LICENSE
> > +BPFTRACE_DEPENDENCIES = host-bison host-flex bcc libbpf llvm
> > +
> > +# libbfd, libopcodes
> 
>  What happens if target binutils is not built? Is it using a bundled version? In
> that case, we prefer to unbundle it (i.e. select binutils).
> 
>  Regards,
>  Arnout
> 
> > +ifeq ($(BR2_PACKAGE_BINUTILS),y)
> > +BPFTRACE_DEPENDENCIES += binutils
> > +endif
> > +
> > +BPFTRACE_CONF_OPTS += -DENABLE_MAN=OFF
> > +
> > +$(eval $(cmake-package))
> > 
