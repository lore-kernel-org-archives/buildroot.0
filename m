Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F12EE7FEF
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 12:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 283BF41BD7;
	Fri,  8 Sep 2023 12:55:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 283BF41BD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0-TJXPp2-w7W; Fri,  8 Sep 2023 12:55:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F09574157D;
	Fri,  8 Sep 2023 12:55:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F09574157D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 351DE1BF2A2
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 12:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C84A81763
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 12:54:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C84A81763
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7lGgdcQdNCBW for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 12:54:19 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 652A181421
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 12:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 652A181421
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-401f503b529so22181625e9.0
 for <buildroot@buildroot.org>; Fri, 08 Sep 2023 05:54:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694177657; x=1694782457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1izxzZRnQRBUL1uK1Y2kymRGoGlrx/5NBho893tLJkU=;
 b=nsgvuyeoUTN+1fKx5WOzX6qLRLfVGF7j+4n/txHUOYVlE+E3fg3o4UueZZDu/CAlwX
 9MhWEvYMB1VK0QskToMyOffzXpx9yC0jziYmXOfZwNkzTpWEHLDbNNNnkU/Sp5gaFDhj
 v0WS+44QY/AVKh4NrwXr2VHx8/y1iNTltKswdjhqUscnlg0eAw1qCKVH3Bb+GvXffciL
 48kX+tFuzvMB93gVW2AwS06FgEQYDhMKBBjAZqo/3MVTw5UvMFaNpjNei47EaKIFG45g
 V/dG5DQsMYJogCgGKH8lP6BvDf4q/Ap/RiawY1nmFLQjK4Z+XoQZF9/tCEsQDJDOGxrZ
 drVg==
X-Gm-Message-State: AOJu0Yw0If1FJLIuc+a394oycdvze3dAFevmlWnaRTJ8MG6vW9pUV3mi
 lXRMP8OsHB/23CNat2FyO7tnsl1dCEuVUA==
X-Google-Smtp-Source: AGHT+IF0Pv4It9C2+OwdCqpy0MstFdwCMc4uu97QUJq7dDdEdyUyUU2kQAVk1LWUwG46pyMB8MTZDQ==
X-Received: by 2002:a1c:f70b:0:b0:3fd:3006:410b with SMTP id
 v11-20020a1cf70b000000b003fd3006410bmr2076976wmh.34.1694177657212; 
 Fri, 08 Sep 2023 05:54:17 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 w3-20020a05600c014300b003fefe70ec9csm5133890wmm.10.2023.09.08.05.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 05:54:16 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Fri,  8 Sep 2023 14:54:00 +0200
Message-ID: <20230908125400.3722455-4-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230908125400.3722455-1-thomas.devoogdt@barco.com>
References: <20230413142927.3137190-1-aperez@igalia.com>
 <20230908125400.3722455-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694177657; x=1694782457; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1izxzZRnQRBUL1uK1Y2kymRGoGlrx/5NBho893tLJkU=;
 b=l9iBRnkjbH0Q7jm212UY5QWGAPojeYmVNgKyqHft9FNTteuDMNdZlE068ZXRRsdbGU
 rWiVHkop5kMkOOHi5G5+UDXQQhiymQzDzkQxTrJYLRbjRZ1f3TP8Up8EbgldAHMDA/A/
 B+Xff4cZcGEWTgi1lGMxTkWz9E+wVAXgRGaLAMkioK8I3VANFYF91uy+ZDFnnqXHtuot
 R4VYHY3VncywB5BDVpGdbXxmL10vm8w/g2Jm18IXbq6U7JLyL6pJn8yn5hP10aVDiako
 zqwCOfbFJEPK1LHrIJdXQxpJMAxyV7LKwSrDUmRvY9tkhDu/WMizj1gLuQ7ZwoayGgNz
 6REA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=l9iBRnkj
Subject: [Buildroot] [PATCH v1 4/4] package/webkitgtk: add a
 USE_OPENGL_OR_ES config option
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
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

OpenGL or GLES support is not mandatory, so make if configurable.
The default was -DUSE_OPENGL_OR_ES=ON, so keep it that way.

It's a quite complex dependency matrix to select libgl, libgles, and libegl.
So for simplicity, always depend on them if the corresponding BR2_PACKAGE_HAS flag is set.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/webkitgtk/Config.in    | 10 ++++++++++
 package/webkitgtk/webkitgtk.mk | 24 +++++++++++++++++++-----
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 6835467c46..748e529208 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -65,6 +65,16 @@ config BR2_PACKAGE_WEBKITGTK
 
 if BR2_PACKAGE_WEBKITGTK
 
+config BR2_PACKAGE_WEBKITGTK_OPENGL_OR_ES
+	bool "OpenGL or GLES support"
+	default y
+	depends on BR2_PACKAGE_HAS_LIBGBM
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
+
+comment "OpenGL or GLES support needs an OpenGL or GLES backend, libgbm"
+	depends on !BR2_PACKAGE_HAS_LIBGBM
+	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES
+
 config BR2_PACKAGE_WEBKITGTK_SANDBOX
 	bool "sandboxing support"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index c096e3b3c1..2f48bc76d9 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -32,6 +32,12 @@ WEBKITGTK_CONF_OPTS = \
 	-DUSE_OPENJPEG=ON \
 	-DUSE_WOFF2=ON
 
+ifeq ($(BR2_PACKAGE_WEBKITGTK_OPENGL_OR_ES),y)
+WEBKITGTK_CONF_OPTS += -DUSE_OPENGL_OR_ES=ON
+else
+WEBKITGTK_CONF_OPTS += -DUSE_OPENGL_OR_ES=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_WEBKITGTK_SANDBOX),y)
 WEBKITGTK_CONF_OPTS += \
 	-DENABLE_BUBBLEWRAP_SANDBOX=ON \
@@ -84,7 +90,6 @@ endif
 $(info $(BR2_PACKAGE_HAS_LIBGL):$(BR2_PACKAGE_HAS_LIBGLES))
 ifeq ($(BR2_PACKAGE_HAS_LIBGL):$(BR2_PACKAGE_HAS_LIBGLES),:y)
 WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=ON
-WEBKITGTK_DEPENDENCIES += libgles
 else
 WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=OFF
 endif
@@ -98,7 +103,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=ON
-WEBKITGTK_DEPENDENCIES += libgl \
+WEBKITGTK_DEPENDENCIES += \
 	xlib_libXcomposite xlib_libXdamage xlib_libXrender xlib_libXt
 else
 WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=OFF
@@ -106,13 +111,22 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=ON
-WEBKITGTK_DEPENDENCIES += libegl
 else
 WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=OFF
 endif
 
-# If only the GTK Broadway backend is enabled, EGL is still needed.
-ifeq ($(BR2_PACKAGE_LIBGTK3_X11):$(BR2_PACKAGE_LIBGTK3_WAYLAND):$(BR2_PACKAGE_LIBGTK3_BROADWAY),::y)
+# required for ENABLE_X11_TARGET, USE_OPENGL_OR_ES
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+WEBKITGTK_DEPENDENCIES += libgl
+endif
+
+# required for ENABLE_GLES2, USE_OPENGL_OR_ES
+ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
+WEBKITGTK_DEPENDENCIES += libgles
+endif
+
+# required for ENABLE_WAYLAND_TARGET, BROADWAY
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
 WEBKITGTK_DEPENDENCIES += libegl
 endif
 
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
