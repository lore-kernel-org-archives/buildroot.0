From: Jim Thomas <jimthomasembedded@yahoo.com>
Date: Sat, 27 Feb 2010 16:27:08 -0800 (PST)
Subject: [Buildroot] How to Set Up Buildroot/QEMU/ARM Cross-Development
	Environment
Message-ID: <520779.77977.qm@web44804.mail.sp1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Sat 27 Feb 2010

How to Set Up Buildroot/QEMU/ARM Cross-Development Environment

I am a Buildroot/QEMU novice.

There must be many ways to bring up a Buildroot/QEMU/ARM environment.

Here is one way that works.

Figuring this out was challenging in part because the target naming
is not consistent across the projects involved:

  Buildroot:     integrator926_defconfig
  U-Boot:        versatilepb
  Linux kernel:  versatile_defconfig
  QEMU:          versatilepb

This procedure describes how to:

  - Create a new Ubuntu 9.10 VM running in VMware under Windows Vista.
  - Build an ARM Linux kernel, RFS, and cross-toolchain in the Ubuntu VM.
  - Boot the ARM Linux kernel using QEMU running in the Ubuntu VM.
  - Mount the RFS via NFS using NFS server hosted by the Ubuntu VM.
  - Cross-build hello.cpp for ARM in Ubuntu VM and execute in the QEMU VM.
  - Configure DNS and NTP to set time automatically when QEMU VM boots.
  - Cross-debug between Ubuntu VM x86 host and QEMU VM ARM target.

The following software versions are used:

  - Windows Vista Home Premium with SP1
  - SecureCRT 6.1.3 (build 423)
  - VMware Player 2.5.3 build-185404
  - Ubuntu Server 9.10 (JeOS, without GUI)
  - QEMU 0.12.3 (23 Feb 2010)
  - Buildroot 2010.02 (26 Feb 2010)
  - Linux kernel 2.6.32.9 (23 Feb 2010)

This procedure begins by creating a new Ubuntu x86 VM to host the
Buildroot/QEMU environment, so residual files from previous experiments
will not be used unknowingly.  This makes the procedure more repeatable.

Install Ubuntu Server 9.10 JeOS as a VMware guest under Windows:

Create a VMX file at easyvmx.com using 2.0 menu option and selecting:

  - Name such as Ubuntu-Server-9.10-QEMU
  - 512 MB memory
  - NAT
  - Intel Pro/1000 (for Windows Vista)
  - 20 GB disk

Download the ZIP file from EasyVMX and expand it.

Launch VMware Player by running the file under Windows:

  Ubuntu-Server-9_10-QEMU.vmx

The boot attempt should fail.

Configure VMware under Devices/CD to install using an Ubuntu ISO image:

  671,686,656  ubuntu-9.10-server-i386.iso

Select VMware Player, Troubleshoot, Reset, and Ubuntu installer should appear.

Select language, then select F4 and:

  Install a minimal virtual machine

Proceed with routine Ubuntu installation.  Select option:

  OpenSSH server

After Ubuntu installs and boots, update it to use current versions:

  $ sudo apt-get update

  $ sudo apt-get -u upgrade

  $ sudo apt-get -u dist-upgrade

  $ touch ~/.hushlogin

  $ sudo reboot

Run '/sbin/ifconfig' to determine the eth0 IP address:

  192.168.32.133

Run '/sbin/route -n' to determine the default gateway IP address:

  192.168.32.2

Assume using SecureCRT as Windows Vista ssh client to access Ubuntu VM.

Set up SecureCRT ssh client for Ubuntu VM IP address:

  Terminal Emulation:  Linux

  Terminal Font:  Terminal

Create SecureCRT desktop icon to launch ssh connection to Ubuntu VM.

Create VMware desktop icon to launch the new Ubuntu VM.

Shut down VM, launch VM using desktop icon, connect using SecureCRT icon.

Create group for user (user was created during Ubuntu install):

  $ sudo groupmod -n swdev jthomas

