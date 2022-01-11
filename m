Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1A2C433FE
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 17:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D19C2400D1;
	Tue, 11 Jan 2022 17:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PylG9LnZojmb; Tue, 11 Jan 2022 17:45:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 990364022E;
	Tue, 11 Jan 2022 17:45:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 84C371BF368
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 17:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 810AF60E97
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 17:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iCVJrFdym0ke for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 17:45:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42D1060757
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 17:45:15 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a5so30459986wrh.5
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 09:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uZwkPi9MSEtSPhqRrdnU5Ttio9Z2SdQPC5FwuflJO70=;
 b=HDBqZJat71SWiBUMuK4xQtDTSY2adTYYqtL2vo+TBgsVAJJYxMFcG4iLkrOGt5I2TL
 +Ewr+GbSWAsx95xdTa1sfIwt56Wq2ymehfBi0xDLKEugFZG1tWEzkEGr6rcfu8vnZk8t
 K60J1FoRXvX5dSUeLANheXRNZPB9y2MZZw6wkqMAeGrjirv6h9r6gFYnr99tUevfQLnP
 XuI+zq/bxPX9vjOv501OXfUdnzAoNN/UvGnmNsaTS9T5xyLagGuFQ9HN0MJS7f5gOg9W
 sFN4aVU4lXSSLMxLizwfaeyHwEFGnm4IAAqmmq1tc7RXacdVa84qsBUBQyxGJfNqVMza
 /AAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uZwkPi9MSEtSPhqRrdnU5Ttio9Z2SdQPC5FwuflJO70=;
 b=PGMfU7OBBAlpVnVCefO/2hX2GNZXxLQqk6Op2QWVVxT1FMoLltoiK+uav8F3+OOxgr
 0AONy4IopH0+Y/iG9HZD2BcR5HC0XongDuJmd5DoOEYai8oPAVHvuh6DTIhlewILBGdY
 ki5NRg9u3I50QKy74x/H7FV3/qIWL042R7w0XBF0WrWZKpJLKP358SYWNFKSnDp84C19
 K8on7rN+Z9bFM37EW6tGKCVcPyFpIXwy0rocTBW9mQjLafxo8xTiXS9+21jDnUC2SNcU
 SYJKWRwpaS3LW8V/GGt5DSUF/HXOrSJv8FvFGYikittRMb0S6ae85j9AuWF9GYJLb2nA
 6+Cw==
X-Gm-Message-State: AOAM532+9tO9JSk0heNAes4cMFZPevK1D1A8zSc39EAzCWtN8wrzzYj6
 IHUAdZWodrSpF0FYVfeWXclywQegQ2Y=
X-Google-Smtp-Source: ABdhPJzasfzefBWESTwqlHT/I3JON5xRcaVCZvcG0rO6rZ6JB4kKPbssmb1LxtONKEX5tFIciCLFGQ==
X-Received: by 2002:a05:6000:50b:: with SMTP id
 a11mr4589346wrf.387.1641923113378; 
 Tue, 11 Jan 2022 09:45:13 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id l25sm2231308wmh.18.2022.01.11.09.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:45:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 18:43:45 +0100
Message-Id: <20220111174345.2482393-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gstreamer1-mm: drop
 package
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gstreamer1-mm is not compatible with glibmm-2.68 API and not actively
maintained anymore (one commit during the last 3 years):
https://gitlab.gnome.org/GNOME/gstreamermm/-/issues/17
https://gitlab.gnome.org/GNOME/gstreamermm/-/commits/master

As this is the only package that doesn't support glibmm-2.68 and because
it can't be easily patched, drop it to avoid the following build failure
raised since commit dddb65efbdf2c7952f22a1e51009f17f1676db4a:

Package 'giomm-2.4', required by 'virtual:world', not found

