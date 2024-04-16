Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1E2C04FF6
	for <buildroot@archiver.kernel.org>; Tue, 16 Apr 2024 14:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 959E440769;
	Tue, 16 Apr 2024 14:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UTnnQ_QCCgiW; Tue, 16 Apr 2024 14:27:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 947D340707
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 947D340707;
	Tue, 16 Apr 2024 14:27:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C6DDF1BF27C
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 14:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B391A400E5
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 14:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iz30vfMJYoVW for <buildroot@lists.busybox.net>;
 Tue, 16 Apr 2024 14:27:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 592F440065
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 592F440065
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 592F440065
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 14:27:26 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-518c9ff3e29so2998016e87.0
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 07:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713277644; x=1713882444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W0oNmTY6+0bDVg0O4cGsraYaL7e/SIEjTEZUPr3Q5GQ=;
 b=Ptg88IUFwBAccGOC6QMjE6nbxJ34JSdD/svRciXiJsNv/P1lYIZYvoYWWeNnR44M1Y
 S14Fo7LcIUFR/XwwRoZ1GDjDsu9uFTeBVoL8aIF5I/UPTawW9FeMVDWcpwetKZFc4UMz
 TAmELMQx1MfCSM7FNuPihX6aPXiN+zZLNnkcRn+BHsYjOQJUPTy2gpAQMIF6HlXlFSzB
 l4l/gM8fpRZZ78nBfuBo9Ya1h0RYV6ugQTOjDGSwzyGyGVgnBW7StrseMOQhhUlX1LDT
 /rZDnRpn5HffO2BEWTQ77oT3ro36WxvA8JOorQI410xmZyWRrJEtc8hRJ3+4B4FbByM9
 5QAQ==
X-Gm-Message-State: AOJu0YzNn7HLV50Mty9H1NMC5Ct22z76C3QXt/JURIpV1L20J+Nx0p14
 efvujJbOVQ0YbiX6F9erKR9KxVrnWNPGw9/qQaHwpzzaZXLU6sEbP/3nbhse
X-Google-Smtp-Source: AGHT+IFbAMreZYU+csiVMRBNK+ik7X1H+KrIiyAZU/OmyMO/g5f77Nyxf9mcEGR9bvtSceEsv6OBvw==
X-Received: by 2002:a05:6512:32ca:b0:518:a17a:2324 with SMTP id
 f10-20020a05651232ca00b00518a17a2324mr8395536lfg.29.1713277643842; 
 Tue, 16 Apr 2024 07:27:23 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a196453000000b00516b0051e6esm1629403lfj.231.2024.04.16.07.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 07:27:23 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Tue, 16 Apr 2024 16:25:57 +0200
Message-ID: <20240416142620.1751773-3-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416142620.1751773-1-roy.kollen.svendsen@akersolutions.com>
References: <20240416142620.1751773-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713277644; x=1713882444; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W0oNmTY6+0bDVg0O4cGsraYaL7e/SIEjTEZUPr3Q5GQ=;
 b=DVjmUWrb5U/gUS2mUe7Rk2pqDbenyjgCgy0DhAcUs8J4a/WY8Ib/l+ASo8IZYdz9jz
 qfvkfdmS1lbyLQTHBDBcz04jtUesil5RhP/E08AznZYlhSrFas7keFWfVOzpnblPuoF+
 I2ZBWSlDqP68acOYm/2Dr+N7fBmZKNDNJLBowRThZJuiQ+OhtOSh+3l1CrNzgiYZIAVW
 zyU12Tp4NsvY2aFmz0c8wgsuW7CAd4829ZZkd3tjeEfTQOKwX5kV2WI/B568Pk4U9i0u
 NnDScQXt2gPRzEBjdzvN7096SWVCoA3M8LVMX5XQjsxH+E0uFOk3OglIHVVElErKWZl7
 WJPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DVjmUWrb
Subject: [Buildroot] [PATCH 03/11] package/qt6/qt6shadertools: new package
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
 package/Config.in.host                        |  1 +
 package/qt6/Config.in                         |  1 +
 package/qt6/Config.in.host                    | 13 +++++++
 package/qt6/qt6base/qt6base.mk                |  7 +++-
 package/qt6/qt6shadertools/Config.in          | 14 +++++++
 package/qt6/qt6shadertools/Config.in.host     | 14 +++++++
 .../qt6/qt6shadertools/qt6shadertools.hash    | 10 +++++
 package/qt6/qt6shadertools/qt6shadertools.mk  | 39 +++++++++++++++++++
 8 files changed, 98 insertions(+), 1 deletion(-)
 create mode 100644 package/qt6/Config.in.host
 create mode 100644 package/qt6/qt6shadertools/Config.in
 create mode 100644 package/qt6/qt6shadertools/Config.in.host
 create mode 100644 package/qt6/qt6shadertools/qt6shadertools.hash
 create mode 100644 package/qt6/qt6shadertools/qt6shadertools.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 9543a22ffc..f2c8efc6be 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -95,6 +95,7 @@ menu "Host utilities"
 	source "package/python3/Config.in.host"
 	source "package/qemu/Config.in.host"
 	source "package/qoriq-rcw/Config.in.host"
