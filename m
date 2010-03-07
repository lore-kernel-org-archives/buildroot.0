From: Jim Thomas <jimthomasembedded@yahoo.com>
Date: Sun, 7 Mar 2010 12:28:20 -0800 (PST)
Subject: [Buildroot] TFTP performance with U-Boot running under QEMU
In-Reply-To: <5ec3d7931003071121i77632726i48ab4047e89096f1@mail.gmail.com>
References: <729565.36936.qm@web44806.mail.sp1.yahoo.com>
	<5ec3d7931003071121i77632726i48ab4047e89096f1@mail.gmail.com>
Message-ID: <943046.82953.qm@web44814.mail.sp1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think I can help you with a couple of issues here:

  > I have to complain even more:

  > VersatilePB # tftp uImage
  > SMC91111: PHY auto-negotiate timed out
  > SMC91111: MAC 52:54:00:12:34:56
  > Using SMC91111-0 device
  > TFTP from server 192.168.0.10; our IP address is 192.168.0.150
  > Filename 'uImage'.
  > Load address: 0x7fc0
  > Loading: #T T T #T T T T #T T T 
  > Retry count exceeded; starting again
  > SMC91111: PHY auto-negotiate timed out
  > SMC91111: MAC 52:54:00:12:34:56
  > Using SMC91111-0 device
  > TFTP from server 192.168.0.10; our IP address is 192.168.0.150
  > Filename 'uImage'.
  > Load address: 0x7fc0
  > Loading: #T T T #T T T T #T T T 
  > Retry count exceeded; starting again

I encountered both issues last night.

First, the 'PHY auto-negotiate timed out' adds an annoying
delay at startup.  The solution for that is to change a U-Boot
#undef to #define in ./u-boot-2009.11/include/configs/versatile.h:

  #define CONFIG_SMC91111_EXT_PHY

With that change, U-Boot blows right past the PHY at startup.
No delay, and no timeout logged to the console.

Second, the excessive timeouts '#T T T #T T T T # T T T' are exactly
what I observed until long past midnight.  This one took me a while
to figure out, and I had to get lucky just trying things -- I don't
really understand the workaround that seems to solve it.

The IP address of my Ubuntu VM hosting the TFTP server is
192.168.32.133.  When I configured U-Boot to use that IP address, I
got the timeout pattern above and it never ran to completion.  Running
tcpdump on the Ubuntu VM, I could see lots of associated packet activity.

At some point, just trying things, I configured U-Boot to use
192.168.32.140 instead, and suddenly the timeouts went away and the
TFTP download was successful (albeit requiring 80 seconds to complete).

What is 192.168.32.140?  It is the IP address of the TUN interface that
I configure for QEMU in qemu-ifup.sh.  I don't understand (yet) why that
works, whereas using the actual IP address of the Ubuntu VM times out
(although a few TFTP packets get through).

I will include my initial setup notes below.  These are rough-cut.  I
will revise them and repost to the mailing list if I come up with a better
procedure, or a workaround for the slow TFTP transfer from QEMU/U-Boot.

Please note that the procedure below uses an ARM cross-toolchain created
using crosstools-ng.  You should be able to use your own equivalent
toolchain.  (My objective is to get Mark Lindner's commonc++ POSIX framework
library working on Buildroot.  Since commonc++ requires aio.h, and uClibc
does not support async I/O, I am moving towards a crosstools-ng glibc based
toolchain.  I am looking forward to the next Buildroot release where the
roadmap mentions improved support for external crosstools-ng toolchains
for an integrated environment.  In the meantime, I got crosstools-ng and
commonc++ built -- but have not tried a commonc++ hello world program yet.
Ran out of weekend.)

Thanks.

Jim

Sat 6 Mar 2010 / Sun 7 Mar 2010

On the Ubuntu 9.10 Server VM:

  $ sudo apt-get install xinetd
  $ sudo apt-get install tftpd
  $ sudo apt-get install tftp

Create the file /etc/xinetd.d/tftp as root:

  service tftp
  {
    protocol    = udp
    port        = 69
    socket_type = dgram
    wait        = yes
    user        = nobody
    server      = /usr/sbin/in.tftpd
    server_args = -s /tftpboot
    disable     = no
  }

