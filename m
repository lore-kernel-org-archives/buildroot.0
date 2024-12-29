Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B22E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 09:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4C0640208;
	Sun, 29 Dec 2024 09:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2UCgu9tlHVjC; Sun, 29 Dec 2024 09:33:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BA3740210
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BA3740210;
	Sun, 29 Dec 2024 09:33:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4589872
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 09:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 334B8607EF
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 09:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NTPywAKIOUzo for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 09:33:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 080C1607CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 080C1607CD
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 080C1607CD
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 09:33:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id BD5D8FF804;
 Sun, 29 Dec 2024 09:33:33 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Dec 2024 10:33:31 +0100
Message-ID: <20241229093332.334759-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735464813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=069/6RHxD+V484S538hFvZ64IIwkpvfvLF5FqnkLIEQ=;
 b=oO/2pLZA53JbNzjkIX2ln//pDM/tNx2O9rHG/z/0sP13yvJw1Dv7Q+X36BcFZwTJINDcZj
 A60+c1aUzPcqMJ3sNEB1MInRRpx/vXGPPSlptcf/5/JEtp/Lw8lJZldbC1zmFnIyZTEiDw
 HE8/4WH9jOQu0M/shLcD0W+MLkAHIK+c6RnNkX6zjcOjR3KiQHE+aUxbpxYlt6V/srhWdN
 gEEPAj1ySej3cnJE8iW9JS704w3BLy8VFzfdCwO54p9OJEZAGZFIEYkNo566oRxJ0cUGAt
 yVw1MUqYcaAnS7L1zkj2lIYcfWbcc7p5xALoxOjJX/AlMv1X9/OnQBGy/v+Q/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oO/2pLZA
Subject: [Buildroot] [PATCH] linux: select
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL when needed
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

The autobuilders are regularly reporting issues when building the
Linux kernel due to BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL not being
enabled.

Since the autobuilders are always using
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG, let's have this option
select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL when the latest kernel is
used.

For now, we enable this for ARC, Sparc and x86-64, but it might have
to be extended for additional architectures based on build results.

Fixes:

  http://autobuild.buildroot.net/results/596699ede6e651163a23fa50386d84aca24c9a28
  http://autobuild.buildroot.net/results/77a767bcd78f9ed21668cc268e91a4584a821661
  http://autobuild.buildroot.net/results/e846d13c9f001b76a08ffb94f69c8dd26b4f5811

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index be44c00d7d..50f1e31427 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -168,6 +168,12 @@ config BR2_LINUX_KERNEL_USE_DEFCONFIG
 
 config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
 	bool "Use the architecture default configuration"
+	# We know that the default configuration on some architectures
+	# requires host-openssl, so select it for the latest kernel
+	# version. This is mainly needed to fix autobuilder testing.
+	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if \
+	       BR2_LINUX_KERNEL_LATEST_VERSION && \
+	       (BR2_arcle || BR2_arceb || BR2_sparc || BR2_x86_64)
 	help
 	  This option will use the default configuration for the
 	  selected architecture. I.e, it is equivalent to running
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