Install vim:

  $ sudo apt-get install vim

Create file ~/.vimrc:

  set shiftwidth=2
  set tabstop=2
  set softtabstop=2
  set expandtab
  :filetype on
  :autocmd FileType c,cpp,cc,java,sh,python,php set cindent
  :autocmd FileType sh set smartindent
  set cinoptions=>2
  set visualbell t_vb=
  set hlsearch
  syntax off
  set background=dark
  syntax on

Create file crtenv.sh (for SecureCRT, not used below):

  export LANG=en_US
  export SUPPORTED=en_US:en

Install routine packages listed below (some required, some not used below):

  $ sudo apt-get -y install <package>

Packages:

  gcc
  g++
  gdb
  cgdb
  ctags
  htop
  lsof
  ltrace
  strace
  make
  man
  manpages
  manpages-dev
  manpages-posix
  pinfo
  psmisc
  sysstat
  tcpdump
  traceroute
  tree
  vsftpd
  wget
  nmap
  flex
  bison
  patch
  gettext
  libtool
  texinfo
  autoconf
  ncurses-dev
  zlib1g-dev

Create directory where Buildroot/QEMU will be built and cd into it:

  /home/jthomas/arm-vm

Get and expand buildroot tarball:

  $ wget http://buildroot.net/downloads/buildroot-2010.02.tar.gz

  -rw-r--r-- 1 jthomas swdev 4428752 2010-02-26 08:59 buildroot-2010.02.tar.gz

  $ tar xfz buildroot-2010.02.tar.gz

Enable SecureCRT session option Terminal Emulation Mapped Keys:

  'Backspace sends delete'

so backspace works properly in menuconfig screens below.

Make buildroot .config file for ARM Integrator:

  /home/jthomas/arm-vm/buildroot-2010.02

  $ make help

  $ make integrator926_defconfig

Press Enter several time to accept config defaults, then run:

  $ make menuconfig

Configure during 'make menuconfig' (add to integrator926 defaults):

  Target options
    Generic serial port config
      Serial port to run a getty on
        ttyAMA0
  Toolchain
    Build gdb debugger for the Target
    Build gdb server for the Target
    Build gdb for the Host
    Build/install c++ compiler and libstdc++
  Package Selection for the target
    lsof
    ltrace
    strace
  Target filesystem options
    tar the root filesystem
      Compression method
        gzip
    Das U-Boot Boot Monitor
      board name
        versatilepb
  Kernel
    kernel binary format
      zImage

Install packages selected in Buildroot:

  /home/jthomas/arm-vm/buildroot-2010.02

  $ make source

Start the build:

  $ make

NOTE: There must be a better way to do the following step.  Ideally,
this would be configured in the Buildroot menuconfig based on the
Buildroot target configuration 'integrator926_defconfig'.

When prompted to confirm Linux kernel config options (after ~55 minutes
building above), enter Ctrl-C to interrupt the kernel build and generate
a default .config file for the ARM Versatile target:

  /home/jthomas/arm-vm/buildroot-2010.02/output/build/linux-2.6.32.9

  $ make ARCH=arm help

  $ make ARCH=arm versatile_defconfig

Continue the build:

  /home/jthomas/arm-vm/buildroot-2010.02

  $ make

Press Enter as needed to accept any remaining Linux kernel config
default options.

The build should complete successfully in ~15 minutes:

  jthomas at pangaea:~/arm-vm/buildroot-2010.02/output/images$ ls -l

  -rw-r--r-- 1 jthomas swdev 12754944 2010-02-27 14:05 rootfs.arm.ext2
  -rw-r--r-- 1 jthomas swdev 10035200 2010-02-27 14:05 rootfs.arm.tar
  -rw-r--r-- 1 jthomas swdev  4551309 2010-02-27 14:05 rootfs.arm.tar.gz
  -rwxr-xr-x 1 jthomas swdev    92712 2010-02-27 14:04 u-boot-2009.11-20100227.bin
  lrwxrwxrwx 1 jthomas swdev       27 2010-02-27 14:04 u-boot.bin -> u-boot-2009.11-20100227.bin
  -rwxr-xr-x 1 jthomas swdev  1473076 2010-02-27 14:03 zImage

