Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DAAE7717F
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 11:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6227081F9E;
	Fri, 13 Dec 2024 11:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8tVcbJvPFqDO; Fri, 13 Dec 2024 11:58:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E04081F57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E04081F57;
	Fri, 13 Dec 2024 11:58:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A8610ECD
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 11:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96F7F40146
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 11:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dm6q9Xq5Tfnj for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 11:58:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6E7BD40003
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E7BD40003
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E7BD40003
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 11:58:53 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-300479ca5c6so14783141fa.3
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 03:58:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734091131; x=1734695931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W5F3kWu36y7twFekSwXefp0a8JnrPiA/XSRbQAtNPw8=;
 b=arX6rSvOZ7iJj7rYvux+F0QkFQeBXZ74u6+nwc3E/4ucbbS0vmHgF+10zkfrAkRGf5
 H6tgNon2LPqDQqu8I9fNSfkhoB6iZBEnHhuuzeZ9QhusUwP65oa2NyHcYj7VCJOvPH0d
 3QDPmNUuo6dQvP9O7gevu4/gYazPTb9lQ6aIucVONdpC3GdzULEOlQH+vK+DdQT+4uP0
 xpIXGZN4eyzLSpk83hf5zQQgf4BZefzzHYzupioCG3iq0z8c3G37gCzMRCsS4SVPy7K6
 skGUwQpQZ/ZVGvOGhPEg2zjsS5PTxcDJ4QGEqEZT+Z5lC1nUJzJyAizv4qnh8h6MfA++
 Yaog==
X-Gm-Message-State: AOJu0YxKnGAYYpuVE9k6QN8JGhFKNvSSLtw4nxX8AQbsQE1PYCbuT52Q
 ZRNsNOiwzcTBvD+p9h8mSLuXomP5NQQPIiMhKdQ0agu6kCKbXU/82Bs4Aw==
X-Gm-Gg: ASbGnctn8ek5Ld3TrUedQbPmizg71f+qwYz+SZBEI3vHks1x30VTVPwb3wQ2N/qtT6Y
 jB+HK9Ji1WmiVoAvMz5r5/RwH3RKENldEYFQBz9Kw/GVNteZlYBDNrUiwsENm1w+xlYu6xicRuL
 aIEDB8w554BqFziKHy2T0vTT7a3iqa0dXswuyrh9A0geg6zSrJn5A7GHfTiGzo0sSGaxe1mEMDY
 Kht45Fh6OHt2PDpHQLKdVf8ecXKvTzUMUzRiPUA91ecWmLO9nDRDOuY5OINoBGYnF0Hzmy4DHdz
 wGMGTuhdfxIRqt0=
X-Google-Smtp-Source: AGHT+IHjB3nhY7tyRd/rtaWmxLXvtvtPw8JR5y2t2lNZN7vQ9zlpssOGZlWCc3liCh27bT4l0omdCQ==
X-Received: by 2002:a2e:bc12:0:b0:302:4130:e0c7 with SMTP id
 38308e7fff4ca-302544267c6mr7391081fa.5.1734091131026; 
 Fri, 13 Dec 2024 03:58:51 -0800 (PST)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30038ce97b4sm20610651fa.118.2024.12.13.03.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 03:58:49 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Hitz <christian@klarinett.li>,
 Andreas Naumann <ANaumann@ultratronik.de>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Date: Fri, 13 Dec 2024 12:58:13 +0100
Message-ID: <20241213115820.655993-6-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241213115820.655993-1-roykollensvendsen@gmail.com>
References: <20241213115820.655993-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734091131; x=1734695931; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W5F3kWu36y7twFekSwXefp0a8JnrPiA/XSRbQAtNPw8=;
 b=BxRnRoIu6t2G0I2I5umKDK2o6nd+9CzQechktxipe4pEqOxUsF7C9QxnHnJIsDW+wh
 WwMdmreSdLeSiQdBeqXvttwJS8XRw35hgoDJbDzM3LJ+JjXFaC7vTh5Uq22Kj2YbRWIo
 KrbfN6lDvF6wl8g0papmgkwLvu8XkSyI20QKhTLvNdJjojt6IxfSuOc1hkdN8Dja72Mm
 Esa6ZDtDj7YA21FzKfongjmfWx+gmsvanXBQ45w8QFfex1oWUHi2v6gZEnObiXtnV4bS
 2DcRmySCyD7e16izZzycpdaC5+0uTAZfVOns7qGjIIzhSEU86WCnoYNsvUTrWbCJtcZG
 5sog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BxRnRoIu
Subject: [Buildroot] [PATCH 6/8] package/qt6/qt6quick3d: new package
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
 package/qt6/Config.in                  |  1 +
 package/qt6/qt6quick3d/Config.in       | 10 +++++
 package/qt6/qt6quick3d/qt6quick3d.hash | 14 ++++++
 package/qt6/qt6quick3d/qt6quick3d.mk   | 62 ++++++++++++++++++++++++++
 4 files changed, 87 insertions(+)
 create mode 100644 package/qt6/qt6quick3d/Config.in
 create mode 100644 package/qt6/qt6quick3d/qt6quick3d.hash
 create mode 100644 package/qt6/qt6quick3d/qt6quick3d.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index b1616495a6..2a5f5a4511 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -50,6 +50,7 @@ source "package/qt6/qt6declarative/Config.in"
 source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6mqtt/Config.in"
 source "package/qt6/qt6opcua/Config.in"
