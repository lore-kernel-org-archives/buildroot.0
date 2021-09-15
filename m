Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB54AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 00:10:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C3B26121F
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 00:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C3B26121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=dynonavionics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC90080E03;
	Wed, 15 Sep 2021 00:10:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OcLUiVolcdO1; Wed, 15 Sep 2021 00:10:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EF0B80E0E;
	Wed, 15 Sep 2021 00:10:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE7A91BF3DF
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 00:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD78A60642
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 00:10:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=dynonavionics.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g2G2WG9W3JMf for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 00:10:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FEE8605F6
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 00:10:30 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id s11so874989pgr.11
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 17:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dynonavionics.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Li0o/NwJm/YmEgVJIjBoOg9XglnQO9EyP2Rt6QyORBE=;
 b=cHbHaD8zuCBlhyzTjiT/q1ZjDylYKC0aSUvJfbU3RjeNiMjxmbDlwub6bPQgPsF69g
 q1ntHwHYTFYq0W1DHp9uQV/SdTrxZ+iqb4H6oWUNiDH+pG4/s7QOvt2u6f0cmX4d2NGR
 KAxOnl0n5wdWvnBFeJzgeqb/298f1VzN3p2OE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Li0o/NwJm/YmEgVJIjBoOg9XglnQO9EyP2Rt6QyORBE=;
 b=HyM/xMoUlitsBxE9viE25SnWMO7BcBPXIP0hPeILhHXMQVLb+QrajwjZ+TDdWlzPp+
 jPJxilNpkkWeBBM59PhCnPgjqds9VFG7jvRGNEkSpirbEv5TNqQPCmbgP56rFwqbfdJx
 oDXmV9eqearRNHnTtI/6z0akdNJCGb/5KfDh3imAnjCr86/18/5NdHh8y4g0r1xPknks
 +jU3LIxvPC2PEdbsB6FETU9Lxe7M5xT3kOyfzRZGArQVj0vn6yCGAhyaO3lKyUDMXK8z
 q8rUac67Cw3hdrlFKd8pj0mrlZ2a0uRjwHYLhkTgcp6s9aSXZU/jrhaj5GOIBvTSO5n9
 Gzmw==
X-Gm-Message-State: AOAM531o92yVJ8vR5kMRMOx62EBvh9m4dd2PuIaZhWygHf9LP4anLqXj
 4vhxX73grCXVtBEFNFT2TA7mPixQBD6h1Q==
X-Google-Smtp-Source: ABdhPJxKDITl2hdKu5pZ6k04bx+bkdCLhZMH7+kmR6seKmOZKrTmKEMQYYFvW4JOrGKNGO+jtSfU5w==
X-Received: by 2002:a63:e00b:: with SMTP id e11mr17887063pgh.190.1631664629308; 
 Tue, 14 Sep 2021 17:10:29 -0700 (PDT)
Received: from dcorbeil-20.dynon.net ([50.34.84.52])
 by smtp.gmail.com with ESMTPSA id t15sm12666204pgi.80.2021.09.14.17.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 17:10:28 -0700 (PDT)
From: david.corbeil@dynonavionics.com
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 17:10:28 -0700
Message-Id: <20210915001028.3540588-1-david.corbeil@dynonavionics.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/glmark2: bumped to latest version
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Spenser Gilliland <spenser@gillilanding.com>,
 David Corbeil <david.corbeil@dynonavionics.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

From: David Corbeil <david.corbeil@dynonavionics.com>

Fixes a segfault happening on Raspberry Pi4 on the fourth test

Signed-off-by: David Corbeil <david.corbeil@dynonavionics.com>
---
 package/glmark2/glmark2.hash | 2 +-
 package/glmark2/glmark2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glmark2/glmark2.hash b/package/glmark2/glmark2.hash
index 33a99de12a..8405819770 100644
--- a/package/glmark2/glmark2.hash
+++ b/package/glmark2/glmark2.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  9ad57e4eec0049c47a367b57f5f8d3e31e4c488b1d5d6673a75f1b2282e40888  glmark2-c493520253fbfe3676c8b34b6f91a7c9a838fc8e.tar.gz
+sha256  12aef3ce80406bc723542979b9818886a28d0a4c93f62379eaadfd830974790d  glmark2-06e78b67702b5413335ecdf1ae816da9c20f6ed9.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  16fbc228292bd774b263b212ae422c524cbf3b2078bcf21b22f8bdd4373be617  COPYING.SGI
diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index 9e47b426fe..5c2dd06362 100644
--- a/package/glmark2/glmark2.mk
+++ b/package/glmark2/glmark2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLMARK2_VERSION = c493520253fbfe3676c8b34b6f91a7c9a838fc8e
+GLMARK2_VERSION = 06e78b67702b5413335ecdf1ae816da9c20f6ed9
 GLMARK2_SITE = $(call github,glmark2,glmark2,$(GLMARK2_VERSION))
 GLMARK2_LICENSE = GPL-3.0+, SGIv1
 GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
