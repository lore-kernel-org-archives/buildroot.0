Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4216FC433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 19:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7F3D841E3;
	Wed, 16 Mar 2022 19:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bn2G1SvL-s8N; Wed, 16 Mar 2022 19:05:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBAC6841A8;
	Wed, 16 Mar 2022 19:05:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E921B1BF4E5
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 19:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D425361213
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 19:05:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jenxhN_KY4Y3 for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 19:05:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFB4460F8C
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 19:05:52 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id w127so3335575oig.10
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 12:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0ns4w0KLJ7T8gwpKD7FXRLJMdvK9SRj1JLye+vJpu9w=;
 b=l6q8PjJrFK9zvO/yk/uia0OoXECBHmZbRZTvxDe2YtMhDGuD/1bA83vrjgxO8ZdZDZ
 fo9yYLgVO7l8hLKN2x4ulcEyp2oAyDoe53WpiYX9XmEpBeUYM6f9HY+V+hONPXU0V5Ig
 NWLX01m1feguTBMgrC/KASqF4PWm/9I/QOSAriAQTZ8IhTrBVO6ERzlE9TIP9LUHMz1i
 v6GOJ5ogLP4dBaLIfz5PouihtkuXS0Vzh1wWKKHAie1kV/KDvgURv8dMlY8YFA5p5NuY
 p1jSXXP1AVpgyxG2YtWqGcka9ihRKHjAyyeifY3+LuB0J14yRhmqZxCbhvhshoB7JS0L
 wdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0ns4w0KLJ7T8gwpKD7FXRLJMdvK9SRj1JLye+vJpu9w=;
 b=HAuzzM4VWQKtzkpk+oJTGGp1kPUhiNc5iysJzwC+HgKiQFDE47W9n8dH55R0MR01zq
 p5PjNOxDjtEdyU0ne+J8y4jFXArCqOdQFSZowePxPXVo1kzNUcFAvIGttKM1jcIbF9De
 hjXHoBhspceL0AkCSez6tN+zEyI0CnYIs6RUwWADldsWwnv03EpHeODhVEyv+5f045ve
 D4VdWuCkIVudxBgpFQqNyZbl5ENqLzWY520eGZoukE1V3ZNpHJ54yPy9lcE7dpqHWD6b
 M1xtz+e8LXM/UHAH8kiG+c3pYcl+2Y7q6vy6BORBw6pcVUasMI1yQvhtgZBxsfnl1nWI
 c6kg==
X-Gm-Message-State: AOAM532Nzzr71+tJ1iIwcR0Z6dpdiJO8K3CcgH1rwId22wWQpUSfeVs/
 kMNx1wjBD/R3g8isB7lBuagZRGWR4xA=
X-Google-Smtp-Source: ABdhPJyVO5irLQ4+Rs1fG4SEOFX6Onuy9w6CwXoBTBKpI6DfmUpltq37otFmPoD0sLDAVo0b9/DPCA==
X-Received: by 2002:a05:6808:170e:b0:2ef:b05:1caa with SMTP id
 bc14-20020a056808170e00b002ef0b051caamr321894oib.234.1647457550368; 
 Wed, 16 Mar 2022 12:05:50 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 k13-20020a54470d000000b002d9b7fa03e1sm1249760oik.12.2022.03.16.12.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 12:05:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 13:05:45 -0600
Message-Id: <20220316190545.3618918-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316190545.3618918-1-james.hilliard1@gmail.com>
References: <20220316190545.3618918-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/iwd: bump to version 1.25
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/iwd/iwd.hash | 2 +-
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 1a58ec88e8..1c34aa0a90 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  61b5e48380cd3a6d0529f725eb6974157f1410af165f5d266b87add0bf395224  iwd-1.24.tar.xz
+sha256  3f138e03301beb2afc7b385a62f56db17059137857ab579f269c4e441783e760  iwd-1.25.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 548b508edb..fc10c5f1d4 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 1.24
+IWD_VERSION = 1.25
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
