Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F70CC27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 14:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA9E6810D8;
	Sun, 30 Jun 2024 14:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQwQtJ-rzleY; Sun, 30 Jun 2024 14:40:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2FA881D4F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2FA881D4F;
	Sun, 30 Jun 2024 14:40:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D0E1A1BF976
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC08781099
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fpAGCZm6t8By for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 14:40:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A67438108E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A67438108E
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 14:40:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F5138360A; Sun, 30 Jun 2024 14:40:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jun 2024 16:36:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e336a037e9c04263b58a2278e0d6f545eb9b1914
X-Git-Newrev: 525695a4459f7c367dd29f138d0c9a7485c5afce
X-Patchwork-Hint: ignore
Message-Id: <20240630144002.8F5138360A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/xilinx-prebuilt/xilinx-prebuilt.mk:
 simplify variables
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=525695a4459f7c367dd29f138d0c9a7485c5afce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch reduces the xilinx-prebuilt package to a single install variable
that changes depending on device family variant.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 boot/xilinx-prebuilt/xilinx-prebuilt.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index eb78ed10cd..0c5456f577 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -20,7 +20,7 @@ ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
 # We need the *.pdi glob, because the file has different names for the
 # different boards, but htere is only one, and it has to be named
 # vpl_gen_fixed.pdi when installed.
-define XILINX_PREBUILT_INSTALL_VERSAL
+define XILINX_PREBUILT_INSTALL
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/plm.elf \
 		$(BINARIES_DIR)/plm.elf
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf \
@@ -29,15 +29,14 @@ define XILINX_PREBUILT_INSTALL_VERSAL
 		$(BINARIES_DIR)/vpl_gen_fixed.pdi
 endef
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL
-define XILINX_PREBUILT_INSTALL_OTHERS
+define XILINX_PREBUILT_INSTALL
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/pmufw.elf \
 		$(BINARIES_DIR)/pmufw.elf
 endef
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL
 
 define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
-	$(XILINX_PREBUILT_INSTALL_VERSAL)
-	$(XILINX_PREBUILT_INSTALL_OTHERS)
+	$(XILINX_PREBUILT_INSTALL)
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
