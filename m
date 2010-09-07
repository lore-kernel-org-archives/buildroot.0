From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Sep 2010 21:03:11 +0200
Subject: [Buildroot] Why is extfs filesystem mandatory?
In-Reply-To: <4C867997.1050309@jdines.net>
References: <4C863CDD.8020805@jdines.net> <20100907165546.06ed2a29@surf>
	<4C8669B3.4030209@jdines.net>
	<1283878421.11196.7.camel@dubciaranr1.verifone.com>
	<4C867997.1050309@jdines.net>
Message-ID: <20100907210311.0bad86cd@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 07 Sep 2010 13:42:47 -0400
"James J. Dines" <jdines@jdines.net> wrote:

> Yes, that was the issue.  I have to admit I feel a bit foolish having
> not looked more closely at the dependencies by choosong the help
> option, but on the other hand I cannot imagine why this dependency
> exists. Obviously one can have an iso image without having an ext2
> filesystem, or there would be no such thing as an iso image for
> Windows.

Well, the ISO image is in fact a little bit more than just an ISO image
of the filesystem: it's a bootable ISO image, and the build process for
this image considers that the root filesystem is an ext2 initrd for the
ISO image.

From fs/iso9660/iso9660.mk :

        cp $(GRUB_DIR)/stage2/stage2_eltorito
        $(ISO9660_TARGET_DIR)/boot/grub/ cp $(ISO9660_BOOT_MENU)
        $(ISO9660_TARGET_DIR)/boot/grub/menu.lst cp
        $(LINUX26_IMAGE_PATH) $(ISO9660_TARGET_DIR)/kernel cp
        $(BINARIES_DIR)/rootfs.ext2 $(ISO9660_TARGET_DIR)/initrd

I must admit that I'm not an user of this feature, so when I did the
cleanup/rewrite of filesystem support, I left it as it was. Maybe it
needs to work differently.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
