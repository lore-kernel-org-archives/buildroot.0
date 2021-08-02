Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D569EC4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 21:05:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6A6B60F4B
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 21:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E6A6B60F4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yuriev.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B50E260865;
	Mon,  2 Aug 2021 21:05:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L8EMNWxl_JF7; Mon,  2 Aug 2021 21:05:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 236F460663;
	Mon,  2 Aug 2021 21:05:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F17C1BF31C
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 21:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E624401FF
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 21:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=yuriev-ru.20150623.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KkHob7ChC0cF for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 21:05:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24B96401FE
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 21:04:59 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id a26so36050339lfr.11
 for <buildroot@buildroot.org>; Mon, 02 Aug 2021 14:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev-ru.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bXyqWn7kDueWVff083xfyXpKxu49oCmNarBAO+NWwQ8=;
 b=WhscnyJht1D+OyrzWLXr0pu/1Qb1nwMkeI6w3pFSwqkQbcSN1HC6hm3DYUJE1GMEAc
 W3CgBcQeIWDTkMrrLyGVXXaysPPca1bUGn1yOPJhXzKgoH/RinIdgk7P2h3jFmdZgLy/
 gErDL6pl6KRRjAircN0EjYrnTOKqzP21NRE9rcV8eJ1KGLtcdYF/AQkhF4uYNo/eLNUF
 wI+GDQaDXzxo8NDL0N3GgquYbI4HUfeHY9Cui63/t4Vg3xtgMHfgYUgWgyAhaKVxyMsI
 ib88HXLnlHRQaQ+ecTkdRxphbm8xQ2r6ffzaWEcpJ8Ybm6IvxAvbbKeW8QtL/dsifxrv
 trAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bXyqWn7kDueWVff083xfyXpKxu49oCmNarBAO+NWwQ8=;
 b=ggFZKXJEjPilvNymW34wz26p++jUHqE445J0ObEiMCiEVc8eg6d6OAMGG04SMqD5s4
 V4m+X4ScDR1p20rh8n1z9XrxiU6N3fF7GDd/cWdHTRq1LZzuVkiRLT0H8o0ncWafiuX6
 E8Yq3G07iWTIxITwiu2OwErkJTrOgU+CA4gHJV9lOOBTzDL6j3ZKWJ7m2k8rRt4DCcCC
 SxQq1HAYXAWVf590WoMDU6jNoCYSToUvHT8zWocQePBeGwaBy+T3+TnHJZrS1Gv/M7tn
 zRGhzZHSKU6xw6jeiwW+EnkeeoYp08ktB8OkYiKmRkMCH1013RvAsvRpNlKclP44QDgr
 QdOw==
X-Gm-Message-State: AOAM533IPv3GwXUrlbbOOjZ0AZ+bXFDHAtwETF3lF/Gczut3S1rKaqcR
 wJ9D9KfcQepxZdSxPZFqDiPSJ4+4JNb8+QrA
X-Google-Smtp-Source: ABdhPJzS6GpQXm/x/zYelc8RQ2bFxvtpIhF8W+l3Inj2B2BmTrJuuWMF2DHQZ43/yMHRGuQ8l5t9Ow==
X-Received: by 2002:a19:ca4d:: with SMTP id h13mr13425519lfj.630.1627938296863; 
 Mon, 02 Aug 2021 14:04:56 -0700 (PDT)
Received: from ly-ThinkPad-X1-Carbon-2nd.router.bigbrother-matrix.ru
 ([31.173.80.214])
 by smtp.gmail.com with ESMTPSA id v16sm929377ljj.55.2021.08.02.14.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 14:04:56 -0700 (PDT)
From: Leonid Yuriev <leo@yuriev.ru>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 00:04:24 +0300
Message-Id: <20210802210426.260728-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libmdbx: bump version to 0.10.2
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
Cc: Leonid Yuriev <leo@yuriev.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Release notes: https://github.com/erthink/libmdbx/releases/tag/v0.10.2

Signed-off-by: Leonid Yuriev <leo@yuriev.ru>
---
 package/libmdbx/libmdbx.hash | 2 +-
 package/libmdbx/libmdbx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
index 8ff8e99810..c8a28ada34 100644
--- a/package/libmdbx/libmdbx.hash
+++ b/package/libmdbx/libmdbx.hash
@@ -1,5 +1,5 @@
 # Hashes from: https://github.com/erthink/libmdbx/releases/
-sha256  767776d961fadeb51ee895fb70ed82a03051bae855a19396f0067b03076103bb  libmdbx-amalgamated-0.10.0.tar.gz
+sha256  745555704df76626a6612ad0c6bc6b1a66bfab98b9245b07dfb82640aa46d6fa  libmdbx-amalgamated-0.10.2.tar.gz
 
 # Locally calculated
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
index 8e2eff0c7f..60c5148625 100644
--- a/package/libmdbx/libmdbx.mk
+++ b/package/libmdbx/libmdbx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMDBX_VERSION = 0.10.0
+LIBMDBX_VERSION = 0.10.2
 LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.gz
 LIBMDBX_SITE = https://github.com/erthink/libmdbx/releases/download/v$(LIBMDBX_VERSION)
 LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