Fixes:
 - http://autobuild.buildroot.org/results/3479688334765fbbe4cb9620f4d3596f7d710404

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy                              |  7 +++
 package/gstreamer1/Config.in                  |  1 -
 .../0001-Fix-build-against-glib-2-68.patch    | 44 -------------------
 package/gstreamer1/gstreamer1-mm/Config.in    | 29 ------------
 .../gstreamer1-mm/gstreamer1-mm.hash          |  6 ---
 .../gstreamer1/gstreamer1-mm/gstreamer1-mm.mk | 24 ----------
 6 files changed, 7 insertions(+), 104 deletions(-)
 delete mode 100644 package/gstreamer1/gstreamer1-mm/0001-Fix-build-against-glib-2-68.patch
 delete mode 100644 package/gstreamer1/gstreamer1-mm/Config.in
 delete mode 100644 package/gstreamer1/gstreamer1-mm/gstreamer1-mm.hash
 delete mode 100644 package/gstreamer1/gstreamer1-mm/gstreamer1-mm.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index d36eac3302..a548ebf1a9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_GSTREAMER1_MM
+	bool "gstreamer1-mm package removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as it is not actively
+	  maintained anymore and does not support glibmm-2.68 API.
+
 config BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE
 	bool "python-backports-functools-lru-cache package removed"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index a2a15397e9..8fe8a34395 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -2,7 +2,6 @@
 source "package/gstreamer1/gstreamer1/Config.in"
 
 if BR2_PACKAGE_GSTREAMER1
-source "package/gstreamer1/gstreamer1-mm/Config.in"
 source "package/gstreamer1/gst1-plugins-base/Config.in"
 source "package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in"
 source "package/gstreamer1/gst1-plugins-good/Config.in"
