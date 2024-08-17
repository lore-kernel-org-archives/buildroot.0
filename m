Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B7EC531DF
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 22:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 223936060E;
	Sat, 17 Aug 2024 22:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpjB15_1DZXh; Sat, 17 Aug 2024 22:02:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DDA760616
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DDA760616;
	Sat, 17 Aug 2024 22:02:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA8F61BF578
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 22:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A689A6061C
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 22:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VP_CwHrSC_DZ for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 22:02:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 901EE6060E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 901EE6060E
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 901EE6060E
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 22:02:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 2C88BC0002;
 Sat, 17 Aug 2024 22:02:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 00:02:04 +0200
Message-ID: <20240817220208.929073-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723932132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vHtcZxzj4ItlCrAhdT8v5uTGLrUJVG3P/Lq8NYPmpyk=;
 b=LeI2jEb7BAMJOxirOYJuJceTFQN5oQobCj3yV2rhgXl5PmStrllfl8blbPip+3cWjjRUfg
 yPVGKaUkBAmFRCAMsST/wnRENbhhRCDjZtNlbSyBnKFP5eWGf9nECuLPbRc6MsmDLsRJsn
 uxBUBAKOwk/iLDFjfp2mn2fosvI/GCusGA8PO02evV1n7fpN3DSS7zonAfuqY887I0Uiph
 MaRZJsZZ7pAQxxSiLGtDUBgO7xNvAH2e7y36moqmiiAu3fF7q+9RpVTyblJDV4uogwajv4
 B96eTFCW038mkwT1hUkTTZxhV6yHtFqFXbCGZJWOCeXLgBFE3Sa128IikX4G0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LeI2jEb7
Subject: [Buildroot] [PATCH 1/3] package/gnu-efi: disable on ARM and AArch64
 big-endian
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the bump of gnu-efi to version 3.0.17 in Buildroot commit
fa9893ad8fb94278d7e8b80cd3e795469223faf0, the build of gnu-efi fails
on ARM big endian and AArch64 big endian.

Indeed, since that bump, gnu-efi builds some "apps", using a special
linker file part of gnu-efi that explicitly sets the architecture:

OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")

OUTPUT_FORMAT("elf64-littleaarch64", "elf64-littleaarch64", "elf64-littleaarch64")

Due to this, big endian builds are now failing:

armeb-buildroot-linux-gnueabi-ld: ../gnuefi/crt0-efi-arm.o: compiled for a big endian system and target is little endian
armeb-buildroot-linux-gnueabi-ld: failed to merge target specific data of file ../gnuefi/crt0-efi-arm.o

Since we are not really interested in supporting gnu-efi on ARM big
endian and AArch64 big endian and it is not supported upstream, let's
disabled on those architectures.

Fixes:

  http://autobuild.buildroot.org/results/4d385d6759346e19664d0bded1e419f004f82b47/ (ARM big endian)
  http://autobuild.buildroot.net/results/b6df43408ca4cd469962c96d49d9ac7935b6dbe9/ (AArch64 big endian)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnu-efi/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/gnu-efi/Config.in b/package/gnu-efi/Config.in
index 4f44cf9f64..012324712c 100644
--- a/package/gnu-efi/Config.in
+++ b/package/gnu-efi/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
 	bool
-	default y if BR2_ARM_CPU_HAS_ARM
+	default y if BR2_arm && BR2_ARM_CPU_HAS_ARM
 	default y if BR2_RISCV_64
 	default y if BR2_aarch64
-	default y if BR2_aarch64_be
 	default y if BR2_i386
 	default y if BR2_x86_64
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
