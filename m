Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B464D5B873
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 22:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30F4980EE2;
	Mon, 15 Dec 2025 22:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 37mQgLJ7MZ3F; Mon, 15 Dec 2025 22:50:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 435DA80FA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765839013;
	bh=34E8ZjuSzW2AC5XKydWTl+ov+R1NIdSRHNyWi6K9EdQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MAN3FytuW4QVdPVrDug/bM3lTCxx3FZtZ7ozakPjRg3M84mOV10AmrYdhURz9QoEF
	 fqkZCIbe7Zb6SibR5y9TVMMLH4Mk621NEtwpqeMfj21jeXpNCknTmnXWAjRUcYEDnS
	 QcLvorMSEQhIYh2inu5QOdYRzM0sz7TDa7DkyOGw1Zj8vkRBTCNNc74Zq61GdSn4YB
	 ywdnxVpjtrOFbfN8wDk+GOdggRMLwpx0t97y8n7Dcl1vNsmfN/CaCP8N8T7rBoH9OW
	 NC/VLYc0BcNjzrWxgPVxIzvsCW3aiJTDt6ySIGpAQL6mY6GbDLpAJVuITbQajvxXeN
	 SfFndTxd8s0tA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 435DA80FA6;
	Mon, 15 Dec 2025 22:50:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AB17219
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0148240B1B
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F6ily2qwLDPA for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 22:50:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E768340B24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E768340B24
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E768340B24
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E1481C19D27;
 Mon, 15 Dec 2025 22:49:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5204A60664;
 Mon, 15 Dec 2025 22:50:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6BEEF1194297D; Mon, 15 Dec 2025 23:50:04 +0100 (CET)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Dec 2025 23:49:37 +0100
Message-ID: <20251215224952.1253359-6-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
References: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765839005; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=DxHqaH4SHGmpPpzEcuwxH9QfSVHLSK4yvMcYCjkK/Ac=;
 b=L/G7xvgJB+DKrsnLMnMUMjB80OGH6B7UFvbF1NI0tH8ZpjMQPHQkjgpqqLzDJH/LZvJFCU
 KZ29gN4ueA2lI3M/w+hh9kUHzcaI771VBG4WiU5jGxwTHiWBRfzPna1d1LrlBGpnMf1vsj
 L+76Tt+ymKEM5aIu0Nh8UQmmZHxD90e3XQaMvwEHn1EzCihnT+EtWiGFFiUZyzSnKMo5cg
 KRpuEubJiIRUM8MYZoW/jgp2CjuvQlmDcQiP7GMRowZLfFt/iavIo2Zv6pmCQKd67B1OXG
 5ZDbYuugUmeuheTvFelfrzqmj09kwTF7K6QHVcBjy3yygnAvLO5rTQGHTyALgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=L/G7xvgJ
Subject: [Buildroot] [PATCH 05/13] package/gstreamer1/gst1-plugins-base:
 drop rpi-userland support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As we're about to remove the rpi-userland package, drop support for it
from package/gstreamer/gst1-plugins-base.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                              |  7 +++++
 .../gstreamer1/gst1-plugins-base/Config.in    | 30 +++----------------
 .../gst1-plugins-base/gst1-plugins-base.mk    |  4 ---
 3 files changed, 11 insertions(+), 30 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 239519aa0c..f1558221a9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_DISPMANX
+	bool "gst1-plugins-base dispmanx option removed"
+	select BR2_LEGACY
+	help
+	  Due to the removal of the rpi-userland package, the dispmanx
+	  OpenGL plug-in from GStreamer plugin base has been removed.
+
 config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
 	bool "rpi-firmware vcdbg option removed"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index df10774ac7..6eff685c2f 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -178,7 +178,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLX
 	default y
 	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL
 	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR # mesa needs big X
-	depends on !BR2_PACKAGE_RPI_USERLAND # x11
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XORGPROTO
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_X11
@@ -186,13 +185,9 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_GLX
 	help
 	  OpenGL Extension to the X Window System
 
-comment "glx not supported with rpi-userland"
-	depends on BR2_PACKAGE_RPI_USERLAND
-
 comment "glx needs the opengl API and modular X.org"
-	depends on !BR2_PACKAGE_RPI_USERLAND && \
-		(!BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL || \
-		!BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR)
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL || \
+		!BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL
 	bool "egl"
@@ -214,19 +209,14 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_X11
 	bool "x11"
 	default y
 	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM
-	depends on !BR2_PACKAGE_RPI_USERLAND
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_WINDOW
 
-comment "x11 not supported with rpi-userland"
-	depends on BR2_PACKAGE_RPI_USERLAND
-
 comment "x11 needs a platform and X.org"
-	depends on !BR2_PACKAGE_RPI_USERLAND && \
-		(!BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM || \
-		!BR2_PACKAGE_XORG7)
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM || \
+		!BR2_PACKAGE_XORG7
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_WAYLAND
 	bool "wayland"
@@ -240,18 +230,6 @@ comment "wayland needs the egl platform and the wayland package"
 	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL || \
 		!BR2_PACKAGE_WAYLAND
 
-config BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_DISPMANX
-	bool "dispmanx"
-	default y
-	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL
-	depends on BR2_PACKAGE_RPI_USERLAND
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_WINDOW
-	help
-	  Raspberry Pi's Dispmanx windowing system
-
-comment "dispmanx needs the egl platform and rpi-userland"
-	depends on !BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL || \
-		!BR2_PACKAGE_RPI_USERLAND
 endif
 
 comment "opengl needs an OpenGL or OpenGL ES backend"
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 456cd205bb..adfb407386 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -93,10 +93,6 @@ GST1_PLUGINS_BASE_WINSYS_LIST += wayland
 GST1_PLUGINS_BASE_DEPENDENCIES += wayland wayland-protocols
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_DISPMANX),y)
-GST1_PLUGINS_BASE_WINSYS_LIST += dispmanx
-GST1_PLUGINS_BASE_DEPENDENCIES += rpi-userland
-endif
 GST1_PLUGINS_BASE_CONF_OPTS += -Dgl_winsys='$(subst $(space),$(comma),$(GST1_PLUGINS_BASE_WINSYS_LIST))'
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ADDER),y)
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
