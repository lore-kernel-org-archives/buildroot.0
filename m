Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5592C3ABDD
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 10:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74B584154F;
	Thu, 15 May 2025 10:37:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y6iH7aTwP5Pa; Thu, 15 May 2025 10:36:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E0AE40896
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E0AE40896;
	Thu, 15 May 2025 10:36:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 792A513D
 for <buildroot@buildroot.org>; Thu, 15 May 2025 10:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B18940134
 for <buildroot@buildroot.org>; Thu, 15 May 2025 10:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FhFHTLGgh4zP for <buildroot@buildroot.org>;
 Thu, 15 May 2025 10:36:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 478E7400C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 478E7400C8
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 478E7400C8
 for <buildroot@buildroot.org>; Thu, 15 May 2025 10:36:56 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-54d6f933152so942075e87.1
 for <buildroot@buildroot.org>; Thu, 15 May 2025 03:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747305414; x=1747910214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XW2u1k2DblgwmnudVJr2slKx3Gbkf07MR7RZ6wpxEL0=;
 b=qwvZvFViZhFPm2iWJsobUGU314+w4eUXlWAMx/lsUnUN+JzMCzRTk0kbAbBAIrimmA
 3z4diPoAVsV5d4OzRb3ghk2lsmV3rB9mIh+QqRcBDq0T8SaRjtSifQilpUHmfnjZWOmj
 mGHRdO0xJkr9PvdK7ozOITEseYJgoOXT/QoSDbOlWCMYdjo4wiwueqqQCp00t7KyvHLx
 ZQ5OQCjHsBvtyiCOXAKeGfYpxexTaBOw6Spa5PNTDJLcwHz03VA8m7uJU3PRXHWV5IKt
 Vt/j92kgDUtRz+wihW8NHl4wVkswNbOzSE1jUbI45qb7pDpcP6tlKbbBIJVNX99gH0g7
 kf5A==
X-Gm-Message-State: AOJu0YyTtfpUDNT+lX3SZzIgjrLMp6S3rXqDUrd4BF5hkA0UB2ozaO7B
 WKQPdGF1u9vacA3oPaWShzKsHMc5OpQR0tW3hF+aUzbbkKhwaKLuYcaDEQ==
X-Gm-Gg: ASbGncsPrpYxDTydOmQ1F69kwOtjXpbmK+J9PiBvJOmh8o45zr8loB2nXMtgvCEkbak
 gNekn+vt8SE9Q8OewN1Lc8GQiYYJbwtCpGRzo9s+vMNaj+unq6fLUcAxsQ8dXnrP5U4qTYfO4iK
 soJUx14uB4XRyERSp3fnSHHPM+ADDzKoIFzqaEiOis29QshtjaN3at1X2IobhkrOn95FelFo167
 FcVjEcTmT6cHLEJ47tZaa9dxSMlqp9o8LwmLhmxvShHPhUf8zbndJ4BnDWM644k2LjotLTyy5uZ
 OnMmHeO/d54i9/Pn4OacpHpqMAIvxC9wAo4nCY+KBxEO0jF+Rdyl150EejxKxJV1x1W4LAjyBAT
 098JrOw==
X-Google-Smtp-Source: AGHT+IHtHSsC9FaYC7EmS3q1+kLPtQ0HSwpJpLaVPnPl53zqw5E7r1qbO2vK5pLCzzfZU5ivPAZmMw==
X-Received: by 2002:a05:6512:2314:b0:54a:ca65:7dbe with SMTP id
 2adb3069b0e04-550dcff31cfmr752980e87.11.1747305413946; 
 Thu, 15 May 2025 03:36:53 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc64cbf3fsm2571603e87.211.2025.05.15.03.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 03:36:52 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 12:36:22 +0200