Expand RFS in new empty directory that will be exported via NFS:

  /home/jthomas/arm-vm/rfs

  $ sudo tar xfz ../buildroot-2010.02/output/images/rootfs.arm.tar.gz

  $ ls -l

  drwxr-xr-x 2 root root 4096 2010-02-27 13:58 bin
  drwxr-xr-x 2 root root 4096 2010-02-27 13:49 boot
  drwxr-xr-x 2 root root 4096 2010-02-27 12:49 config
  drwxr-xr-x 2 root root 4096 2010-02-27 14:05 dev
  drwxr-xr-x 5 root root 4096 2010-02-27 13:58 etc
  drwxrwxrwx 3 root root 4096 2010-02-27 14:05 home
  drwxr-xr-x 3 root root 4096 2010-02-27 13:58 lib
  lrwxrwxrwx 1 root root   11 2010-02-27 14:08 linuxrc -> bin/busybox
  drwxr-xr-x 2 root root 4096 2010-02-27 14:05 proc
  drwxr-x--- 2 root root 4096 2010-02-27 14:05 root
  drwxr-xr-x 2 root root 4096 2010-02-27 13:58 sbin
  drwxr-xr-x 2 root root 4096 2010-02-27 12:49 sys
  drwxrwxrwt 2 root root 4096 2010-02-27 12:49 tmp
  drwxr-xr-x 6 root root 4096 2010-02-27 13:58 usr
  drwxr-xr-x 4 root root 4096 2010-02-27 13:57 var

  $ sudo du -sh
  9.9M    .

Install NFS server on Ubuntu VM:

  $ nmap 192.168.32.133
  PORT   STATE SERVICE
  21/tcp open  ftp
  22/tcp open  ssh

  $ sudo apt-get install portmap

  $ sudo dpkg-reconfigure portmap

      Should portmap be bound to the loopback address?

      <No>

  $ sudo apt-get install nfs-kernel-server
  
  $ nmap 192.168.32.133                   
  PORT     STATE SERVICE
  21/tcp   open  ftp
  22/tcp   open  ssh
  111/tcp  open  rpcbind
  2049/tcp open  nfs

Add to /etc/exports:

  /home/jthomas/arm-vm/rfs *(rw,no_root_squash,no_subtree_check)

Restart portmap and NFS server:

  $ sudo service portmap restart

  $ sudo service nfs-kernel-server restart

  $ showmount -e
  Export list for pangaea:
  /home/jthomas/arm-vm/rfs *

Install User Mode Linux utilities (includes tunctl):

  $ sudo apt-get install uml-utilities

Install bridge utilities (Ethernet bridge):

  $ sudo apt-get install bridge-utils

Get QEMU:

  /home/jthomas/arm-vm

  $ wget http://download.savannah.gnu.org/releases/qemu/qemu-0.12.3.tar.gz

Get ARM sample RFS for future use (not used below):

  $ wget http://wiki.qemu.org/download/arm-test-0.2.tar.gz

Expand, build (~28 minutes), and install QEMU:

  /home/jthomas/arm-vm

  $ tar xfz qemu-0.12.3.tar.gz

  /home/jthomas/arm-vm/qemu-0.12.3

  $ ./configure

  $ make

The Buildroot/QEMU/RFS development directories now consume ~3.5 GB:

  /home/jthomas/arm-vm

  $ sudo du -sh
  3.5G    .

Create file /home/jthomas/arm-vm/qemu-ifup.sh:

  #!/bin/sh

  # IP_TUN  = IP address for TUN interface
  # IP_QEMU = IP address for QEMU guest interface

  IP_TUN=192.168.32.140
  IP_QEMU=192.168.32.150

  sudo /sbin/ifconfig $1 $IP_TUN
  sudo bash -c 'echo 1 >/proc/sys/net/ipv4/ip_forward'
  sudo route add -host $IP_QEMU dev tap0
  sudo bash -c 'echo 1 >/proc/sys/net/ipv4/conf/tap0/proxy_arp'
  sudo arp -Ds $IP_QEMU eth0 pub