Create tftpboot directory:

  $ sudo mkdir /tftpboot
  $ sudo chmod 777 /tftpboot
  $ sudo chown nobody /tftpboot/

  $ ls -ld /tftpboot
  drwxrwxrwx 2 nobody root 4096 2010-03-06 17:45 /tftpboot

  $ grep nobody /etc/passwd
  nobody:x:65534:65534:nobody:/nonexistent:/bin/sh

Start tftpd using xinetd:

  $ sudo /etc/init.d/xinetd restart
   * Stopping internet superserver xinetd  [ OK ] 
   * Starting internet superserver xinetd  [ OK ] 

Use Buildroot 'make menuconfig' and 'make' to select and build Linux
kernel 'uImage' for U-Boot instead of the usual 'zImage'.  Copy the
new uImage to the /tftpboot directory:

  /tftpboot

  -rw-r--r-- 1 jthomas swdev 1473140 2010-03-07 10:01 uImage

Verify that tftpd is functional by copying uImage to a local tmp directory:

  /home/jthomas/tmp

  $ tftp 192.168.32.133
  tftp> binary
  tftp> get uImage
  Received 1473140 bytes in 0.2 seconds
  tftp> quit

  $ ls -l
  -rw-r--r-- 1 jthomas swdev 1473140 2010-03-07 10:47 uImage

Create a standalone U-Boot build environment independent of Buildroot:

  /home/jthomas/work

  -rw-r--r-- 1 jthomas swdev 8856614 2010-03-07 10:23 u-boot-2009.11.tar.bz2

  $ tar xfj u-boot-2009.11.tar.bz2 

NOTE:  *_EXT_PHY below is to avoid lengthy delay and timeout at U-Boot startup
due to there being no PHY in the QEMU execution environment.

NOTE:  The hard-coded IP addresses below are inflexible, but very convenient
since the U-Boot environment variables need not be manually entered each time.

Customize the U-Boot source for the Versatile platform:

  /home/jthomas/work/u-boot-2009.11/include/configs/versatile.h 

  Modify:

    #define CONFIG_SMC91111_EXT_PHY

    #define CONFIG_BOOTFILE   "uImage"

    #define CONFIG_BOOTARGS   "console=ttyAMA0 mem=128M " \
      "root=/dev/nfs rw nfsroot=192.168.32.133:/home/jthomas/arm-vm/rfs " \
      "ip=192.168.32.150:192.168.32.133:192.168.32.2:255.255.255.0"

  Add:

    #define CONFIG_IPADDR    192.168.32.150
    #define CONFIG_NETMASK   255.255.255.0
    #define CONFIG_SERVERIP  192.168.32.140

Set PATH to toolchain built using crosstools-ng:

  $ export PATH=$PATH:/home/jthomas/x-tools/arm-unknown-linux-gnueabi/bin

Build U-Boot:

  /home/jthomas/work/u-boot-2009.11

  $ make versatile

The build completes in ~2 minutes, and creates:

  /home/jthomas/work/u-boot-2009.11

  -rwxr-xr-x 1 jthomas swdev 91580 2010-03-07 10:36 u-boot.bin

Create script to run U-Boot in QEMU:

  /home/jthomas/arm-vm/run-uboot.sh 

  #!/bin/sh

  TARGET=versatilepb

  CONSOLE=ttyAMA0

  SCRIPT=qemu-ifup.sh

  RFS=~/arm-vm/rfs

  UBOOT=/home/jthomas/work/u-boot-2009.11/u-boot.bin

  QEMU=~/arm-vm/qemu-0.12.3/arm-softmmu/qemu-system-arm

  sudo $QEMU -M $TARGET -nographic \
    -net nic,vlan=0 -net tap,ifname=tap0,script=$SCRIPT \
    -append "console=$CONSOLE" \
    -kernel $UBOOT

