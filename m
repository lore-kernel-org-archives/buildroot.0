From: amit.chaudhuri at bt.com <amit.chaudhuri@bt.com>
Date: Tue, 15 Jul 2014 16:12:06 +0100
Subject: [Buildroot] Kernel oops on imx53 / ARM - Unhandled fault: alignment
 exception (0x801)s
Message-ID: <8CF2946A95E16D4A92067339B0D48BE59AD1126633@EMV66-UKRD.domain1.systemhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am using buildroot to create a toolchain for Freescale's imx53qsb board.  
Part of the target we're looking for is Qt5 with support for their eglfs 
platform.

If I only build part of Qt5 and don't satisfy dependencies for eglfs I get
a bootable system. When I add all of the dependencies I appear to need, I
get the relevant Qt5 modules compiled & linked but my kernel dies with 
"Unhandled fault: alignment exception (0x801) at 0xdf039e16". I've added the
console error message and disassembly of the crash site below.

In narrowing down the things that tip me over the edge I've settled on the
addition of udev and evdev as being likely factors.

I *think* I need to add -mno-unaligned-access to the compilation flags for
everything. But I've not worked out how to do that. If alignment is my issue
how does one add custom compilation flags to all packages?

If I'm mis-diagnosing the problem, I'd be keen to have that pointed out.
All help much appreciated..

Regards,

Amit

** console **

Linux version 2.6.35.3-00004-g5a0d407-dirty (chaudhak at linux-j264) (gcc version 4.7.3 (Buildroot 2014.05-rc3-00004-g5a0d407-dirty) ) #1 PREEMPT Mon Jul 14 17:02:48 BST 2014
CPU: ARMv7 Processor [412fc085] revision 5 (ARMv7), cr=10c53c7f
CPU: VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
Machine: Freescale MX53 LOCO Board
Memory policy: ECC disabled, Data cache writeback
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 250880
Kernel command line: console=ttymxc0,115200 ip=dhcp root=/dev/mmcblk0p1 rootwait rw
PID hash table entries: 4096 (order: 2, 16384 bytes)
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
Memory: 480MB 512MB = 992MB total
Memory: 998308k/998308k available, 17500k reserved, 0K highmem
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
    DMA     : 0xf9e00000 - 0xffe00000   (  96 MB)
    vmalloc : 0xe0800000 - 0xf4000000   ( 312 MB)
    lowmem  : 0x80000000 - 0xe0000000   (1536 MB)
    pkmap   : 0x7fe00000 - 0x80000000   (   2 MB)
    modules : 0x7f000000 - 0x7fe00000   (  14 MB)
      .init : 0x80008000 - 0x80032000   ( 168 kB)
      .text : 0x80032000 - 0x807de000   (7856 kB)
      .data : 0x80802000 - 0x8085a0e0   ( 353 kB)
SLUB: Genslabs=11, HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
Hierarchical RCU implementation.
        RCU-based detection of stalled CPUs is disabled.
        Verbose stalled-CPUs detection is disabled.
