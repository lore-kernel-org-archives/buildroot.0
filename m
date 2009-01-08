From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Thu, 8 Jan 2009 15:10:39 +0100
Subject: [Buildroot] [PATCH] u-boot: add config option to disable
	general patches
In-Reply-To: <200811151156.02393.markus.heidelberg@web.de>
References: <200811140854.58814.markus.heidelberg@web.de>
	<87od0ijunz.fsf@macbook.be.48ers.dk>
	<200811151156.02393.markus.heidelberg@web.de>
Message-ID: <200901081510.39837.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patches in target/u-boot/$(U_BOOT_VERSION)/ can conflict with custom
board specific patches, so this option is necessary.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---

Markus Heidelberg, 15.11.2008:
> Peter Korsgaard, 14.11.2008:
> > >>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:
> > 
> >  Markus> The patches in target/u-boot/ can conflict with custom board specific
> >  Markus> patches, so this option is necessary.
> > 
> > But there aren't any patches under target/u-boot?

Now there are.

> I use Atmel's buildroot for AVR32, they added a patch there. Then do you think
> we should just delete the 3 patch-kernel.sh lines I've surrounded with the new
> option because it is never used?


 target/u-boot/Config.in   |    8 ++++++++
 target/u-boot/Makefile.in |    2 ++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/target/u-boot/Config.in b/target/u-boot/Config.in
index 9ab6224..f916852 100644
--- a/target/u-boot/Config.in
+++ b/target/u-boot/Config.in
@@ -54,6 +54,14 @@ config BR2_U_BOOT_SITE
 	default "$(BR2_ATMEL_MIRROR)"		if BR2_TARGET_UBOOT_1_2_0_ATMEL
 	default "ftp://ftp.denx.de/pub/u-boot"
 
+config BR2_TARGET_UBOOT_DISABLE_GENERAL_PATCHES
+	bool "disable general patches"
+	depends on BR2_TARGET_UBOOT
+	help
+	  Select this option to disable applying the patches from
+	  target/u-boot/$(U_BOOT_VERSION)/. This can be necessary if they
+	  conflict with your custom patch.
+
 config BR2_TARGET_UBOOT_CUSTOM_PATCH
 	string "custom patch"
 	depends on BR2_TARGET_UBOOT
diff --git a/target/u-boot/Makefile.in b/target/u-boot/Makefile.in
index b5bb8e1..6319cea 100644
--- a/target/u-boot/Makefile.in
+++ b/target/u-boot/Makefile.in
@@ -85,9 +85,11 @@ $(U_BOOT_DIR)/.unpacked: $(DL_DIR)/$(U_BOOT_SOURCE)
 	touch $@
 
 $(U_BOOT_DIR)/.patched: $(U_BOOT_DIR)/.unpacked
+ifneq ($(BR2_TARGET_UBOOT_DISABLE_GENERAL_PATCHES),y)
 	toolchain/patch-kernel.sh $(U_BOOT_DIR) target/u-boot/$(U_BOOT_VERSION) \
 		u-boot-$(U_BOOT_VERSION)-\*.patch \
 		u-boot-$(U_BOOT_VERSION)-\*.patch.$(ARCH)
+endif
 ifneq ($(strip $(BR2_TARGET_UBOOT_CUSTOM_PATCH)),"")
 	@mkdir -p $(U_BOOT_PATCH_DIR)
 	cp -dpr $(BR2_TARGET_UBOOT_CUSTOM_PATCH) $(U_BOOT_PATCH_DIR)
-- 
1.6.1.35.g0c23
