Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D1AC52D7D
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 09:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC99760A76;
	Thu, 15 Aug 2024 09:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LkvOQLoqs79U; Thu, 15 Aug 2024 09:12:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A4ED6066F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A4ED6066F;
	Thu, 15 Aug 2024 09:12:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED2C31BF5E0
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 09:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E364E81E8E
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 09:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id noZThRehbSkW for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 09:12:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8CA380E4C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8CA380E4C
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 09:12:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3B9885E53; Thu, 15 Aug 2024 09:12:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 11:11:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd88b0104fd0e0e39edf80518f3454d94f671405
X-Git-Newrev: 273160552d6540aea5d3bb1065ca296614f43c44
X-Patchwork-Hint: ignore
Message-Id: <20240815091225.A3B9885E53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: fix dependency on
 xilinx-prebuilt
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=273160552d6540aea5d3bb1065ca296614f43c44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building with `make -j` and PER_PACKAGE_DIRECTORIES, a race
condition occurs between xilinx-prebuilt and u-boot, resulting in the
following error.

  objcopy -O binary -I elf32-little .../images/pmufw.elf .../images/pmufw.bin
  objcopy: '.../images/pmufw.elf': No such file

U-Boot registers a KCONFIG_FIXUP_CMD that uses the pmufw.elf from
xilinx-prebuilt. But KCONFIG_FIXUP_CMDS does not use the normal
DEPENDENCIES, so xilinx-prebuilt is not guaranteed to have run before
fixup.

Instead move the `objcopy` call out to a PRE_BUILD_HOOK so it will run
after xilinx-prebuilt has finished.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Tested-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/uboot.mk | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 45ad1c880f..cdb9f435f7 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -460,13 +460,17 @@ endif #ifneq ($(findstring ://,$(UBOOT_ZYNQMP_PMUFW)),)
 
 endif #BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
 
-UBOOT_ZYNQMP_PMUFW_BASENAME = $(basename $(UBOOT_ZYNQMP_PMUFW_PATH))
-
+ifeq ($(suffix $(UBOOT_ZYNQMP_PMUFW_PATH)),.elf)
+UBOOT_ZYNQMP_PMUFW_PATH_FINAL = $(basename $(UBOOT_ZYNQMP_PMUFW_PATH)).bin
+define UBOOT_ZYNQMP_PMUFW_CONVERT
+	objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_PATH) $(UBOOT_ZYNQMP_PMUFW_PATH_FINAL)
+endef
+UBOOT_PRE_BUILD_HOOKS += UBOOT_ZYNQMP_PMUFW_CONVERT
+else
+UBOOT_ZYNQMP_PMUFW_PATH_FINAL = $(UBOOT_ZYNQMP_PMUFW_PATH)
+endif
 define UBOOT_ZYNQMP_KCONFIG_PMUFW
-	$(if $(filter %.elf,$(UBOOT_ZYNQMP_PMUFW_PATH)),
-		objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_BASENAME).elf $(UBOOT_ZYNQMP_PMUFW_BASENAME).bin
-		$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_BASENAME).bin"),
-		$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH)"))
+	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH_FINAL)")
 endef
 
 UBOOT_ZYNQMP_PM_CFG = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PM_CFG))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