NR_IRQS:368
MXC GPIO hardware
MXC IRQ initialized
MXC_Early serial console at MMIO 0x53fbc000 (options '115200')
bootconsole [ttymxc0] enabled
Console: colour dummy device 80x30
Calibrating delay loop... 999.42 BogoMIPS (lpj=4997120)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
Unhandled fault: alignment exception (0x801) at 0xdf039fc6
Internal error: : 801 [#1] PREEMPT
last sysfs file: 
Modules linked in:
CPU: 0    Not tainted  (2.6.35.3-00004-g5a0d407-dirty #1)
PC is at devtmpfs_init+0x10/0xa4
LR is at driver_init+0x8/0x28
pc : [<8001e19c>]    lr : [<8001e148>]    psr: 80000013
sp : df039fc0  ip : 00000000  fp : 00000000
r10: 00000000  r9 : 00000000  r8 : 00000000
r7 : 00000013  r6 : 800338b4  r5 : 80031830  r4 : 80031830
r3 : 8078f6f4  r2 : 65646f6d  r1 : 00000200  r0 : 8083d89c
Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 10c5387f  Table: 70004019  DAC: 00000017
Process swapper (pid: 1, stack limit = 0xdf0382e8)
Stack: (0xdf039fc0 to 0xdf03a000)
9fc0: 00000000 00000200 8009e324 00000000 80031830 8001e148 00000000 80008984
9fe0: 00000000 00000000 00000000 00000000 80008904 800338b4 2138002e 1c000420
[<8001e19c>] (devtmpfs_init+0x10/0xa4) from [<8001e148>] (driver_init+0x8/0x28)
[<8001e148>] (driver_init+0x8/0x28) from [<80008984>] (kernel_init+0x80/0x160)
[<80008984>] (kernel_init+0x80/0x160) from [<800338b4>] (kernel_thread_exit+0x0/0x8)
Code: e92d401f e59f3080 e59f0080 e5932000 (e58d2006) 


** disassembly **


8001e18c <devtmpfs_init>:
8001e18c:       e92d401f        push    {r0, r1, r2, r3, r4, lr}
8001e190:       e59f3080        ldr     r3, [pc, #128]  ; 8001e218 <devtmpfs_init+0x8c>
8001e194:       e59f0080        ldr     r0, [pc, #128]  ; 8001e21c <devtmpfs_init+0x90>
8001e198:       e5932000        ldr     r2, [r3]
8001e19c:       e58d2006        str     r2, [sp, #6]
8001e1a0:       e5932004        ldr     r2, [r3, #4]
8001e1a4:       e1d330b8        ldrh    r3, [r3, #8]
8001e1a8:       e58d200a        str     r2, [sp, #10]
8001e1ac:       e1cd30be        strh    r3, [sp, #14]
8001e1b0:       eb02d0a2        bl      800d2440 <register_filesystem>
8001e1b4:       e2504000        subs    r4, r0, #0
8001e1b8:       0a000003        beq     8001e1cc <devtmpfs_init+0x40>
8001e1bc:       e1a01004        mov     r1, r4
8001e1c0:       e59f0058        ldr     r0, [pc, #88]   ; 8001e220 <devtmpfs_init+0x94>
8001e1c4:       eb0f430c        bl      803eedfc <printk>
8001e1c8:       ea00000f        b       8001e20c <devtmpfs_init+0x80>
8001e1cc:       e59f0048        ldr     r0, [pc, #72]   ; 8001e21c <devtmpfs_init+0x90>
8001e1d0:       e28d1006        add     r1, sp, #6
8001e1d4:       eb027dce        bl      800bd914 <kern_mount_data>
8001e1d8:       e3700a01        cmn     r0, #4096       ; 0x1000
8001e1dc:       9a000006        bls     8001e1fc <devtmpfs_init+0x70>
8001e1e0:       e1a04000        mov     r4, r0
8001e1e4:       e59f0038        ldr     r0, [pc, #56]   ; 8001e224 <devtmpfs_init+0x98>
8001e1e8:       e1a01004        mov     r1, r4
8001e1ec:       eb0f4302        bl      803eedfc <printk>
8001e1f0:       e59f0024        ldr     r0, [pc, #36]   ; 8001e21c <devtmpfs_init+0x90>
8001e1f4:       eb02d063        bl      800d2388 <unregister_filesystem>
8001e1f8:       ea000003        b       8001e20c <devtmpfs_init+0x80>
8001e1fc:       e59f3024        ldr     r3, [pc, #36]   ; 8001e228 <devtmpfs_init+0x9c>
8001e200:       e5830000        str     r0, [r3]
8001e204:       e59f0020        ldr     r0, [pc, #32]   ; 8001e22c <devtmpfs_init+0xa0>
8001e208:       eb0f42fb        bl      803eedfc <printk>
8001e20c:       e1a00004        mov     r0, r4
8001e210:       e28dd010        add     sp, sp, #16
8001e214:       e8bd8010        pop     {r4, pc}
8001e218:       8078f6f4        .word   0x8078f6f4
8001e21c:       8083d89c        .word   0x8083d89c
8001e220:       8078f67d        .word   0x8078f67d
8001e224:       8078f6af        .word   0x8078f6af
8001e228:       80878c2c        .word   0x80878c2c
8001e22c:       8078f6da        .word   0x8078f6da

** end **
