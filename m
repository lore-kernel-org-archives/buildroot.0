Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0648C30653
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 19:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9EF660E2C;
	Thu, 27 Jun 2024 19:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBUFpFcpCTP1; Thu, 27 Jun 2024 19:33:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CDA360E7D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CDA360E7D;
	Thu, 27 Jun 2024 19:33:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 49A471BF3D9
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 19:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35F91414CE
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 19:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V3X739AGPLI7 for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 19:33:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B5D4D40DB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5D4D40DB3
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5D4D40DB3
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 19:33:41 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sMusD-008G4x-7t; Thu, 27 Jun 2024 21:33:37 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 618f079e;
 Thu, 27 Jun 2024 19:33:35 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 22:33:29 +0300
Message-ID: <20240627193335.4069574-2-aperez@igalia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240208095531.99049-1-aperez@igalia.com>
References: <20240208095531.99049-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9xL+e3FQQ3ugxIVLScdvSX/ykt3fNgH2jPoj5EUlE5c=; b=nfs1dfEBTVAdbXYCace+Sgzwbb
 yIKAvs1VTfgjpJW3nmXeTJCdTU/WXgc72j8TZwiwRehEc1gQQFlQWgrpaNyff9jr0DlKKu3I4/yft
 cN1EKJFQs4YO2hi07cA4pmLMmcCtxkOk9oInaHTxpFtrXB7QlS8k4+jMrrk0dv3J7efcAGrQ7cy8I
 SDoto3SGfZoifzUj9jJ+yPZroh3f+HL0M2xDxyulFCjpsU/FVPaQSO62xCK/OYQkjXmtU2AR7PueN
 ROyizSC9G29RdjVFQA6AdCCNzI5RnEBhePk2rLAKL9dAo8C/qNUd37VqrRJRrpARip+3GIzJToFKy
 xkj7QiYg==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=nfs1dfEB
Subject: [Buildroot] [PATCH v2 1/4] package/wpebackend-rdk: new package
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The wpebackend-rdk can be used as an alternative to wpebackend-fdo in
some cases, and also supports a few additional configurations. For now
only the Wayland-EGL and Broadcom RaspberryPi userland implementations
can be enabled. The former is useful for testing, and the latter allows
using WPE WebKit directly on top of Dispmanx in combination with the
rpi-userland package in supported RaspberryPi models.

This only adds the new package, follow-up commits will un-hardcode the
usage of wpebackend-fdo and allow selecting either which of both to
build.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/Config.in                          |  1 +
 package/wpebackend-rdk/Config.in           | 57 ++++++++++++++++++++++
 package/wpebackend-rdk/wpebackend-rdk.hash |  5 ++
 package/wpebackend-rdk/wpebackend-rdk.mk   | 43 ++++++++++++++++
 4 files changed, 106 insertions(+)
 create mode 100644 package/wpebackend-rdk/Config.in
 create mode 100644 package/wpebackend-rdk/wpebackend-rdk.hash
 create mode 100644 package/wpebackend-rdk/wpebackend-rdk.mk

---
v1 -> v2:
- Unchanged.

diff --git a/package/Config.in b/package/Config.in
index 550fdc1f411..5dab5de59c1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1734,6 +1734,7 @@ menu "Graphics"
 	source "package/wlroots/Config.in"
 	source "package/woff2/Config.in"
 	source "package/wpebackend-fdo/Config.in"
+	source "package/wpebackend-rdk/Config.in"
 	source "package/wpewebkit/Config.in"
 	source "package/zbar/Config.in"
 	source "package/zxing-cpp/Config.in"
