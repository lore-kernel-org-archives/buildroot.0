Return-Path: <SRS0=Fkjy=NM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C668C4338F
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 10:44:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1628661186
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 10:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1628661186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC5CE80B0D;
	Sat, 21 Aug 2021 10:44:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AIuZ6jWK9ygM; Sat, 21 Aug 2021 10:44:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EB1980B0E;
	Sat, 21 Aug 2021 10:44:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E0351BF4E6
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 10:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DAF2605C9
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 10:44:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OBIu7XPwIiGI for <buildroot@lists.busybox.net>;
 Sat, 21 Aug 2021 10:44:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 470D8605BE
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 10:44:17 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k8so17958261wrn.3
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 03:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=npUiuCr20LFoXwMJi9vaycfgryuYA2Q6W2ISU5sT/a4=;
 b=j2oMzyJIgcirxP/ujKcGwIZx0wJjc6/uLuzHhHsEzf2XwYqFX7eu8P46kVJ/I6GA8y
 Xi2/rhsvMzqGAW13ynIGQKOnR7aF/x7xDKOUphjhYsYfof7m366Nvta+L5Ao8VHxfrsb
 dcpdphiZ/IKx1sJ2S+RywPskvwHGT5guNMDBUZ7OJ4q9FA2wtIqzXGyldGP0Xj3UHfO0
 KaaoIX10yhO7DdnlJnAqzZGfVvBw3SU5G7hdDDrk/2FtgP4IQiSscVuw1Ui856mMwfNI
 8v7FbSAF4wSopSCCs/U318AsCIr2YZhVLLvvKOlgoVAs9uVuwO7TTdEO5fa6vrK/hU1O
 oyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=npUiuCr20LFoXwMJi9vaycfgryuYA2Q6W2ISU5sT/a4=;
 b=BvEnr4/88pDcLwnKMsjCZOFF0hvhFpOERFmRAKGgPwe0ULTnrDw6ZKcjUkZRFprCAq
 EnrwMIdq4CyHfx+rb61GNSNAG8i+NYZORMRdQFDV+ZJmDjkAhtDojrEUd2mRSaz+J/go
 WG7WT2LaP3d6Xrf7VMQ4lVIsf0P8J7xT3xA2KTTe/QOsZXKplIB0p8cilhbqp7vo7g6+
 xhp1p0oOA65nn1YK56LaOmeJMljG8c6BX1gS4ilOxh1kGpiHTbf8N0zA6ah91aUqTwCP
 AEKxbUyf9x/lgw+2ud+CsIbGTXsY6Q7mmdrNIDjlSGaP4Fca7if2w/OX4YwxJsqMvngR
 AM6A==
X-Gm-Message-State: AOAM531K7DA9NfKBbelHgGxfkKqMMVRmTJ+uwYCF8/w3Ttv8XfDR6Vmm
 P0HAq1XmR5uFPEKERAL3Y4Iv6HVI2KyT1w==
X-Google-Smtp-Source: ABdhPJwV0aXsrvFa14j6lZPdbMXOMJTsr+9SvbglM/soAirFeo/e4SbOaA4OkvRiQS079tyLw7yI1A==
X-Received: by 2002:adf:f943:: with SMTP id q3mr3409475wrr.118.1629542655152; 
 Sat, 21 Aug 2021 03:44:15 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id k20sm4502044wrc.33.2021.08.21.03.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 03:44:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Aug 2021 12:44:03 +0200
Message-Id: <20210821104403.1184407-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/log4cxx: add libesmtp optional
 dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

libesmtp is an optional dependency (disabled by default) since version
0.10.0 and
https://github.com/apache/logging-log4cxx/commit/8a35b429c6b1bc73635d9b6db482523619199a90

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/log4cxx/log4cxx.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index 0ddea9466a..075f8cb371 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -22,4 +22,11 @@ LOG4CXX_CONF_OPTS = \
 
 LOG4CXX_DEPENDENCIES = apr apr-util
 
+ifeq ($(BR2_PACKAGE_LIBESMTP),y)
+LOG4CXX_DEPENDENCIES += libesmtp
+LOG4CXX_CONF_OPTS += --with-SMTP=libesmtp
+else
+LOG4CXX_CONF_OPTS += --without-SMTP
+endif
+
 $(eval $(autotools-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
