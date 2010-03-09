From: Wade Maxfield <wmaxfield@gmail.com>
Date: Tue, 9 Mar 2010 17:44:37 -0600
Subject: [Buildroot] Newbie PPC build
Message-ID: <45a1b53e1003091544w202cb0a8v200255a9085be68d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 I apologize for answering my own question, (where to go next) but here
goes:

Problem: xilinx powerpc linux boots to the point where ram is released, and
hangs.

Solution:
 In the Xilinx forums, someone doing an ML507 board was having the same
problem I was having.

  The issue is in the default inittab in the buildroot generic.  In the
default inittab, the console tty is commented out, and some other tty's are
commented in.

   If you are running Xilinx power pc, and you are bootstrapping up with the
initial baud rate that Xilinx likes to use (9600 baud), change the image's
inittab to contain the following:
----------------------------------------------

# Set up a couple of getty's

#comment out the tty1 and tty2
#tty1::respawn:/sbin/getty 38400 tty1
#tty2::respawn:/sbin/getty 38400 tty2

#null::respawn:/usr/sbin/inetd

# Put a getty on the serial port
ttyS0::respawn:/sbin/getty -L ttyS0 9600 vt100

 --------------------------------

 NOTE: if you are using UartLite, change ttyS0 to ttyUL0


  For a quick change to the image built by buildroot, change into the
buildroot/output/images directory and mount the image similar to the
following line (assuming /mnt/ramdisk directory exists and you have sudo
privs, and the file system is named rootfs.powerpc.ext2):

sudo mount ./rootfs.powerpc.ext2 /mnt/ramdisk -t ext2 -o loop=/dev/loop3


  In addition, the linuxrc located in the root of the file system won't work
for a test init.  If you are trying to do a test init for your boot, add the
line

init=/bin/sh

to your linux boot line, rather than init=/linuxrc, as that will fail.
 Busybox pays attention to how it is linked, which causes certain patterns
to fail.


wade
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100309/710d1b7b/attachment.htm>
