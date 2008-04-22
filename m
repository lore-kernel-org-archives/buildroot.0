From: Kuniyasu Suzaki <k.suzaki@aist.go.jp>
Date: Tue, 22 Apr 2008 18:15:54 +0900 (JST)
Subject: [Buildroot] Release: InetBoot (GRUB + BuildRoot + HTTP-FUSE)
Message-ID: <20080422.181554.15248718.k.suzaki@aist.go.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Dear,

InetBoot (GRUB + BuildRoot + HTTP-FUSE) is released.
 HP:  http://openlab.jp/oscircular/inetboot/
 Guide-PDF: http://openlab.ring.gr.jp/oscircular/inetboot/InetBoot-httpfuse080418-E.pdf
 Sample bootable CD 5.4MB (MD5: cb93a918ebec70d1763a116a133a50ce)
  http://www.ring.gr.jp/archives/linux/oscircular/iso/inetboot-http-fuse-20080418.iso

InetBoot (GRUB + BuildRoot + HTTP-FUSE) is a bootloader which gets
hypervisor, kernel and miniroot via Internet and reboots them with 
"kexec"(Warm Reboot). The root file system is obtained by HTTP-FUSE
CLOOP via Internet. The sample bootable CD (5.4MB) boots 3 types of
KNOPPIX and 3 types of Xenoppix.
 3 types of KNOPPIX; 511,501, and 402
 3 types of Xenoppix(Xen2.0.6); KNOPPIX on Dom0, Plan9 on DomU, and NetBSD on DomU.
# Xen environment uses old Linux kernel and limits the network
# interface (for examples NE2000 and RL8139). Fortunately they boots
# on QEMU, KQEMU, and VMWare (Xen2.0.6 on a virtual machine!).

# Your comments are welcome. This topic will be discussed at the BOF of
# Ottawa Linux Symposium08.
#     http://www.linuxsymposium.org/2008/view_abstract.php?content_key=231

### Special Feature ###
InetBoot downloads a kernel form a HTTP server and reboot it with
"kexec". Since InetBoot doesn't use BOOTP and TFTP which are used for
normal network boot (PXE), InetBoot is not limited on LAN
environment. It also doesn't use satefull NFS server for root file
system. InetBoot uses stateless HTTP for root file system and enables
dynamic load lancing.
    You only have to designate the URL of KNOPPIX at the GRUB menu and you
can boot the KNOPPIX/VMKoppix from Internet. It means you don't need
to burn a CD/DVD for new KNOPPIX/VMKnoppix.

    InetBoot is consisted of GRUB and BuildRoot (BusyBox). It is not
simple boot loader. It boots a mini Linux, sets up the network,
obtains hypervisor, kernel, and miniroot form a HTTP server, and reboots
them with "kexec". The new OS boots with loopback-mounting HTTP-FUSE
CLOOP. So InetBoot is PreBoot-Linux which adds some operations before
targeted OS.
    InetBoot can download a script and execute it. This function makes
flexible to control the PreBoot-Linux. Xenoppix uses this function.
    HTTP-FUSE CLOOP saves parts of block device (block files) on a local
storage. The saved block files prevent downloads of same block files
and reduces total traffic. They are used for re-boot and makes quick
boot.

### Usage ###
Download "linux" and "minirt.gz" of BuildRoot and set up GRUB.
Ony you have to designate the URL of HTTP-FUSE KNOPPIX/Xenoppix at GRUB menu.

Ex: Normal KNOPPIX
kernel /boot/grub/linux httpfuse=http://knoppix.inetboot.net/archives/linux/oscircular/tcgeeks/v1.0/ ramdisk_size=100000 lang=en vga=normal nodhcp lang=us
initrd /boot/grub/minirt.gz

Ex: Xenoppix.
kernel /boot/grub/linux iscript=http://knoppix.inetboot.net/archives/linux/knoppix/xenoppix_http/kexec.sh ramdisk_size=100000 lang=en vga=normal nodhcp lang=us
initrd /boot/grub/minirt.gz

# "iscript=" designate a script which is executed on the BuildRoot.

The sample bootable-CD includes some URLs of HTTP-FUSE
KNOPPIX/Xenoppix. They are load-balanced by SLB(Global Server Load
Balance) and InetBoot finds a suitable site automatically form 3 sites
in US, 3 sites in EU, and 7 sites in Japan. The available OS are 
 * knoppix511 (linux 2.6.19)
 * knoppix501 (linux 2.6.17)
 * knoppix402 (linux 2.6.12)
 * Xenoppix (Xen2.0.6+Linux 2.6.12)
 * Plan9 on Xenoppix (Xen2.0.6+Linux 2.6.12)
 * NetBSD on Xenoppix (Xen2.0.6+Linux 2.6.12)
CAUTION: The included URLs are temporal service. The service will be
stop after a certain period.

* Disk Image Caching
The disk image is distributed by block files. Some block files are
saved on local storage and reduce the network traffic.
    The "\knxblock" folder on a local storage (Ex. USB memory) is detected
by the driver of HTTP-FUSE CLOOP and block files are saved at the
folder. The local storage must be FAT or Ext2/Ext3 because the driver
can recognize it. The free space should be more than 100MB. If the
free space is 1GB, it will save whole image of an OS.

### Detail of Implementation ###
The following indicates the boot procedure of InetBoot.

* GRUB
The designated URL at GRUB Menu is passed to BuildRoot as a kernel option.

* BuildRoot (BusyBox)
The BuildRoot (BusyBox) opeates the following steps.
  1) Set up the network by "udhcp" 
  2) Download hypervisor, kernel miniroot from a HTTP server.
  3) Reboot them with "kexec" (Warm Boot)

*  Targeted kernel
The download kernel boots with the downloaded miniroot which includes
the driver of HTTP-FUSE CLOOP.
  1)  Set up the network by "udhcp" 
  2)  Mount "/cdrom" with the driver of HTTP-FUSE CLOOP.
  3)  Loopback mount "/KNOPPIX" with "/cdrom/Disk1/knoppix".
  4)  Pass the control to "init".
After that it works as the normal KNOPPIX.

#### Known Problems ####
 * Depend on Network Interface.
  + InetBoot sets up Network Interface twice (in BuildRoot and
    downladed new kernel). Both of them have to set up a suitable
    driver.
  + Xenoppix uses old kernel and boots with a few Network Inerface. We
    confirmed only RealTeck RL8139 and NE2000. Xenoppix can boots on
    QEMU, KQEMU, and VMWare.
 * Depend on the situation of server and network.
  + It is sensitive of network latency and load of the server because
    the root file system is mounted by "HTTP-FUSE CLOOP".
  + The situation may change by rebooting because the load balancer
    (GSLB) may select another site.

#### Download ####
 Sample bootable CD 5.4MB (MD5: cb93a918ebec70d1763a116a133a50ce)
  http://www.ring.gr.jp/archives/linux/oscircular/iso/inetboot-http-fuse-20080418.iso
 kernel and miniroot of BuildRoot(They are used on sample CD.)
  http://www.ring.gr.jp/archives/linux/oscircular/iso/inetboot-http-fuse-20080418/linux
  http://www.ring.gr.jp/archives/linux/oscircular/iso/inetboot-http-fuse-20080418/minirt.gz

------
suzaki
