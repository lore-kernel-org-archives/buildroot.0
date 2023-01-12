Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617F6C54EBD
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 16:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0335240255;
	Thu, 12 Jan 2023 16:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0335240255
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BSKuTm5JJ_zZ; Thu, 12 Jan 2023 16:33:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD6F440290;
	Thu, 12 Jan 2023 16:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD6F440290
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 931341BF973
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 16:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7889A817E4
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 16:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7889A817E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03mITm2cUHu0 for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 16:32:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B38381886
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 16:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B38381886
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69BB7879B8; Thu, 12 Jan 2023 16:32:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Jan 2023 17:26:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a029f6e8855b7c6b0b558a4f715d25faf1dba32
X-Git-Newrev: 250d7df53acdccdb3c65c941ad426f6cc0502996
X-Patchwork-Hint: ignore
Message-Id: <20230112163256.69BB7879B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/zynqmp_kria_kv260_defconfig: use
 CONFIG_MULTI_DTB_FIT
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=250d7df53acdccdb3c65c941ad426f6cc0502996
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using the buildroot compiler, it builds the u-boot.itb immediately
after building the fit-dtb.blob.  This causes a build failure when using
the CONFIG_MULTI_DTB_FIT build configuration.  This patch adds the necessary
dependency to guarantee that the fit-dtb.blob has finished building before
trying to build the u-boot.itb.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/3310463281

This patch has been submitted to u-boot mainline:
https://lore.kernel.org/all/20221221075446.47141-1-neal.frager@amd.com/

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/zynqmp/kria/kv260/kv260.sh                   |  2 +-
 .../v1-0001-makefile-add-multi_dtb_fit-dep.patch   | 32 ++++++++++++++++++++++
 board/zynqmp/kria/uboot.fragment                   |  1 +
 configs/zynqmp_kria_kv260_defconfig                |  1 +
 4 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/board/zynqmp/kria/kv260/kv260.sh b/board/zynqmp/kria/kv260/kv260.sh
index e891852009..e3467f3068 100755
--- a/board/zynqmp/kria/kv260/kv260.sh
+++ b/board/zynqmp/kria/kv260/kv260.sh
@@ -8,5 +8,5 @@
 
 UBOOT_DIR=$4
 
-fdtoverlay -o ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb -i ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb ${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo
+fdtoverlay -o ${UBOOT_DIR}/fit-dtb.blob -i ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb ${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo
 ${UBOOT_DIR}/tools/mkimage -E -f ${UBOOT_DIR}/u-boot.its -B 0x8 ${BINARIES_DIR}/u-boot.itb
diff --git a/board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch b/board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch
new file mode 100644
index 0000000000..ddc04cacac
--- /dev/null
+++ b/board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch
@@ -0,0 +1,32 @@
+From 8b181bf582c17cf709a62cf499f9709c94f49d33 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Wed, 21 Dec 2022 07:51:42 +0000
+Subject: [PATCH v1 1/1] makefile: add multi_dtb_fit dep
+
+With certain gcc compilers, the u-boot.itb is built immediately after dtb
+generation.  If CONFIG_MULTI_DTB_FIT is used, it is possible that the
+fit-dtb.blob is not finished in time.
+
+This patch adds a necessary dependency to guarantee that the fit-dtb.blob
+is built before attempting to build the u-boot.itb.
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index b96e2ffa15..682a5d94fd 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1425,6 +1425,7 @@ MKIMAGEFLAGS_u-boot.itb += -B 0x8
+ ifdef U_BOOT_ITS
+ u-boot.itb: u-boot-nodtb.bin \
+ 		$(if $(CONFIG_OF_SEPARATE)$(CONFIG_OF_EMBED)$(CONFIG_SANDBOX),dts/dt.dtb) \
++		$(if $(CONFIG_MULTI_DTB_FIT),$(FINAL_DTB_CONTAINER)) \
+ 		$(U_BOOT_ITS) FORCE
+ 	$(call if_changed,mkfitimage)
+ 	$(BOARD_SIZE_CHECK)
+-- 
+2.17.1
+
diff --git a/board/zynqmp/kria/uboot.fragment b/board/zynqmp/kria/uboot.fragment
index 9e32edfb36..40709549dc 100644
--- a/board/zynqmp/kria/uboot.fragment
+++ b/board/zynqmp/kria/uboot.fragment
@@ -1,4 +1,5 @@
 CONFIG_SYS_SPI_U_BOOT_OFFS=0xF80000
+CONFIG_MULTI_DTB_FIT=y
 CONFIG_DTB_RESELECT=y
 CONFIG_DMA=y
 CONFIG_XILINX_DPDMA=y
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 5c53122b46..3214d45fa9 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -38,3 +38,4 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