Create file /home/jthomas/arm-vm/run-qemu.sh:

  #!/bin/sh

  TARGET=versatilepb

  CONSOLE=ttyAMA0

  # IP_QEMU = IP address for QEMU guest interface
  # IP_HOST = IP address for Ubuntu host interface

  IP_QEMU=192.168.32.150
  IP_HOST=192.168.32.133
  IP_GTWY=192.168.32.2
  IP_MASK=255.255.255.0
  IP_ARGS=$IP_QEMU:$IP_HOST:$IP_GTWY:$IP_MASK

  SCRIPT=qemu-ifup.sh

  RFS=~/arm-vm/rfs

  KERNEL=~/arm-vm/buildroot-2010.02/output/images/zImage

  QEMU=~/arm-vm/qemu-0.12.3/arm-softmmu/qemu-system-arm

  sudo $QEMU -M $TARGET -nographic \
    -net nic,vlan=0 -net tap,ifname=tap0,script=$SCRIPT \
    -append "console=$CONSOLE root=/dev/nfs rw nfsroot=$IP_HOST:$RFS ip=$IP_ARGS" \
    -kernel $KERNEL

Make the files executable:

  $ chmod 755 qemu-ifup.sh 
  $ chmod 755 run-qemu.sh

Boot Linux in the QEMU virtual machine using the Linux kernel
and RFS created by Buildroot:

  /home/jthomas/arm-vm

  $ ./run-qemu.sh 

  Uncompressing Linux.................................. done, booting the kernel.
  Linux version 2.6.32.9 (jthomas at pangaea) (gcc version 4.3.4 (Buildroot 2010.02) ) 
    #1 Sat Feb 27 14:03:15 CST 2010
  CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00093177
  CPU: VIVT data cache, VIVT instruction cache
  Machine: ARM-Versatile PB
  Memory policy: ECC disabled, Data cache writeback
  Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
  Kernel command line: console=ttyAMA0 root=/dev/nfs rw 
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
  Calibrating delay loop... 242.48 BogoMIPS (lpj=1212416)
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
  mount: mounting tmpfs on /tmp failed: Invalid argument
  mount: mounting configfs on /config failed: No such device
  Initializing random number generator... done.
  Starting network...
  ip: RTNETLINK answers: File exists
  Generating RSA Key...
  Generating public/private rsa1 key pair.
  Your identification has been saved in /etc/ssh_host_key.
  Your public key has been saved in /etc/ssh_host_key.pub.
  The key fingerprint is:
  77:2f:ee:18:31:84:2c:2a:e7:78:65:79:98:3f:e5:70 
  The key's randomart image is:
  +--[RSA1 2048]----+
  |                 |
  |       . .       |
  |      . o .      |
  |     . = .       |
  |  . o * S E .    |
  |   = o o * + .   |
  |  . o   o o . .  |
  |   .     . + .   |
  |          ..o    |
  +-----------------+
  Generating RSA Key...
  Generating public/private rsa key pair.
  Your identification has been saved in /etc/ssh_host_rsa_key.
  Your public key has been saved in /etc/ssh_host_rsa_key.pub.
  The key fingerprint is:
  11:aa:73:46:97:00:d2:b9:ce:65:26:a9:23:ee:8e:90 
  The key's randomart image is:
  +--[ RSA 2048]----+
  |  ...o. .        |
  |   .o  o o       |
  |     oo +        |
  |    +o+. .       |
  |   +o=o S        |
  |..o o+           |
  |E. .             |
  |o.               |
  |+o               |
  +-----------------+
  Generating DSA Key...
  THIS CAN TAKE A MINUTE OR TWO DEPENDING ON YOUR PROCESSOR!

  Generating public/private dsa key pair.
  Your identification has been saved in /etc/ssh_host_dsa_key.
  Your public key has been saved in /etc/ssh_host_dsa_key.pub.
  The key fingerprint is:
  7e:46:f5:ee:3a:2a:52:76:cf:75:26:8f:e1:28:77:05 
  The key's randomart image is:
  +--[ DSA 1024]----+
  |                 |
  |                 |
  |            .    |
  |           . .E  |
  |        S .   .. |
  |       .o..  .+ +|
  |       o..oo +.O |
  |      . .o. *.+ .|
  |       . ..+.+.  |
  +-----------------+
  Starting sshd: OK

  Welcome to Buildroot
  buildroot login: root

  # uname -a
  Linux buildroot 2.6.32.9 #1 Sat Feb 27 14:03:15 CST 2010 armv5tejl unknown

  # ls -l /
  drwxr-xr-x    2 root     root         4096 Feb 27  2010 bin
  drwxr-xr-x    2 root     root         4096 Feb 27  2010 boot
  drwxr-xr-x    2 root     root         4096 Feb 27  2010 config
  drwxr-xr-x    3 root     root         4096 Feb 27  2010 dev
  drwxr-xr-x    5 root     root         4096 Feb 27  2010 etc
  drwxrwxrwx    3 root     root         4096 Feb 27  2010 home
  drwxr-xr-x    3 root     root         4096 Feb 27  2010 lib
  lrwxrwxrwx    1 root     root           11 Feb 27  2010 linuxrc -> bin/busybox
  dr-xr-xr-x   38 root     root            0 Dec 31 17:00 proc
  drwxr-x---    2 root     root         4096 Feb 27  2010 root
  drwxr-xr-x    2 root     root         4096 Feb 27  2010 sbin
  drwxr-xr-x   12 root     root            0 Dec 31 17:00 sys
  drwxrwxrwt    2 root     root         4096 Feb 27  2010 tmp
  drwxr-xr-x    6 root     root         4096 Feb 27  2010 usr
  drwxr-xr-x    4 root     root         4096 Feb 27  2010 var

  # du -sh /
  9.9M

  # cat /proc/cpuinfo 
  Processor       : ARM926EJ-S rev 5 (v5l)
  BogoMIPS        : 242.48
  Features        : swp half thumb fastmult vfp edsp java 
  CPU implementer : 0x41
  CPU architecture: 5TEJ
  CPU variant     : 0x0
  CPU part        : 0x926
  CPU revision    : 5

  Hardware        : ARM-Versatile PB
  Revision        : 0000
  Serial          : 0000000000000000

  # ps
  PID   USER     COMMAND
      1 root     init       
      2 root     [kthreadd]
      3 root     [ksoftirqd/0]
      4 root     [watchdog/0]
      5 root     [events/0]
      6 root     [khelper]
      9 root     [async/mgr]
     87 root     [sync_supers]
     89 root     [bdi-default]
     91 root     [kblockd/0]
     95 root     [kseriod]
     97 root     [kmmcd]
    113 root     [rpciod/0]
    122 root     [khungtaskd]
    123 root     [kswapd0]
    124 root     [aio/0]
    125 root     [nfsiod]
    268 root     [mtdblockd]
    278 root     [kpsmoused]
    303 root     [flush-0:11]
    329 root     /usr/sbin/sshd 
    332 root     /sbin/getty 38400 tty1 
    333 root     /sbin/getty 38400 tty2 
    336 root     -sh 
    337 root     /sbin/syslogd -n 
    338 root     /sbin/klogd -n 
    339 root     /usr/bin/tail -f /var/log/messages 
    349 root     ps 

  # halt
  The system is going down NOW!
  Sending SIGTERM to all processes
  Sending SIGKILL to all processes
  Requesting system halt
  System halted.

