From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 21 Feb 2013 12:14:35 +0200
Subject: [Buildroot] editing device_table_dev.txt
In-Reply-To: <1361403460.22521.44.camel@genx.eng.msli.com>
References: <1361403460.22521.44.camel@genx.eng.msli.com>
Message-ID: <5125F38B.2030204@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

21.2.2013 1:37, John Stile kirjoitti:
> I need a better way to auto-populate /dev, using buildroot-2011.11, with
> 2.6.30 kernel, but it seems not matter what I do, /dev/ is not populated
> automaticly. 
>
> My config looks like this:
>
> BR2_ROOTFS_DEVICE_CREATION_STATIC=y
> # BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS is not set
> # BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV is not set
> # BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV is not set
> BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt target/generic/device_table_dev.txt"
> BR2_ROOTFS_STATIC_DEVICE_TABLE="target/generic/device_table_dev.txt"
> # BR2_ROOTFS_SKELETON_DEFAULT is not set
> BR2_ROOTFS_SKELETON_CUSTOM=y
> BR2_ROOTFS_SKELETON_CUSTOM_PATH="fs/skeletonMiLON"
> BR2_ROOTFS_POST_BUILD_SCRIPT="$(TOPDIR)/board/atmel/at91sam9g20ek/post-build/post-build-scripts.bash"
>
> To use hwclock I had to create dev/rtc0.
> Although my kernel argument contains mtdparts, the  mtd* and mtdblock*
> devices are not created.
> There are others too.
>
> What should my config look like in order to auto-populate /dev?
>

Well, if you don't want to manually create your device nodes then there
are several ways to autopopulate /dev

Maybe the simplest would be just let the kernel handle it by mounting
/dev with tmpfs
So selecting BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y is the
correct option.

Also kernel .config file should also have CONFIG_DEVTMPFS and DEVTMPFS
as 'y'.
If you are using initramfs as your root system then kernel .config is
not enough but the /dev must be mounted manually
in /etc/fstab or somehwere in init-script (I think buildroot already
does this?)

mount -t devtmpfs devtmpfs /dev


Next easiest is mdev. It needs /etc/mdev.conf file and somewhere in your
init script your should have
echo /sbin/mdev > /proc/sys/kernel/hotplug

BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y should be selected in that case.

Most complete but also maybe most complex in configuration is udev
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV=y

Unlike previous two methods, devtmpfs and mdev, udev daemon (udevd) is
usually running continually and polling any events from
kernel when devices are plugged/unplugged.

Ofcourse if all you need is just the initial auto-creation of devices at
the boot time,
 then devtmpfs or mdev would be perfectly enough.

Regards
Stefan


> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
