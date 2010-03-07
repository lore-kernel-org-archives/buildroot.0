From: Jim Thomas <jimthomasembedded@yahoo.com>
Date: Sun, 7 Mar 2010 10:19:49 -0800 (PST)
Subject: [Buildroot] TFTP performance with U-Boot running under QEMU
Message-ID: <729565.36936.qm@web44806.mail.sp1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I previously got the Buildroot generated Linux kernel and
RFS running in a QEMU VM (ARM versatilepb) , where the Linux
kernel zImage is passed to QEMU directly as a startup command
line option.

Now I am exploring adding U-Boot to the mix, where QEMU
executes u-boot.bin, and U-Boot first transfers the Linux
kernel uImage via TFTP and then executes it in the QEMU VM.

I currently hard-code a few U-Boot environment variables in
./include/configs/versatile.h.  That is inflexible, but very
convenient since it eliminates having to manually re-enter the
IP addresses, kernel parameters, and boot commands manually
each time the QEMU VM and U-Boot are restarted.

It works:

  $ ./run-uboot.sh 

  U-Boot 2009.11 (Mar 07 2010 - 11:10:57)
  DRAM:   0 kB
  ## Unknown FLASH on Bank 1 - Size = 0x00000000 = 0 MB
  Flash:  0 kB
  *** Warning - bad CRC, using default environment
  In:    serial
  Out:   serial
  Err:   serial
  Net:   SMC91111-0
  Hit any key to stop autoboot:  0 
  SMC91111: MAC 52:54:00:12:34:56
  Using SMC91111-0 device
  TFTP from server 192.168.32.140; our IP address is 192.168.32.150
  Filename 'uImage'.
  Load address: 0x7fc0
  Loading: #################################################################
           #################################################################
           #################################################################
           #################################################################
           ############################
  done
  Bytes transferred = 1473140 (167a74 hex)
  ## Booting kernel from Legacy Image at 00007fc0 ...
     Image Name:   Linux-2.6.32.9
     Image Type:   ARM Linux Kernel Image (uncompressed)
     Data Size:    1473076 Bytes =  1.4 MB
     Load Address: 00008000
     Entry Point:  00008000
     Loading Kernel Image ... OK
  OK
  Starting kernel ...
  Uncompressing Linux............... done, booting the kernel.
  Linux version 2.6.32.9 (jthomas at pangaea) (gcc version 4.3.4 
    (Buildroot 2010.02) ) #2 Sun Mar 7 09:46:53 CST 2010
  CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00093177
  CPU: VIVT data cache, VIVT instruction cache
  Machine: ARM-Versatile PB
  <snip>
  Starting sshd: OK
  Welcome to Buildroot
  buildroot login: root
  #

I am very pleased that this works.

But the problem is, the TFTP transfer of the 1.4 MB Linux kernel
takes a full 80 seconds (!) to complete.

When U-Boot is idling at the U-Boot prompt in the QEMU VM, I can
see by running 'top' in another terminal session in the Ubuntu VM
that hosts the QEMU VM that the QEMU VM is consuming 99% of the CPU.

This is perhaps to be expected, since U-Boot is a low level boot
loader that runs superloop.

It may also explain the slow TFTP tranfer.  I suspect the QEMU VM
running U-Boot superloop, consuming 99% of the Ubuntu VM CPU, is
starving the TFTP server that is also running as a daemon on that
same Ubuntu VM.  Running QEMU/U-Boot with 'nice' does not improve
the file transfer performance.

Have you observed this same slow TFTP file transfer under QEMU?
Is there any known workaround?

If the TFTP transfer speed cannot be improved, I will probably just
boot zImage in QEMU directly, and only include U-Boot when I really
wish to explore U-Boot and the 80 second transfer is affordable.

Thanks.

Jim



      
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100307/c3dba190/attachment.htm>
