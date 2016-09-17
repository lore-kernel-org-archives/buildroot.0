From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 19:35:24 +0200
Subject: [Buildroot] [PATCH 1/2] boot/uboot: add missing SPL build
 dependency
In-Reply-To: <706220f2-ed95-8a00-8a40-2c818636ac63@jikos.cz>
References: <1472741494-7043-1-git-send-email-brain@jikos.cz>
 <1472741494-7043-2-git-send-email-brain@jikos.cz>
 <9e8b258d-39e7-1cd4-7530-e295ee7e09b6@mind.be>
 <706220f2-ed95-8a00-8a40-2c818636ac63@jikos.cz>
Message-ID: <20160917193524.3dd6f8a1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 3 Sep 2016 17:11:21 +0200, Petr Kulhavy wrote:

> > On 01-09-16 16:51, Petr Kulhavy wrote:  
> >> If SPL installation is selected make does not always build the SPL binary.  
> >   Please give a concrete example of this so people can verify.  
> 
> It doesn't work with the iMX "SPL" target.

I believe that if we invoke "make all", it will solve your problem as
well. What the SPL target does is:

SPL: spl/u-boot-spl.bin FORCE

And what make all does is:

all:            $(ALL-y)
ALL-$(CONFIG_SPL) += spl/u-boot-spl.bin

So as soon as CONFIG_SPL=y in the U-Boot configuration, the SPL will be
built if we do "make all". So I suggest that we do:

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 7379a4d..d0dbf6a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -68,7 +68,7 @@ endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_DTB_IMG),y)
 UBOOT_BINS += u-boot-dtb.img
-UBOOT_MAKE_TARGET += all u-boot-dtb.img
+UBOOT_MAKE_TARGET += u-boot-dtb.img
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMG),y)
@@ -179,7 +179,7 @@ endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
 define UBOOT_BUILD_CMDS
        $(TARGET_CONFIGURE_OPTS)        \
                $(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)             \
-               $(UBOOT_MAKE_TARGET)
+               all $(UBOOT_MAKE_TARGET)
        $(if $(BR2_TARGET_UBOOT_FORMAT_SD),
                $(@D)/tools/mxsboot sd $(@D)/u-boot.sb $(@D)/u-boot.sd)
        $(if $(BR2_TARGET_UBOOT_FORMAT_NAND),

Petr, does this fix the problem for you? Arnout, what do you think?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
