From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Sep 2016 07:55:24 +0200
Subject: [Buildroot] uboot: building MLO fails
In-Reply-To: <e564e1a1-d285-c57b-46a1-00d6375d01f9@gmail.com>
References: <e564e1a1-d285-c57b-46a1-00d6375d01f9@gmail.com>
Message-ID: <20160923075524.10122519@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Sep 2016 00:55:51 +0200, Lothar Felten wrote:

> with the current uboot.mk the MLO isn't generated anymore.
> 
> I modified my defconfig (beaglebone_defconfig) to:
> BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="spl/u-boot-spl.bin"

This looks wrong. The image format is u-boot.img.

> BR2_TARGET_UBOOT_SPL=y
> BR2_TARGET_UBOOT_SPL_NAME="MLO"
> 
> In uboot.mk $(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME) is added to 
> UBOOT_BINS but not to UBOOT_MAKE_TARGET, why?

However, indeed, MLO is no longer built. This is a fallout from
https://git.buildroot.org/buildroot/commit/boot/uboot?id=fad58cefa4a392b52eafe46a773f8cbfb8aadb43.

I really think we should do, in order to build both the default images
for the selected platforms *and* the additional make targets if any.

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 7379a4d..81c5169 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -179,7 +179,7 @@ endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
 define UBOOT_BUILD_CMDS
        $(TARGET_CONFIGURE_OPTS)        \
                $(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)             \
-               $(UBOOT_MAKE_TARGET)
+               all $(UBOOT_MAKE_TARGET)
        $(if $(BR2_TARGET_UBOOT_FORMAT_SD),
                $(@D)/tools/mxsboot sd $(@D)/u-boot.sb $(@D)/u-boot.sd)
        $(if $(BR2_TARGET_UBOOT_FORMAT_NAND),

I tested with this patch, and it generates and installs MLO and
u-boot.img properly.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
