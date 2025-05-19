Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8340C3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 21:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 653CA40DF5;
	Mon, 19 May 2025 21:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11yl_ltxy51Z; Mon, 19 May 2025 21:06:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EE79410B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EE79410B4;
	Mon, 19 May 2025 21:06:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 30AE3196
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D03FB60FE2
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9zEyhuW1sZ4C for <buildroot@buildroot.org>;
 Mon, 19 May 2025 21:06:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A2BAA60FC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2BAA60FC2
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2BAA60FC2
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:17 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-32805a565e6so46942701fa.1
 for <buildroot@buildroot.org>; Mon, 19 May 2025 14:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747688775; x=1748293575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XW2u1k2DblgwmnudVJr2slKx3Gbkf07MR7RZ6wpxEL0=;
 b=XnD+e1kDLDqyVbzldnNBVd3gCP/PtT8kGaxS6KK0KDMed817nUZ8pCfUeqmUFsNKvR
 qDQmKlcXj/gkcfm5u71GJUqpOPtCQDbi6EWUZg2RZjpd5gvgKqWDlRIHgcymtC4xfyJh
 IX8OkpwAtoePi+a4HCXzc7oXJKZQoFJwCO4JC+0u+yx59jb/xnEtzMySF9OdE6oqz05X
 jwwa0PHPj6FbY5xFIZOpfd9fGsWewCR4GyS481/UNAEMINIrT+2SbKOaPkbGmLbr/4Ei
 j/YyCqpKvJM0nDdp24tlW5VigMxl8pxciBRjzfRzbUN498niDEo0nw09jU5teZBv81xH
 X5Lw==
X-Gm-Message-State: AOJu0YwQ1rluRWgW5hQeus+otvM3nGDh8senH2jIaM0yadygzNPaEn9o
 FjyoQvRLDcuKvd04mZCx7Ua5kj+WMs3lYZkG20ytSCMTrjY4TVP04cF9v8MlWg==
X-Gm-Gg: ASbGncsjWUwZdwv94XB06Nq9hoyeKb94zduM9Nfq35ez+z4IekhCTjIkEe26Qi/ic0t
 H4/36BH7Y2EtRIVHyFHzIiedbfF+qgKt3WaZMu2EH3oQnRbyEq8fuq775KQ/oSfNor9PilVuNKu
 nJQQql1GtJQ1/H5fo4pNejwbFKGYjw9dUmR2LYhn1skvqlY+xpzEZkWJUNSZl9kRCydNPYomE9w
 6E/cl0HH0+iNtXLkH5JHeq8wHFj4inpEIAj3lpDtkJtX/n+nbJF1u6sFR4nul6YA8Dz2ldFLsrS
 FiKEnzntwbKfJTK4PzqBTOk8YJ3/0GTKZTsziefHJlmVMx4fF+K/QwlnFSphuCpX8iWcZNVJfWN
 2hxi9fQ==
X-Google-Smtp-Source: AGHT+IGFVNUnclQuCDBJoWaVXpB+R/U1pkNZccxC7GBs9umXtxnqGM/Iv/2jIUgudpl1QI+0xoIQxQ==
X-Received: by 2002:a2e:ae1c:0:b0:30d:c4c3:eafa with SMTP id
 38308e7fff4ca-3280840b4aamr42737771fa.7.1747688774935; 
 Mon, 19 May 2025 14:06:14 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cfaebsm20181171fa.100.2025.05.19.14.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 14:06:14 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 23:05:40 +0200
Message-ID: <20250519210553.265725-7-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519210553.265725-1-roykollensvendsen@gmail.com>
References: <20250519210553.265725-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747688775; x=1748293575; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XW2u1k2DblgwmnudVJr2slKx3Gbkf07MR7RZ6wpxEL0=;
 b=XhFYTff/YbdnFUBU4QR3S3JQWYa8oNPRHxYdkaSUl7AfeGkq5b9y4wOBKcud2m4fFH
 ZUz54qj7bFOA8DmRzLtyHXgmaG9McPA1irTAVneAFvX0W2+FkIgnEhKlzG9vAiRbxJ0V
 ciutRGToIRLZ03X+vacxmHdlEezt0G0eZ6HpKhxCfJfgPCDPguiWOnFu3zqZnpM16Os4
 6Fn2RwdT5iarWn47Q2YL3z2Q7Hl8ENmDH1ONgF0VQ0qUleh+mAGjvx0wM9+/2uMAllYb
 VQAjyc6DguoPSqkPRI8rzUFOtRN8ATbi5Us8F9Icf4fpV1BDP1qcNB24uzfoV3Ffg31Q
 CBVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XhFYTff/
Subject: [Buildroot] [PATCH v2 06/11] package/qt6/qt6speech: new package
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
