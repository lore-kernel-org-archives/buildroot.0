Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11902C4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 18:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0556403C2;
	Sat, 26 Nov 2022 18:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0556403C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cnhdEU2ohykA; Sat, 26 Nov 2022 18:44:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0423A40133;
	Sat, 26 Nov 2022 18:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0423A40133
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6051C1BF372
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AF62408F6
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AF62408F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0U5UQ1Ijw82r for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 18:44:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5475A408E1
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 18:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5475A408E1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 438F884783; Sat, 26 Nov 2022 18:44:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 26 Nov 2022 19:40:35 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 0a9916879afb5c4e0028c9882989f3e89a0ad2c4
X-Git-Newrev: 324dd44105cb61a32454dfd4fbebefc23f7dea3d
X-Patchwork-Hint: ignore
Message-Id: <20221126184403.438F884783@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] boot/uboot/uboot.mk: fix
 zynqmp without pmufw
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

commit: https://git.buildroot.net/buildroot/commit/?id=324dd44105cb61a32454dfd4fbebefc23f7dea3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Commit d07e6b70 (boot/uboot/uboot.mk: add pmufw.elf support) broke
configurations where the UBOOT_ZYNQMP_PMUFW was blank. Previously it
would set the U-Boot CONFIG_PMUFW_INIT_FILE to the blank string, but now
it will set it to ".bin" which causes U-Boot to fail to build.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Reviewed-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 13dc57c94f9f394441b6faeb864aefd2b8ed08ab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 0439ec5e4b..9e073daa38 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -395,8 +395,9 @@ UBOOT_ZYNQMP_PMUFW_BASENAME = $(basename $(UBOOT_ZYNQMP_PMUFW_PATH))
 
 define UBOOT_ZYNQMP_KCONFIG_PMUFW
 	$(if $(filter %.elf,$(UBOOT_ZYNQMP_PMUFW_PATH)),
-		objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_BASENAME).elf $(UBOOT_ZYNQMP_PMUFW_BASENAME).bin)
-	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_BASENAME).bin")
+		objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_BASENAME).elf $(UBOOT_ZYNQMP_PMUFW_BASENAME).bin
+		$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_BASENAME).bin"),
+		$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH)"))
 endef
 
 UBOOT_ZYNQMP_PM_CFG = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PM_CFG))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