Enter Ctrl-a-x to terminate the QEMU VM and return to the Ubuntu VM:

  QEMU: Terminated

The initial QEMU VM boot above took longer than usual because the
public/private keys were generated.

Boot Linux in the QEMU virtual machine again (boots in 7 seconds):

  $ ./run-qemu.sh 

  Uncompressing Linux.................................. done, booting the kernel.
  Linux version 2.6.32.9 (jthomas at pangaea) (gcc version 4.3.4 (Buildroot 2010.02) )
    #1 Sat Feb 27 14:03:15 CST 2010
  CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00093177
  CPU: VIVT data cache, VIVT instruction cache
  Machine: ARM-Versatile PB
  Memory policy: ECC disabled, Data cache writeback
  Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512
  Kernel command line: console=ttyAMA0 root=/dev/nfs rw 
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
  Calibrating delay loop... 228.55 BogoMIPS (lpj=1142784)
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
  Starting sshd: OK

  Welcome to Buildroot
  buildroot login: root
  # 

Set the system date/time (required for user setup and remote login success):

  # date
  Wed Dec 31 17:02:42 MST 1969

  # date 022715352010
  Sat Feb 27 15:35:00 MST 2010

Create root password (required for remote login as root):

  # passwd
  Changing password for root
  New password: ******
  Bad password: too weak
  Retype password: ******
  Password for root changed by root

