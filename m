Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F3BC48260
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 09:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7812441B9D;
	Thu,  8 Feb 2024 09:55:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oAvF2ln123nU; Thu,  8 Feb 2024 09:55:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0614441B29
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0614441B29;
	Thu,  8 Feb 2024 09:55:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7AFEA1BF831
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 09:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75A70616CC
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 09:55:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mjvKlSk6BzXr for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 09:55:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 78725616B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78725616B8
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78725616B8
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 09:55:36 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rY180-00F8hL-Vh; Thu, 08 Feb 2024 10:55:33 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 701358e0;
 Thu, 8 Feb 2024 09:55:31 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Thu,  8 Feb 2024 11:55:28 +0200
Message-ID: <20240208095531.99049-2-aperez@igalia.com>
X-Mailer: git-send-email 2.43.0
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
 bh=jDKtECMVxWr3Pjyj+n2HI3nayjq3JRcCUlpfaoJ/yiA=; b=K91xd+iJWEDjd8I0bFVcxthRlA
 NTwRS4aEJuFkhbZ5/14Ap9eFcwrr6GSjsXDSJ/XnLzDuXRzCNr2lnIxLMvNM+SSi9yXZY30gDWRAs
 bdxhoGBR10rhjWwfc9Lg7wHFC1/TU35Ue983i4YX4XwpkfpITyX/B3lTE7+Vlf9hV0nA4pb9FQArk
 xpig9v+cOmQQ3SROLCYAsa9z6WCfqqLn4gikR5advbLG7Hp4zeHavS9hRO/g+to1jJht7Wwy6ZW3F
 Tek3WSQhAhfjugZjbB/2q9uBcD43OqORw92DgUxpsJKGS8+/u0q9zJLhZCN0HbWEFp0MrtNK7GrfM
 5ClZBW7A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=K91xd+iJ
Subject: [Buildroot] [PATCH 1/3] package/wpebackend-rdk: new package
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

diff --git a/package/Config.in b/package/Config.in
index 91a6f1de00d..99bd6fee22e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1723,6 +1723,7 @@ menu "Graphics"
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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