diff --git a/package/gstreamer1/gstreamer1-mm/0001-Fix-build-against-glib-2-68.patch b/package/gstreamer1/gstreamer1-mm/0001-Fix-build-against-glib-2-68.patch
deleted file mode 100644
index 3ffdbb9cbf..0000000000
--- a/package/gstreamer1/gstreamer1-mm/0001-Fix-build-against-glib-2-68.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 0c0b5f8cef3b1f0a06f56c34340e210e0f23d1b0 Mon Sep 17 00:00:00 2001
-From: Dominique Leuenberger <dimstar@opensuse.org>
-Date: Tue, 13 Jul 2021 10:32:30 +0000
-Subject: [PATCH] Fix build against glib 2.68
-
-volatile has been misused in the past
-
-[Retrieved from:
-https://gitlab.gnome.org/GNOME/gstreamermm/-/merge_requests/4]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- gstreamer/gstreamermm/register.h                    | 2 +-
- tests/integration/test-integration-seekonstartup.cc | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gstreamer/gstreamermm/register.h b/gstreamer/gstreamermm/register.h
-index db66d172..a7ab3a63 100644
---- a/gstreamer/gstreamermm/register.h
-+++ b/gstreamer/gstreamermm/register.h
-@@ -110,7 +110,7 @@ register_mm_type(const gchar * type_name)
-     /* The typedef for GType may be gulong or gsize, depending on the
-      * system and whether the compiler is c++ or not. The g_once_init_*
-      * functions always take a gsize * though ... */
--    static volatile gsize gonce_data = 0;
-+    static gsize gonce_data = 0;
-     if (g_once_init_enter (&gonce_data)) {
-         GTypeInfo info;
- 
-diff --git a/tests/integration/test-integration-seekonstartup.cc b/tests/integration/test-integration-seekonstartup.cc
-index 247ac499..cd43a125 100644
---- a/tests/integration/test-integration-seekonstartup.cc
-+++ b/tests/integration/test-integration-seekonstartup.cc
-@@ -18,7 +18,7 @@ RefPtr<Glib::MainLoop> mainloop;
- RefPtr<Bus> bus;
- RefPtr<Pipeline> pipeline;
- RefPtr<Pad> sink_pad;
--static volatile gint counter;
-+static gint counter;
- bool prerolled = false;
- gboolean was_check = 0;
- 
--- 
-GitLab
-
diff --git a/package/gstreamer1/gstreamer1-mm/Config.in b/package/gstreamer1/gstreamer1-mm/Config.in
deleted file mode 100644
index 3225e394f4..0000000000
--- a/package/gstreamer1/gstreamer1-mm/Config.in
+++ /dev/null
@@ -1,29 +0,0 @@
-config BR2_PACKAGE_GSTREAMER1_MM
-	bool "gstreamer1-mm"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # glibmm -> libsigc
-	depends on BR2_INSTALL_LIBSTDCPP # glibmm
-	depends on BR2_USE_WCHAR # glibmm -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_USE_MMU # glibmm -> libglib2
-	select BR2_PACKAGE_GLIBMM
-	select BR2_PACKAGE_GSTREAMER1_CHECK
-	select BR2_PACKAGE_GST1_PLUGINS_BASE
-	help
-	  gstreamermm provides C++ bindings for the GStreamer streaming
-	  multimedia library (http://gstreamer.freedesktop.org). With
-	  gstreamermm it is possible to	develop applications that work
-	  with multimedia in C++.
-
-	  gstreamermm is developed over glibmm, libsigc++ and libxml++
-	  and the functionalities they provide. This means that, among
-	  other things, referencing and unreferencing of GObjects is
-	  handled automatically via glibmm's automatic pointer class,
-	  Glib::RefPtr, and libsigc++'s slots are used for callbacks and
-	  signals.
-
-	  https://gstreamer.freedesktop.org/bindings/cplusplus.html
-
-comment "gstreamer1-mm needs a toolchain w/ C++, wchar, threads, gcc >= 7"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gstreamer1/gstreamer1-mm/gstreamer1-mm.hash b/package/gstreamer1/gstreamer1-mm/gstreamer1-mm.hash
deleted file mode 100644
index 425cf05f39..0000000000
--- a/package/gstreamer1/gstreamer1-mm/gstreamer1-mm.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gstreamermm/1.10/gstreamermm-1.10.0.sha256sum
-sha256 be58fe9ef7d7e392568ec85e80a84f4730adbf91fb0355ff7d7c616675ea8d60 gstreamermm-1.10.0.tar.xz
-
-# Locally computed
-sha256 7c78a8d7fc6781d51402d5a6036bedda9cffb0e5d28757e25d54d6eacbb1949f  COPYING
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.examples
diff --git a/package/gstreamer1/gstreamer1-mm/gstreamer1-mm.mk b/package/gstreamer1/gstreamer1-mm/gstreamer1-mm.mk
deleted file mode 100644
index 539c9df1cb..0000000000
--- a/package/gstreamer1/gstreamer1-mm/gstreamer1-mm.mk
+++ /dev/null
@@ -1,24 +0,0 @@
-################################################################################
-#
-# gstreamer1-mm
-#
-################################################################################
-
-GSTREAMER1_MM_VERSION_MAJOR = 1.10
-GSTREAMER1_MM_VERSION = $(GSTREAMER1_MM_VERSION_MAJOR).0
-GSTREAMER1_MM_SITE = http://ftp.gnome.org/pub/gnome/sources/gstreamermm/$(GSTREAMER1_MM_VERSION_MAJOR)
-GSTREAMER1_MM_SOURCE = gstreamermm-$(GSTREAMER1_MM_VERSION).tar.xz
-GSTREAMER1_MM_LICENSE = LGPL-2.1+ (library), GPL-2.0 (examples)
-GSTREAMER1_MM_LICENSE_FILES = COPYING COPYING.examples
-GSTREAMER1_MM_INSTALL_STAGING = YES
-GSTREAMER1_MM_DEPENDENCIES += \
-	glibmm \
-	gstreamer1 \
-	gst1-plugins-base
-
-GSTREAMER1_MM_CONF_OPTS += \
-	--disable-gl \
-	--enable-unittests=no \
-	--disable-deprecated-api
-
-$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
