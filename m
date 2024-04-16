Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4A5C4345F
	for <buildroot@archiver.kernel.org>; Tue, 16 Apr 2024 14:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6065A40329;
	Tue, 16 Apr 2024 14:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12MTNX5o-OUX; Tue, 16 Apr 2024 14:27:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9526A407DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9526A407DC;
	Tue, 16 Apr 2024 14:27:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4975D1BF27C
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 14:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43D23400D8
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 14:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sd9AYIHgDAUY for <buildroot@lists.busybox.net>;
 Tue, 16 Apr 2024 14:27:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 09F9F40065
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09F9F40065
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09F9F40065
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 14:27:38 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-518b9527c60so3320279e87.0
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 07:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713277657; x=1713882457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nRgD2+37l3BG+hTHOuxN2xe6lh7WZGTay6iAyVmFxkA=;
 b=HokuFQ1EM8gqhBR9SBa1xyqC+aH0PrBEfqgUt/frLY+27Pn9oOocxMhgS2lW7fwtK1
 qu4RUzNPJID/I7EIVR8kL8acgdEsthnQUDxDr2l2ec7yRYMNnyvkmZ2jWkc6/WCM/XTE
 OSpppVNkiiimoBsAgr3JWVqzPi6RKmCl98VBAPslLFgGNPjRWEK+dJYdqlZhHHAhQq5J
 qobxMn6n70zUwvrjp5Ewl1JqhgZN3GXE5d3pxJlcKAl53hOlmCs8emtI0nuMbgVSt5H7
 S4PT/CLuiwNer4JzGQvitQVkvLqivS7MvwlkwjdAJEMbLherOIPOdzdgDO3wncIXMKCI
 FCQQ==
X-Gm-Message-State: AOJu0Yw284ZAv+GKIo0Bu7Vpf+QmdQ8XRJwJI02wxFWU9fO2PAvuhlws
 JCScqlbcNORDf1CCJYDBvoEIV3yMn7ly5Uq/7UUwhFY2Ik6x58SZXukSk3QL
X-Google-Smtp-Source: AGHT+IFA8W5OnkAl8dB7Y/q8by0ZYKX3ATE9S8GkEewtB1ux3Zd7541Z7Zd4kADjIlSyKaOJNobTrQ==
X-Received: by 2002:a19:640e:0:b0:516:cf23:588 with SMTP id
 y14-20020a19640e000000b00516cf230588mr10156261lfb.27.1713277656690; 
 Tue, 16 Apr 2024 07:27:36 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a196453000000b00516b0051e6esm1629403lfj.231.2024.04.16.07.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 07:27:36 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Tue, 16 Apr 2024 16:26:02 +0200
Message-ID: <20240416142620.1751773-8-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416142620.1751773-1-roy.kollen.svendsen@akersolutions.com>
References: <20240416142620.1751773-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713277657; x=1713882457; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nRgD2+37l3BG+hTHOuxN2xe6lh7WZGTay6iAyVmFxkA=;
 b=F1P6WkAC6Hp2WSttU97FD18VXvL6Kj+uv5kUISJn7IYcAs9I1HfAlCzp/0A1ufHD3v
 C/kisCQ/V5h4ObVyD19NVTLB9TZ0Rqs2zDea28VahOY5hTALL7ns5xiXtUOnzYv1/Sor
 iI7zJIdtLefEGOWFH3mdDXBg6fPW3qLbVP1PV465kUBInkGj57nOF9wCLNJl7iodyp7k
 H+vY8/VBa+8limMMLlm1wU/vZ981oTGKpVCTsD1BLMYOnIiujxc9g8wXcd/fK2szvQhH
 t091sbl6d/64SGh/MdGJxe+HAjKIE+52M18stYpugcFub9E5n3O8axfPPET5MTDI4dEX
 hA7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=F1P6WkAC
Subject: [Buildroot] [PATCH 08/11] package/qt6/qt6wayland: new package
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
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
