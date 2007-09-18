From: Rae_Samant at emc.com <Rae_Samant@emc.com>
Date: Tue, 18 Sep 2007 17:55:43 -0400
Subject: [Buildroot] linuxrc on marvell feroceon does not get executed
Message-ID: <7EDF9790847B6B459CE09E1355BE138D1EB006@CORPUSMX10C.corp.emc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
      I am not very experienced in kernel area. I need to boot the
Marvell feroceon processor
With LSP from marvell.
 
 The kernel comes up fine and mounts the root from initrd, but after
that, the linuxrc is not executed. But kernel thread for linuxrc
Has been spawned and "do_linuxrc" function gets called.

 I have busybox for shell and other commands.
 
 If I replace linuxrc with an arm executable program (in the name of
"linuxrc") which calls execve with "ls" -- it works..
 Ie..I see list of files in the / directory of my filesystem after root
is mounted.
 
 Seems that the shell of busybox is not working properly . (There is a
hang/crash at "setjmp" in ash_main.c). I commented that setjmp, still
there is a crash somewhere (my linuxrc does not get executed). Should I
enable 
This in buildroot configuration ?
#BR2_GCC_USE_SJLJ_EXCEPTIONS is not set



I used bash too. No change in output (same output).

 Configuration:

 I have 128 MB RAM.
 
 At U-boot I give:
 
 >> tftpboot 0x400000 uImage.marvell
 >> tftpboot 0x800000 initrd.marvell
 >> bootm 0x400000 0x800000

 bootargs are: console=ttyS0,115200 initrd=0x800000 root=/dev/ram

CPU: 
sh-2.05b# cat cpuinfo
Processor       : ARM926EJ-Sid(wb) rev 0 (v5l)
BogoMIPS        : 499.71
Features        : swp half thumb fastmult vfp edsp
CPU implementer : 0x41
CPU architecture: 5TEJ
CPU variant     : 0x0
CPU part        : 0x926
CPU revision    : 0
...snip...
Hardware        : Feroceon
Revision        : 0000
Serial          : 0000000000000000

Busybox: 20060906.tar.bz2  (I tried with latest version too. 1.7.1  Same
output).
uClibc : 0.9.28.3
Gcc    : 3.4.6
KERNEL: 2.6.12.6 patched with LSP 2.2.2 from marvell.

.config derived from:
db88f5281_demo_defconfig


CONFIG_ARM=y
CONFIG_MMU=y
CONFIG_UID16=y
CONFIG_RWSEM_GENERIC_SPINLOCK=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_GENERIC_IOMAP=y

# CONFIG_FPE_NWFPE is not set ............should I Set this ?.


# Processor Type
#
CONFIG_CPU_32=y
CONFIG_CPU_ARM926T=y
CONFIG_CPU_32v5=y
CONFIG_CPU_ABRT_EV5TJ=y
CONFIG_CPU_CACHE_VIVT=y
CONFIG_CPU_COPY_V4WB=y
CONFIG_CPU_TLB_V4WBI=y


Please help me if possible !
Output of console:
--------------------
NET: Registered protocol family 1
NET: Registered protocol family 17
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
RAMDISK: Compressed image found at block 0
usb 2-1: new high speed USB device using dummy_hcd and address 2
VFS: Mounted root (ext2 filesystem).
 eh .. do_linuxrc..fn before execve....shell = </linuxrc>
 he....           calling setjmp.............
Freeing init memory: 108K
init started: BusyBox v1.7.1 (2007-09-17 13:26:03 MDT)
starting pid 291, tty '': '/etc/init.d/rcS'
Cannot run '/etc/init.d/rcS': No such file or directory

Please press Enter to activate this console. usb 2-1: configuration #1
chosen fr
om 2 choices
usb0: high speed config #1: 100 mA, Ethernet Gadget, using CDC Ethernet
midi: probe of 2-1:1.0 failed with error -5
usb1: register usbnet at usb-hc.0-1, CDC Ethernet Device,
36:8a:1c:43:95:2b
hub 2-0:1.0: 92mA over power budget!
------------------------------------


Should I try with buildroot .. Latest ; gcc 4.1.2 ; NWFPE enabled ;
uClibc 0.9.29 ?


Thanks and Regards,
samant
