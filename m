From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Jul 2017 19:50:55 +0200
Subject: [Buildroot] [PATCH] configs: nexbox_a95x_defconfig: bump to
	kernel 4.12
In-Reply-To: <20170712153940.610cae5e@windsurf.lan> (Thomas Petazzoni's
 message of "Wed, 12 Jul 2017 15:39:40 +0200")
References: <20170712122322.12281-1-peter@korsgaard.com>
 <20170712153940.610cae5e@windsurf.lan>
Message-ID: <87eftlpmrk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Since you used this board, perhaps you could remove the bit in the
 > post-build.sh script that generates boot.scr, and use
 > BR2_TARGET_UBOOT_BOOT_SCRIPT instead ? Should be a separate patch of
 > course.

Heh, I also got tricked by this. You would think that could be done, but
as the defconfig doesn't build u-boot (no public sources) we cannot use
that option.

 > Sadly, this will not allow to remove completely post-build.sh, as it
 > needs a special AArch64 uImage for the kernel. But I wonder why this is
 > done in the post-build.sh script and not the post-image.sh script.

It doesn't really matter as the kernel gets built before the post-build
script runs (except for initramfs, but the genimage configuration
expects ext4).

If we are to introduce kconfig options for genimage (which will cause
genimage to be executed BEFORE the post-image script, then this uImage
handling must be in post-build so it is available for genimage.


 > And the post-image.sh script can be refactored to use the common
 > genimage script :)

Correct. I would prefer to first rework the genimage handling to make it
available in kconfig instead of such in-between solution.

-- 
Bye, Peter Korsgaard
