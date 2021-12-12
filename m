Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DE5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A781E61CD9;
	Sun, 12 Dec 2021 14:54:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C-YG2phG59Qj; Sun, 12 Dec 2021 14:54:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0358360E7E;
	Sun, 12 Dec 2021 14:54:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 460AF1BF973
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B56B40131
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:53:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4LDN3ORBgfDx for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:53:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18FF84014E
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:53:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 299CE83465; Sun, 12 Dec 2021 14:48:23 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 15:48:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: baafe68bc3faa286d404636f25bb5cf4128d963f
X-Git-Newrev: 9a05e2c384c76a02686bc522c6ca31d434d58f45
X-Patchwork-Hint: ignore
Message-Id: <20211212144823.299CE83465@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: Add ddr3 IMX firmware files to
 uboot package dir
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a05e2c384c76a02686bc522c6ca31d434d58f45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mainline U-Boot can create an i.MX specific firmware image (e.g. flash.bin).
For this the i.MX firmware files must be in the toplevel directory.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/uboot/uboot.mk                                |  3 ++-
 package/freescale-imx/firmware-imx/Config.in       |  5 +++++
 package/freescale-imx/firmware-imx/firmware-imx.mk | 20 ++++++++++++++++++++
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 9661f901ea..c89216fac4 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -187,7 +187,8 @@ UBOOT_DEPENDENCIES += firmware-imx
 UBOOT_IMX_FW_FILES = \
 	$(if $(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW),signed_hdmi_imx8m.bin) \
 	$(if $(BR2_PACKAGE_FIRMWARE_IMX_LPDDR4),lpddr4*.bin) \
-	$(if $(BR2_PACKAGE_FIRMWARE_IMX_DDR4),ddr4*.bin)
+	$(if $(BR2_PACKAGE_FIRMWARE_IMX_DDR4),ddr4*.bin) \
+	$(if $(BR2_PACKAGE_FIRMWARE_IMX_DDR3),ddr3*.bin)
 
 define UBOOT_COPY_IMX_FW_FILES
 	$(foreach fw,$(UBOOT_IMX_FW_FILES),\
diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 0bd8000b50..df266fb28e 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -71,6 +71,11 @@ config BR2_PACKAGE_FIRMWARE_IMX_DDR4
 	help
 	  Use DDR4 binaries (i.e.: ddr4_*_201810.bin).
 
+config BR2_PACKAGE_FIRMWARE_IMX_DDR3
+	bool "DDR3"
+	help
+	  Use DDR3 binaries (i.e.: ddr3_*_201810.bin).
+
 endchoice # DDR training FW
 
 config BR2_PACKAGE_FIRMWARE_IMX_IMEM_LEN
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 60c97fd2b8..3acd053d0f 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -82,6 +82,26 @@ define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_DDR3),y)
+FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
+
+define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
+	# Create padded versions of ddr3_* and generate ddr3_fw.bin.
+	# ddr3_fw.bin is needed when generating imx8-boot-sd.bin
+	# which is done in post-image script.
+	$(call FIRMWARE_IMX_PREPARE_DDR_FW, \
+		ddr3_imem_1d_201810,ddr3_dmem_1d_201810,ddr3_1d_201810_fw)
+	cat $(FIRMWARE_IMX_DDRFW_DIR)/ddr3_1d_201810_fw.bin > \
+		$(BINARIES_DIR)/ddr3_201810_fw.bin
+	ln -sf $(BINARIES_DIR)/ddr3_201810_fw.bin $(BINARIES_DIR)/ddr_fw.bin
+
+	# U-Boot supports creation of the combined flash.bin image. To make
+	# sure that U-Boot can access all available files copy them to
+	# the binary dir.
+	cp $(FIRMWARE_IMX_DDRFW_DIR)/ddr3*.bin $(BINARIES_DIR)/
+endef
+endif
+
 #
 # HDMI firmware
 #
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
