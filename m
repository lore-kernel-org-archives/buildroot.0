Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27658C02196
	for <buildroot@archiver.kernel.org>; Thu,  6 Feb 2025 07:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C89B681E00;
	Thu,  6 Feb 2025 07:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l82Agj-lkM88; Thu,  6 Feb 2025 07:09:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF11281DFB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF11281DFB;
	Thu,  6 Feb 2025 07:09:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B76CE1
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 07:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F32CE60855
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 07:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfMIGDjpkpls for <buildroot@buildroot.org>;
 Thu,  6 Feb 2025 07:09:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=eagle.alexander923@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 064E361125
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 064E361125
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 064E361125
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 07:09:27 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-543e47e93a3so643638e87.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 23:09:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738825765; x=1739430565;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hexNjr5hHPNYRISw0AxG+ai/aa3vdcfhR2fS0m7fgeg=;
 b=H5+vk28wGsDFyPPxiN5yZffNqd6PKdYoNXR04jIquIYwJ9dHCZJOAei73JT+1y+Dn+
 v0snqb9hrx2qz25h1HaPGVr8PbyByR9Z4ynV1lqPfzdGJSRvp9GJvwtHc4Hxmn6EvaxQ
 91M/zBOWt3yWIhRBo+qn0TiQfPb0benEgfMyGAr3Frq62Dbx4I+XfecQjXpgMoueljA4
 o/4CN00lk6BearnQVg7xyGzO+NjQR0beHqJ4wGnLotqBT9JzeP/15AxtYbIZ8Jto40+0
 bFR3r4Tqf2dSU9rtn4VbHRxd7ITduNJhAJVjo/lL6cAZetsem1QQm5igY4y6KJwzqWKb
 yOwA==
X-Gm-Message-State: AOJu0YyylQuMo2oUn+vLZDiEPmzSQT2lZ04IrpI/ijp95iuTg9annLZx
 W9/Vo3Xt82d/C6+mDg4K+nmtPssD9JLvQlqjIMVUlnaZLEwNMOOpEfZnJnD8
X-Gm-Gg: ASbGncutVZmsxLY6Ypu8GvbkPEzyY2jD5oJup+C/T6YE2Z9GxZEykYqtVGCr4eJOGEt
 V3AzIK2VfY3s/d5f2eC5oyucntPrLvCGJHZxjaT2vyKbrsfn2uZjCtR5kKDeh5Qj6FxZbd9H1TX
 ct63i0Qm1G+2ykV7sep4YH3zaE848rDOO96peWD/3+ov+z5ot5Pnml/YTszSJMPD3m77QXQ1WVH
 Ae8IlTwbvdXgzbxJXLsxIn7lt1iZuKbSIr0+nT6lDKKoNeeXiVTdT6apbpuokZXW9o2nYpwbyyU
 ViyXMT9d0t6dc6qbBjCT1wGxsJ9HqCWeSQp2Jg==
X-Google-Smtp-Source: AGHT+IHdsAp/BcCebyqzyu/dNCRektBqX2YfwL2QBqEeMuZQadTFWTx+cD2RVK356/8xL6hjgIN6yw==
X-Received: by 2002:a05:6512:ac1:b0:53e:395c:688d with SMTP id
 2adb3069b0e04-54405a7a5a8mr2206387e87.43.1738825764606; 
 Wed, 05 Feb 2025 23:09:24 -0800 (PST)
Received: from localhost.localdomain ([188.243.23.53])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-544105bf6casm56423e87.112.2025.02.05.23.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2025 23:09:22 -0800 (PST)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Thu,  6 Feb 2025 10:09:10 +0300
Message-Id: <20250206070910.1423800-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738825765; x=1739430565; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hexNjr5hHPNYRISw0AxG+ai/aa3vdcfhR2fS0m7fgeg=;
 b=dC0U1TmNsAdifxDL26c5UAQb0A/37cKAco16+SVkmBFOmKIzUGNCBHenXDftVeICVQ
 TFR7PMDhuLCusVZg8KmThK0slJZax9GzSjrhXMTogoRg4hNr7XKVP/YFS2EVH4toClVk
 Se6lIhBIuytB14u1zpSEl6d2rhnnLIIVz8cKFN9jaAzwYabnMzSBzM3zl755bWZHVmf0
 8bVUGpYBwfKnqZWPHYqkXej2eu6DRS3meXeYbSaIJfrO14uMbMq5OLZkWhDxbSKJSW+/
 bopedp7sguzhw+2zz/6zPjRo84UR/3JQpAOBNayxsScDZ5N57p7YzfyhU1zhr9MUdM6r
 9T/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dC0U1TmN
Subject: [Buildroot] [PATCH] package/sdl2: Add wayland support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This adds a configuration option to enable Wayland video driver
support in SDL2.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 package/sdl2/Config.in | 11 +++++++++++
 package/sdl2/sdl2.mk   |  8 +++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
index f1c22e4f80..784e381003 100644
--- a/package/sdl2/Config.in
+++ b/package/sdl2/Config.in
@@ -38,6 +38,17 @@ comment "KMS/DRM video driver needs a GBM provider, and OpenGL or OpenGLES+EGL"
 		!BR2_PACKAGE_HAS_LIBEGL || \
 		!(BR2_PACKAGE_SDL2_OPENGL || BR2_PACKAGE_SDL2_OPENGLES)
 
+config BR2_PACKAGE_SDL2_WAYLAND
+	bool "Wayland video driver"
+	depends on BR2_PACKAGE_WAYLAND
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_SDL2_OPENGLES
+	depends on BR2_PACKAGE_LIBXKBCOMMON
+
+comment "Wayland video driver needs a Wayland, OpenGLES+EGL and libxkbcommon"
+	depends on !BR2_PACKAGE_WAYLAND || !BR2_PACKAGE_HAS_LIBEGL || \
+		!BR2_PACKAGE_SDL2_OPENGLES || !BR2_PACKAGE_LIBXKBCOMMON
+
 config BR2_PACKAGE_SDL2_OPENGL
 	bool "OpenGL (GLX)"
 	depends on BR2_PACKAGE_HAS_LIBGL
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 50f80c68d7..918d5d7811 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -23,7 +23,6 @@ SDL2_CONF_OPTS += \
 	--disable-video-vivante \
 	--disable-video-cocoa \
 	--disable-video-metal \
-	--disable-video-wayland \
 	--disable-video-dummy \
 	--disable-video-offscreen \
 	--disable-video-vulkan \
@@ -164,4 +163,11 @@ else
 SDL2_CONF_OPTS += --disable-video-kmsdrm
 endif
 
+ifeq ($(BR2_PACKAGE_SDL2_WAYLAND),y)
+SDL2_DEPENDENCIES += libegl libxkbcommon wayland
+SDL2_CONF_OPTS += --enable-video-wayland
+else
+SDL2_CONF_OPTS += --disable-video-wayland
+endif
+
 $(eval $(autotools-package))
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
