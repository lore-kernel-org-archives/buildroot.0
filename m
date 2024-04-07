Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E48CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A7674035D;
	Sun,  7 Apr 2024 19:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGGBBWGD3szp; Sun,  7 Apr 2024 19:29:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8869403AC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8869403AC;
	Sun,  7 Apr 2024 19:29:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 706E21BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AA6460710
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b5SYN4kdQNkL for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:29:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7126860600
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7126860600
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7126860600
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:29:50 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41550858cabso24391645e9.2
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 12:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712518187; x=1713122987;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LTC4WqyuN2c2dDFwGagYP+RhnmBJWJ54hQE+nnf/k7g=;
 b=FDTL/o4D364TRIgUH0tmDKWWN8yPeB/za6CttF6sOI6Yq5rAoQCmBDfV9jkaCNEnSX
 mmvOK0eUlNsCkfoXeaPE6vX1TXhIFStdWs7RgJQDY00xTJBB89E/TN/feBy+p2LKeBNU
 uPC+C0BZxURoDB6PFKBZCIA2o1L9oVNw1jlGOcmpc6/lipXYF6R3vBd2IfbTxSUv0bHM
 RPQarigM+pmy0eLX498vQfrADf3djH1Qs7DI/iIJ1hMTOUw9+SiZDke1MwXD3GRZ7wdo
 TWYiIXAiisMKQ1SMTmGxJvpTgwzbaCKuT0slwhQEqTqyO8I/5V64UGmcc+Xl/Spi+qxK
 tQKg==
X-Gm-Message-State: AOJu0Yx41a0LLhYkZXywBYuU9BCZH2llL9Mjql6FhtCP4UEaxi9A1Ln5
 sIdhwwmAsGKa+ZdEhZpqGvIqsRiINQGoRoFC2uGD98KZhxy95FnF5+mKE7B/
X-Google-Smtp-Source: AGHT+IGBSlVPzsXYauotW2pjIwmlimBvScFMhf2EDv0PsJJkXPkUnc3j6mHh4g17xKo5lzvvCjxGtA==
X-Received: by 2002:a05:600c:a42:b0:416:1d6d:dc6d with SMTP id
 c2-20020a05600c0a4200b004161d6ddc6dmr4802856wmq.40.1712518187373; 
 Sun, 07 Apr 2024 12:29:47 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c468d00b004163059bb53sm9550188wmo.16.2024.04.07.12.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 12:29:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 21:29:44 +0200
Message-ID: <20240407192944.3335886-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712518187; x=1713122987; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LTC4WqyuN2c2dDFwGagYP+RhnmBJWJ54hQE+nnf/k7g=;
 b=mgMWT8+zaQSHvYdFX2phJ1E+laaYPjkUQkW5NsPYapUVIkKFh6YaWAhRQr981vOP9r
 cSdj3abQpYMCZj9+32cOCWt7IbtjB1vabCy8Brb0LY7Smf+VLEIy37yC1iA+TMwPAuoK
 deK7pd3UsX+S0m9mSXla6XC9Cs5YQsbfeWjz8S0KWwk9kkh0zTBg508+Wu0AC5/S36FQ
 R+i/4HQZifRLq+PRlaSy8ePDVE2zN/FxiSSNrfnE6E8kKDelFB/sEt6tz0bDkMJbODKy
 cBFVXhZC+BbWGLCjZ4Sm/pe7y4aCNmPOYLs/L67a8GVlEub/kQAbjAdz69/qrKOvHowj
 NWUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mgMWT8+z
Subject: [Buildroot] [PATCH 1/1] package/opensc: openssl is optional,
 not mandatory
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

openssl is optional, not mandatory since the addition of the package in
commit 8aaa7ecbce1d10cbcd880c3da5e429988f96176a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opensc/Config.in | 1 -
 package/opensc/opensc.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/opensc/Config.in b/package/opensc/Config.in
index 8c6a95a41d..13b085f389 100644
--- a/package/opensc/Config.in
+++ b/package/opensc/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_OPENSC
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pcsc-lite
 	select BR2_PACKAGE_PCSC_LITE
-	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	help
diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
index aa82bd18da..f4dc2206ea 100644
--- a/package/opensc/opensc.mk
+++ b/package/opensc/opensc.mk
@@ -9,8 +9,15 @@ OPENSC_SITE = https://github.com/OpenSC/OpenSC/releases/download/$(OPENSC_VERSIO
 OPENSC_LICENSE = LGPL-2.1+
 OPENSC_LICENSE_FILES = COPYING
 OPENSC_CPE_ID_VALID = YES
-OPENSC_DEPENDENCIES = openssl pcsc-lite
+OPENSC_DEPENDENCIES = pcsc-lite
 OPENSC_INSTALL_STAGING = YES
 OPENSC_CONF_OPTS = --disable-cmocka --disable-strict --disable-tests
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+OPENSC_DEPENDENCIES += openssl
+OPENSC_CONF_OPTS += --enable-openssl
+else
+OPENSC_CONF_OPTS += --disable-openssl
+endif
+
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
