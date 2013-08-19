From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 19 Aug 2013 10:17:35 +0200
Subject: [Buildroot] BeagleBone defconfig broken?
In-Reply-To: <CAAMhL_RF-0KNoCpRfAK1foEcfbJRCz2y5nF3d2UF=1kBD1N-vw@mail.gmail.com>
References: <520DE175.1050103@relinux.de>
 <CAAMhL_RF-0KNoCpRfAK1foEcfbJRCz2y5nF3d2UF=1kBD1N-vw@mail.gmail.com>
Message-ID: <5211D49F.7080105@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 18.08.2013 19:48, schrieb Ivan Sergeev:
> Hi Stephan,
Hello Ivan,

thank you for your reply.
>
> Does u-boot report that the device tree is loaded into memory just
> before booting?
Yes, that is obviously the case:
> 2857712 bytes read in 435 ms (6.3 MiB/s)
> 10537 bytes read in 55 ms (186.5 KiB/s)
> Booting from mmc ...
> ## Booting kernel from Legacy Image at 80200000 ...
>    Image Name:   Linux-3.8.11
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>    Data Size:    2857648 Bytes = 2.7 MiB
>    Load Address: 80008000
>    Entry Point:  80008000
>    Verifying Checksum ... OK
> ## Flattened Device Tree blob at 80f80000
>    Booting using the fdt blob at 0x80f80000
>    Loading Kernel Image ... OK
> OK
>    Using Device Tree in place at 80f80000, end 80f85928
>
> Starting kernel ...

> It should be named /boot/am335x-bone.dtb or /boot/am335x-boneblack.dtb
> on your rootfs partition, depending on if your BeagleBone hardware
> platform is White or Black, for u-boot to autoload it without further
> assistance in a uEnv.txt... The defaults are
> in buildroot/output/build/uboot-2013.04/include/configs/am335x_evm.h.
I tried the white one. Obviously the right files are loaded, at least
the sizes match:
> ls -l output/target/boot/
> insgesamt 2804
> -rw-rw-r-- 1 stephan users   10537 2013-08-19 09:47 am335x-bone.dtb
> -rw-r--r-- 1 stephan users 2857712 2013-08-19 09:47 uImage
I also verified the filenames in u-boot.

But the kernel still fails to mount root:
> [    1.509906] Waiting for root device /dev/mmcblk0p2...
is the last sign of life it gives.

BTW: I changed the config by adding BR2_LINUX_KERNEL_INSTALL_TARGET=y,
which is obviously missing in beaglebone_defconfig.

Any further idea?

Kind regards

Stephan
>
> Thanks,
> ~vsergeev
> Ivan Sergeev
>
>
> On Fri, Aug 16, 2013 at 1:23 AM, Stephan Hoffmann <sho@relinux.de
> <mailto:sho@relinux.de>> wrote:
>
>     Hello all,
>
>     I am currently trying to get the latest buildroot to run on my
>     beaglebone with little success. The last version that seem to run
>     out of
>     the box is 2012.08, where I can simply copy MLO, u-boot.img and uImage
>     to the boot partition, dd rootfs.ext2 to the second partition and the
>     system works.
>
>     The current build fails to boot, because u-boot expects the image and
>     dts in /boot within the root filesystem. After putting them there
>     with a
>     post build script, u-boot starts the kernel, but the kernel fails to
>     mount root:
>     > [    1.509962] Waiting for root device /dev/mmcblk0p2...
>     The SD partitions seem o.k.:
>     > Disk /dev/sdi: 3965 MB, 3965190144 bytes
>     > 255 heads, 63 sectors/track, 482 cylinders
>     > Units = cylinders of 16065 * 512 = 8225280 bytes
>     > Sector size (logical/physical): 512 bytes / 512 bytes
>     > I/O size (minimum/optimal): 512 bytes / 512 bytes
>     > Disk identifier: 0x00000000
>     >
>     >    Device Boot      Start         End      Blocks   Id  System
>     > /dev/sdi1   *           1           9       72292    c  W95
>     FAT32 (LBA)
>     > /dev/sdi2              10         133      996030   83  Linux
>     and /dev/mmcblk0p2 sounds like the right partition.
>
>     Can anybody give a hint where to look further?
>
>     Kind regards
>
>     Stephan
>
>     --
>     reLinux     -    Stephan Hoffmann
>     Am Schmidtgrund 124    50765 K?ln
>     Tel. +49.221.95595-19 <tel:%2B49.221.95595-19>    Fax: -64
>     www.reLinux.de <http://www.reLinux.de>     sho at reLinux.de
>
>     _______________________________________________
>     buildroot mailing list
>     buildroot at busybox.net <mailto:buildroot@busybox.net>
>     http://lists.busybox.net/mailman/listinfo/buildroot
>
>


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130819/fdf8d8bb/attachment-0001.html>
