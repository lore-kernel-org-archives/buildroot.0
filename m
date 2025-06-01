Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E106DC5B552
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 10:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CF2641E3E;
	Sun,  1 Jun 2025 10:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SxFpd4OjPZkv; Sun,  1 Jun 2025 10:42:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C907141E2D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C907141E2D;
	Sun,  1 Jun 2025 10:41:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C4516222
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9EAB818EC
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rDqgGFJOD61L for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 10:41:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B3153818AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3153818AC
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3153818AC
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:41:54 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-54998f865b8so3307527e87.3
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 03:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748774512; x=1749379312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XW2u1k2DblgwmnudVJr2slKx3Gbkf07MR7RZ6wpxEL0=;
 b=LdHvkehwxfJPqWtw6n73B4r5h9t7DG+fqDLmPAbLuFU/013YUbNAIvVYn5o2mM5sF2
 MR5qp6Zg27zvJ3VDmUH3JSljeV4cYdhh/9bl/LSsRFOqfz+UM5XRyC31sHmvxFc+SlKN
 adtToPhE7Fjomu66GXUQ+PBO8TkWSdY189Y8MQl/NgfWl2CNjvq+p3z5WGa33OeMAdXv
 4LvNgGONBuqc7KIB9wHjTAjzMfJVsl9ORL8xZyAKN6OpyJMp8YGlOARekjfhIc5l7U6e
 u4KT5e9sixABGbqrw0iSIzpVBJt5jehyNtrGeeoWO87J+zcd2IGdpeMNie7RPVwxduDK
 K6cQ==
X-Gm-Message-State: AOJu0YzvnQsbAN0gN31twdqDHBOG2hrnYEO2SUH7tvI1JXutuns6Evgi
 roVteXNVt0lfPGXoTdkcAUSUgkH3IRq7OAvbFskTBG846K/T/67CLsjYWfwOkQ==
X-Gm-Gg: ASbGncucgaG7c0lf++UYxscRgiyWlqffIO9ncvHGfYdMgZZYk4EVhn28afiNLn3vPTU
 k37uEpq7hTkR2rZKVOeFTIhW9Fjpsq1w1hucdggXRpAI+aREguMRuCfzXVNr2tGl74O2OrA4s4h
 lI453w2s+ykx7hBa3MIP4DxWFaTyIHfU1BdZfsmTyrL7H2oA2K2Ne20prWFY4FpwuPzcACLC5F6
 JEIfSabfGvILLsYSdKSDbFMFlHM7a0O8DstkbC2LERQA3a3Zf7g/yiqWuwQL52D8+UEzWWi8Hg/
 mnl1OwNaEsq6Vx1md9QTvAuN4XygY+VqfwEdEVeJ1zYlO/xMk/1q9kxB5KsDb82xYI3lyOsri0X
 G3vAZ4BCfzA==
X-Google-Smtp-Source: AGHT+IEryJnSbgg7LEgAxeqDPhThf/jL8yuBaEy4COtMxrbWFPbV2lgLN0f8bkN6ioejwGhet3Swyw==
X-Received: by 2002:a05:6512:220b:b0:553:2dce:3aad with SMTP id
 2adb3069b0e04-5533b8e0fd7mr2971285e87.7.1748774512292; 
 Sun, 01 Jun 2025 03:41:52 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553379378easm1266670e87.240.2025.06.01.03.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 03:41:51 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Jun 2025 12:41:28 +0200
Message-ID: <20250601104133.3238551-7-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601104133.3238551-1-roykollensvendsen@gmail.com>
References: <20250601104133.3238551-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748774512; x=1749379312; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XW2u1k2DblgwmnudVJr2slKx3Gbkf07MR7RZ6wpxEL0=;
 b=TfBSyAbLHIf8uIVZVziVRdQBZL3aCHDT7v6UqgdPvpIzmgAJBVk24WQCRUgCilvgOB
 2kEAt/6A3oQeZY07atKmvdhSGLfpu5Ae2/r/jn5E26atsoMe8diLt7o56D1w0ZE0O7kh
 8f3r/H7orotx7CSAjoTxLCIf36J7/ihYGOUBBm11Q74Zrtwi9Q1CBypbUqy8RbvbYQ0B
 vAka9DQvx8B05dTKG7auMyMoRtTmtO9kukb1Mw16UthmqFXfMjWw66aP6CIUmn40+j0R
 3mKqYdGd8p7NPrORZZHeMItP6XOb05Qwx1ZBETFbk15kPZhlBWIOOt22JpkHfb8cQa0k
 2hbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TfBSyAbL
Subject: [Buildroot] [PATCH v4 6/6] package/qt6/qt6speech: new package
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
