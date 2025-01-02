Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40D0E77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 21:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A57B80593;
	Thu,  2 Jan 2025 21:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87as5GY5BV56; Thu,  2 Jan 2025 21:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94E128053C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94E128053C;
	Thu,  2 Jan 2025 21:02:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 63586F27
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 21:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50118406D3
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 21:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M8xxrsZMNTfF for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 21:02:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0202A406E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0202A406E3
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0202A406E3
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 21:02:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id B2D79C0005;
 Thu,  2 Jan 2025 21:02:36 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Esse <alexandre.esse.dev@gmail.com>
Date: Thu,  2 Jan 2025 22:02:34 +0100
Message-ID: <20250102210235.3386319-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735851757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=cFp+ZzZ5F9Ix7c9GBN8g9svKcF8AV2gBPbjk1JIxp0s=;
 b=PBgHO9ZFQfmNS1ElRljcYB/z9jrJ9aoK5WLp40M0cJMyd4pOg8X+okJf90Hl5SnnFBFdNR
 7Ye+LdSjjwQZoF7hkhiZvMzKNVL6LgzTNYOFQwPms6MscV+uU/V9P+4DStCvcp0VZQki9K
 ROU42i+ZgDTIuPVz+0EZJb8ehd7AHQE7d89DrABTesRXZ3BaEL884NLd9GmYSE8A02tyjk
 jenNr9gC/tcKK2bwRCSs/nrC2fHhYWpAmXtRUjqael1PBTPz+aaInpGd3HY9TWonSz9BNE
 MB03gWwIZpMFVXJ5V5m4sHATc6K7r/+kVYL5d3JkTrAJPJGrCj4/mKvigcaQJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PBgHO9ZF
Subject: [Buildroot] [PATCH] package/v4l2loopback: enable
 CONFIG_MEDIA_CAMERA_SUPPORT kernel option
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

Setting CONFIG_VIDEO_DEV is no sufficient as drivers/media/Kconfig has
some very convoluted logic to hide some options behind a
CONFIG_MEDIA_SUPPORT_FILTER option, unless CONFIG_EXPERT is
enabled. Due to this, several arch defconfigs don't have
CONFIG_VIDEO_DEV enabled when doing $(call
KCONFIG_ENABLE_OPT,CONFIG_VIDEO_DEV).

To fix this, we enable one of the possible options that ensures
CONFIG_VIDEO_DEV is enabled, and we've more or less arbitrarily chosen
CONFIG_MEDIA_CAMERA_SUPPORT.

Fixes:

  http://autobuild.buildroot.net/results/2a337d29e7870564027bcd42bd0addd228eb6a24/

We've tried to track down which kernel version introduced this
exactly, but it's been introduced a while ago and step by step making
it difficult to pin-point which version version exactly introduced
this. But the issue has been appearing for quite some time in the
autobuilders, so it's clearly not a recent issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/v4l2loopback/v4l2loopback.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
index abc2929d12..0e1d20c0cc 100644
--- a/package/v4l2loopback/v4l2loopback.mk
+++ b/package/v4l2loopback/v4l2loopback.mk
@@ -24,6 +24,7 @@ define V4L2LOOPBACK_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_MEDIA_SUPPORT)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_I2C)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_VIDEO_DEV)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MEDIA_CAMERA_SUPPORT)
 endef
 
 $(eval $(kernel-module))
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
