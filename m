From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Jul 2017 23:47:37 +0200
Subject: [Buildroot] [PATCH 2/3] fs/squashfs: align size to 1MiB
In-Reply-To: <20170711204204.GA2991@scaer> (Yann E. MORIN's message of "Tue,
 11 Jul 2017 22:42:04 +0200")
References: <cover.1499703968.git.yann.morin.1998@free.fr>
 <03816ee56333f1eddb6ca8a048aea947fc027963.1499703968.git.yann.morin.1998@free.fr>
 <20170710232439.7dba43f1@windsurf.lan> <20170710213516.GB22898@scaer>
 <87pod6rak1.fsf@dell.be.48ers.dk> <20170711204204.GA2991@scaer>
Message-ID: <878tjur6h2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > Well, I also did not remeber such an issue either, but ot urns out that
 > the squashfs images that are generated with mksquashfs are not bootable
 > in a (recent-ish) kernel if their size is not a multiple of at least
 > 256KiB...

 > Steps to reproduce:
 >   - start with qemu_arm_vexpress_defconfig,
 >   - change the toolchain to external (for speed)
 >   - change the fs ro squashfs
 >   - build
 >   - boot

 > Expected results:
 >   - it boots to a login prompt

 > Actual result:
 >   - the kernel panics beacuse it can't mount the root filesystem

Are we sure this isn't just some kind of issue in the qemu sd card
emulation?

I did a test with qemu_arm_versatile_defconfig (just because that's the
defconfig I normally use), and here it works:

Booting Linux on physical CPU 0x0
Linux version 4.11.3 (peko at dell) (gcc version 4.8.3 20140320 (prerelease) (Sourcery CodeBench Lite 2014.05-29) ) #2 Tue Jul 11 23:38:39 CEST 2017
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00093177
CPU: VIVT data cache, VIVT instruction cache
OF: fdt: Machine model: ARM Versatile PB
Memory policy: Data cache writeback
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
Kernel command line: root=/dev/sda console=ttyAMA0,115200
..

sd 0:0:0:0: [sda] 4480 512-byte logical blocks: (2.29 MB/2.19 MiB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
sd 0:0:0:0: [sda] Attached SCSI disk
Segment Routing with IPv6
sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
NET: Registered protocol family 17
input: AT Raw Set 2 keyboard as /devices/platform/amba/amba:fpga/10006000.kmi/serio0/input/input0
input: ImExPS/2 Generic Explorer Mouse as /devices/platform/amba/amba:fpga/10007000.kmi/serio1/input/input2
VFS: Mounted root (squashfs filesystem) readonly on device 8:0.
devtmpfs: mounted
Freeing unused kernel memory: 136K
This architecture does not have kernel memory protection.
Starting logging: OK
read-only file system detected...done
Starting network: 8139cp 0000:00:0c.0 eth0: link up, 100Mbps, full-duplex, lpa 0x05E1
udhcpc: started, v1.26.2
udhcpc: sending discover
udhcpc: sending select for 10.0.2.15
udhcpc: lease of 10.0.2.15 obtained, lease time 86400
deleting routers
adding dns 10.0.2.3
OK

Welcome to Buildroot

This is with this rootfs image:

ls -la rootfs.squashfs
-rw-r--r-- 1 peko peko 2293760 Jul 11 23:38 rootfs.squashfs

2293760 is 0x230000, so 64KB alignment.

Adding strace bumps it up to:

-rw-r--r-- 1 peko peko 2457600 Jul 11 23:46 rootfs.squashfs

2457600 is 0x258000, so 32KB alignment.

And this rootfs also works.

-- 
Bye, Peter Korsgaard
