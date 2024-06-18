Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2919C27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 21:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9121242B72;
	Tue, 18 Jun 2024 21:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecl6ynuPo-8G; Tue, 18 Jun 2024 21:28:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8B7242B6C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8B7242B6C;
	Tue, 18 Jun 2024 21:28:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 790B31BF2EA
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 21:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 675A16081E
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 21:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QhXmE6jnTwUo for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 21:27:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E84F605EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E84F605EF
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E84F605EF
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 21:27:26 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2eabd22d3f4so70084321fa.1
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 14:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718746045; x=1719350845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5IBtsw08Mw0Y+T18dm1yKCbbYjSf3gICZIdoOcZepVc=;
 b=EZSuH9aJtbypG3207qRNgEe5+nV0rmUlJtkAUM3VpRQIOZiIb64xcJrE/p1IBXp4fk
 7CfBJRptEH8xv5OA1iv/gwE7sVNLA8xFJEdxr88sTt4Z0jAmkF4kps6RoQgLxBwpA4Ny
 dyfi/o+tbCXudSBhULgUzKVjtc0xIu2lkHYnhlFWG4NTKjTgYpNJ/+Jviq17q5hpt7Wv
 r0AHnpMzruT4v7OilHhxP3vfcpXFvm/iklKRBDKzVNR6uyJgX60yLWYoGxMMzvoMZjXs
 eP3iLNA0tXYZQf7muDpyZiw3ubUD4vxAvBrZOE7BZ2ua2TiLawJxnGMz/j5YFTs5WIrq
 hilQ==
X-Gm-Message-State: AOJu0Yz5TqwxV/63wY978mnFMXtjjcNHHT9EfwAixRHtU4UMihjtAnQZ
 AR6U+WCCYmMuKzvr5L2eTrb+c2EjgdXw2pp2wnI73q1PGQ57GG3jpEMhOg==
X-Google-Smtp-Source: AGHT+IHAmJjDrb/AtXJ4WpRuutprFnRUDmzE5yADhKl8Oh2ToGDX7BOr6DEVis4ronUfwwDDEhDPcA==
X-Received: by 2002:a2e:a286:0:b0:2eb:552a:f6d0 with SMTP id
 38308e7fff4ca-2ec3cfffa27mr5028221fa.52.1718746043818; 
 Tue, 18 Jun 2024 14:27:23 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c7838fsm17240521fa.100.2024.06.18.14.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 14:27:23 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 23:26:34 +0200
Message-ID: <20240618212646.4154474-11-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
References: <20240618131902.2912459-9-roykollensvendsen@gmail.com>
 <20240618212646.4154474-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718746045; x=1719350845; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5IBtsw08Mw0Y+T18dm1yKCbbYjSf3gICZIdoOcZepVc=;
 b=STniyD9lQBOmAgN1rYj95KnoiycOZIr0aKvjrks/hMmP34hNeHm7aQT00QLmtWqDQX
 BodO3PBFdBgblKEYk6v20bUJuDhsj13f6h+wzHzsbcj39TsY0oTOaf7/c35K24Bxor4D
 51BG8bPCG/tUDUQG8FX25zkmcQXkw0bxUD2zk2KbDKc8DcWUJ+8NNGtMfUyloFsQBIRH
 WIDgUCuDETacnwNpwN78dBTxKgEcyfS1cH5gfHmmjeR9QohxFYkUg5fsUL6aCEkctNU7
 liP/4RnycNk11dzs2xQG5coNrkZidZiZSdTzixTWC8kHxtI8LI3MIByikuKtLdAnweIs
 D08g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=STniyD9l
Subject: [Buildroot] [PATCH v8 11/14] package/qt6/qt6wayland: new package
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add host-qt6wayland as dependency to build the qtwaylandscanner host
tool:

  Failed to find the host tool "Qt6::qtwaylandscanner".  It is part of the
  Qt6WaylandScannerTools package, but the package could not be found.  Make
  sure you have built and installed the host WaylandScanner module, which
  will ensure the creation of the Qt6WaylandScannerTools package.

Select the qt6base and host-qt6base Gui modules to avoid skipping the
build:

  Skipping the build as the condition "TARGET Qt::Gui" is not met.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/Config.in                  |  1 +
 package/qt6/qt6wayland/Config.in       | 27 +++++++++++++
 package/qt6/qt6wayland/qt6wayland.hash | 11 +++++
 package/qt6/qt6wayland/qt6wayland.mk   | 56 ++++++++++++++++++++++++++
 4 files changed, 95 insertions(+)
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
index 0000000000..11179a4416
--- /dev/null
+++ b/package/qt6/qt6wayland/Config.in
@@ -0,0 +1,27 @@
+comment "qt6wayland needs an OpenGL-capable backend"
+	depends on !BR2_PACKAGE_QT6_GL_SUPPORTS
+
+config BR2_PACKAGE_QT6WAYLAND
+	bool "qt6wayland"
+	depends on BR2_PACKAGE_QT6_GL_SUPPORTS
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_QT6BASE_GUI
+	select BR2_PACKAGE_HOST_QT6BASE_GUI
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
+	select BR2_PACKAGE_LIBXKBCOMMON
+	help
+	  The compositor API is still experimental, and not built by
+	  default.
+
+endif
diff --git a/package/qt6/qt6wayland/qt6wayland.hash b/package/qt6/qt6wayland/qt6wayland.hash
new file mode 100644
index 0000000000..b0760f661e
--- /dev/null
+++ b/package/qt6/qt6wayland/qt6wayland.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qtwayland-everywhere-src-6.7.1.tar.xz.sha256
+sha256  7ef176a8e701c90edd8e591dad36f83c30d623ef94439ff62cafcffd46a83d20  qtwayland-everywhere-src-6.7.1.tar.xz
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
index 0000000000..62fa966577
--- /dev/null
+++ b/package/qt6/qt6wayland/qt6wayland.mk
@@ -0,0 +1,56 @@
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
+QT6WAYLAND_DEPENDENCIES = \
+	qt6base \
+	wayland \
+	host-qt6wayland
+
+HOST_QT6WAYLAND_CONF_OPTS = \
+	-DFEATURE_wayland_client=OFF \
+	-DFEATURE_wayland_server=OFF
+
+HOST_QT6WAYLAND_DEPENDENCIES = host-qt6base
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6WAYLAND_DEPENDENCIES += qt6declarative
+endif
+
+ifeq ($(BR2_PACKAGE_QT6WAYLAND_COMPOSITOR),y)
+QT6WAYLAND_CONF_OPTS += -DFEATURE_wayland_server=ON
+QT6WAYLAND_DEPENDENCIES += libxkbcommon
+else
+QT6WAYLAND_CONF_OPTS += -DFEATURE_wayland_server=OFF
+endif
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
