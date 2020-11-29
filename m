From: Qais Yousef <qais.yousef@arm.com>
Date: Sun, 29 Nov 2020 15:14:06 +0000
Subject: [Buildroot] [PATCH v4 2/4] package/bcc: new package
In-Reply-To: <20201107002836.3101760-2-romain.naour@gmail.com>
References: <20201107002836.3101760-1-romain.naour@gmail.com>
 <20201107002836.3101760-2-romain.naour@gmail.com>
Message-ID: <20201129151406.neufl54p6pjiraux@e107158-lin.cambridge.arm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain

Thanks for updating the series.

On 11/07/20 01:28, Romain Naour wrote:
> From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> 
> bcc is a front-end tool for eBPF :
> https://github.com/iovisor/bcc/blob/master/README.md.
> eBPF is the most powerful Linux tracer, and bcc
> allows to write eBPF scripts in C and PYTHON3.
> 
> bcc can help to troubleshoot issues quickly on
> embedded systems (as long as Linux kernel
> version >= 4.1).
> 
> bcc can also make it easy to create observabilty tools,
> SDN configuration, ddos mitigation, intrusion detection
> and secure containers. More information is available at:
> https://ebpf.io/
> 
> BCC can be tested on the target :
> $ mount -t debugfs none /sys/kernel/debug
> $ cd /usr/share/bcc/tools
> $ ./execsnoop
> 
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Qais Yousef <qais.yousef@arm.com>
> ---
> v4
> - Bump to version 0.17.0.
> - Remove kernel dependency (Qais)
> - Remove optional kernel option handling (Quais)
> - Update ebpf url (Quais)
> - Fix tools path in the commit log (Quais)
> - Add full tar dependency (used to extract the kernel sources from IKHEADERS module) (Quais)
> - Make luajit optional dependeny (Quais)

I don't see a new option in Config.in to enable luajit. Shouldn't we have one
to enable it?

Wouldn't it be better to split luajit support into its own patch?

> - Remove python module install hook (Quais)
> - Keep BCC_LINUX_CONFIG_FIXUPS but only for kernel built by Buildroot.

I still think this will be a maintenance headache. Are you sure you want to
continue to maintain this list of fixups for all kernel versions given how fast
ebpf moves?

[...]

> diff --git a/package/bcc/Config.in b/package/bcc/Config.in
> new file mode 100644
> index 0000000000..b75984a36e
> --- /dev/null
> +++ b/package/bcc/Config.in
> @@ -0,0 +1,42 @@
> +config BR2_PACKAGE_BCC
> +	bool "bcc"
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # hardcode GNU tuple (x86_64-unknown-linux-gnu)
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # clang
> +	depends on BR2_INSTALL_LIBSTDCPP # clang
> +	select BR2_PACKAGE_AUDIT # runtime
> +	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # to select tar package
> +	select BR2_PACKAGE_CLANG
> +	select BR2_PACKAGE_ELFUTILS
> +	select BR2_PACKAGE_FLEX # needs FlexLexer.h
> +	select BR2_PACKAGE_IPERF3 # runtime
> +	select BR2_PACKAGE_LLVM_BPF
> +	select BR2_PACKAGE_NETPERF # runtime
> +	select BR2_PACKAGE_PYTHON3
> +	select BR2_PACKAGE_TAR # Decompress kernel headers required by BCC

I still think IPERF3, NETPERF and AUDIT dependencies are not required and
should be enabled by the user if they care only.

Are you okay to make them optional so users who don't care can have the choice
to enable BCC without having to include these packages too?

> +	help
> +	  BPF Compiler Collection (BCC)
> +
> +	  BCC is a toolkit for creating efficient kernel tracing and
> +	  manipulation programs, and includes several useful tools and
> +	  examples. It makes use of extended BPF (Berkeley Packet
> +	  Filters), formally known as eBPF, a new feature that was
> +	  first added to Linux 3.15. Much of what BCC uses requires
> +	  Linux 4.1 and above.
> +
> +	  Note: Before using bcc, you need either need to :
> +	  - For kernel_ver = [4.1, 5.2) : Copy kernel source code
> +	  to target folder /lib/module/<kernel_ver>/build.
> +	  - Or kernel_ver >= 5.2 : Compile kernel with CONFIG_IKHEADERS
> +	  and use generated headers under /sys/kernel/kheaders.tar.xz
> +	  to populate /lib/module/<kernel_ver>/build.
> +
> +	  That's because the clang frontend build eBPF code at runtime.

I still this the Clang build error for i386, x86_64, arm and arm64

	/usr/bin/ld: CMakeFiles/libclang.dir/CIndexer.cpp.o: in function `clang::CIndexer::getClangResourcesPath[abi:cxx11]()':
	CIndexer.cpp:(.text._ZN5clang8CIndexer21getClangResourcesPathB5cxx11Ev+0x9b): undefined reference to `dladdr'
	collect2: error: ld returned 1 exit status
	make[4]: *** [tools/libclang/CMakeFiles/libclang.dir/build.make:395: lib/libclang.so.9] Error 1
	make[3]: *** [CMakeFiles/Makefile2:8451: tools/libclang/CMakeFiles/libclang.dir/all] Error 2

I had a hacky patch for that in my series. Should we just report this to the
clang package maintainer in buildroot? I'm assuming you're not hitting it,
right?

I was based on 2020.08.2 tag.

I couldn't fully test this series yet because of this error.

Thanks

--
Qais Yousef
