From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 7 Jan 2020 10:27:38 +0100
Subject: [Buildroot] Fwd: Zynqmp ZCU-102 Xilinx
In-Reply-To: <CADDW7LNtKTzF+gYpB-j7QcHjcQPi+D9X9JKqnghvWeQVh8QfaQ@mail.gmail.com>
References: <CADDW7LPbh8ep74a5kcu1CZQuaFxuUGyCUxuJT6uo6Y=m9ftmOA@mail.gmail.com>
 <d46c58a9-4b07-878f-b638-1a4d1554e9b1@lucaceresoli.net>
 <CADDW7LPZ+oD9NzjqvbjVBDYj59K_6q1d8beoqwyQ==jFNTq=KA@mail.gmail.com>
 <6efe98a4-0570-32fa-c2f4-c692907815a4@lucaceresoli.net>
 <CADDW7LNdqK-6fw-hRF5HcCWN7s6Spyq-KGm9O3XcV-tX3O1NwA@mail.gmail.com>
 <95b0cf7d-204c-92f0-a236-beae2a5d0477@lucaceresoli.net>
 <CADDW7LOAUTVqHJHDc5po--YcqunHV01OfSRCY12mytvob14geg@mail.gmail.com>
 <CADDW7LPYECM6B1p1WvrU9GeYAK9Y1qrH2-5tJHTWMs9d=MfdKA@mail.gmail.com>
 <CADDW7LNtKTzF+gYpB-j7QcHjcQPi+D9X9JKqnghvWeQVh8QfaQ@mail.gmail.com>
Message-ID: <a092fc0a-ad3f-fa8b-8895-7db6a90dd10e@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 07/01/20 09:59, Adrian martinez munera wrote:
> 
> 
> ---------- Forwarded message ---------
> De: *Adrian martinez munera* <adrianmartinezmunera@gmail.com
> <mailto:adrianmartinezmunera@gmail.com>>
> Date: mar., 7 ene. 2020 a las 9:55
> Subject: Re: [Buildroot] Zynqmp ZCU-102 Xilinx
> To: Luca Ceresoli <luca@lucaceresoli.net
> <mailto:luca@lucaceresoli.net>>, <buildroot@busybox.net
> <mailto:buildroot@busybox.net>>, Thomas Petazzoni
> <thomas.petazzoni at bootlin.com <mailto:thomas.petazzoni@bootlin.com>>
> 
> 
> Hi?Luca and Thomas and happy new year!
> 
> Finally I could build a ZCU-102 image using pmufw v2017.4.

Good!

> This two
> lines has been crucial:
> ? git checkout v2017.4
> ? git sumbodule update
> Also. I've used the pm_cfg_obj.c of your repository, Luca.

Interesting. That file has been generated for zcu106, it is not
necessarily OK for another board. However the two boards have somewhat
similar SoC variants, so it's still possible that it works.

> But, I have to work with v2018.3. I have built pmufw.bin using this
> version and, when I'm going to build the ZCU102 image (using Buidroot),
> I get this errors for each patch:
> 
> - 0001-arm64-zynqmp-zcu106-fix-SPL-MMC-booting.patch
> *Applying 0001-arm64-zynqmp-zcu106-fix-SPL-MMC-booting.patch using patch:
> patching file board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
> Reversed (or previously applied) patch detected!? Skipping patch.
> 1 out of 1 hunk ignored -- saving rejects to file
> board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c.rej
> package/pkg-generic.mk:202 <http://pkg-generic.mk:202>: recipe for
> target
> '/home/adrian/Documents/ZCU-102/buildroot-2019.02.3/output/build/uboot-xilinx-v2018.3/.stamp_patched'
> failed
> make[1]: ***
> [/home/adrian/Documents/ZCU-102/buildroot-2019.02.3/output/build/uboot-xilinx-v2018.3/.stamp_patched]
> Error 1
> Makefile:84: recipe for target '_all' failed
> make: *** [_all] Error 2*

[...]
This is absolutely normal: those 4 patches are backported from upstream
(as described in each of them), and they all have been merged into
upstream U-Boot between 2017.xx and 2018.yy. Thus they are not needed
(and do not apply) when using 2018.yy.

