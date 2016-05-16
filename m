From: Giuseppe Lippolis <giu.lippolis@gmail.com>
Date: Mon, 16 May 2016 13:18:29 +0200
Subject: [Buildroot] Problem with cuImage on 83x
Message-ID: <001701d1af64$acb860d0$06292270$@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying with buildroot to build the linux-4.4.3 for an iomega 150d
machine mounting the mpc8347E sys.
Due the old U-Boot version is not possible to use the standard uImage, but
it is needed to set the cuImage target (the one embedding the device tree).

I start using the default configuration
arch/powerpc/configs/mpc83xx_defconfig,
and the default device tree mpc834x_mds.

In order to enable the console  output during the first linux boot stage I
added the following line at the end of the device tree file:

        chosen {
                linux,stdout-path = "/soc8349/serial at 4500";
        };

The kernel is compiled and I get the cuImage.mpc834x_mds image.

Then I load it on the machine and execute:

tftp 0x10000000 cuImage.mpc834x_mds
Speed: 1000, full duplex
Using Freescale TSEC0 device
TFTP from server 192.168.178.36; our IP address is 192.168.178.10
Filename 'cuImage.mpc834x_mds'.
Load address: 0x10000000
Loading: #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         ################################
done
Bytes transferred = 2157489 (20ebb1 hex)
IOMEGA=> bootm 0x10000000
## Booting image at 10000000 ...
   Image Name:   Linux-4.4.3
   Image Type:   PowerPC Linux Kernel Image (gzip compressed)
   Data Size:    2157425 Bytes =  2.1 MB
   Load Address: 00500000
   Entry Point:  005001f8
   Verifying Checksum ... OK
   Uncompressing Kernel Image ... OK
Memory <- <0x0 0x20000000> (512MB)
ethernet0: local-mac-address <- 00:d0:b8:01:d1:9f
ethernet1: local-mac-address <- 9b:e3:00:01:72:6f
CPU clock-frequency <- 0x179a7b00 (396MHz)
CPU timebase-frequency <- 0x3ef1480 (66MHz)
CPU bus-frequency <- 0xfbc5200 (264MHz)

zImage starting: loaded at 0x00500000 (sp: 0x1ffb2ce8)
Allocating 0x439a88 bytes for kernel ...
gunzipping (0x00000000 <- 0x0050e000:0x00940fe8)...done 0x422920 bytes

Linux/PowerPC load: root=/dev/mtdblock1 ro rootfstype=cramfs devfs=mount
console=ttyS0,115200 init=/linuxrc
Finalizing device tree... flat tree at 0x94d120


But at this point the process crash and the system is reset.
It should be something near the handover between the first kenel boot stage
and the vmlinux start, but I do not have a jtag to proceed the
investigation.

In any case it seems that the execution never entry the vmlinux start
(head_32.S).

I try to add this macro at the begin of the file:

        .equ cnsladdr, 0xe0004500 (console address txreg)

.macro dbg_prnt nid
        lis     r24, cnsladdr at ha
        addi    r24, r24, cnsladdr@l
        li      r25, 'd'
        stb     r25, 0(r24)
        li      r25, 'b'
        stb     r25, 0(r24)
        li      r25, 'g'
        stb     r25, 0(r24)
        li      r25, '0'
        addi    r25, r25, \nid
        stb     r25, 0(r24)
        li      r25, '\n'
        stb     r25, 0(r24)
.endm


But I do not see anything in the console.
The problem seems releted to the vmlinux call in arc/powerpc/boot/main.c

kentry = (kernel_entry_t) vmlinux.addr;


Any suggestion?
Bye.
