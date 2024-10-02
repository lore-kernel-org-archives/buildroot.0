Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32283CF31BA
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 20:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF8D48137A;
	Wed,  2 Oct 2024 20:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EAUYzkQcPt52; Wed,  2 Oct 2024 20:35:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E8C381F71
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E8C381F71;
	Wed,  2 Oct 2024 20:35:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 43A8C1BF282
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F7AF40042
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HdIUJhvgXbPQ for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 20:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B392140124
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B392140124
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 20:35:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FEF3838FA; Wed,  2 Oct 2024 20:35:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Oct 2024 22:34:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d75e29c9b23d0edf47dadba365f592e5f7f957a7
X-Git-Newrev: ceff8dbaa554ed543ec1c09ee8e2a76f40a0415c
X-Patchwork-Hint: ignore
Message-Id: <20241002203511.9FEF3838FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: pass -mno-fdpic if FDPIC is
 enabled
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

commit: https://git.buildroot.net/buildroot/commit/?id=ceff8dbaa554ed543ec1c09ee8e2a76f40a0415c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the FDPIC ABI is enabled by default in the toolchain, it must be
explicitly disabled when building U-Boot.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/uboot.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index ab534a8b3a..d8faef648f 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -172,6 +172,11 @@ UBOOT_MAKE_OPTS += \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)" \
 	$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS))
 
+# Disable FDPIC if enabled by default in toolchain
+ifeq ($(BR2_BINFMT_FDPIC),y)
+UBOOT_MAKE_OPTS += KCFLAGS=-mno-fdpic
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
 UBOOT_DEPENDENCIES += arm-trusted-firmware
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
