Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096CDEE7FEF
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 12:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB82241B3C;
	Fri,  8 Sep 2023 12:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB82241B3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HYbr4eqbS3bZ; Fri,  8 Sep 2023 12:54:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C839A415F8;
	Fri,  8 Sep 2023 12:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C839A415F8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF8141BF2A2
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 12:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C082C60D6E
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 12:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C082C60D6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VI5ppjKFyj9x for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 12:54:16 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9069860D6D
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 12:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9069860D6D
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31f4a286ae1so1825336f8f.3
 for <buildroot@buildroot.org>; Fri, 08 Sep 2023 05:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694177654; x=1694782454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gDD0wFUYtXGL318xw9LcHfAO93UziHYKvqzqr/W2k2o=;
 b=rDbwQVNGW4fANrlbr4atp+Blp1Xt/mC4Kn3Le8MjV9+xxa5bJfrqF+FhqUnBKErA/H
 RG8M+u9p0TqkC9u5OlIOWR4Cvq4NmoVg3YqaroNHzzsYCjD8u983uqUKBWI5AdiW4oNE
 VM76cSkA/DHOKd94CBIaEHSnGgEwMYxpteYd9htFf9oxjZzgxrUaSug/sdE59JCdkHkq
 I/+sLtAzyJBMg2RoWNB729n4grkNES5dWtGpDDT3unmI+urAY2hcmqdPgcIJTNKGmmFP
 6vOWaNcdHNN6OVvVp4vhdqpO7vTM/FDVtG+au/wRYHzof92XwsKfVHQ/oeasR3Yz5SXE
 HjoA==
X-Gm-Message-State: AOJu0YxwAHFHnHVascINA18ogDVZTGoof9JAdeKhs3SKCuL/oIQwk+1H
 TeBEzCMxclIcXfyoQX1/IbO00iZL6CDiXg==
X-Google-Smtp-Source: AGHT+IG3ETLUAkhR1iP/XDeMTDq8GvOub4RlJr3i/KA4dQfLV/WGSBmlk9NO4TWBI1j05EojwFjuWQ==
X-Received: by 2002:a5d:4568:0:b0:314:1560:cc68 with SMTP id
 a8-20020a5d4568000000b003141560cc68mr1912558wrc.56.1694177654196; 
 Fri, 08 Sep 2023 05:54:14 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 w3-20020a05600c014300b003fefe70ec9csm5133890wmm.10.2023.09.08.05.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 05:54:13 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Fri,  8 Sep 2023 14:53:58 +0200
Message-ID: <20230908125400.3722455-2-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230908125400.3722455-1-thomas.devoogdt@barco.com>
References: <20230413142927.3137190-1-aperez@igalia.com>
 <20230908125400.3722455-1-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694177654; x=1694782454; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gDD0wFUYtXGL318xw9LcHfAO93UziHYKvqzqr/W2k2o=;
 b=di3AwgHUZ+PkGHjdNEXEgODqdhR/3ZWiAEXBbeXyE9Xuy2afYw+X9QdkeIgilCe4Di
 V6Rpsw2A+XPST0LHzyxnTmSi3wciaChhYNmfGfCbMe4q3yg5AdGWKG3q6bk/CnMJJb6r
 89XuoHev1DNCGNNLlhhovhgusJkNJkZvV2PK3xyLqDgUQR5jE6JTf1iLT256nsLuK0ac
 f8JidMHHcbZmoh8q2paITFuf/nejdrdw/ImvXITjzzYxqDKafurU/gTOHNsFQWa2BpEt
 v4IEStk7wXNJIu1g1PWE6kosk45ujflrJvev0uu1+dTCXgcomVEjt+KJmgBl5wxEGSwU
 mHVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=di3AwgHU
Subject: [Buildroot] [PATCH v1 2/4] package/webkitgtk: allow both X11 and
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
 package/webkitgtk/webkitgtk.mk | 35 +++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 71599477f2..be2d04054c 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -80,32 +80,33 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_GAMEPAD=OFF
 endif
 
-# Only one target platform can be built, assume X11 > Wayland
+# Use GLES if available and desktop GL is not.
+$(info $(BR2_PACKAGE_HAS_LIBGL):$(BR2_PACKAGE_HAS_LIBGLES))
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
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