Run U-Boot and boot Linux in QEMU VM:

  /home/jthomas/arm-vm

  $ ./run-uboot.sh 

  U-Boot 2009.11 (Mar 07 2010 - 10:34:48)

  DRAM:   0 kB
  ## Unknown FLASH on Bank 1 - Size = 0x00000000 = 0 MB
  Flash:  0 kB
  *** Warning - bad CRC, using default environment

  In:    serial
  Out:   serial
  Err:   serial
  Net:   SMC91111-0
  VersatilePB # 

  VersatilePB # printenv

  bootargs=console=ttyAMA0 mem=128M root=/dev/nfs rw 
    nfsroot=192.168.32.133:/home/jthomas/arm-vm/rfs 
    ip=192.168.32.150:192.168.32.133:192.168.32.2:255.255.255.0
  bootdelay=2
  baudrate=38400
  ipaddr=192.168.32.150
  serverip=192.168.32.140
  netmask=255.255.255.0
  bootfile="uImage"
  stdin=serial
  stdout=serial
  stderr=serial
  verify=n
  ethact=SMC91111-0
  Environment size: 341/8188 bytes

  VersatilePB # tftpboot

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

  VersatilePB # bootm

  ## Booting kernel from Legacy Image at 00007fc0 ...
     Image Name:   Linux-2.6.32.9
     Image Type:   ARM Linux Kernel Image (uncompressed)
     Data Size:    1473076 Bytes =  1.4 MB
     Load Address: 00008000
     Entry Point:  00008000
     Loading Kernel Image ... OK
  OK

  Starting kernel ...

  Uncompressing Linux................................... done, booting the kernel.
  Linux version 2.6.32.9 (jthomas at pangaea) (gcc version 4.3.4 (Buildroot 2010.02) )
    #2 Sun Mar 7 09:46:53 CST 2010
  CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00093177
  CPU: VIVT data cache, VIVT instruction cache
  Machine: ARM-Versatile PB
  Memory policy: ECC disabled, Data cache writeback
  Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
  Kernel command line: console=ttyAMA0 mem=128M root=/dev/nfs rw 
    nfsroot=192.168.32.133:/home/jthomas/arm-vm/rfs 
    ip=192.168.32.150:192.168.32.133:192.168.32.2:255.255.255.0
  PID hash table entries: 512 (order: -1, 2048 bytes)
  Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
  Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
  Memory: 128MB = 128MB total
  Memory: 126748KB available (2596K code, 227K data, 108K init, 0K highmem)
  Hierarchical RCU implementation.
  NR_IRQS:192
  VIC @f1140000: id 0x00041190, vendor 0x41
  Console: colour dummy device 80x30
  Calibrating delay loop... 197.83 BogoMIPS (lpj=989184)
  Mount-cache hash table entries: 512
  CPU: Testing write buffer coherency: ok
  NET: Registered protocol family 16
  Serial: AMBA PL011 UART driver
  dev:f1: ttyAMA0 at MMIO 0x101f1000 (irq = 12) is a AMBA/PL011
  console [ttyAMA0] enabled
  dev:f2: ttyAMA1 at MMIO 0x101f2000 (irq = 13) is a AMBA/PL011
  dev:f3: ttyAMA2 at MMIO 0x101f3000 (irq = 14) is a AMBA/PL011
  fpga:09: ttyAMA3 at MMIO 0x10009000 (irq = 38) is a AMBA/PL011
  bio: create slab <bio-0> at 0
  Switching to clocksource timer3
  NET: Registered protocol family 2
  IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
  TCP established hash table entries: 4096 (order: 3, 32768 bytes)
  TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
  TCP: Hash tables configured (established 4096 bind 4096)
  TCP reno registered
  NET: Registered protocol family 1
  RPC: Registered udp transport module.
  RPC: Registered tcp transport module.
  RPC: Registered tcp NFSv4.1 backchannel transport module.
  Installing knfsd (copyright (C) 1996 okir at monad.swb.de).
  JFFS2 version 2.2. (NAND) ?? 2001-2006 Red Hat, Inc.
  ROMFS MTD (C) 2007 Red Hat, Inc.
  msgmni has been set to 247
  Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
  io scheduler noop registered
  io scheduler anticipatory registered (default)
  io scheduler deadline registered
  io scheduler cfq registered
  CLCD: unknown LCD panel ID 0x00001000, using VGA
  CLCD: Versatile hardware, VGA display
  Console: switching to colour frame buffer device 80x60
  brd: module loaded
  smc91x.c: v1.1, sep 22 2004 by Nicolas Pitre <nico@fluxnic.net>
  eth0: SMC91C11xFD (rev 1) at c8800000 IRQ 25 [nowait]
  eth0: Ethernet addr: 52:54:00:12:34:56
  mice: PS/2 mouse device common for all mice
  TCP cubic registered
  NET: Registered protocol family 17
  VFP support v0.3: implementor 41 architecture 1 part 10 variant 9 rev 0
  input: AT Raw Set 2 keyboard as /devices/fpga:06/serio0/input/input0
  input: ImExPS/2 Generic Explorer Mouse as /devices/fpga:07/serio1/input/input1
  eth0: link up
  IP-Config: Complete:
       device=eth0, addr=192.168.32.150, mask=255.255.255.0, gw=192.168.32.2,
       host=192.168.32.150, domain=, nis-domain=(none),
       bootserver=192.168.32.133, rootserver=192.168.32.133, rootpath=
  Looking up port of RPC 100003/2 on 192.168.32.133
  Looking up port of RPC 100005/1 on 192.168.32.133
  VFS: Mounted root (nfs filesystem) on device 0:11.
  Freeing init memory: 108K
  mount: mounting none on /dev failed: Invalid argument
  mkdir: cannot create directory '/dev/pts': File exists
  mount: mounting tmpfs on /tmp failed: Invalid argument
  mount: mounting configfs on /config failed: No such device
  Initializing random number generator... done.
  Starting network...
  ifup: interface lo already configured
  Getting initial time via ntp.
  Starting network time protocol daemon: ntpd.
  Starting sshd: OK

  Welcome to Buildroot
  buildroot login: root

  # date
  Sun Mar  7 09:56:10 MST 2010

  # halt
  The system is going down NOW!
  Sending SIGTERM to all processes
  Sending SIGKILL to all processes
  Requesting system halt
  System halted.