Add user:

  # addgroup swdev

  # adduser -G swdev jthomas
  Changing password for jthomas
  New password: ******
  Bad password: too weak
  Retype password: ******
  Password for jthomas changed by root

  # ls -al /home/jthomas/
  drwxr-sr-x    2 jthomas  swdev        4096 Feb 27 14:39 .
  drwxrwxrwx    4 root     root         4096 Feb 27 14:39 ..

Verify can log in to QEMU VM as user and root from Ubuntu VM via ssh:

  $ ssh jthomas at 192.168.32.150
  jthomas at 192.168.32.150's password: ******
  $ id
  uid=1001(jthomas) gid=7(swdev) groups=7(swdev)
  $ exit
  Connection to 192.168.32.150 closed.

  $ ssh root at 192.168.32.150
  root at 192.168.32.150's password: ******
  # id
  uid=0(root) gid=0(root) groups=0(root),10(wheel)
  # exit
  Connection to 192.168.32.150 closed.

On the Ubuntu VM host, add the Buildroot cross-toolchain to the PATH:

  $ echo $PATH
  /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

  $ export PATH=$PATH:~/arm-vm/buildroot-2010.02/output/staging/usr/bin

  $ echo $PATH
  /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:
    /home/jthomas/arm-vm/buildroot-2010.02/output/staging/usr/bin

Verify the cross-toolchain built by Buildroot is accessible:

  $ arm-linux-g++ --version
  arm-linux-g++ (Buildroot 2010.02) 4.3.4

On the Ubuntu VM host, make the user directory within the RFS accessible:

  /home/jthomas/arm-vm/rfs/home

  $ ls -l
  drwxr-sr-x 2 jthomas  swdev 4096 2010-02-27 14:05 default
  drwxr-sr-x 2     1001 lp    4096 2010-02-27 15:41 jthomas

  $ sudo chmod 777 jthomas/

  $ ls -l
  drwxr-sr-x 2 jthomas  swdev 4096 2010-02-27 14:05 default
  drwxrwsrwx 2     1001 lp    4096 2010-02-27 15:41 jthomas

On the Ubuntu VM host, create a C++ hello world test program:

  /home/jthomas/arm-vm/rfs/home/jthomas

  $ cat hello.cpp 

  // hello.cpp

  #include <iostream>

  int main()
  {
    std::cout << "hello virtual world!\n";
  }

  $ arm-linux-g++ -o hello hello.cpp 

  $ ls -l
  -rwxr-xr-x 1 jthomas lp 6848 2010-02-27 16:04 hello
  -rw-r--r-- 1 jthomas lp   91 2010-02-27 16:04 hello.cpp

