Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4D3C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 06:53:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAA9460F9C
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 06:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAA9460F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94150403CA;
	Fri, 10 Sep 2021 06:53:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PbZsEfnNW-mF; Fri, 10 Sep 2021 06:53:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E79DB403CF;
	Fri, 10 Sep 2021 06:53:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F17971BF352
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 06:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9B3760B17
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 06:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dcVB8neQVH6O for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 06:53:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E92D66068F
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 06:53:09 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id n5so1092252wro.12
 for <buildroot@buildroot.org>; Thu, 09 Sep 2021 23:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PlbKx2pePHxuK5fgw+xwk70FXocKleqGWVRTyFUnSto=;
 b=LloPqxIr8SarBc3IGAi8A75F21R1aocwW7aUBEVOOL6uYJsdV81TLyNhC73tQ2kNBz
 aPVJD2w7bRsaNjfWPTnc7z0LTTuECSQw33mqIAR4C2sFd7DrxyiXqXfo3l//yPFjbfWV
 CNONXubr23mQPQYdTA7o8ROa5bRar73SlSFRpezIRO6Lz0XZcP7t5IQISCGcaKZHWo+N
 mcxvxnbWk01JLPYzO0gT0OruAFkTJ9QyEZJQOgt7eJIvWVy1TPA5cMdwejxaI5V/YYTa
 lmyZ+x1bJ0C/KfTzIg+I6yEDB90dDvBdQBT979zWMMqOf9YP790AXduW9xoayrzrbYG5
 ECbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PlbKx2pePHxuK5fgw+xwk70FXocKleqGWVRTyFUnSto=;
 b=p0g5tJFErgiBG80FYCrJe/VRvZ96EbxHdYzDLFmBzkC7JDJiJ20eyBOAEhMkS1Ra4f
 EG1RF89uXQOq5+TATfRGlBMDoZ1f60MwWErpwL9rH2S4IIXtoeciqS/MunC9XKFQCyzd
 /CQUUCAPHczUQcISX7lS/hSXTREth+Y5MmqpqP80TJTvgv6ibWMAwMfmos0GT3YfSlzT
 j8RhBoOdoHSJp3L2JLaaDZsvc/KaXjyejOHVa7u/WngsCdtgx9Pl9oThvAW2wTAix4EX
 QLhWp0TaMGu4sargXcZdu0sQb3xoVY17MwEjdgVyJxiRXYWyh4Ugbt5SxUrAvSt4kuOK
 v8Jw==
X-Gm-Message-State: AOAM5339Fq2l4WuppSpLdH3kJjFTlMSmVkfx5KEsVs62E/qa5sgTQz1Q
 iPRgo1W0RvB1cBFfbbSvPUrRQT+lUCQ=
X-Google-Smtp-Source: ABdhPJzwN9uQKqocw+ztH8SpHuI7YP8bWljNW2MMNAC7FkiVafgY81mhzxGR2/hBShya9kuBbSZ/KA==
X-Received: by 2002:a5d:69c8:: with SMTP id s8mr588249wrw.330.1631256787909;
 Thu, 09 Sep 2021 23:53:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id m8sm3514757wms.32.2021.09.09.23.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 23:53:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 08:53:05 +0200
Message-Id: <20210910065305.100451-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gnuradio: drop gr-flex option
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

gr-pager is not available since bump to version 3.8.0.0 in commit
0d6a7b2981d4ba83a95ff1c10a15970e41fabec2 and
https://github.com/gnuradio/gnuradio/commit/2d2caa205f3c3059deab7c82660908656167fd90

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy             | 8 ++++++++
 package/gnuradio/Config.in   | 6 ------
 package/gnuradio/gnuradio.mk | 6 ------
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6f71575f8a..c550abf419 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,14 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2021.11"
+
+config BR2_PACKAGE_GNURADIO_PAGER
+	bool "gnuradio gr-flex support removed"
+	select BR2_LEGACY
+	help
+	  gr-flex has been removed from gnuradio since version 3.8.0.0.
+
 comment "Legacy options removed in 2021.08"
 
 config BR2_PACKAGE_LIBMCRYPT
diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 183b49fe9b..77163c611d 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -130,12 +130,6 @@ config BR2_PACKAGE_GNURADIO_FILTER
 	help
 	  Filter signal processing blocks
 
-config BR2_PACKAGE_GNURADIO_PAGER
-	bool "gr-flex support"
-	select BR2_PACKAGE_GNURADIO_ANALOG
-	help
-	  FLEX pager decoder implementation blocks
-
 config BR2_PACKAGE_GNURADIO_QTGUI
 	bool "gr-qtgui"
 	depends on BR2_PACKAGE_GNURADIO_PYTHON
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index d8292dac08..36d7ee65cf 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -130,12 +130,6 @@ else
 GNURADIO_CONF_OPTS += -DENABLE_PYTHON=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_GNURADIO_PAGER),y)
-GNURADIO_CONF_OPTS += -DENABLE_GR_PAGER=ON
-else
-GNURADIO_CONF_OPTS += -DENABLE_GR_PAGER=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_GNURADIO_QTGUI),y)
 GNURADIO_DEPENDENCIES += qt5base python-pyqt5 qwt
 GNURADIO_CONF_OPTS += -DENABLE_GR_QTGUI=ON
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