+	source "package/qt6/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
 	source "package/riscv-isa-sim/Config.in.host"
diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 276a0217ab..b7e95a6885 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -47,6 +47,7 @@ source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6core5compat/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
+source "package/qt6/qt6shadertools/Config.in"
 source "package/qt6/qt6svg/Config.in"
 
 endif
diff --git a/package/qt6/Config.in.host b/package/qt6/Config.in.host
new file mode 100644
index 0000000000..e909e3285a
--- /dev/null
+++ b/package/qt6/Config.in.host
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_HOST_QT6
+	bool "host Qt6"
+	help
+	  This option enables the Qt6 framework. Sub-options allow to
+	  select which modules and tools should be built.
+
+	  http://qt.io
+
+if BR2_PACKAGE_HOST_QT6
+
+source "package/qt6/qt6shadertools/Config.in.host"
+
+endif
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 211808d2af..a7101ca043 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -84,7 +84,6 @@ HOST_QT6BASE_DEPENDENCIES = \
 	host-pcre2 \
 	host-zlib
 HOST_QT6BASE_CONF_OPTS = \
-	-DFEATURE_gui=OFF \
 	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=ON \
 	-DFEATURE_sql=OFF \
@@ -98,6 +97,12 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_system_pcre2=ON \
 	-DFEATURE_system_zlib=ON
 
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_GUI),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
+endif
+
 # Conditional blocks below are ordered by alphabetic ordering of the
 # BR2_PACKAGE_* option.
 
diff --git a/package/qt6/qt6shadertools/Config.in b/package/qt6/qt6shadertools/Config.in
new file mode 100644
index 0000000000..3161b3b19b
--- /dev/null
+++ b/package/qt6/qt6shadertools/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_QT6SHADERTOOLS
+	bool "qt6shadertools"
+	select BR2_PACKAGE_HOST_QT6
+	select BR2_PACKAGE_HOST_QT6SHADERTOOLS
+	select BR2_PACKAGE_QT6BASE_GUI
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  The Qt Shader Tools module builds on the SPIR-V Open
+	  Source Ecosystem as described at the Khronos SPIR-V web
+	  site.
+
+	  https://doc.qt.io/qt-6/qtshadertools-index.html
diff --git a/package/qt6/qt6shadertools/Config.in.host b/package/qt6/qt6shadertools/Config.in.host
new file mode 100644
index 0000000000..a7d876b98d
--- /dev/null
+++ b/package/qt6/qt6shadertools/Config.in.host
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_HOST_QT6SHADERTOOLS
+	bool "host qt6shadertools"
+	select BR2_PACKAGE_HOST_QT6BASE_GUI
+	help
+	  This package builds and installs the "qsb" tool.
+
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  The Qt Shader Tools module builds on the SPIR-V Open
+	  Source Ecosystem as described at the Khronos SPIR-V web
+	  site.
+
+	  https://doc.qt.io/qt-6/qtshadertools-index.html
diff --git a/package/qt6/qt6shadertools/qt6shadertools.hash b/package/qt6/qt6shadertools/qt6shadertools.hash
new file mode 100644
index 0000000000..90313163fa
--- /dev/null
+++ b/package/qt6/qt6shadertools/qt6shadertools.hash
@@ -0,0 +1,10 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtshadertools-everywhere-src-6.7.0.tar.xz.sha256
+sha256  3e13f967c62f0815c901e754cbc472a2e19170da0c7a505230d559615f7998af  qtshadertools-everywhere-src-6.7.0.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6shadertools/qt6shadertools.mk b/package/qt6/qt6shadertools/qt6shadertools.mk
new file mode 100644
index 0000000000..108f409380
--- /dev/null
+++ b/package/qt6/qt6shadertools/qt6shadertools.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# qt6shadertools
+#
+################################################################################
+
+QT6SHADERTOOLS_VERSION = $(QT6_VERSION)
+QT6SHADERTOOLS_SITE = $(QT6_SITE)
+QT6SHADERTOOLS_SOURCE = qtshadertools-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SHADERTOOLS_VERSION).tar.xz
+QT6SHADERTOOLS_INSTALL_STAGING = YES
+QT6SHADERTOOLS_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6SHADERTOOLS_CMAKE_BACKEND = ninja
+
+QT6SHADERTOOLS_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0, GFDL-1.3 no invariants (docs)
+
+QT6SHADERTOOLS_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt
+
+QT6SHADERTOOLS_CONF_OPTS = \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6SHADERTOOLS_DEPENDENCIES = \
+	host-pkgconf \
+	qt6base \
+	host-qt6shadertools
+
+HOST_QT6SHADERTOOLS_DEPENDENCIES = \
+	host-qt6base
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
