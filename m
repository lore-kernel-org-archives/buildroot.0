From: don <don_reid@comcast.net>
Date: Wed, 1 Nov 2006 15:20:25 -0800
Subject: [Buildroot] How to use a buildroot disk image.
In-Reply-To: <1d09f8b80611011236m74428fd7x3aeb6c31e3605118@mail.gmail.com>
References: <1d09f8b80611011236m74428fd7x3aeb6c31e3605118@mail.gmail.com>
Message-ID: <20061101232025.GA7915@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 01, 2006 at 03:36:12PM -0500, Will Buik wrote:
> I'm really sorry if I missed this in the documentation, but how do I
> install the file system image to an actual disk drive.  I have tried
> using dd to write it to the disk as super block and also just to the
> first partition, but this has not worked.  Thanks in advance.

I use two methods.  

With a network connected device, I boot with pxelinux and have this in
the config file:

	 default bot1/kernel initrd=bot1/rootfs.i486.cramfs root=/dev/ram0 ramdisk_size=8192


To get an ext2 fs onto a CF card (in /dev/sdb) I use:

        mount /dev/sdb1 /media/disk
        mkdir -p rootfs
        mount rootfs.i486.ext2 rootfs -t ext2 -o loop=/dev/loop0
        rsync -a --delete rootfs/ /media/disk
        umount rootfs
        umount /dev/sdb1

You need to make a file system and get boot loader onto the card once.
You need to copy the kernel into the root tree before it gets built into
a file system (or later...).

Don Reid
