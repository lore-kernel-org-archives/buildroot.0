Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A70C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 20:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73A7B6100F;
	Wed, 27 Apr 2022 20:45:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nV5v4tzaFecC; Wed, 27 Apr 2022 20:45:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85F5760A70;
	Wed, 27 Apr 2022 20:45:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D19C1BF869
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 20:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AD4341821
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 20:44:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OMj3Lq0M6kgh for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 20:44:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D5B2417EF
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 20:44:58 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d5so4101745wrb.6
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 13:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tkVGluXvc8dGCKdwbrZGXFOmUiMMHP2v7Mk2VhT5I0o=;
 b=H3/9cwVheP6tb8bRGtd8S8EzDUxpgSYxbyPQH3YiAdqtYUiBNWB6y60mG8l+t5oaq2
 sGDmpwxWqvvgLUz3kNk4vaNGkx8vX2tVi6CfYAr5hliV1I7db7nThwF3x9MRXV/BKu9X
 r9SpP41MAUpUcjRl2gm+c3RrvaaZVy+/TrB8sG2l5mFBqPCTW1PpG/u2/JzTJiEIL6tg
 HzuRqUV7xK/G9jWViVeNXek5m3YYYlbssTLCPxIHaonb+wvt/cqkOZupdyYIhvjbngtR
 iKit6GvBpJei3aBBWzglGO8g0sxLFD0vQXVIi2zeoPaX3FncyPrhUDPEm+MHfq9xuG9g
 JRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tkVGluXvc8dGCKdwbrZGXFOmUiMMHP2v7Mk2VhT5I0o=;
 b=xZJLgikWfxH5zBlHpbuJydqlLhbfHUYiBvgYfnP0J7WC79sqjOgl/fVhJlQ0Hc/xNS
 K7fyZaEfG++iHMqMIdDeSajU5ypk5wewzv2HuQXmfnAskwm6CWLBSoR8wzCaOcfPMts5
 56aC1kFyw8PKwYSM5dZCSILXCeB1mRdC8MttUQuEelB1yDuHFr8XKxbFNiGRjE+O0zhK
 YhfWZGhpjs81KBGpr3KvnctCT/3ol8Gb9IC4XP/qv9Baj49L3EYtYbBKeG5T4CmWXOLG
 mvEsERjCAeiaG7TKbtvQw/27kwTvhnD/kChXVX5ORKMcqSXgWqRVsBxD0TNxJUPzpwA7
 fO7g==
X-Gm-Message-State: AOAM53393RC7AxWbtbmoQheIgI+KztLaGVzh80h02RQDHvgUqupyw/1H
 hkHXi+E82dnusGAI4sFd+abxA2OAkNM=
X-Google-Smtp-Source: ABdhPJyy2Gd86ZKQUpLXtyxThahGqcqJLigYdElQ86/mjNtdR9MtvDooflF6bIqm+hiW+TZdBlJI/w==
X-Received: by 2002:a05:6000:118a:b0:20a:d97d:f56d with SMTP id
 g10-20020a056000118a00b0020ad97df56dmr15239447wrx.659.1651092296173; 
 Wed, 27 Apr 2022 13:44:56 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a05600c3ac400b0039082eeff53sm2283909wms.22.2022.04.27.13.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 13:44:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 22:42:48 +0200
Message-Id: <20220427204249.3207448-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libv4l: drop -largp
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

Commit 07ac045655d08255fbc2d17b16a42d0f0017632e added -largp to LIBS but
it was not needed since
https://git.linuxtv.org/v4l-utils.git/commit/configure.ac?id=b187b94d8e9158973ad17ea1f9c4cb01df117ba3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libv4l/libv4l.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 8300f5c970..a781ffcd5d 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -28,7 +28,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 LIBV4L_DEPENDENCIES += argp-standalone
-LIBV4L_LIBS += -largp
 endif
 
 LIBV4L_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
@@ -85,6 +84,4 @@ ifeq ($(BR2_PACKAGE_SDL2_IMAGE),y)
 LIBV4L_DEPENDENCIES += sdl2_image
 endif
 
-LIBV4L_CONF_ENV += LIBS="$(LIBV4L_LIBS)"
-
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