Enter Ctrl-a-x to exit QEMU:

  QEMU: Terminated
  jthomas at pangaea:~/arm-vm$ 

Modify U-Boot to boot Linux without manual U-Boot command entry.

Customize the U-Boot source for the Versatile platform:

  /home/jthomas/work/u-boot-2009.11/include/configs/versatile.h 

  Modify:

    #define CONFIG_BOOTDELAY  5

  Add:

    #define CONFIG_BOOTCOMMAND "tftpboot; bootm"

Set PATH to toolchain built using crosstools-ng:

  $ export PATH=$PATH:/home/jthomas/x-tools/arm-unknown-linux-gnueabi/bin

Build U-Boot:

  /home/jthomas/work/u-boot-2009.11

  $ make versatile

The build completes in ~2 minutes, and creates:

  /home/jthomas/work/u-boot-2009.11

  -rwxr-xr-x 1 jthomas swdev 91604 2010-03-07 11:13 u-boot.bin

Run U-Boot and boot Linux in QEMU VM.  Verify keyboard intercept counts
down from '5', and U-Boot is intercepted when spacebar is pressed:

  /home/jthomas/arm-vm

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
  VersatilePB # 

  <Ctrl-a-x>

  QEMU: Terminated
  $

Run U-Boot and boot Linux in QEMU VM.  Verify Linux boots automatically,
without manual entry of U-Boot commands:

  /home/jthomas/arm-vm

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

  Uncompressing Linux................................... done, booting the kernel.
  Linux version 2.6.32.9 (jthomas at pangaea) (gcc version 4.3.4 (Buildroot 2010.02) )
    #2 Sun Mar 7 09:46:53 CST 2010
  CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00093177
  CPU: VIVT data cache, VIVT instruction cache
  Machine: ARM-Versatile PB
  Memory policy: ECC disabled, Data cache writeback
  Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
  Kernel command line: console=ttyAMA0 mem=128M root=/dev/nfs rw 
    nfsroot=192.168.32.133:/home/jthomas/arm-vm/rfs 
    ip=192.168.32.150:192.168.32.133:192.168.32.2:255.255.255.0
  PID hash table entries: 512 (order: -1, 2048 bytes)
  Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
  Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
  Memory: 128MB = 128MB total
  Memory: 126748KB available (2596K code, 227K data, 108K init, 0K highmem)
  Hierarchical RCU implementation.
  NR_IRQS:192
  VIC @f1140000: id 0x00041190, vendor 0x41
  Console: colour dummy device 80x30
  Calibrating delay loop... 234.29 BogoMIPS (lpj=1171456)
  Mount-cache hash table entries: 512
  CPU: Testing write buffer coherency: ok
  NET: Registered protocol family 16
  Serial: AMBA PL011 UART driver
  dev:f1: ttyAMA0 at MMIO 0x101f1000 (irq = 12) is a AMBA/PL011
  console [ttyAMA0] enabled
  dev:f2: ttyAMA1 at MMIO 0x101f2000 (irq = 13) is a AMBA/PL011
  dev:f3: ttyAMA2 at MMIO 0x101f3000 (irq = 14) is a AMBA/PL011
  fpga:09: ttyAMA3 at MMIO 0x10009000 (irq = 38) is a AMBA/PL011
  bio: create slab <bio-0> at 0
  Switching to clocksource timer3
  NET: Registered protocol family 2
  IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
  TCP established hash table entries: 4096 (order: 3, 32768 bytes)
  TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
  TCP: Hash tables configured (established 4096 bind 4096)
  TCP reno registered
  NET: Registered protocol family 1
  RPC: Registered udp transport module.
  RPC: Registered tcp transport module.
  RPC: Registered tcp NFSv4.1 backchannel transport module.
  Installing knfsd (copyright (C) 1996 okir at monad.swb.de).
  JFFS2 version 2.2. (NAND) ?? 2001-2006 Red Hat, Inc.
  ROMFS MTD (C) 2007 Red Hat, Inc.
  msgmni has been set to 247
  Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
  io scheduler noop registered
  io scheduler anticipatory registered (default)
  io scheduler deadline registered
  io scheduler cfq registered
  CLCD: unknown LCD panel ID 0x00001000, using VGA
  CLCD: Versatile hardware, VGA display
  Console: switching to colour frame buffer device 80x60
  brd: module loaded
  smc91x.c: v1.1, sep 22 2004 by Nicolas Pitre <nico@fluxnic.net>
  eth0: SMC91C11xFD (rev 1) at c8800000 IRQ 25 [nowait]
  eth0: Ethernet addr: 52:54:00:12:34:56
  mice: PS/2 mouse device common for all mice
  TCP cubic registered
  NET: Registered protocol family 17
  VFP support v0.3: implementor 41 architecture 1 part 10 variant 9 rev 0
  input: AT Raw Set 2 keyboard as /devices/fpga:06/serio0/input/input0
  input: ImExPS/2 Generic Explorer Mouse as /devices/fpga:07/serio1/input/input1
  eth0: link up
  IP-Config: Complete:
       device=eth0, addr=192.168.32.150, mask=255.255.255.0, gw=192.168.32.2,
       host=192.168.32.150, domain=, nis-domain=(none),
       bootserver=192.168.32.133, rootserver=192.168.32.133, rootpath=
  Looking up port of RPC 100003/2 on 192.168.32.133
  Looking up port of RPC 100005/1 on 192.168.32.133
  VFS: Mounted root (nfs filesystem) on device 0:11.
  Freeing init memory: 108K
  mount: mounting none on /dev failed: Invalid argument
  mkdir: cannot create directory '/dev/pts': File exists
  mount: mounting tmpfs on /tmp failed: Invalid argument
  mount: mounting configfs on /config failed: No such device
  Initializing random number generator... done.
  Starting network...
  ifup: interface lo already configured
  Getting initial time via ntp.
  Starting network time protocol daemon: ntpd.
  Starting sshd: OK

  Welcome to Buildroot
  buildroot login: root

  # date
  Sun Mar  7 10:20:42 MST 2010

  # halt
  The system is going down NOW!
  Sending SIGTERM to all processes
  Sending SIGKILL to all processes
  Requesting system halt
  System halted.

  <Ctrl-a-x>

  QEMU: Terminated

