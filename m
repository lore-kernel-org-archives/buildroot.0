Return-Path: <SRS0=Fkjy=NM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8464C4338F
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 09:40:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7093A61178
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 09:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7093A61178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3990380B79;
	Sat, 21 Aug 2021 09:40:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8r8tR9tvh7gF; Sat, 21 Aug 2021 09:40:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B584880D27;
	Sat, 21 Aug 2021 09:40:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 72D651BF82F
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 09:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62827402DF
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 09:40:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MqMQaCuhsPjS for <buildroot@lists.busybox.net>;
 Sat, 21 Aug 2021 09:40:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B376403C3
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 09:40:00 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 f13-20020a1c6a0d000000b002e6fd0b0b3fso8962287wmc.3
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 02:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RZDH95Thd7o46V1F0yqziodXdmNP6R6PpqCtSBHOxjs=;
 b=gq+pNc2yzoEXaX34ZXEfYJIVQC0a55AsA0khGEaYO4iRcc0hvgi3e0EPuR6jvTbfrm
 5gb4hS9ep8ZzU6G4NV1wU14s0O/GfFCAQrPVnhBgh0jtKIDR1RNjtGFRTR2fJ6vKt9so
 l6SLOjGsrp9HlkkPcj63+vBpugrVwGtgVrlV90yuOLq4VfxvgKIIRB2zUeC9I52+xczx
 63tBsczU8N2nJi6lJqTm8Seb6u64E3cW4SPWZik+QJMZqfNcmuUysCGCcg7tMFiipwyH
 Mdvi4RBYYchdoU4JA8wbUIz63B5j6oJ2XTZeDvqYsyvutQuE1Dv/Y24y/obYQab7Qvce
 js+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RZDH95Thd7o46V1F0yqziodXdmNP6R6PpqCtSBHOxjs=;
 b=WSIV107KSpHt2+kuMoe+Cp//r4dcKeedpNgGGumFo4vpIVqBD7oFPCoY86R/ZVYaNK
 WEldZ5mposgAOf0E7BCe0Pd125qPYbZ0I6ItRQiVG1t5KJ8DCNo7BazI96eN5DuXUTNw
 CjYvFEP8vm2VmqUxttsx7s2JNcgWJ7BKU1jOHu0LDyoPXLZVHn/jpCmBq5itgq6ZOb5Z
 tQ8DTdUZLwJqEejmFDKuCht7REBlW2lbRAN0QorCQm9Of0WdWxBtXaN9DpcEaP0CZ3IT
 jT05VDjGcRQ1JZUyQLkGfPhoNVa7cGRQ0ylq7rN4/kBViyZgkwOEDeInQ/i/ufcQqyY7
 vzzA==
X-Gm-Message-State: AOAM533AAKQFNRqlcV3m36UTzB09Viijy4JLpU8jEYHV7lX/OJzTv1+f
 kAkRhMuNqOoUTBwKKTY0TJ1d8Xr4RqLnyw==
X-Google-Smtp-Source: ABdhPJyddha0u2pZh9YfoXLEyfnrUFdzusChk2DuB7/XbZyHlF7an/OP+qe9IlopnSc30u32iHmSCg==
X-Received: by 2002:a1c:7e12:: with SMTP id z18mr7612705wmc.60.1629538798288; 
 Sat, 21 Aug 2021 02:39:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id l18sm14761902wmc.30.2021.08.21.02.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 02:39:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Aug 2021 11:39:07 +0200
Message-Id: <20210821093908.677218-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/sdl2: kmsdrm needs GBM
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Fischer <mf@go-sys.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

kmsdrm needs GBM (and so mesa3d) since its addition in version 2.0.6:
https://github.com/libsdl-org/SDL/commit/56363ebf6124b345e1cfbd14fb6c0e654837910c

If libgbm is not found, kmsdrm will be silently disabled

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sdl2/Config.in | 5 +++++
 package/sdl2/sdl2.mk   | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
index f29b3c7c38..07de75a4d5 100644
--- a/package/sdl2/Config.in
+++ b/package/sdl2/Config.in
@@ -32,10 +32,15 @@ comment "X11 video driver needs X.org"
 config BR2_PACKAGE_SDL2_KMSDRM
 	bool "KMS/DRM video driver"
 	depends on BR2_PACKAGE_LIBDRM
+	# requires libgbm from mesa3d
+	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
 
 comment "KMS/DRM video driver needs libdrm"
 	depends on !BR2_PACKAGE_LIBDRM
 
+comment "KMS/DRM video driver needs an OpenGL EGL backend provided by mesa3d"
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
+
 config BR2_PACKAGE_SDL2_OPENGL
 	bool "OpenGL (GLX)"
 	depends on BR2_PACKAGE_HAS_LIBGL
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 5aad92eda8..ff6b29f29c 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -152,7 +152,7 @@ SDL2_CONF_OPTS += --disable-alsa
 endif
 
 ifeq ($(BR2_PACKAGE_SDL2_KMSDRM),y)
-SDL2_DEPENDENCIES += libdrm
+SDL2_DEPENDENCIES += libdrm mesa3d
 SDL2_CONF_OPTS += --enable-video-kmsdrm
 else
 SDL2_CONF_OPTS += --disable-video-kmsdrm
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