Verify the cross-built binary is executable from the QEMU VM ssh console:

  /home/jthomas

  $ ls -l
  -rwxr-xr-x    1 default  swdev        6848 Feb 27 15:04 hello
  -rw-r--r--    1 default  swdev          91 Feb 27 15:04 hello.cpp

  $ ldd hello
          libstdc++.so.6 => /usr/lib/libstdc++.so.6 (0x4000e000)
          libm.so.0 => /lib/libm.so.0 (0x40082000)
          libgcc_s.so.1 => /lib/libgcc_s.so.1 (0x4009c000)
          libc.so.0 => /lib/libc.so.0 (0x400af000)
          ld-uClibc.so.0 => /lib/ld-uClibc.so.0 (0x40000000)

  $ ./hello
  hello virtual world!

Enter 'halt' and use Ctrl-a-x to exit the QEMU VM:

  # halt
  The system is going down NOW!
  Sending SIGTERM to all processes
  Sending SIGKILL to all processes
  Requesting system halt
  System halted.
  QEMU: Terminated

Enable BR2_PACKAGE_NTP in Buildroot .config file under:

  /home/jthomas/arm-vm/buildroot-2010.02

Change .config from:

  # BR2_PACKAGE_NTP is not set

to:

  BR2_PACKAGE_NTP=y

Rebuild the RFS and expand it under ~/arm-vm/rfs.

The S49ntp startup file is now present in the RFS:

  /home/jthomas/arm-vm/rfs/etc/init.d

  $ ls -l
  -rwxr-xr-x 1 root root  408 2010-02-26 08:52 rcS
  -rwxr-xr-x 1 root root 1365 2010-02-26 08:52 S20urandom
  -rwxr-xr-x 1 root root  282 2010-02-26 08:52 S40network
  -rwxr-xr-x 1 root root 1078 2010-02-27 16:34 S49ntp
  -rwxr-xr-x 1 root root 1089 2010-02-27 13:57 S50sshd

Add /home/jthomas/arm-vm/rfs/etc/ntp.conf to the RFS:

  server 0.us.pool.ntp.org
  server 1.us.pool.ntp.org
  server 127.0.0.1

Change /home/jthomas/arm-vm/rfs/etc/default/ntpd 'NTPDATE=no'
to 'NTPDATE=yes':

  # NTP Servers to use for ntpdate
  NTPSERVERS="pool.ntp.org"

  # Get initial time via ntpdate?
  NTPDATE=yes
  NTPDATE_OPTS="-t 5"

  # Start the ntp daemon?
  NTPD=yes

With that change, 'ntpdate' will be run at startup to get
the initial date before 'ntpd' is run to maintain accuracy.

Add to /home/jthomas/arm-vm/rfs/etc/resolv.conf in RFS:

  domain localdomain
  search localdomain
  nameserver 192.168.32.2

The date/time is now correct after QEMU VM Linux boot:

  <snip>
  Getting initial time via ntp.
  Starting network time protocol daemon: ntpd.
  <snip>

  Welcome to Buildroot
  buildroot login: root

  # date
  Sat Feb 27 15:50:11 MST 2010

Enter 'halt' and use Ctrl-a-x to exit the QEMU VM.

Test execution of the U-Boot image built by Buildroot:

  /home/jthomas/arm-vm

  $ sudo qemu-0.12.3/arm-softmmu/qemu-system-arm 
      -M versatilepb -append "console=ttyAMA0" -nographic 
      -kernel buildroot-2010.02/output/images/u-boot.bin 

  U-Boot 2009.11 (Feb 27 2010 - 14:03:29)

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
  bootargs=root=/dev/nfs mem=128M ip=dhcp netdev=25,0,0xf1010000,0xf1010010,eth0
  bootdelay=2
  baudrate=38400
  bootfile="/tftpboot/uImage"
  stdin=serial
  stdout=serial
  stderr=serial
  verify=n
  ethact=SMC91111-0

  Environment size: 202/8188 bytes
  VersatilePB # 

Use Ctrl-a-x to exit the QEMU VM:

  QEMU: Terminated