It works.  Can run U-Boot in the QEMU VM, and U-Boot loads the Linux kernel
using TFTP and executes it without manual intervention.

However -- The TFTP transfer of the Linux kernel is very time consuming, at
around 80 seconds.  Why so slow?

The QEMU VM is running in the same Ubuntu VM that operates the TFTP server.

Can see in 'top' on the Ubuntu VM that the QEMU process consumes 99% of the
CPU when U-Boot is running in the QEMU VM.  That is probably to be expected,
since U-Boot is a low-level boot loader that runs superloop.

The 99% superloop overhead induced by U-Boot/QEMU probably greatly reduces
the CPU cycles available for TFTP on the Ubuntu VM to respond quickly.

Tried running QEMU/U-Boot with various 'nice' values, without improvement.

Need to explore this further.  Will ask for guidance at the Buildroot mailing
list.






________________________________
From: Drasko DRASKOVIC <drasko.draskovic@gmail.com>
To: Jim Thomas <jimthomasembedded@yahoo.com>
Sent: Sun, March 7, 2010 1:21:15 PM
Subject: Re: [Buildroot] TFTP performance with U-Boot running under QEMU




On Sun, Mar 7, 2010 at 7:19 PM, Jim Thomas <jimthomasembedded@yahoo.com> wrote:
I currently hard-code a few U-Boot environment variables in
>./include/configs/versatile.h.  That is inflexible, but very
>convenient since it eliminates having to manually re-enter the
>IP addresses, kernel parameters, and boot commands manually
>each
> time the QEMU VM and U-Boot are restarted.

