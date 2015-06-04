From: John OSullivan <john.osullivan@cloudiumsystems.com>
Date: Thu, 4 Jun 2015 15:30:58 +0100
Subject: [Buildroot] Valgrind on buildroot
Message-ID: <00f501d09ed3$13c8d000$3b5a7000$@osullivan@cloudiumsystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have been trying to get valgrind working on a buildroot 2013.05 arm board.

valgrind -d -d

fails to run with 

--2993:0:aspacem  Valgrind: FATAL: aspacem assertion failed:

--2993:0:aspacem    segment_is_sane

--2993:0:aspacem    at m_aspacemgr/aspacemgr-linux.c:1477 (add_segment)

--2993:0:aspacem  Exiting now.

 

The issue is with the device node for libc

00008000-00106000 r-xp 00000000 00:00 8773       /bin/busybox

0010e000-0010f000 rw-p 000fe000 00:00 8773       /bin/busybox

0010f000-00111000 rw-p 00000000 00:00 0          [heap]

b6dae000-b6eea000 r-xp 00000000 00:00 8937       /lib/libc-2.13.so

                                ^^^^^

                                 dev & ino are always zero

 

valgrind is not expecting a zero for b6dae000-b6eea000 r-xp 00000000 00:00
8937       /lib/libc-2.13.so

 

The build options I am using are:

 

Filesystem images->cpio the root filesystem (initial RAM Filoesystem)

Filesystem images->ext2/3/4 root filesystem

(0)Size in blocks

(0)Inodes (auto calculation)

(0)Reserved blocks percentage

 

Any ideas on how to change this to non-zero so that Valgrind will read it
correctly, it works fine on rabpberrypi, but my filesystem is on the SD
Card,

Other info that might be useful follows

 

 

 

My /proc/self/maps is as follows:

--------------------------

00008000-00106000 r-xp 00000000 00:00 8773       /bin/busybox

0010e000-0010f000 rw-p 000fe000 00:00 8773       /bin/busybox

0010f000-00111000 rw-p 00000000 00:00 0          [heap]

b6dae000-b6eea000 r-xp 00000000 00:00 8937       /lib/libc-2.13.so

b6eea000-b6ef2000 ---p 0013c000 00:00 8937       /lib/libc-2.13.so

b6ef2000-b6ef4000 r--p 0013c000 00:00 8937       /lib/libc-2.13.so

b6ef4000-b6ef5000 rw-p 0013e000 00:00 8937       /lib/libc-2.13.so

b6ef5000-b6ef8000 rw-p 00000000 00:00 0 

b6ef8000-b6f66000 r-xp 00000000 00:00 8935       /lib/libm-2.13.so

b6f66000-b6f6d000 ---p 0006e000 00:00 8935       /lib/libm-2.13.so

b6f6d000-b6f6e000 r--p 0006d000 00:00 8935       /lib/libm-2.13.so

b6f6e000-b6f6f000 rw-p 0006e000 00:00 8935       /lib/libm-2.13.so

b6f6f000-b6f8f000 r-xp 00000000 00:00 8945       /lib/ld-2.13.so

b6f91000-b6f92000 rw-p 00000000 00:00 0

b6f94000-b6f95000 rw-p 00000000 00:00 0 

b6f95000-b6f96000 r-xp 00000000 00:00 0          [sigpage]

b6f96000-b6f97000 r--p 0001f000 00:00 8945       /lib/ld-2.13.so

b6f97000-b6f98000 rw-p 00020000 00:00 8945       /lib/ld-2.13.so

bee7c000-bee9d000 rw-p 00000000 00:00 0          [stack]

ffff0000-ffff1000 r-xp 00000000 00:00 0          [vectors]

----------------------------------------------

# cat /proc/cpuinfo 

processor       : 0

model name      : ARMv7 Processor rev 0 (v7l)

Features        : swp half thumb fastmult vfp edsp neon vfpv3 tls

vfpd32

CPU implementer : 0x41

CPU architecture: 7

CPU variant     : 0x3

CPU part        : 0xc09

CPU revision    : 0

 

processor       : 1

model name      : ARMv7 Processor rev 0 (v7l)

Features        : swp half thumb fastmult vfp edsp neon vfpv3 tls

vfpd32

CPU implementer : 0x41

CPU architecture: 7

CPU variant     : 0x3

CPU part        : 0xc09

CPU revision    : 0

 

Hardware        : Xilinx Zynq Platform

Revision        : 0000

Serial          : 0000000000000000

 

Regards

John

 

 

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150604/cc626682/attachment.html>