diff --git a/package/wpebackend-rdk/Config.in b/package/wpebackend-rdk/Config.in
new file mode 100644
index 00000000000..6125911bec9
--- /dev/null
+++ b/package/wpebackend-rdk/Config.in
@@ -0,0 +1,57 @@
+comment "wpebackend-rdk needs a toolchain w/ C++, wchar, threads, dynamic library, and rpi-userland or an OpenGL-capable Wayland backend"
+	depends on !(BR2_PACKAGE_RPI_USERLAND || BR2_PACKAGE_HAS_LIBEGL_WAYLAND) \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+config BR2_PACKAGE_WPEBACKEND_RDK
+	bool "wpebackend-rdk"
+	depends on !BR2_STATIC_LIBS # wayland
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, libglib2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_PACKAGE_RPI_USERLAND || BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBWPE
+	help
+	  WPEBackend interface supporting a number of configurations.
+
+if BR2_PACKAGE_WPEBACKEND_RDK
+
+choice
+	prompt Implementation
+	default BR2_PACKAGE_WPEBACKEND_RDK_IMPL_BRCM_RPI if BR2_PACKAGE_RPI_USERLAND
+	default BR2_PACKAGE_WPEBACKEND_RDK_IMPL_WAYLAND_EGL if BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+
+comment "brcm-rpi needs rpi-userland"
+	depends on !BR2_PACKAGE_RPI_USERLAND || !BR2_arm
+
+config BR2_PACKAGE_WPEBACKEND_RDK_IMPL_BRCM_RPI
+	bool "brcm-rpi"
+	depends on BR2_arm
+	depends on BR2_PACKAGE_RPI_USERLAND
+	help
+	  Build RaspberryPi support using Broadcom's rpi-userland.
+
+comment "wayland-egl needs an EGL capable Wayland implementation"
+	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+
+config BR2_PACKAGE_WPEBACKEND_RDK_IMPL_WAYLAND_EGL
+	bool "wayland-egl"
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	help
+	  Build Wayland-EGL support.
+
+endchoice
+
+if BR2_PACKAGE_WPEBACKEND_RDK_IMPL_BRCM_RPI
+
+config BR2_PACKAGE_WPEBACKEND_RDK_LIBINPUT
+	bool "libinput support"
+	select BR2_PACKAGE_LIBINPUT
+	help
+	  Support keyboard and mouse input through libinput
+
+endif
+
+endif
diff --git a/package/wpebackend-rdk/wpebackend-rdk.hash b/package/wpebackend-rdk/wpebackend-rdk.hash
new file mode 100644
index 00000000000..af7dab6a365
--- /dev/null
+++ b/package/wpebackend-rdk/wpebackend-rdk.hash
@@ -0,0 +1,5 @@
+# Generated locally
+sha256  4c6ae288cf66f0a47052a50972e3d3727617c4c3e104db20494a3c5feb262f40  wpebackend-rdk-4.4.1.tar.gz
+
+# License files
+sha256  a5ba969938c2896411ea1a23ee7d9ccb68306a65615b6711afe738c8f6ff2153  COPYING
diff --git a/package/wpebackend-rdk/wpebackend-rdk.mk b/package/wpebackend-rdk/wpebackend-rdk.mk
new file mode 100644
index 00000000000..f9740eb46cd
--- /dev/null
+++ b/package/wpebackend-rdk/wpebackend-rdk.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# wpebackend-rdk
+#
+################################################################################
+
+WPEBACKEND_RDK_VERSION = 4.4.1
+WPEBACKEND_RDK_SITE = $(call github,WebPlatformForEmbedded,WPEBackend-rdk,R$(WPEBACKEND_RDK_VERSION))
+WPEBACKEND_RDK_INSTALL_STAGING = YES
+WPEBACKEND_RDK_LICENSE = BSD-2-Clause
+WPEBACKEND_RDK_LICENSE_FILES = COPYING
+WPEBACKEND_RDK_DEPENDENCIES = libglib2 libwpe
+WPEBACKEND_RDK_CONF_OPTS = \
+	-DUSE_BACKEND_BCM_NEXUS=OFF \
+	-DUSE_BACKEND_BCM_NEXUS_WAYLAND=OFF \
+	-DUSE_BACKEND_INTEL_CE=OFF \
+	-DUSE_BACKEND_WESTEROS=OFF \
+	-DUSE_BACKEND_WPEFRAMEWORK=OFF \
+	-DUSE_HOLE_PUNCH_GSTREAMER=OFF \
+	-DUSE_VIRTUAL_KEYBOARD=OFF
+
+ifeq ($(BR2_PACKAGE_WPEBACKEND_RDK_IMPL_BRCM_RPI),y)
+WPEBACKEND_RDK_CONF_OPTS += -DUSE_BACKEND_BCM_RPI=ON
+WPEBACKEND_RDK_DEPENDENCIES += rpi-userland
+else
+WPEBACKEND_RDK_CONF_OPTS += -DUSE_BACKEND_BCM_RPI=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_WPEBACKEND_RDK_IMPL_WAYLAND_EGL),y)
+WPEBACKEND_RDK_CONF_OPTS += -DUSE_BACKEND_WAYLAND_EGL=ON
+WPEBACKEND_RDK_DEPENDENCIES += libegl wayland
+else
+WPEBACKEND_RDK_CONF_OPTS += -DUSE_BACKEND_WAYLAND_EGL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_WPEBACKEND_RDK_LIBINPUT),y)
+WPEBACKEND_RDK_CONF_OPTS += -DUSE_INPUT_LIBINPUT=ON
+WPEBACKEND_RDK_DEPENDENCIES += libinput
+else
+WPEBACKEND_RDK_CONF_OPTS += -DUSE_INPUT_LIBINPUT=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