Message-ID: <20250515103632.2631227-6-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515103632.2631227-1-roykollensvendsen@gmail.com>
References: <20250515103632.2631227-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747305414; x=1747910214; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XW2u1k2DblgwmnudVJr2slKx3Gbkf07MR7RZ6wpxEL0=;
 b=YclRuKalOsrb4Z36JLuzyMlrfLMNAuXnIFp8sW6hsFaxrqkA31YempBn1oDPWj35Us
 SRJi3afvZgVALxZ8dCY4NOOoPmMYbHHLKNzWQHtpsraELXnGUd+U/8lLsEXeK1EqMKw+
 Xh6t6HIQCxhTgfiwHLpwFZdi1EKTPl4XAAHGGBoo7wa3ml+dBDkGJLJOUm3CmliHypFv
 kmLQ3xFOCSneUEnUoAI+C42MIoKE89+ELvq51hLYMxVNj4aYqLBl4rWxbdGWAbyICkC4
 uGKG1c0WnzZInZ/8U+WxRinABQADGL/LzHaGn7Blv1LiCObXT6sulpBSUSiPYT0p2k3t
 I8Zg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YclRuKal
Subject: [Buildroot] [PATCH 06/10] package/qt6/qt6speech: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Christian Hitz <christian@klarinett.li>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/Config.in                |  1 +
 package/qt6/qt6speech/Config.in      |  8 ++++++
 package/qt6/qt6speech/qt6speech.hash | 10 ++++++++
 package/qt6/qt6speech/qt6speech.mk   | 37 ++++++++++++++++++++++++++++
 4 files changed, 56 insertions(+)
 create mode 100644 package/qt6/qt6speech/Config.in
 create mode 100644 package/qt6/qt6speech/qt6speech.hash
 create mode 100644 package/qt6/qt6speech/qt6speech.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 05f0540db0..4251b134d4 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -62,6 +62,7 @@ source "package/qt6/qt6sensors/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
+source "package/qt6/qt6speech/Config.in"
 source "package/qt6/qt6svg/Config.in"
 source "package/qt6/qt6tools/Config.in"
 source "package/qt6/qt6virtualkeyboard/Config.in"
diff --git a/package/qt6/qt6speech/Config.in b/package/qt6/qt6speech/Config.in
new file mode 100644
index 0000000000..3bcadd799e
--- /dev/null
+++ b/package/qt6/qt6speech/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_QT6SPEECH
+	bool "qt6speech"
+	select BR2_PACKAGE_QT6MULTIMEDIA
+	help
+	  This package provides the Qt TextToSpeech module:
+
+	  https://code.qt.io/cgit/qt/qtspeech.git
+	  https://doc.qt.io/qt-6/qttexttospeech-index.html
diff --git a/package/qt6/qt6speech/qt6speech.hash b/package/qt6/qt6speech/qt6speech.hash
new file mode 100644
index 0000000000..139d6e7abe
--- /dev/null
+++ b/package/qt6/qt6speech/qt6speech.hash
@@ -0,0 +1,10 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.0/submodules/qtspeech-everywhere-src-6.9.0.tar.xz.sha256
+sha256  a981b68c71743d77a3ce4437ad118d3851390f05a1ab26a859fb9b8c5938c971  qtspeech-everywhere-src-6.9.0.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
diff --git a/package/qt6/qt6speech/qt6speech.mk b/package/qt6/qt6speech/qt6speech.mk
new file mode 100644
index 0000000000..5df2ce8155
--- /dev/null
+++ b/package/qt6/qt6speech/qt6speech.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# qt6speech
+#
+################################################################################
+
+QT6SPEECH_VERSION = $(QT6_VERSION)
+QT6SPEECH_SITE = $(QT6_SITE)
+QT6SPEECH_SOURCE = qtspeech-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SPEECH_VERSION).tar.xz
+QT6SPEECH_INSTALL_STAGING = YES
+QT6SPEECH_SUPPORTS_IN_SOURCE_BUILD = NO
+QT6SPEECH_CMAKE_BACKEND = ninja
+QT6SPEECH_LICENSE = LGPL-3.0 or GPL-2.0
+
+QT6SPEECH_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/LicenseRef-Qt-Commercial.txt
+
+QT6SPEECH_CONF_OPTS = \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF \
+	-DQT_HOST_PATH=$(HOST_DIR)
+
+QT6SPEECH_DEPENDENCIES = \
+	qt6base \
+	qt6multimedia
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6SPEECH_DEPENDENCIES += qt6declarative
+endif
+
+$(eval $(cmake-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
