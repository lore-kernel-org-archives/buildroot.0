Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014D2C52D7C
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 20:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66288810B1;
	Mon, 19 Aug 2024 20:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eiKfNF0SqgWx; Mon, 19 Aug 2024 20:31:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 246FF8111B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 246FF8111B;
	Mon, 19 Aug 2024 20:30:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B5B41BF3C9
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B574408EA
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AtyJUEbWP1fI for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 20:30:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B625140638
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B625140638
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 20:30:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 985C1860D7; Mon, 19 Aug 2024 20:30:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Aug 2024 22:29:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ba9ac62052c99d7557adf2bbad1bab0c5577a81
X-Git-Newrev: db32d83e42d88b4a443789dd488fba69d0d271f4
X-Patchwork-Hint: ignore
Message-Id: <20240819203010.985C1860D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: use $(TARGET_OBJCOPY) for
 ZynqMP pmufw.elf
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

commit: https://git.buildroot.net/buildroot/commit/?id=db32d83e42d88b4a443789dd488fba69d0d271f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Converting the pmufw.elf to a binary works with any objcopy, regardless
if it's from the host or cross-compiler. Prefer to use the
$(TARGET_OBJCOPY) as it's always available and reproducible.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Reviewed-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/uboot.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index cdb9f435f7..2c04abc896 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -462,8 +462,10 @@ endif #BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
 
 ifeq ($(suffix $(UBOOT_ZYNQMP_PMUFW_PATH)),.elf)
 UBOOT_ZYNQMP_PMUFW_PATH_FINAL = $(basename $(UBOOT_ZYNQMP_PMUFW_PATH)).bin
+# objcopy is arch-agnostic so we can use $(TARGET_OBJCOPY) in lack of a
+# microblaze objcopy
 define UBOOT_ZYNQMP_PMUFW_CONVERT
-	objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_PATH) $(UBOOT_ZYNQMP_PMUFW_PATH_FINAL)
+	$(TARGET_OBJCOPY) -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_PATH) $(UBOOT_ZYNQMP_PMUFW_PATH_FINAL)
 endef
 UBOOT_PRE_BUILD_HOOKS += UBOOT_ZYNQMP_PMUFW_CONVERT
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
