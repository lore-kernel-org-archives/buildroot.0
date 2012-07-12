From: Bart J. Smit <bart@smits.co.uk>
Date: Thu, 12 Jul 2012 10:54:27 +0000
Subject: [Buildroot] Starting from scratch fails - how do I get to a basic
	PXE boot?
Message-ID: <07221C471CA1C044B6D10EC0D483C95708D3ECA7@hercules.clumpton.homeip.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After a string of issues with custom kernels, I thought I'd try with a defconfig from scratch. I deleted the buildroot tree and unpacked the buildroot tarball again. I ran:

$ make menuconfig

kernel changes for VM:
	BR2_LINUX_KERNEL=y
	BR2_LINUX_KERNEL_DEFCONFIG=qemu_x86

changes for PXE boot:
	BR2_TARGET_ROOTFS_TAR=n
	BR2_TARGET_ROOTFS_INITRAMFS=y
	BR2_TARGET_ROOTFS_CPIO=y
	BR2_TARGET_ROOTFS_CPIO_GZIP=y

$ make

This went along quite happy for a while and then halted on:

>>> linux 3.3.7 Configuring
cp /home/buildroot/buildroot/output/build/linux-3.3.7/arch/x86/configs/qemu_x86_defconfig /home/buildroot/buildroot/output/build/linux-3.3.7/arch/x86/configs/buildroot_defconfig
cp: cannot stat `/home/buildroot/buildroot/output/build/linux-3.3.7/arch/x86/configs/qemu_x86_defconfig': No such file or directory
make: *** [/home/buildroot/buildroot/output/build/linux-3.3.7/.stamp_configured] Error 1

So I ran:

$ cp output/build/linux-3.3.7/arch/x86/configs/i386_defconfig output/build/linux-3.3.7/arch/x86/configs/qemu_x86_defconfig
$ make

And this built successfully. I?m testing on a ESXi 4 guest (VM hardware level 7, LSI Logic Parallel SCSI disk, Intel E1000 NIC).
However, when I PXE boot from this, the VM stalls with these last lines:

[ 	2.208499] nf _conntrack version 0.5.0 (16068 buckets, 64272 Max) 
[ 	2.208876] ctnetlink v0.93: registering with nfnetlink. 
[ 	2.209472] ip_tables: (C) 2000-2006 Netfilter Core TeaM 
[ 	2.209692] TCP cubic registered 
[ 	2.209999] input: IMPS/2 Generic Wheel House as /devices/platforM/i8842/serio1/input/input2 
[ 	2.210496] Initializing XFRH netlink socket 
[ 	2.210912] NET: Registered protocol faMily 10 
[ 	2.211103] ip6_tables: (C) 2000-2006 Netfilter Core Team
[ 	2.211141] IPv6 over IPv4 tunneling driver 
[ 	2.212437] NET: Registered protocol faMily 17 
[ 	2.212476] Registering the dns_resolver key type 
[ 	2.212513] Using IPI No-Shortcut Mode 
[ 	2.212791] registered taskstats version 1 
[ 	2.216653] Magic number: 4:891:476 
[ 	2.216690] console [netcon0] enabled 
[ 	2.216728] netconsole: network logging started 
[ 	2.216875] Freeing unused kernel MeMory: 1000k freed 
[ 	2.217135] Write protecting the kernel text: 6392k 
[ 	2.217190] Write protecting the kernel read-only data: 2888k 
Starting logging: ON 
Initializing random number generator ... done.
Starting network ... 
[ 	2.227418] ip used greatest stack depth: 6392 bytes left

What steps did I miss? Is there a better/easier way to get from a clean buildroot to a working PXE setup?

Also, how do I start from scratch more quickly? Is it enough to delete .config to clear all my changes?

Thanks,

Bart...
