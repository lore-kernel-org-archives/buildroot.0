Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38949C25B4F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 20:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 044CF820F1;
	Sun, 12 May 2024 20:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3FmWH3Ckhv5; Sun, 12 May 2024 20:19:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E9C3822E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E9C3822E5;
	Sun, 12 May 2024 20:19:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12FEF1BF8B4
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 20:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0249282253
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 20:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPjrjAvNVNPF for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 20:19:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A2E08139F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A2E08139F
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A2E08139F
 for <buildroot@buildroot.org>; Sun, 12 May 2024 20:19:25 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2e6792ea67dso12353731fa.3
 for <buildroot@buildroot.org>; Sun, 12 May 2024 13:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715545163; x=1716149963;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fe/0IWcwPmfkrXukNgySzo4XOcmF/OOi6fQdc2jOxHo=;
 b=Bui8PK3fHshycz4BM0FTJpefBGgstBoJPpeWRmAmapTLBpzSweT/I3GwrqD+mqewrb
 D31RIkNq1FNjTx20muDNEEanF6dSxj9cPWK6fmyz6suuPbfeNBUHSRRuiTVEt/vkKcQ1
 E2XWdWqH9FuXBkxorNBE+R9qHEhOOHY+wR6DfDKInv8hmM3IWieIMo9yafgjMLD5BE+f
 ZhkfYK7pA2Wmk6p48Xsi3G9aRAeXtK992gtVhLCk4rywf47vUZO/kuz78RjSFFvVTGzc
 W90JdwTiD+3kOV+TRN9A6tphZZIzbGiL2VG9zAqb1/WtlhrOIrNot4QnsARnQ9WWXy+i
 j56Q==
X-Gm-Message-State: AOJu0YwTmxXSHKE7+jXhfikjSkEiwkTsCHHiZVLtM6HCTiTEBP6V3w/I
 aM9Eb0ymtb58h2LQVg7OaCfWou2ibpeTw9ZCng67ItWjkdAQggnYvqyzFggS
X-Google-Smtp-Source: AGHT+IGhY3dqYkgZ61Caz4uYCZqpc+mMAD0qCOv80SgioaOd09Rz59iaV6YIAScGJBlYI4FXjZj6Lw==
X-Received: by 2002:a2e:7006:0:b0:2dd:7938:ed2f with SMTP id
 38308e7fff4ca-2e51fd463bamr66916181fa.19.1715545162069; 
 Sun, 12 May 2024 13:19:22 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d1515580sm11400791fa.79.2024.05.12.13.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 May 2024 13:19:21 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 13:45:57 +0200
Message-ID: <20240512114617.2564569-10-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240512114617.2564569-1-roykollensvendsen@gmail.com>
References: <1924535>
 <20240512114617.2564569-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715545163; x=1716149963; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fe/0IWcwPmfkrXukNgySzo4XOcmF/OOi6fQdc2jOxHo=;
 b=FuppW1eUFE/R2amFaJ9l8+1Yy2/Ez4uzGI6fQ8nB9Hho2HltWg/0Ku3eE3znkagzM3
 UjSIpJDmlBiyp4WKeMvV2u9ur4rWCyn2W+uHR07E7eGE4RLQQjCLltnXgfbpfqhyN7I1
 /ePlNkB3Oe4B/7AiwZcpbfPZidaOtaa8ylwYzKw2x/rdZE2eG6hZprsB6L2905elHpoz
 3sjRzsVaN2/Te47PF3+DkCj5uUEWT+K6p+s86gaK1SiikiRluDulGuhakh5HhPvgiV1c
 9SkurMhZUOXJk2IeJwRG1oIsdS/szwGFfRDvVjG/Q89W/jcIU//nIiT+iPHo68KYQbi6
 /hNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FuppW1eU
Subject: [Buildroot] [PATCH v3 10/14] package/qt6/qt6wayland: new package
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
 Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/Config.in                  |  1 +
 package/qt6/qt6wayland/Config.in       | 24 ++++++++++++
 package/qt6/qt6wayland/qt6wayland.hash | 11 ++++++
 package/qt6/qt6wayland/qt6wayland.mk   | 53 ++++++++++++++++++++++++++
 4 files changed, 89 insertions(+)
 create mode 100644 package/qt6/qt6wayland/Config.in
 create mode 100644 package/qt6/qt6wayland/qt6wayland.hash
 create mode 100644 package/qt6/qt6wayland/qt6wayland.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 16f792cff3..69ce0b3f6a 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -51,6 +51,7 @@ source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
 source "package/qt6/qt6svg/Config.in"
+source "package/qt6/qt6wayland/Config.in"
 source "package/qt6/qt6websockets/Config.in"
 
 endif
diff --git a/package/qt6/qt6wayland/Config.in b/package/qt6/qt6wayland/Config.in
new file mode 100644
index 0000000000..814f9e1722
--- /dev/null
+++ b/package/qt6/qt6wayland/Config.in
@@ -0,0 +1,24 @@
+comment "qt6wayland needs an OpenGL-capable backend"
+	depends on !BR2_PACKAGE_QT6_GL_SUPPORTS
+
+config BR2_PACKAGE_QT6WAYLAND
+	bool "qt6wayland"
+	depends on BR2_PACKAGE_QT6_GL_SUPPORTS
+	select BR2_PACKAGE_WAYLAND
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6wayland module.
+
+	  https://doc.qt.io/qt-6/qtwayland-index.html
+
+if BR2_PACKAGE_QT6WAYLAND
+
+config BR2_PACKAGE_QT6WAYLAND_COMPOSITOR
+	bool "Enable compositor (experimental)"
+	help
+	  The compositor API is still experimental, and not built by
+	  default.
+
+endif
diff --git a/package/qt6/qt6wayland/qt6wayland.hash b/package/qt6/qt6wayland/qt6wayland.hash
new file mode 100644
index 0000000000..13a6ba15eb
--- /dev/null
+++ b/package/qt6/qt6wayland/qt6wayland.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtwayland-everywhere-src-6.7.0.tar.xz.sha256
+sha256  d73470e4217da388d8cd2a517ee8bb373853f33c569306e80f04397845157aea  qtwayland-everywhere-src-6.7.0.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6wayland/qt6wayland.mk b/package/qt6/qt6wayland/qt6wayland.mk
new file mode 100644
index 0000000000..cf8727287e
--- /dev/null
+++ b/package/qt6/qt6wayland/qt6wayland.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# qt6wayland
+#
+################################################################################
+
+QT6WAYLAND_VERSION = $(QT6_VERSION)
+QT6WAYLAND_SITE = $(QT6_SITE)
+QT6WAYLAND_SOURCE = qtwayland-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6WAYLAND_VERSION).tar.xz
+QT6WAYLAND_INSTALL_STAGING = YES
+
+QT6WAYLAND_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6WAYLAND_CMAKE_BACKEND = ninja
+
+QT6WAYLAND_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0, GFDL-1.3 no invariants (docs)
+
+QT6WAYLAND_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt
+
+QT6WAYLAND_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF \
+	-DFEATURE_wayland_client=ON
+
+ifeq ($(BR2_PACKAGE_QT6WAYLAND_COMPOSITOR),y)
+QT6WAYLAND_CONF_OPTS += -DFEATURE_wayland_server=ON
+else
+QT6WAYLAND_CONF_OPTS += -DFEATURE_wayland_server=OFF
+endif
+
+HOST_QT6WAYLAND_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6WAYLAND_DEPENDENCIES = \
+	qt6base \
+	qt6declarative \
+	host-qt6wayland \
+	wayland \
+	host-wayland
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
