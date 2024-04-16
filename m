Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329D2C4345F
	for <buildroot@archiver.kernel.org>; Tue, 16 Apr 2024 14:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0DEA407B3;
	Tue, 16 Apr 2024 14:27:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cxku6ryW2sus; Tue, 16 Apr 2024 14:27:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BFD2407BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BFD2407BA;
	Tue, 16 Apr 2024 14:27:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68E411BF27C
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 14:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55A5540346
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 14:27:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQCu2MvX0zrc for <buildroot@lists.busybox.net>;
 Tue, 16 Apr 2024 14:27:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE07B4081A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE07B4081A
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE07B4081A
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 14:27:36 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-516db2214e6so5536145e87.1
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 07:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713277654; x=1713882454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XlgDQmPJma4IjMuHnuUml9+af+94MwIcuowRe8q7w3w=;
 b=pST/Vz5+AR0HEc718WJU6u1ADV4sDT7iEHa5jddu/nV8weI7dWfnfEZ6v/qBtT8JO5
 FgZaBzANwTUBpGCP5xNjg+cBdQUVmlvS+SyobTAPUO7nxJIFXWxWjbN6gjRg2mfGprbU
 r4zCtZQ5as739glherCc67E/J5QcSyCScy/vHqxOdFWXPZszViuYmyn7iYoyuCaSjuUo
 j85CZELjeJ526FY7o23MAVKQgRgybD+VAy3L3j09xeStrBUne9jZmhpJwbM76gs7W0DR
 9TUSKe+xwmNP1M8XuNHCsmQVmxrFxHNSm/EjBgxhrecUJm3hQ0FlYp92lcl/y66RS+0k
 Uh8A==
X-Gm-Message-State: AOJu0Yy7FENcWnkj/lp6D02qYS7mZqZHTkbNQWY62aBWLo+KKY0ZfSbW
 yxWCUECISgEBtkFFwQ+ujPYdSa+Ax4etWBTRU48BucfcsLjju0+iNKDg1W0/
X-Google-Smtp-Source: AGHT+IE/1gbJCJ7cv7r95HFSMVGeeegRJZK0kbpSAaGFH0MLVxtVLK9MxxV7QU4fFx5nec+B0bkZmA==
X-Received: by 2002:a19:6406:0:b0:516:afeb:e27e with SMTP id
 y6-20020a196406000000b00516afebe27emr7457060lfb.29.1713277654297; 
 Tue, 16 Apr 2024 07:27:34 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a196453000000b00516b0051e6esm1629403lfj.231.2024.04.16.07.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 07:27:33 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Tue, 16 Apr 2024 16:26:01 +0200
Message-ID: <20240416142620.1751773-7-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416142620.1751773-1-roy.kollen.svendsen@akersolutions.com>
References: <20240416142620.1751773-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713277654; x=1713882454; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XlgDQmPJma4IjMuHnuUml9+af+94MwIcuowRe8q7w3w=;
 b=eehYyqKbUW0lsQIQbVASFJllsO/xWYXGNXVLS2BlzrA6tGeofyvXKY8MHWb8oCVQI2
 1Y5zvwUSs63rPlAQy12HLxkZTe39YwQ1fIYmXemv3FqCzRjEFwBjZxGIWiuogr4zEU8K
 UEo98Wtdy3tz+4CrONP6cNT3oUR18Y3XLFqbHf5iPAQMly8k58ZY8FVV2Ezi5fhVdjM9
 LUZjnUZ2ZJX3dL4hi3KbEX0ByJn/qspeTipPyotrb1n+VI7u4OrNopJObdUjkdjM3sny
 nbot+Lh+2RlGYHw82M1py2VGxk3QHctGCe4n4Dozm/5l5U3QCDa+WfuzDwBkfs9zeuSD
 YHHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eehYyqKb
Subject: [Buildroot] [PATCH 07/11] package/qt6/qt6websockets: new package
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
 package/qt6/Config.in                        |  1 +
 package/qt6/qt6websockets/Config.in          |  9 ++++
 package/qt6/qt6websockets/qt6websockets.hash | 11 +++++
 package/qt6/qt6websockets/qt6websockets.mk   | 46 ++++++++++++++++++++
 4 files changed, 67 insertions(+)
 create mode 100644 package/qt6/qt6websockets/Config.in
 create mode 100644 package/qt6/qt6websockets/qt6websockets.hash
 create mode 100644 package/qt6/qt6websockets/qt6websockets.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 625134d281..16f792cff3 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -51,5 +51,6 @@ source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
 source "package/qt6/qt6svg/Config.in"
+source "package/qt6/qt6websockets/Config.in"
 
 endif
diff --git a/package/qt6/qt6websockets/Config.in b/package/qt6/qt6websockets/Config.in
new file mode 100644
index 0000000000..a201483922
--- /dev/null
+++ b/package/qt6/qt6websockets/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_QT6WEBSOCKETS
+	bool "qt6websockets"
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6websockets module.
+
+	  https://doc.qt.io/qt-6/qtwebsockets-index.html
diff --git a/package/qt6/qt6websockets/qt6websockets.hash b/package/qt6/qt6websockets/qt6websockets.hash
new file mode 100644
index 0000000000..4e36eb4257
--- /dev/null
+++ b/package/qt6/qt6websockets/qt6websockets.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtwebsockets-everywhere-src-6.7.0.tar.xz.sha256
+sha256  5ffc77da6b36cdf18e04c975a0fbf243968806a93a6291bcd2e9cd0b26139736  qtwebsockets-everywhere-src-6.7.0.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6websockets/qt6websockets.mk b/package/qt6/qt6websockets/qt6websockets.mk
new file mode 100644
index 0000000000..cc17085d10
--- /dev/null
+++ b/package/qt6/qt6websockets/qt6websockets.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# qt6websockets
+#
+################################################################################
+
+QT6WEBSOCKETS_VERSION = $(QT6_VERSION)
+QT6WEBSOCKETS_SITE = $(QT6_SITE)
+QT6WEBSOCKETS_SOURCE = qtwebsockets-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6WEBSOCKETS_VERSION).tar.xz
+QT6WEBSOCKETS_INSTALL_STAGING = YES
+
+QT6WEBSOCKETS_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6WEBSOCKETS_CMAKE_BACKEND = ninja
+
+QT6WEBSOCKETS_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0, GFDL-1.3 no invariants (docs)
+
+QT6WEBSOCKETS_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt
+
+QT6WEBSOCKETS_CONF_OPTS = \
+	-DQT_FEATURE_thread=ON \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+HOST_QT6WEBSOCKETS_CONF_OPTS = \
+	-DQT_FEATURE_thread=ON \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6WEBSOCKETS_DEPENDENCIES = \
+	qt6base \
+	qt6declarative \
+	host-qt6declarative
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
