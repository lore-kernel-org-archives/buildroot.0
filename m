Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D811C47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 20:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0015660AFF;
	Sun, 21 Jan 2024 20:57:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0015660AFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UQRKrOmrRnNx; Sun, 21 Jan 2024 20:57:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 721D160AEB;
	Sun, 21 Jan 2024 20:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 721D160AEB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 743AE1BF28A
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 20:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59DFE821E9
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 20:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59DFE821E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id smD8fX-PQezR for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 20:57:25 +0000 (UTC)
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BBD9821DA
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 20:57:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BBD9821DA
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3bd562d17dcso2244685b6e.3
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 12:57:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705870643; x=1706475443;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NSOWyFjcHRQgOwIUHk947cjC3I/0UsOT5vhH99L0L5k=;
 b=WoHfU6u+5wtWAqDDYcCn+roMkd9NkkV+5JmoUP12MJyHn1K120zATeYfBGQAcZBqFm
 RvsfZf5dmmDmVi9tD5bGO6o+HL2AiBEWBuzY/aX7X1l+2z2wUQUFt2zG9Cx/qAhV+5P5
 rpd3jcZPLCAiBoLoFlM85lgPMQwf0x2ODdvlDR/VkVrc7/qaZ5Cry3drmI58Q+mkk1Q/
 kU1XFPIyMAEqE0rK3gVAdKF316xdy2yY/cyAP/WwtTvc7J4OK2Ug2nSWL/rHCPdVrrD4
 6rT/Rj7bGLX3RTeOY3r9lNC04+DEWiNXWqNFiLLB8gIV9RhCRNjw+X2qBc6LTcD6jpib
 3R7g==
X-Gm-Message-State: AOJu0Ywwp7+71/FlKvoakJlAs31RYoVykenP2dy7XDvyqjkrv2IekgZI
 9BnzxMh/O1vCvlRFokgzTbjibHvmOhiI4pP60j9TJMAv1MXeOlvPKnP2OuWYd08X0cNhzgvsPb1
 l
X-Google-Smtp-Source: AGHT+IFuB7/Aubmn8qBr9ZjnF984zFe1CPIz6WCnsHYf5DAvuwOL4hgzAMZXWMa3M8FlwYsOI8T8qA==
X-Received: by 2002:a05:6808:1521:b0:3bd:bb5b:7eb6 with SMTP id
 u33-20020a056808152100b003bdbb5b7eb6mr248487oiw.2.1705870643345; 
 Sun, 21 Jan 2024 12:57:23 -0800 (PST)
Received: from fedora.. ([75.174.148.104]) by smtp.gmail.com with ESMTPSA id
 x20-20020a170902e05400b001d705b43724sm6034278plx.169.2024.01.21.12.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jan 2024 12:57:22 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jan 2024 13:57:18 -0700
Message-ID: <20240121205718.155549-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705870643; x=1706475443;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NSOWyFjcHRQgOwIUHk947cjC3I/0UsOT5vhH99L0L5k=;
 b=Jt2inXD7BAHGgx3lUz3BWH7kzvlEsKpBX0bMF8KUXfTwFsGdvk/2HQtx953EmrqaGe
 Xj+8x2AXZDJ4g5yyPVKKe3beVqtNrfsr2U6wR7GF06OuL8VXLU8q8IvabeVXJI55TTIf
 vjT4RDGBcs+in0T90p+knc+Q3WB31E/5QUcM0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Jt2inXD7
Subject: [Buildroot] [PATCH 1/1] package/flutter-pi: enable vulkan if
 possible
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable the flutter-pi vulkan option if a suitable driver is enabled.
Currently, only Mesa provides Vulkan drivers. As such, gating the feature
behind the BR2_PACKAGE_MESA3D_VULKAN_DRIVER option is reasonable at the moment
and is done by three other packages already:
flutter-engine, ivi-home screen, and wlroots.

Furthermore, a dependency on BR2_PACKAGE_VULKAN_LOADER is needed as the
vulkan-loader package provides the vulkan.pc file, which the configure step
relies upon.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-pi/flutter-pi.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
index f1812b154e..9edc62e7ac 100644
--- a/package/flutter-pi/flutter-pi.mk
+++ b/package/flutter-pi/flutter-pi.mk
@@ -24,7 +24,6 @@ FLUTTER_PI_CONF_OPTS = \
 	-DENABLE_TESTS=OFF \
 	-DENABLE_TSAN=OFF \
 	-DENABLE_UBSAN=OFF \
-	-DENABLE_VULKAN=OFF \
 	-DFILESYSTEM_LAYOUT=meta-flutter \
 	-DLINT_EGL_HEADERS=OFF \
 	-DTRY_BUILD_GSTREAMER_AUDIO_PLAYER_PLUGIN=OFF \
@@ -75,6 +74,13 @@ else
 FLUTTER_PI_CONF_OPTS += -DBUILD_TEXT_INPUT_PLUGIN=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER)$(BR2_PACKAGE_VULKAN_LOADER),yy)
+FLUTTER_PI_DEPENDENCIES += mesa3d vulkan-loader
+FLUTTER_PI_CONF_OPTS += -DENABLE_VULKAN=ON
+else
+FLUTTER_PI_CONF_OPTS += -DENABLE_VULKAN=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 FLUTTER_PI_CONF_OPTS += -DENABLE_OPENGL=ON
 else
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