Cool idea, and very close to reality. I tried to do the same thing (I saw your very nice instructions, thanks!) 


>
>>It works:
>
>
>  $ ./run-uboot.sh 
>
>
>  U-Boot 2009.11 (Mar 07 2010 - 11:10:57)
>  DRAM:   0 kB
>  ## Unknown FLASH on Bank 1 - Size = 0x00000000 = 0 MB
>>  Flash:  0 kB
>  *** Warning - bad CRC, using default environment
>  In:    serial
>  Out:   serial
>  Err:   serial
>  Net:   SMC91111-0
>  Hit any key to stop autoboot:  0 
>  SMC91111: MAC 52:54:00:12:34:56
>  Using SMC91111-0 device
>  TFTP from server 192.168.32.140; our IP address is 192.168.32.150
>  Filename 'uImage'.
>  Load address:
> 0x7fc0
>  Loading: #################################################################
>           #################################################################
>           #################################################################
>           #################################################################
>           ############################
>  done
But the problem is, the TFTP transfer of
> the 1.4 MB Linux kernel
>takes a full 80 seconds (!) to complete


I have to complain even more:

VersatilePB # tftp uImage
SMC91111: PHY auto-negotiate timed out
SMC91111: MAC 52:54:00:12:34:56
Using SMC91111-0 device
TFTP from server 192.168.0.10; our IP address is 192.168.0.150
Filename 'uImage'.
Load address: 0x7fc0
Loading: #T T T #T T T T #T T T 
Retry count exceeded; starting again
SMC91111: PHY auto-negotiate timed out
SMC91111: MAC 52:54:00:12:34:56
Using SMC91111-0 device
TFTP from server 192.168.0.10; our IP address is 192.168.0.150
Filename 'uImage'.
Load address: 0x7fc0
Loading: #T T T #T T T T #T T T 
Retry count exceeded; starting again
 
 

>
>When U-Boot is idling at the U-Boot prompt in the QEMU VM, I can
>see by running 'top' in another terminal session in the Ubuntu VM
>that hosts the QEMU VM that the QEMU VM is consuming 99% of the CPU.

Same thing here... Even ping takes 20 seconds. Something is fishy in NetLoop.
 

>
>Have you observed this same slow TFTP file transfer under QEMU?
>Is there any known
> workaround?

I would like to know this also. 


      
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100307/aec3dc4e/attachment-0001.htm>