Experimented with cross-debugging an ARM executable running on
the QEMU ARM VM, using cgdb/cross-gdb running on the Ubuntu VM.

Boot the QEMU VM using the new (second build with NTP) RFS above.

On the QEMU VM, recreate the user account as shown further above:

  # addgroup swdev

  # adduser -G swdev jthomas
  Changing password for jthomas
  New password: ******
  Bad password: too weak
  Retype password: ******
  Password for jthomas changed by root

  # chmod 777 /home/jthomas 

On the Ubuntu VM, cross-compile a C++ test program using the ARM
toolchain created by Buildroot:

  /home/jthomas/arm-vm/rfs/home/jthomas

  $ cat hello.cpp 

  // hello.cpp

  #include <iostream>

  int main()
  {
    for (int i = 0; i < 10; i++)
    {
      std::cout << "[" << i << "] hello world\n";
    }
  }

  $ ~/arm-vm/buildroot-2010.02/output/staging/usr/bin/arm-linux-g++ -g -o hello hello.cpp

  $ ls -l
  -rwxr-xr-x 1 jthomas swdev 33247 2010-02-27 17:25 hello
  -rw-r--r-- 1 jthomas swdev   137 2010-02-27 17:13 hello.cpp

On the QEMU ARM VM, execute the test program using ARM gdbserver in the RFS:

  /home/jthomas

  $ ls -l
  -rwxr-xr-x    1 default  default     33247 Feb 27 16:25 hello
  -rw-r--r--    1 default  default       137 Feb 27 16:13 hello.cpp

  $ gdbserver 0.0.0.0:9999 ./hello
  Process ./hello created; pid = 372
  Listening on port 9999

NOTE: 'cgdb' is an ncurses front-end to gdb with source window
and syntax highlighting.  It runs on the Ubuntu VM host, using
the cross-debugger built by Buildroot.  It interoperates with
gdbserver (also built by Buildroot) running on the QEMU VM.

On the Ubuntu VM, start the ARM toolchain gdb under control of cgdb:

  $ cgdb -d ~/arm-vm/buildroot-2010.02/output/staging/usr/bin/arm-linux-gdb ./hello

On the Ubuntu VM, enter in the gdb command window in cgdb:

  (gdb) target remote 192.168.32.150:9999

  Remote debugging using 192.168.32.150:9999
  [New Thread 372]
  warning: Unable to find dynamic linker breakpoint function.
  GDB will be unable to debug shared library initializers
  and track explicitly loaded dynamic code.
  0x400009a0 in ?? ()

  (gdb) break main
  Breakpoint 1 at 0x87c4: file hello.cpp, line 7.

  (gdb) cont
  Continuing.
  Breakpoint 1, main ()@hello.cpp:7

  (gdb) next
  (gdb) 
  (gdb) 
  (gdb) 
  (gdb) 
  (gdb) 
  (gdb) 

On the Ubuntu VM, the cgdb source window displays single-stepping:

   ~|
   1| // hello.cpp
   2|
   3| #include <iostream>
   4|
   5| int main()
   6| {
   7+>  for (int i = 0; i < 10; i++)
   8|   {
   9|     std::cout << "[" << i << "] hello world\n";
  10|   }
  11| }
   ~|

On the QEMU VM, the ARM executable responds to the remote gdb commands:

  Remote debugging from host 192.168.32.140
  [0] hello world
  [1] hello world
  [2] hello world

On the Ubuntu VM, entered the gdb command 'cont' (continue):

  (gdb) cont
  Continuing.

  Program exited normally.
  (gdb) 

On the QEMU VM, the ARM executable responded to the remote gdb command:

  [3] hello world
  [4] hello world
  [5] hello world
  [6] hello world
  [7] hello world
  [8] hello world
  [9] hello world

  Child exited with retcode = 0 

  Child exited with status 0
  GDBserver exiting
  $

I hope these notes are helpful.

Thanks to the Buildroot/QEMU/Linux/etc. open source projects.

Jim Thomas


      
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100227/d521b083/attachment-0001.htm>
