Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B948E77365
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 10:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7A3B60F37;
	Sat, 30 Sep 2023 10:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7A3B60F37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B5Pq23HifL03; Sat, 30 Sep 2023 10:23:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A61F760DF9;
	Sat, 30 Sep 2023 10:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A61F760DF9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA4FB1BF2F9
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 10:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B26E404ED
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 10:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B26E404ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gUTuIW-QMbQl for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 10:23:34 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEE8B40135
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 10:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEE8B40135
Received: by mail.gandi.net (Postfix) with ESMTPA id D35D060002;
 Sat, 30 Sep 2023 10:23:31 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sat, 30 Sep 2023 12:23:28 +0200
Message-ID: <20230930102328.537070-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696069412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=tySx2tKdAmtuXQm/2yWcTV7sZtRpYnr737x0ZQI1TgY=;
 b=mvDLKzJfiVO4xFVPvOT6Wlss/tjYaxWsJ19jUvzrev7cECcOjEsjVczLgkv950uq4katnd
 ++1/44hsxMGgLFxS5lhn82Cf8v7j6/q5vXDAVgy6TR0x5ExKV83P4roMDJBoEaJECdBInL
 jOnAEglaQYy8TXGePMXQstFqxnfu2LcG7br282TG2km/s437iSHc1N1qh41sLffZdrN1wS
 3NbJKP/Fj6G+b0ilrE+8o41KS5g0ulj6K/tkun2pYuu+PQIUrBaXrG8DpzVgDG2ygfIv2b
 H0WOyyxS+plZKZXlh+/LU21AUARQUQ7lp4u8vIQpcX9munUA2A7PBzorVLiaZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mvDLKzJf
Subject: [Buildroot] [PATCH] package/gnu-efi: disable on mips64el
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The gnu-efi package was enabled on mips64el by commit
11b347c03ab0b38389ec11b48f63236a3b4d6547 ("package/gnu-efi: add
mips64el support"). However, it has been failing to build for a long
time, and nobody bothered fixing it:

gnu-efi-3.0.15//gnuefi/crt0-efi-mips64el.S:71: Error: cannot represent BFD_RELOC_16 relocation in this object file format

Even reverting back to gnu-efi 3.0.10, which was the version used at
the time of 11b347c03ab0b38389ec11b48f63236a3b4d6547, does not fix the
issue. We tested updating to the latest gnu-efi version, 3.0.17, and
the problem still exists.

Since EFI on MIPS is extremely niche, we don't really want to invest
the time to fix this issue, so let's disable it again. If someone
cares enough, it can be fixed and re-enabled.

Fixes:

  http://autobuild.buildroot.net/results/d5938edcf50ebb7fdcec148d73f402845079779d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnu-efi/Config.in  | 1 -
 package/gnu-efi/gnu-efi.mk | 2 --
 2 files changed, 3 deletions(-)

diff --git a/package/gnu-efi/Config.in b/package/gnu-efi/Config.in
index 8e35fddbcb..d456a23837 100644
--- a/package/gnu-efi/Config.in
+++ b/package/gnu-efi/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
 	default y if BR2_aarch64
 	default y if BR2_aarch64_be
 	default y if BR2_i386
-	default y if BR2_mips64el
 	default y if BR2_x86_64
 
 config BR2_PACKAGE_GNU_EFI
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 93b5888370..686a14be01 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -24,8 +24,6 @@ else ifeq ($(BR2_arm)$(BR2_armeb),y)
 GNU_EFI_PLATFORM = arm
 else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
 GNU_EFI_PLATFORM = aarch64
-else ifeq ($(BR2_mips64el),y)
-GNU_EFI_PLATFORM = mips64el
 endif
 
 GNU_EFI_MAKE_OPTS = \
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