+source "package/qt6/qt6quick3d/Config.in"
 source "package/qt6/qt6quicktimeline/Config.in"
 source "package/qt6/qt6scxml/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
diff --git a/package/qt6/qt6quick3d/Config.in b/package/qt6/qt6quick3d/Config.in
new file mode 100644
index 0000000000..c4b8148039
--- /dev/null
+++ b/package/qt6/qt6quick3d/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_QT6QUICK3D
+	bool "qt6quick3d"
+	select BR2_PACKAGE_HOST_QT6BASE_CONCURRENT # Host Quick3DRuntimeRender
+	select BR2_PACKAGE_HOST_QT6BASE_GUI
+	select BR2_PACKAGE_HOST_QT6BASE_WIDGETS
+	select BR2_PACKAGE_QT6DECLARATIVE_QUICK
+	help
+	  This package corresponds to the Qt Quick 3D module:
+
+	  https://doc.qt.io/qt-6/qtquick3d-index.html
diff --git a/package/qt6/qt6quick3d/qt6quick3d.hash b/package/qt6/qt6quick3d/qt6quick3d.hash
new file mode 100644
index 0000000000..960cda69ad
--- /dev/null
+++ b/package/qt6/qt6quick3d/qt6quick3d.hash
@@ -0,0 +1,14 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtquick3d-everywhere-src-6.8.1.tar.xz.sha256
+sha256  3f3d345e6c95fcd40ab37e6a37cd31811e5d239dea8e142e632d4ea41bf20ce7  qtquick3d-everywhere-src-6.8.1.tar.xz
+
+# Hashes for license files
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf1fc  LICENSES/MIT.txt
+sha256  c3ed04bcbea49f521e4ab32c638fa86b13ebc7b8e1a8972807265079fcd1e6b9  src/3rdparty/assimp/LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/embree/LICENSE.txt
+sha256  063805e3b8e24ceab4c5dea358b03245ee41c31be87cf65c61d836636cb494bb  src/3rdparty/meshoptimizer/LICENSE.md
+sha256  2af9d14c7cd67f13c3e7e91dcfe15ec5c8af42923635441e0f5a75bcadadeb33  src/3rdparty/tinyexr/LICENSE
+sha256  2c16d5b1c2808277fe975b4f70f0fd9afc9b3bcf04e6c676665a82cb2d5579e3  src/3rdparty/xatlas/LICENSE
+sha256  966313e8129db5d0b3b081d1a50ae107da9a3da2d8faa05899e3042a33192525  src/helpers/GODOT_LICENSE.txt
+sha256  966313e8129db5d0b3b081d1a50ae107da9a3da2d8faa05899e3042a33192525  src/runtimerender/GODOT_LICENSE.txt
diff --git a/package/qt6/qt6quick3d/qt6quick3d.mk b/package/qt6/qt6quick3d/qt6quick3d.mk
new file mode 100644
index 0000000000..246bd2d82d
--- /dev/null
+++ b/package/qt6/qt6quick3d/qt6quick3d.mk
@@ -0,0 +1,62 @@
+################################################################################
+#
+# qt6quick3d
+#
+################################################################################
+
+QT6QUICK3D_VERSION = $(QT6_VERSION)
+QT6QUICK3D_SITE = $(QT6_SITE)
+QT6QUICK3D_SOURCE = qtquick3d-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6QUICK3D_VERSION).tar.xz
+QT6QUICK3D_INSTALL_STAGING = YES
+QT6QUICK3D_SUPPORTS_IN_SOURCE_BUILD = NO
+QT6QUICK3D_CMAKE_BACKEND = ninja
+QT6QUICK3D_LICENSE = GPL-3.0
+
+QT6QUICK3D_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/MIT.txt \
+	src/3rdparty/assimp/LICENSE \
+	src/3rdparty/embree/LICENSE.txt \
+	src/3rdparty/meshoptimizer/LICENSE.md \
+	src/3rdparty/tinyexr/LICENSE \
+	src/3rdparty/xatlas/LICENSE \
+	src/helpers/GODOT_LICENSE.txt \
+	src/runtimerender/GODOT_LICENSE.txt
+
+QT6QUICK3D_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6QUICK3D_DEPENDENCIES = \
+	host-qt6quick3d \
+	host-qt6shadertools \
+	qt6base \
+	qt6declarative
+
+ifeq ($(BR2_PACKAGE_ASSIMP),y)
+QT6QUICK3D_CONF_OPTS += -DFEATURE_system_assimp=ON
+QT6QUICK3D_DEPENDENCIES += assimp
+else
+QT6QUICK3D_CONF_OPTS += -DFEATURE_system_assimp=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6QUICKTIMELINE),y)
+QT6QUICK3D_DEPENDENCIES += qt6quicktimeline
+endif
+
+ifeq ($(BR2_PACKAGE_QT6SHADERTOOLS),y)
+QT6QUICK3D_DEPENDENCIES += qt6shadertools
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+QT6QUICK3D_CONF_OPTS += -DFEATURE_system_zlib=ON
+QT6QUICK3D_DEPENDENCIES += zlib
+else
+QT6QUICK3D_CONF_OPTS += -DFEATURE_system_zlib=OFF
+endif
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