> *U-Boot 2018.01 (Jan 07 2020 - 09:25:14 +0100) Xilinx ZynqMP ZCU102 rev1.0
> 
> I2C: ? ready
> DRAM: ?4 GiB
> EL Level: ? ? ? EL2
> Chip ID: ? ? ? ?zu9eg
> MMC: ? sdhci at ff170000: 0 (SD)
> *** Warning - bad CRC, using default environment
> 
> In: ? ?serial at ff000000
> Out: ? serial at ff000000
> Err: ? serial at ff000000
> Bootmode: LVL_SHFT_SD_MODE1
> Net: ? ZYNQ GEM: ff0e0000, phyaddr c, interface rgmii-id
> 
> Warning: ethernet at ff0e0000 (eth0) using random MAC address -
> 5a:a3:fb:ee:f8:87
> eth0: ethernet at ff0e0000
> Hit any key to stop autoboot: ?0
> switch to partitions #0, OK
> mmc0 is current device
> Device: sdhci at ff170000
> Manufacturer ID: 3
> OEM: 5344
> Name: SL16G
> Tran Speed: 50000000
> Rd Block Len: 512
> SD version 3.0
> High Capacity: Yes
> Capacity: 14.8 GiB
> Bus Width: 4-bit
> Erase Group Size: 512 Bytes
> reading system.dtb
> 37887 bytes read in 18 ms (2 MiB/s)
> reading Image
> 14825984 bytes read in 975 ms (14.5 MiB/s)
> ## Flattened Device Tree blob at 04000000
> ? ?Booting using the fdt blob at 0x4000000
> ? ?Loading Device Tree to 000000000fff3000, end 000000000ffff3fe ... OK
> 
> Starting kernel ...
> 
> [ ? ?0.000000] Booting Linux on physical CPU 0x0
> [ ? ?0.000000] Linux version 4.14.0 (adrian at adrian) (gcc version 7.4.0
> (Buildroot 2019.02.3)) #1 SMP Tue Jan 7 09:34:39 CET 2020
> [ ? ?0.000000] Boot CPU: AArch64 Processor [410fd034]
> [ ? ?0.000000] Machine model: ZynqMP ZCU102 Rev1.0
> [ ? ?0.000000] earlycon: cdns0 at MMIO 0x00000000ff000000 (options
> '115200n8')
> [ ? ?0.000000] bootconsole [cdns0] enabled
> [ ? ?0.000000] efi: Getting EFI parameters from FDT:
> [ ? ?0.000000] efi: UEFI not found.
> [ ? ?0.000000] cma: Reserved 256 MiB at 0x0000000070000000
> [ ? ?0.000000] psci: probing for conduit method from DT.
> [ ? ?0.000000] psci: PSCIv1.1 detected in firmware.
> [ ? ?0.000000] psci: Using standard PSCI v0.2 function IDs
> [ ? ?0.000000] psci: MIGRATE_INFO_TYPE not supported.
> [ ? ?0.000000] percpu: Embedded 21 pages/cpu @ffffffc87ff66000 s45080
> r8192 d32744 u86016
> [ ? ?0.000000] Detected VIPT I-cache on CPU0
> [ ? ?0.000000] CPU features: enabling workaround for ARM erratum 845719
> [ ? ?0.000000] Built 1 zonelists, mobility grouping on.? Total pages:
> 1034240
> [ ? ?0.000000] Kernel command line: earlycon clk_ignore_unused
> root=/dev/mmcblk0p2 rw rootwait
> [ ? ?0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
> [ ? ?0.000000] Dentry cache hash table entries: 524288 (order: 10,
> 4194304 bytes)
> [ ? ?0.000000] Inode-cache hash table entries: 262144 (order: 9, 2097152
> bytes)
> [ ? ?0.000000] software IO TLB [mem 0x6bfff000-0x6ffff000] (64MB) mapped
> at [ffffffc06bfff000-ffffffc06fffefff]
> [ ? ?0.000000] Memory: 3785368K/4194304K available (10108K kernel code,
> 654K rwdata, 3168K rodata, 512K init, 2157K bss, 146792K reserved,
> 262144K cma-reserved)
> [ ? ?0.000000] Virtual kernel memory layout:
> [ ? ?0.000000] ? ? modules : 0xffffff8000000000 - 0xffffff8008000000 ? (
> ? 128 MB)
> [ ? ?0.000000] ? ? vmalloc : 0xffffff8008000000 - 0xffffffbebfff0000 ? (
> ? 250 GB)
> [ ? ?0.000000] ? ? ? .text : 0xffffff8008080000 - 0xffffff8008a60000 ? (
> 10112 KB)
> [ ? ?0.000000] ? ? .rodata : 0xffffff8008a60000 - 0xffffff8008d80000 ? (
> ?3200 KB)
> [ ? ?0.000000] ? ? ? .init : 0xffffff8008d80000 - 0xffffff8008e00000 ? (
> ? 512 KB)
> [ ? ?0.000000] ? ? ? .data : 0xffffff8008e00000 - 0xffffff8008ea3a00 ? (
> ? 655 KB)
> [ ? ?0.000000] ? ? ? ?.bss : 0xffffff8008ea3a00 - 0xffffff80090bf030 ? (
> ?2158 KB)
> [ ? ?0.000000] ? ? fixed ? : 0xffffffbefe7fd000 - 0xffffffbefec00000 ? (
> ?4108 KB)
> [ ? ?0.000000] ? ? PCI I/O : 0xffffffbefee00000 - 0xffffffbeffe00000 ? (
> ? ?16 MB)
> [ ? ?0.000000] ? ? vmemmap : 0xffffffbf00000000 - 0xffffffc000000000 ? (
> ? ? 4 GB maximum)
> [ ? ?0.000000] ? ? ? ? ? ? ? 0xffffffbf00000000 - 0xffffffbf1dc00000 ? (
> ? 476 MB actual)
> [ ? ?0.000000] ? ? memory ?: 0xffffffc000000000 - 0xffffffc880000000 ? (
> 34816 MB)
> [ ? ?0.000000] Hierarchical RCU implementation.
> [ ? ?0.000000] ?RCU event tracing is enabled.
> [ ? ?0.000000] ?RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=4.
> [ ? ?0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
> [ ? ?0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> [ ? ?0.000000] GIC: Adjusting CPU interface base to 0x00000000f902f000
> [ ? ?0.000000] GIC: Using split EOI/Deactivate mode
> [ ? ?0.000000] arch_timer: cp15 timer(s) running at 100.00MHz (phys).
> [ ? ?0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff
> max_cycles: 0x171024e7e0, max_idle_ns: 440795205315 ns
> [ ? ?0.000003] sched_clock: 56 bits at 100MHz, resolution 10ns, wraps
> every 4398046511100ns
> [ ? ?0.008382] Console: colour dummy device 80x25
> [ ? ?0.012463] console [tty0] enabled
> [ ? ?0.015830] bootconsole [cdns0] disabled
> *
> *
> *
> Is there anything I'm doing wrong?

I don't know what, sorry. But I would not even start investigating
before generating a proper pm_cfg_obj.c and psu_init_gpl.c for zcu102
(not zcu106) and from Vivado 2018.3. As I said before, these tools tend
to have poor compatibility with mixed versions, and using a config file
for a different board *might* work in some cases, but is not granted at all.

-- 
Luca
