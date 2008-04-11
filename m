From: Kuniyasu Suzaki <k.suzaki@aist.go.jp>
Date: Fri, 11 Apr 2008 09:16:25 +0900 (JST)
Subject: [Buildroot] Release: InetBoot(GRUB+BuildRoot+httpfs)
Message-ID: <20080411.091625.74740808.k.suzaki@aist.go.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Dear,

InetBoot(GRUB+BuildRoot+httpfs) "netfs" version is released.
  HP:        http://openlab.jp/oscircular/inetboot/
  Guide-PDF: http://openlab.ring.gr.jp/oscircular/inetboot/InetBoot-netfs080409-E.pdf

InetBoot(GRUB+BuildRoot+httpfs) loads a kernel from a ISO(KNOPPIX/Xenoppix) file on HTTP 
server and boots the OS(KNOPPIX/Xenoppix).

Your comments are welcome. This topic will be discussed at the BOF of
Ottawa Linux Symposium08.
     http://www.linuxsymposium.org/2008/view_abstract.php?content_key=231

------------------------------------------------------------------------
InetBoot is a bootloader which gets kernel and disk image via Internet
and boots form it. "netfs" version boots from a ISO file of KNOPPIX/VMKnoppix 
which is uploaded on a HTTP server. The sample bootable CD (5MB) can 
boot 3 types of KNOPPIX and 5 types of VMKnoppix.
  * 3 types of KNOPPIX(511,501, 402) and 
  * 5 types of VMKnoppix (Xen: 3.2.0, 3.1.1, 3.1.0, 3.0.4.1, 3.0.4)
InetBoot will boot an ISO file which is based on KNOPPIX 4.0.2 or
later. (CAUTION: It doesn't not support special customization. Refer
known problems.)

### Special Feature ###
InetBoot loads a kernel form a HTTP server. Since it doesn't use
BOOTP and TFTP which are used for normal network boot (PXE), InetBoot
is not limited on LAN environment. It also doesn't use a satefull NFS
server for a root file system. InetBoot uses stateless HTTP for a root
file system and enables the dynamic load lancing.

All you have to designate the URL of KNOPPIX at the boot menu and you
can boot the KNOPPIX from Internet. It means you don't need to burn a
CD/DVD for new KNOPPIX.

InetBoot is consisted of GRUB and BuildRoot (BusyBox). It is not
simple boot loader. It boots a mini Linux, sets up the network,
obtains a new kernel form a HTTP server, re-masters the miniroot,
reboots with "kexec". The new OS boots with loopback-mounting the
ISO file at HTTP server with httpfs.

### Usage ###
Download "linux" and "minirt.gz" of BuildRoot and set up GRUB.
Only you have to designate the URL of ISO file of KNOPPIX at GRUB menu.

Ex: Normal KNOPPIX
  kernel /boot/grub/linux netdir=http://***/knoppix.iso ramdisk_size=100000 lang=ja vga=normal
  initrd /boot/grub/minirt.gz

Ex: VMKnoppix. Add "bootxen=1" option.
  kernel /boot/grub/linux netdir=http://***/Xenoppix.iso bootxen=1 ramdisk_size=100000 lang=ja vga=normal
  initrd /boot/grub/minirt.gz

The sample bootable-CD includes some URLs of ISO file. They are load
balanced by SLB(Global Server Load Balance) and InetBoot finds a
suitable site automatically form 3 sites in US, 3 sites in EU, and 7
sites in Japan.
    * knoppix511 (linux 2.6.19)
    * knoppix501 (linux 2.6.17)
    * knoppix402 (linux 2.6.12)
    * VMKnoppix (Xen3.2.0+Linux 2.6.18)
    * VMKnoppix (Xen3.1.1+Linux 2.6.18)
    * VMKnoppix (Xen3.1.0+Linux 2.6.18)
    * VMKnoppix (Xen3.0.4.1+Linux 2.6.18) Oprofile
    * VMKnoppix (Xen3.0.4) +Linux 2.6.18

### Detail of Implementation ###
The designated URL at GRUB Menu is passed to BuildRoot as a kernel option.
On the BuildRoot (BusyBox) do the following steps.
   1) Set up the network by "udhcp" 
   2) Mount the ISO file by "httpfs"
   3) Extract the kernel
   4) Re-master the miniroot. (The new kernel will mount ISO file with "httpfs".)
   5) Reboot by "kexec" (Warm Boot)
The download kernel boots with the re-mastered miniroot.
   1)  Mount the ISO file at /cdrom with "httpfs"
   2)  Pass the control to "init" and boots as the normal KNOPPIX
After that it works as the normal KNOPPIX.

### Known Problems ###
* Depend on Network Interface.
    InetBoot sets up Network Interface TWICE (in BuildRoot and
    downladed new kernel). Both of them have to set up a suitable
    driver.
* Depend on the situation of server and network.
  + It is sensitive of network latency and load of the server because
    the root file system is mounted by "httpfs".
  + The situation may change by rebooting because the load balancer
    (GSLB) may select another site.
* InetBoot can not applied a deeply re-mastered KNOPPIX.
  + InetBoot has to know the boot procedure to re-master miniroot.
* Some HTTP servers have 2GB limitation. 
  + "httpfs" can not mount DVD ISO file from the servers.

### Related URL ###
[1] BuildRoot: http://buildroot.uclibc.org/
[2] httpfs: http://httpfs.sourceforge.net/
[3] kboot: http://kboot.sourceforge.net/
[4] Linux Symposium 08 BOF: OS Circular,
     http://www.linuxsymposium.org/2008/view_abstract.php?content_key=231

### Download ###
Sample Bootable CD (ISO file) 
  The included UPLs are temporal service. Please designate your favorite URL.
  http://www.ring.gr.jp/archives/linux/oscircular/iso/inetboot-netfs-20080409-us.iso
  MD5: 1c32b27fbe93903ee2decaec220cfbc6
kernel and miniroot of BuildRoot
  http://www.ring.gr.jp/archives/linux/oscircular/iso/inetboot-netfs-20080409/linux
  http://www.ring.gr.jp/archives/linux/oscircular/iso/inetboot-netfs-20080409/minirt.gz

### Acknowledgement ###
The research and development is a part of "OS Circular" project.

------
suzaki
