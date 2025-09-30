Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E993DCAC5B8
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 19:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9986661055;
	Tue, 30 Sep 2025 19:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ciRGi0_SvPl; Tue, 30 Sep 2025 19:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C088561056
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C088561056;
	Tue, 30 Sep 2025 19:38:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 48BBD1000
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A80D40E7E
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RCa9ilE3Efcs for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 19:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4132D40E7F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4132D40E7F
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3053D865D9; Tue, 30 Sep 2025 19:38:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 21:20:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5acd66ed0b91f3766ad8e43bdbb1635b39c9ad7c
X-Git-Newrev: 97ecafec8989c99f83a35d4b5bd0fadb91a6a394
X-Patchwork-Hint: ignore
Message-Id: <20250930193850.3053D865D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/xilinx-prebuilt: simplify family logic
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=97ecafec8989c99f83a35d4b5bd0fadb91a6a394
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the xilinx-prebuilt package uses an if-then-else statement for
deciding which files need to be installed from the xilinx-prebuilt repo. This
works fine for now because there are really only two options, either versal or
zynqmp/kria.

Starting with the xilinx_v2025.2 release, the versal2 family along with the
vek385 board will be added to Buildroot and thus the xilinx-prebuilt package
as well. In the future, additional families will also probably be added to
this package.

To avoid creating a long if-then-else-then-else statement which will only grow
in complexity over time, simplify the logic of the xilinx-prebuilt package by
giving each xilinx family its own if statement. In the long term, this will
make the xilinx-prebuilt package easier to understand and maintain.

For this reason, this patch moves the zynqmp/kria families from the "else"
statement to having an if statement separate from the versal family.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 5d984c4f82..95b656cdde 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -103,15 +103,16 @@ define XILINX_PREBUILT_INSTALL_VERSAL_PSMFW
 		$(BINARIES_DIR)/psmfw.elf
 endef
 endif # !BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
+endif # BR2_TARGET_XILINX_PREBUILT_VERSAL
 
-else # BR2_TARGET_XILINX_PREBUILT_VERSAL
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_KRIA)$(BR2_TARGET_XILINX_PREBUILT_ZYNQMP),y)
 ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW),y)
 define XILINX_PREBUILT_INSTALL_ZYNQMP_PMUFW
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/pmufw.elf \
 		$(BINARIES_DIR)/pmufw.elf
 endef
 endif # !BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
-endif # BR2_TARGET_XILINX_PREBUILT_VERSAL
+endif # BR2_TARGET_XILINX_PREBUILT_KRIA | BR2_TARGET_XILINX_PREBUILT_ZYNQMP
 
 define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
 	$(XILINX_PREBUILT_INSTALL_VERSAL_PLM)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
