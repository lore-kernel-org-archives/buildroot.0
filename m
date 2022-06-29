Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6455C43334
	for <buildroot@archiver.kernel.org>; Wed, 29 Jun 2022 19:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AA1740913;
	Wed, 29 Jun 2022 19:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AA1740913
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cedv8Gcs-yCS; Wed, 29 Jun 2022 19:21:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EDAA40906;
	Wed, 29 Jun 2022 19:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EDAA40906
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 349F21BF4E5
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 19:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0ED0460C1C
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 19:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ED0460C1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2fS-x_9F41Nc for <buildroot@lists.busybox.net>;
 Wed, 29 Jun 2022 19:20:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E305760C31
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E305760C31
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 19:20:56 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 v193-20020a1cacca000000b003a051f41541so222435wme.5
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 12:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mp+40CAYvEfTIGcdjOux9waHTtth9xSuJE3+ab210kE=;
 b=08gtVTiRr2tmP0Nb+LICxgSbA5kvbRlXPZdBbhheyn5Z3YFXFo/Mt/QFkriyYNTZ/E
 wiGaoPxSH1R2YSFOTwKhSaYxdKw0B21jQnRD7P+bROR59GgXJwo7vwSRdHEE8azCYun7
 RhF7a8ULLhe+HTDLuMWnw7wKEt3CzVtl2k27GL779yNNrOs5ozibWgEllOCQ1gQ41NIj
 tSFkbSVCy4YXB6LQFykrtyQumbwIUX9Otx6dbzOl+2zJpAc+wGpUFuaIVN53MoIKeGI2
 TnkyVkmYepClzTZXR23z7rd7mkwcMa9mu2M5lQ5znz8At6fltnYHxYqsUvspQYS/b+i0
 ynhg==
X-Gm-Message-State: AJIora81txAfCcBzGb9lApZCEuL3zjIzEw1oQvpxhzGfE/hgLOjp1nMN
 qY6nn92fssye3D6PNfn1ggrTxr6wnGE=
X-Google-Smtp-Source: AGRyM1t9Y1y2rk5kujAxLds8NPyBl9XVylLpYilbuNlE+nHmlqTM+xSCKAIujz9ZWdPwNF5aJJNN9g==
X-Received: by 2002:a05:600c:2c42:b0:39c:4597:1f74 with SMTP id
 r2-20020a05600c2c4200b0039c45971f74mr5294358wmg.13.1656530454875; 
 Wed, 29 Jun 2022 12:20:54 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n30-20020a05600c501e00b0039c454067ddsm4200855wmr.15.2022.06.29.12.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 12:20:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Jun 2022 21:17:56 +0200
Message-Id: <20220629191756.181085-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mp+40CAYvEfTIGcdjOux9waHTtth9xSuJE3+ab210kE=;
 b=CV/Kd4AQxQDmenDPOjWNl3y5E+2mtkGqoy18bioGUqlson87ulEtw+ALeXRovwi751
 EKDIkyCLWYuW1gz6MYl1RsJE+eN3uXy3iiwaDvjLXVgxsYmhjiA2EOJG0M5+xaKhy4u1
 aktl+VWOwyo0QYiS+xH9xL2POzQSPvKctQJsXA79btUWlFcL/63rT2gydpC+S6nmbBA1
 r8zohjT0pAeVivIm6/g/BqKtBKOQ5fLDGkMnZqPGlF44VSip1R5SCfWNvS4kjLnJFa1W
 xr7ACTxyP3542EUse3K/tB+tA6xZQ3afQbAX7PMRw98itnxG7n5zLK//YrRooGx0GTzv
 XTzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CV/Kd4AQ
Subject: [Buildroot] [PATCH 1/1] package/gtest: bump to version 1.12
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
Cc: Stephan Hoffmann <sho@relinux.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/google/googletest/releases/tag/release-1.12.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gtest/gtest.hash | 2 +-
 package/gtest/gtest.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gtest/gtest.hash b/package/gtest/gtest.hash
index d21fea7142..1a93684aeb 100644
--- a/package/gtest/gtest.hash
+++ b/package/gtest/gtest.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b4870bf121ff7795ba20d20bcdd8627b8e088f2d1dab299a031c1034eddc93d5  gtest-1.11.0.tar.gz
+sha256  2a4f11dce6188b256f3650061525d0fe352069e5c162452818efbbf8d0b5fe1c  gtest-1.12.0.tar.gz
 sha256  9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138  LICENSE
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 8ec5e9c535..f3f3f9c296 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GTEST_VERSION = 1.11.0
+GTEST_VERSION = 1.12.0
 GTEST_SITE = $(call github,google,googletest,release-$(GTEST_VERSION))
 GTEST_INSTALL_STAGING = YES
 GTEST_INSTALL_TARGET = NO
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
