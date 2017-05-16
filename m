From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 May 2017 22:56:02 +0200
Subject: [Buildroot] [PATCH 1/1] lego: ev3: use mainline kernel
In-Reply-To: <1494890483-11249-1-git-send-email-david@lechnology.com> (David
 Lechner's message of "Mon, 15 May 2017 18:21:23 -0500")
References: <1494890483-11249-1-git-send-email-david@lechnology.com>
Message-ID: <878tlw8qsd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "David" == David Lechner <david@lechnology.com> writes:

 > It is finally possible to boot LEGO MINDSTORMS EV3 from the mainline
 > Linux kernel. This patch updates the defconfg to use the mainline kernel
 > instead of the custom ev3dev kernel.

Great, thanks!

 >  .../patches/linux/0001-adc-device-tree-node.patch  | 56 ++++++++++++++
 >  .../linux/0002-sound-device-tree-node.patch        | 85 ++++++++++++++++++++++

I see these patches are already in mainline post-4.11, so that's great.

> +++ b/board/lego/ev3/genimage.cfg
 > @@ -19,7 +19,7 @@ image flash.bin {
 >  		size = 320K
 >  	}
 >  	partition uimage {
 > -		image = "uImage"
 > +		image = "uImage.da850-lego-ev3"
 >  		size = 3M
 >  		offset = 0x50000
 >  	}

I guess this change isn't strictly needed because of the symlink, but
OK.

> diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
 > index 543a227..0996b8c 100644
 > --- a/configs/lego_ev3_defconfig
 > +++ b/configs/lego_ev3_defconfig
 > @@ -2,22 +2,26 @@
 >  BR2_arm=y
 >  BR2_arm926t=y
 
 > +# Build options
 > +BR2_GLOBAL_PATCH_DIR="board/lego/ev3/patches"
 > +
 >  # system
 >  BR2_TARGET_GENERIC_GETTY=y
 >  BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
 >  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/lego/ev3/post-image.sh"
 > -# Linux headers same as kernel, a 4.4 series
 > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y

This shouldn't be dropped (after changing to 4.11) as the defconfig
would otherwise break whenever 4.12 gets added.

Committed to next with that fixed, thanks.

I see you are still using a relatively old u-boot and ext3. Any reason
to not use 2017.05 and ext4?

-- 
Bye, Peter Korsgaard
