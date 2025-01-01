Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1085DE7718B
	for <buildroot@archiver.kernel.org>; Wed,  1 Jan 2025 21:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A695E40270;
	Wed,  1 Jan 2025 21:42:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MiUjc-6f8bhS; Wed,  1 Jan 2025 21:42:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89DE040272
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89DE040272;
	Wed,  1 Jan 2025 21:42:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 961F1E0F
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 21:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61E344011D
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 21:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dAkk2yNemFUS for <buildroot@buildroot.org>;
 Wed,  1 Jan 2025 21:42:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 19214402B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19214402B1
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19214402B1
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 21:42:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 0541A1C0003;
 Wed,  1 Jan 2025 21:42:17 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  1 Jan 2025 22:42:13 +0100
Message-ID: <20250101214216.2117350-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735767738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0cgSUCfaB/fh0DumkttBVZIq4KgvgaTQNsa88aesiGE=;
 b=EiZyF6hWo+D1BjjMgU6mkyr7B+l8XTljjS+tQ+YULoSLMioAOhCsYPN8Lvzmt5E7G73HSN
 BxlKFaRqBEgtiaZ8RTD3I/f3jKGDJ1JgIAP9G6o0oJ+lkFP156BP3wM/RIxO8ddKPRlNm5
 EDxbw6ZW0NuxvZwoTcRz29Bcld8qhJwZ687uumC2vGqkE8BxpBchmQhmi6VbavbVxo6eB8
 1VSsfkfwcXAuFeHTRPD4liNeZgax59wVHqtHAASMzfYBj+EBZzsljpCGZhr65g/ZwDCytW
 KLsG+NSubeGuuoj23OWxYx1fZ7uRnxr9vBTNDc59e/YHP9uhcTfUDRAIfqmoKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EiZyF6hW
Subject: [Buildroot] [PATCH] linux: the aarch64 defconfig also needs
 host-openssl
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit extends 5dae966a30c5485e45b94f750a739d36810cba4c ("linux:
select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL when needed") to also cover
the aarch64 architecture, whose kernel defconfig also needs
host-openssl.

Fixes:

  http://autobuild.buildroot.net/results/375f48cabebddce3b1d23c820bc3a722c8cdd819/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 6db6fc8b0c..98db89f8ab 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -178,7 +178,7 @@ config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
 	# version. This is mainly needed to fix autobuilder testing.
 	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if \
 	       BR2_LINUX_KERNEL_LATEST_VERSION && \
-	       (BR2_arcle || BR2_arceb || BR2_sparc || BR2_x86_64)
+	       (BR2_aarch64 || BR2_aarch64_be || BR2_arcle || BR2_arceb || BR2_sparc || BR2_x86_64)
 	help
 	  This option will use the default configuration for the
 	  selected architecture. I.e, it is equivalent to running
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
