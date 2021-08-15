Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AECC4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 17:00:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27DFB61264
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 17:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27DFB61264
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E89FB80CF7;
	Sun, 15 Aug 2021 17:00:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FnGjdDhJqZQD; Sun, 15 Aug 2021 17:00:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6907880CFC;
	Sun, 15 Aug 2021 17:00:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 06CA81BF3CA
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 17:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3E1D605C9
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 17:00:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n9NF5w1XFU9k for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 17:00:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5AA30605A3
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 17:00:38 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id u1so10169685wmm.0
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 10:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8zvtSsuWjfeC/8gOM+USyGCVmHOPPeiDH87Mdi2xpCU=;
 b=hR/L5NnhT48dB1Ui7y3kMxNfzeXVhRxSzXPxP2Y13lEUtGSkFZrBJaRnZyBu0f8tvp
 ECEOutxMNi8aBZ3w5jmYxO6lK0xgMMG8+rn0HCMJVFdarm9fwtgd0NzE+UIHFZ1oSuGB
 OZkUAPIpVDm3nPhOkzH2gkhbkeNHdrL42ktzxTDL0NOZLN9+HXRmpIP4tBDRMZwH43x3
 TRn8hoK7bYvTjGW46VCsRIo3f7TogAKXV9ha7W5m9UL+V5fHXhYwFIlyORCqNYQYXqCw
 qWG5J6SsWyx9g9FYyv7Z7QfRxOdN9keAgIO6z11UTHYRdrzvPIpNtzXt48/xFGFQg9vK
 cH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8zvtSsuWjfeC/8gOM+USyGCVmHOPPeiDH87Mdi2xpCU=;
 b=FsZVOOzKDMGKHRCL8oZuYikt0hSErC55gP4X2FumLn8nYr8ZOkxYmv9mFeBkqLg5gw
 yj9CmZl1pRZf21Too2pLIKtQq5zhjNiZdQp+6a27YVp9g5JlhRboT15NYJ5DXs8u0R3X
 PC2u/HP4qc4EFzhlQglaxECQvlyMDJsSvaWDwkFD+KTJN7ULKg0EJlFDusKq+agPX/CE
 yetRUpLMD0vmULwT5TgF5YiiOZVOJFgwvNmSF34Q3H35AE9ENjRLGslNo6AlvNnfNyvY
 D93HsH8ZfZG+WBZDet74UH+r06Jzhl1Mb4Y/jjkA5fXSXXT2AZHQjWOGSw+23vwg382b
 XQKg==
X-Gm-Message-State: AOAM532tb+i9oPIM8cgAy55+D5piPFuMHEpPDqBPYcUCePslaV01Sd6p
 85HDaqKHbWl9t+iB7b9ikEPoyTGQiYM4dA==
X-Google-Smtp-Source: ABdhPJyj9jXYdDXhLuIcg5P4qPW/gK1IzwxkPj078lDsrGfU9WNfSiFnLaef2tnfYt0Y6fp1TBz2Lg==
X-Received: by 2002:a1c:ed13:: with SMTP id l19mr11835772wmh.48.1629046836177; 
 Sun, 15 Aug 2021 10:00:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id e2sm8931297wrq.56.2021.08.15.10.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Aug 2021 10:00:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 19:00:31 +0200
Message-Id: <20210815170031.1495825-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libargtable2: update
 LIBARGTABLE2_VERSION
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

Update LIBARGTABLE2_VERSION to reflect what is used by
https://release-monitoring.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libargtable2/libargtable2.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libargtable2/libargtable2.mk b/package/libargtable2/libargtable2.mk
index 8215f552cd..d033e28f40 100644
--- a/package/libargtable2/libargtable2.mk
+++ b/package/libargtable2/libargtable2.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-LIBARGTABLE2_VERSION = 13
-LIBARGTABLE2_SOURCE = argtable2-$(LIBARGTABLE2_VERSION).tar.gz
-LIBARGTABLE2_SITE = http://downloads.sourceforge.net/project/argtable/argtable/argtable-2.13
+LIBARGTABLE2_MAJOR_VERSION = 2
+LIBARGTABLE2_MINOR_VERSION = 13
+LIBARGTABLE2_VERSION = $(LIBARGTABLE2_MAJOR_VERSION).$(LIBARGTABLE2_MINOR_VERSION)
+LIBARGTABLE2_SOURCE = argtable2-$(LIBARGTABLE2_MINOR_VERSION).tar.gz
+LIBARGTABLE2_SITE = http://downloads.sourceforge.net/project/argtable/argtable/argtable-$(LIBARGTABLE2_VERSION)
 LIBARGTABLE2_INSTALL_STAGING = YES
 LIBARGTABLE2_CONF_OPTS = \
 	--disable-example \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
