Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8F3C4345F
	for <buildroot@archiver.kernel.org>; Tue, 16 Apr 2024 14:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F437407BC;
	Tue, 16 Apr 2024 14:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wEi2kSBEgSQx; Tue, 16 Apr 2024 14:27:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F0E3407B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F0E3407B3;
	Tue, 16 Apr 2024 14:27:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 363591BF27C
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 14:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22CA7400D8
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 14:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qTrR3TkQeFuH for <buildroot@lists.busybox.net>;
 Tue, 16 Apr 2024 14:27:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AF58540065
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF58540065
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF58540065
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 14:27:31 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-518f8a69f82so2283079e87.2
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 07:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713277649; x=1713882449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OwTtSSpazCTmU2bhvFTAhnWgQFt0eDQzIGO3VTdOwfI=;
 b=W027NJ7IXnznHR6n75pTd/+smAQwxHdSwmE80ZaCTQjPQRRb2JRmnzEA/f8Z+PYzkL
 mACFPJF7ybMMk5lqG6x9rS/C7JlcWYAcUbzXysw8WbmR8uM25EwJtwNn/sbzsUYajUd1
 RTLpRlms4GVLVuskqpxVDNgqe+GEhFbjvSgjWyFPV1N28xneRvqe2tYO4jdA1xyKDnlr
 0ypoVVy+IH8mkJ50AuR3Hslf1C7Qm88UkQGIRc3v7O0kKIiQt05J8k0yZu6itVhrtu5t
 Zsv7rX02clyKxR9Rtm4d1waAoodG77BWwDMXMEYP8Ktz800KZhDchx0ss6/3yf1G3osq
 hh4A==
X-Gm-Message-State: AOJu0YyRJucD2+B2kWNj6O8nCA+JkqpSAA1AoPibUXmNAWNThH4CwDuc
 /suk+9VGpxl/Oje1GxefQBtTTz2XnuQRQ+3/C6Wuu/lwkUrxgzqmPK+JSgZX
X-Google-Smtp-Source: AGHT+IEZHMVObH0DtBgKJ9jYu0UPGk0bIAi+U+4ETYrKNmscOoxeP4l6TP2AH22lH55cgKxmfrc7pQ==
X-Received: by 2002:a19:e042:0:b0:512:f6a0:1311 with SMTP id
 g2-20020a19e042000000b00512f6a01311mr9901583lfj.47.1713277649168; 
 Tue, 16 Apr 2024 07:27:29 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a196453000000b00516b0051e6esm1629403lfj.231.2024.04.16.07.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 07:27:28 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Tue, 16 Apr 2024 16:25:59 +0200
Message-ID: <20240416142620.1751773-5-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416142620.1751773-1-roy.kollen.svendsen@akersolutions.com>
References: <20240416142620.1751773-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713277649; x=1713882449; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OwTtSSpazCTmU2bhvFTAhnWgQFt0eDQzIGO3VTdOwfI=;
 b=fxUUtMePjzvYgpMLwvCMyAUOGQ9n0963bcQwH+dSNUrWX/Nh0VBGDHM/lUmTMBDjI2
 yNMtMngDMqsI8Wr3H46nLjsgAT3p13ii2WKR4liBYEvMf1sdiHeXSt8x5dL7jaw/eiU2
 et2bbUyc5YHGIk36b9AK51yK2vClmw1VXaosCNJsiIJmgzQgsgxjv+GySGmyoPr0Hndn
 5QUgbE+2CC8naDiwrte6y8QaCJkjW+4vyQHK4/arJYZ/1o2euxF4S77iU4H/KK0pCT6n
 LFvpQG4qBcA+2ljC/ctQ53CE3vu/luxGwW8HJCKOHFX73QAe2pEFyKVqsuJ6+lZBsfdY
 1KMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fxUUtMeP
Subject: [Buildroot] [PATCH 05/11] package/qt6/qt6languageserver: new package
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
---
 package/qt6/Config.in                         |  1 +
 package/qt6/qt6languageserver/Config.in       |  9 +++++
 .../qt6languageserver/qt6languageserver.hash  | 11 ++++++
 .../qt6languageserver/qt6languageserver.mk    | 34 +++++++++++++++++++
 4 files changed, 55 insertions(+)
 create mode 100644 package/qt6/qt6languageserver/Config.in
 create mode 100644 package/qt6/qt6languageserver/qt6languageserver.hash
 create mode 100644 package/qt6/qt6languageserver/qt6languageserver.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index b7e95a6885..81682af476 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -45,6 +45,7 @@ if BR2_PACKAGE_QT6
 
 source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6core5compat/Config.in"
+source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
diff --git a/package/qt6/qt6languageserver/Config.in b/package/qt6/qt6languageserver/Config.in
new file mode 100644
index 0000000000..8a54ae1911
--- /dev/null
+++ b/package/qt6/qt6languageserver/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_QT6LANGUAGESERVER
+	bool "qt6languageserver"
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6languageserver module.
+
+	  https://doc.qt.io/qt-6/qtlanguageserver-index.html
diff --git a/package/qt6/qt6languageserver/qt6languageserver.hash b/package/qt6/qt6languageserver/qt6languageserver.hash
new file mode 100644
index 0000000000..2d40426c6f
--- /dev/null
+++ b/package/qt6/qt6languageserver/qt6languageserver.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtlanguageserver-everywhere-src-6.7.0.tar.xz.sha256
+sha256  a99ecb342abdf7b7ac24804c89830a7991de95f9402f45a1e337ae851f76c9fc  qtlanguageserver-everywhere-src-6.7.0.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6languageserver/qt6languageserver.mk b/package/qt6/qt6languageserver/qt6languageserver.mk
new file mode 100644
index 0000000000..6f96feb275
--- /dev/null
+++ b/package/qt6/qt6languageserver/qt6languageserver.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# qt6languageserver
+#
+################################################################################
+
+QT6LANGUAGESERVER_VERSION = $(QT6_VERSION)
+QT6LANGUAGESERVER_SITE = $(QT6_SITE)
+QT6LANGUAGESERVER_SOURCE = qtlanguageserver-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6LANGUAGESERVER_VERSION).tar.xz
+QT6LANGUAGESERVER_INSTALL_STAGING = YES
+QT6LANGUAGESERVER_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6LANGUAGESERVER_CMAKE_BACKEND = ninja
+
+QT6LANGUAGESERVER_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0, GFDL-1.3 no invariants (docs)
+
+QT6LANGUAGESERVER_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt
+
+QT6LANGUAGESERVER_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6LANGUAGESERVER_DEPENDENCIES = \
+	qt6base
+
+$(eval $(cmake-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
