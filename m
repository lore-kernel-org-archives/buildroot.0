Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE6EC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:00:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6D0360184
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6D0360184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8823E40E43;
	Wed,  4 Aug 2021 21:00:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nh-Xit0Um4nS; Wed,  4 Aug 2021 21:00:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAAA94069B;
	Wed,  4 Aug 2021 21:00:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB3E61BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9D1A8377F
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:00:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q6RLsO2fJ3A4 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 21:00:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E93F083709
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 21:00:06 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 m28-20020a05600c3b1cb02902b5a8c22575so2020965wms.0
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 14:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nVhYjJpJ9KnvhOp1las1B0p1A8Osh6odG2wVypeGN/Y=;
 b=cjgpFRax+nKkxrouS0c4FAxDCNwBgB2ulaXzS7uPbs3561GhFjC4qvta/eWjJ71nMz
 xHE6VB420nrHSYyQwyYT8iNHaY+HMC/gX5viLFfmNuB2vtALnCu6KmaHAFXtjRZlqfMq
 pAswpDgXm5s8L25pQi5ymqnSpBqt2WGVrB3AvJFp6nm065fKpcI9VKGSMRY50UbVksaS
 /xt5x3reN2orSkzVHCM2pGR5Acd86QQk3CdBOd+thnGm8gVXn3W9baWXziLXMqxEfIAw
 eXiWEiO84fBtz3nTH7eg+AjE4cWZSx4n+wJeWdAYzbD6U1xbwlQ+uBf5lx80EXIg9rNW
 Uk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nVhYjJpJ9KnvhOp1las1B0p1A8Osh6odG2wVypeGN/Y=;
 b=iIhggxurOR+qZx5sCqHzDBZVcubRcEJsdIWkdvMoFbIZEgQsIEyz1u9upaFP0WFPUO
 jIDpzsJ0gyVRN3WUH4WiEiT80M+Q+B95nWpXuUQhRE/EFGmHektfJcJNy5O6O5L6o5/9
 cbVXL9EMs9OZ3qxVlHftqdTQG74RmBsQWygAjp6HnZN+96rHOus8XMUp0oR+THzY654A
 c9DT5GL6sUCquRu4CBpktr4t9axlam2xeZzAVKMo7QVJ1CCZeRhAO5/uUYWx0J7eH+/Z
 FmCyg+uFUvYbg8rN9gkDeC4uyHf5GkkVefmwjFXaF7AUS4Flv/R3uJbgO89P/0jLTohc
 kcHQ==
X-Gm-Message-State: AOAM531erdv7wC7tJb/yliMu++4jaQ0+oHGxXoM4fxsxnBdZdam0WnCA
 rYHNt6colgw/Mv3vwIGr0Je7+LGwRGqxug==
X-Google-Smtp-Source: ABdhPJwlTuUiSpTtJgqOKjSG4feCKP5tkxN4PT5dkZ/PeU3BdYrGtkoElzH5Zs874k86orOBlEAvlA==
X-Received: by 2002:a05:600c:35d6:: with SMTP id
 r22mr11420611wmq.41.1628110804965; 
 Wed, 04 Aug 2021 14:00:04 -0700 (PDT)
Received: from kali.home (pop.92-184-97-43.mobile.abo.orange.fr.
 [92.184.97.43])
 by smtp.gmail.com with ESMTPSA id w5sm4355337wro.45.2021.08.04.14.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 14:00:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 22:59:54 +0200
Message-Id: <20210804205956.1475477-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/shairport-sync: bump to version
 3.3.8
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Version 3.3.8 brings many bug fixes and enhancements and is recommended
for all users.

https://github.com/mikebrady/shairport-sync/releases/tag/3.3.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/shairport-sync/shairport-sync.hash | 2 +-
 package/shairport-sync/shairport-sync.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index c451edb933..ebc81dedc1 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7f8d4ecec53f2f681a962467bf09205568fc936c8c31a9ee07b1bd72d3d95b12  shairport-sync-3.3.7.tar.gz
+sha256  c92f9a2d86dd1138673abc66e0010c94412ad6a46da8f36c3d538f4fa6b9faca  shairport-sync-3.3.8.tar.gz
 sha256  1daaa904985807b7f9f2fa91f6b19f3faadf8df4e813f7451a691f89a6965e3f  LICENSES
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 1a02186dc1..adc584d554 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 3.3.7
+SHAIRPORT_SYNC_VERSION = 3.3.8
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
