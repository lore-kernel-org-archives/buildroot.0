Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83706C3DA6D
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 11:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 481F281A23;
	Tue, 20 May 2025 11:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ko8_RCeRbmvK; Tue, 20 May 2025 11:34:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BF94819FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BF94819FC;
	Tue, 20 May 2025 11:34:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E7A7193
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38959402D1
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJloSUh3oK5S for <buildroot@buildroot.org>;
 Tue, 20 May 2025 11:33:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 17704400C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17704400C8
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17704400C8
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:33:56 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-317f68d0dffso68446791fa.2
 for <buildroot@buildroot.org>; Tue, 20 May 2025 04:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747740835; x=1748345635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XW2u1k2DblgwmnudVJr2slKx3Gbkf07MR7RZ6wpxEL0=;
 b=NugziUqBOPq751ff5uB5AF9BwSstfspTDDNLbuUk2dIwv/EIVFmwdc/+Kn7vjodtnY
 Kd4kaAQ2oytq2nH9rKegwaWc7ZSjrpqGUI2rVBfFSX2rGMkL2hwkmjk0xt9K+JONkDfM
 vCieqC8Ij+rtUgAKp9c/fOiCR59mvALP6GDNUT8et3yyJQRa7BRa+Md1GSvfIMGRBwFY
 DkHiseYod6vw4l3BKt67fbfNwcgcgXwAHd2RQp41d1j9wukbHw4khShKM8pWvWA/dgm8
 WZKYiGz8+8FFDEf44qt+z2dXhz5etCwBCTQiPga7U8f+BqMVO1rWOW+IgJOUl1+KZm3y
 rYbw==
X-Gm-Message-State: AOJu0YwVLl9eJX38zSXoRB+ys/nNOx4O3387BGAzbeLIfsUo39gka8Rq
 +nce91+H1ykvMEtYnZtOd8Te7XCbURu2v1rdwrkdtvXal5hEwyBGaCb1ydqebQ==
X-Gm-Gg: ASbGncsPhKTMlnp/I3af9pt06uE1NCiYS1+WXgwC/9g8R9rGgz3JKxNXIOjatKr6+Ex
 mOTRuoDJE2cc3H6TIyGBAAI5ubkPTnWb+ntLjRlg8WhTJhgYJFNb2a9iVjJNX4jAnUaWTLMoszm
 ZDlxNWYCtRxTR3qNo3X+RKLJAmYMnmJcOZKLhE+ElnN8r6TT7XW3RaxihL1a1Zuudf6KFtxyjnj
 YOVBqJJnct4aVYeO8q1pnukwXNWZUqBx6K3IRUj2k8JAUNZqROvJndSseLBu7/qeP5CbRwSWycT
 +0aGq0WiUpfCOCtZjRpI/koLkGt0Ej48QFaLBUp6HF2YaImqq7mlVlCyNfiYAYDlfEiixmWwQfX
 GD6K4zA==
X-Google-Smtp-Source: AGHT+IFK7WqWkDEZSVzqt5QefsQJqrDq1Fzuyr/Fl+6ho5ozE86TRe9Ud4pnEODXQY0hBx+W6WRHbg==
X-Received: by 2002:a05:651c:19a4:b0:31e:261a:f3d6 with SMTP id
 38308e7fff4ca-32807759020mr57185661fa.23.1747740834600; 
 Tue, 20 May 2025 04:33:54 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085b8bdfsm23324841fa.76.2025.05.20.04.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 04:33:54 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 May 2025 13:33:25 +0200
Message-ID: <20250520113339.2525537-7-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
References: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747740835; x=1748345635; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XW2u1k2DblgwmnudVJr2slKx3Gbkf07MR7RZ6wpxEL0=;
 b=YLQlKdkTik62xD4+IisDxRoiUL8lVmRqoy4bWfVMdHYMfjyYv1wGUifs7GoHWYhpbk
 ceWqQNi+n/abjQTDAez21qj+UzG3j1a0eeSwGP2tQ0iPQVHIH4GcWI2EQGBClAe/50qD
 rJ84ItEUebcHUFfy5ZkhaMj+CzONQjtz7VZ3v5sDRnyB1zoIR3+dcXjXFYS2SAP+jvYg
 WGURYO4C5PIYgskrjvGZQU9qxhoz/ZRcnJ1wJBCsF2h1H2a5pnk8gb/PlzsGNcFUdlAv
 CytgXUHbixw+yHrU+N+nndzk9DnbGTO403hp2BKAxr7h4QfeMY/xgwIbjqT6mmgFJKJB
 jmKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YLQlKdkT
Subject: [Buildroot] [PATCH v3 06/12] package/qt6/qt6speech: new package
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
