From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Apr 2019 11:41:15 +0200
Subject: [Buildroot] [PATCH] linux-tools/perf: Add dependency on atomic
 ops for ARC
In-Reply-To: <20190418093025.36642-1-abrodkin@synopsys.com>
References: <20190418093025.36642-1-abrodkin@synopsys.com>
Message-ID: <20190418114115.2e186f18@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Apr 2019 12:30:25 +0300
Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:

> Atomic ops are strictly required by perf utility as it uses
> atomic_xxx() functions.
> 
> Otherwise building fails like that:
> |.../output/host/opt/ext-toolchain/bin/../lib/gcc/arc-snps-linux-uclibc/8.2.1/../../../../arc-snps-linux-uclibc/bin/ld:
> |.../output/build/linux-5.0.7/tools/perf/libperf.a(libperf-in.o): in function `atomic_cmpxchg':
> |.../output/build/linux-5.0.7/tools/include/asm-generic/atomic-gcc.h:69: undefined reference to `__sync_val_compare_and_swap_4'
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  package/linux-tools/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> index 4916faa349..15257e499e 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -46,6 +46,7 @@ config BR2_PACKAGE_LINUX_TOOLS_PCI
>  config BR2_PACKAGE_LINUX_TOOLS_PERF
>  	bool "perf"
>  	select BR2_PACKAGE_LINUX_TOOLS
> +	depends on !BR2_arc || BR2_ARC_ATOMIC_EXT

Since the actual dependency is on sync builtins, can we use
BR2_TOOLCHAIN_HAS_SYNC_4 instead ?

BR2_TOOLCHAIN_HAS_SYNC_4 is already defined like this:

config BR2_TOOLCHAIN_HAS_SYNC_4
        bool
        default y
        depends on !BR2_m68k_cf
        depends on !BR2_sparc
        depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)

i.e, it is already false on ARC systems that don't have
BR2_ARC_ATOMIC_EXT.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
