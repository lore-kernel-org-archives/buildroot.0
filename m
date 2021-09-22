Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF15C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 21:47:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9187C60FA0
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 21:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9187C60FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 648DF84341;
	Wed, 22 Sep 2021 21:47:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9sRfJgVWW9KP; Wed, 22 Sep 2021 21:47:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8DC28433C;
	Wed, 22 Sep 2021 21:47:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 685C51BF2F7
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 21:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 572C56148D
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 21:47:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lax0a7XcpMIQ for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 21:47:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76AF8614C7
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 21:47:14 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t8so11239115wri.1
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 14:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UQaDQlxmRb3oKRWkuNSuKeVvanuJ8HajR//eAyiUCr0=;
 b=fO0mgS+e0kMzD/J5BPmHvgJZwX0gbhdSV7SO+lyWrq/FP4lvev8LCAE5v5AiAIBLth
 aruOhrCuHoSInRhqqILWAkn59en45823BkKO32p4/RwReXMn8uShQMMLFBzd73NnpnQ/
 kRHmzSOS43i84ad7bkxnEqEG3zL3bqMAkmOFr+Fodfusw75vhJWAfRDjlKm/OrvpkL8D
 7TImMhjIG7j2VT36fe96cr+RYOoV/J8micoHAHpxic9HjOOeOUNs3blAM6mqIo4Gx7Gh
 kQkm6m8LPpYGYmxK9KOdU8EOkmFep7eAla3XhHZTsR2xBC83+8pjiXpFNJtFcZkEF9pJ
 zB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UQaDQlxmRb3oKRWkuNSuKeVvanuJ8HajR//eAyiUCr0=;
 b=xXjSM8z4etC47mtD7inkc0z8I03q7T/53wfjALAQHYPWD4iCFqLS7yZpGPTFuorf2f
 x73aAEIGj9sW5LFwxyJjDFuxsoqjcNl3mLCBZyurcmZigcwqWa9xXGihGyPtmCsYTPlC
 iElTinOOD3X7umnclhQNz7MhsXrl+BRjFJtC86Vx9dzeOkYcsDAOmBUWOEdezO1xI8bQ
 DC0Z+cRWXTL7Bd3SXt1/YW6wDv2z7fMSDQ4kC/Rjw6UIR9Jlol/1OzyTU5EQ5MeQgzKF
 Q0lVptWCmbjqX2/iGhISBWRSWBY35u5WU26CWusmtzUBMq1zPseLuj5mQvszbnxMb7tg
 o/Pw==
X-Gm-Message-State: AOAM532xUyWvHfATw0/6uqYpoLPxHxsOtuP7aTqD8IwsQyrh0RDr/cwx
 ZR+0q0Pg5OR5WZ6a4pt1jemqu4oLIL0=
X-Google-Smtp-Source: ABdhPJzW8hKtleGJSpgotO5LFyoqktpJKgeNS2OYl3vYbtNjhiJPoHbskUalIMSuZ13jT3U3S2yqZQ==
X-Received: by 2002:a7b:cf21:: with SMTP id m1mr1161414wmg.95.1632347232515;
 Wed, 22 Sep 2021 14:47:12 -0700 (PDT)
Received: from kali.home (pop.92-184-100-47.mobile.abo.orange.fr.
 [92.184.100.47])
 by smtp.gmail.com with ESMTPSA id r4sm3393910wma.48.2021.09.22.14.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 14:47:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 23:46:27 +0200
Message-Id: <20210922214627.828388-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/liblinear: fix shared library
 install
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fix the following build failure raised since bump to version 2.43 in
commit bdd05a2b1323b4bdfbcaf559e0567a7d09f4837d:

/usr/bin/install: cannot stat '/tmp/instance-0/output-1/build/liblinear-2.43/liblinear.so.3': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/97c2a3babe8f9df7cda069858f13e3be2508cf40

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/liblinear/liblinear.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
index 3b137ed518..1ad734c756 100644
--- a/package/liblinear/liblinear.mk
+++ b/package/liblinear/liblinear.mk
@@ -14,8 +14,8 @@ LIBLINEAR_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
 # $1: destination directory
 define LIBLINEAR_INSTALL_SHARED
-	$(INSTALL) -m 0644 -D $(@D)/liblinear.so.3 $(1)/usr/lib/liblinear.so.3
-	ln -sf liblinear.so.3 $(1)/usr/lib/liblinear.so
+	$(INSTALL) -m 0644 -D $(@D)/liblinear.so.4 $(1)/usr/lib/liblinear.so.4
+	ln -sf liblinear.so.4 $(1)/usr/lib/liblinear.so
 endef
 LIBLINEAR_CFLAGS += -fPIC
 endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
