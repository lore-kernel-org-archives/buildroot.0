Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E32EEB564
	for <buildroot@archiver.kernel.org>; Sat,  9 Sep 2023 07:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12FAC822FE;
	Sat,  9 Sep 2023 07:58:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12FAC822FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qR6f4SRYRyLt; Sat,  9 Sep 2023 07:58:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43C8082BF5;
	Sat,  9 Sep 2023 07:58:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43C8082BF5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0AEED1BF863
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 07:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5A3160E5B
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 07:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5A3160E5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bUFDPdOa431e for <buildroot@lists.busybox.net>;
 Sat,  9 Sep 2023 07:58:05 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 886BE60D89
 for <buildroot@buildroot.org>; Sat,  9 Sep 2023 07:58:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 886BE60D89
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-401b5516104so29765315e9.2
 for <buildroot@buildroot.org>; Sat, 09 Sep 2023 00:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694246283; x=1694851083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+P9JpcuJU4S5YU4LR/N9RCfJFFjfkpfiN4BDxncIRNU=;
 b=vBoPZecWnaSXOdElVCc8skrRRcJPtu+T2nGdzqrpqgg/wfz9FtCluTQt2PcuEHR8f1
 lTlelqwsZKi0qkHzx5l8jp4X10vTxuDV5dl0LFso8ntj+p4adeDaBtoumLNLeHhcSYhQ
 1c5chqU21XM3sHIQslZucfc5d65J7DSjP4XSHk6F9msO/7k+A02YeSTj0VC/hJG+VnvI
 7h8XmCjxVRznrO07pPhcXNb06UBjQwXgkE7rSIdEhiB8j1KnwPumrEYZR/s4/pDu9dwe
 2Whp+b4FKNOrnAeXzk7DCo2XK/BQlEA7g8Q2WX1LEUTaUHcmP81wNCrqp1Q1tWeyfeMH
 la1w==
X-Gm-Message-State: AOJu0Yzw7LKRn8eNmrmYEqiZ/t6nuauAsyLC4CFIVjbYBuJHCcKBFieu
 i0irTeXda6kYlOt1Q3ogwKsWjxps4wPClw==
X-Google-Smtp-Source: AGHT+IFMUpkifpcGKRLvIiH8ScYnwpPncyY3SmuV6X774CbhchMDL18wSiuK6kss7vpEmmXEJdIgFA==
X-Received: by 2002:a7b:c01a:0:b0:3fa:9823:407 with SMTP id
 c26-20020a7bc01a000000b003fa98230407mr3848713wmb.18.1694246282945; 
 Sat, 09 Sep 2023 00:58:02 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:f478:a81f:8ede:9814])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a1c4b0c000000b003fee9cdf55esm3833262wma.14.2023.09.09.00.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 00:58:02 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat,  9 Sep 2023 09:57:51 +0200
Message-Id: <20230909075753.7471-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230909075753.7471-1-thomas@devoogdt.com>
References: <20230909075753.7471-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/4] package/webkitgtk: allow both X11 and
 Wayland
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

From: Adrian Perez de Castro <aperez@igalia.com>

Allow enabling support for both the X11 and Wayland backends.

This in turn needs reorganizing how desktop GL or OpenGL ES is chosen,
as it no longer can depend on whether Wayland support is enabled: the
BR2_PACKAGE_HAS_LIBGL and BR2_PACKAGE_HAS_LIBGLES variables are both
checked, and ENABLE_GLES2 is set only if the package providing OpenGL
claims only GLES is supported; otherwise desktop GL is preferred. This
matches the existing logic.

The existing comment indicating that only one of both windowing systems
can be enabled was wrong: the same WebKitGTK build can target both
X11 and Wayland at the same time, as long as GTK itself has been built
accordingly. Enabling both is the approach taken by most Linux
distributions, and has been supported for years.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v2: dropped info debug line
---
 package/webkitgtk/webkitgtk.mk | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 71599477f2..bb6df3d592 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -80,32 +80,32 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_GAMEPAD=OFF
 endif
 
-# Only one target platform can be built, assume X11 > Wayland
+# Use GLES if available and desktop GL is not.
+ifeq ($(BR2_PACKAGE_HAS_LIBGL):$(BR2_PACKAGE_HAS_LIBGLES),:y)
+WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=ON
+WEBKITGTK_DEPENDENCIES += libgles
+else
+WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=OFF
+endif
 
-# GTK3-X11 target gives OpenGL from newer libgtk3 versions
-# Consider this better than EGL + maybe GLESv2 since both can't be built
-# 2D CANVAS acceleration requires OpenGL proper with cairo-gl
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
-WEBKITGTK_CONF_OPTS += \
-	-DENABLE_GLES2=OFF \
-	-DENABLE_X11_TARGET=ON
+WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=ON
 WEBKITGTK_DEPENDENCIES += libgl \
 	xlib_libXcomposite xlib_libXdamage xlib_libXrender xlib_libXt
-else # !X11
-# GTK3-BROADWAY/WAYLAND needs at least EGL
-WEBKITGTK_DEPENDENCIES += libegl
-# GLESv2 support is optional though
-ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
-WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=ON
-WEBKITGTK_DEPENDENCIES += libgles
 else
-# Disable general OpenGL (shading) if there's no GLESv2
-WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=OFF
+WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=OFF
 endif
-# We must explicitly state the wayland target
+
 ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=ON
+WEBKITGTK_DEPENDENCIES += libegl
+else
+WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=OFF
 endif
+
+# If only the GTK Broadway backend is enabled, EGL is still needed.
+ifeq ($(BR2_PACKAGE_LIBGTK3_X11):$(BR2_PACKAGE_LIBGTK3_WAYLAND):$(BR2_PACKAGE_LIBGTK3_BROADWAY),::y)
+WEBKITGTK_DEPENDENCIES += libegl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND)$(BR2_PACKAGE_WPEBACKEND_FDO),yy)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
