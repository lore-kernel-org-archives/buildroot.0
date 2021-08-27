Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7CFC432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 22:19:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28E6560F91
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 22:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28E6560F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C96714000B;
	Fri, 27 Aug 2021 22:19:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AS3d2CdWsntK; Fri, 27 Aug 2021 22:19:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BCFB40180;
	Fri, 27 Aug 2021 22:19:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B55F61BF3D4
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 22:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4F5D836F1
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 22:19:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id USyyS79m4_3D for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 22:19:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C07EC8367C
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 22:19:35 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id y195so1886693wmc.2
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 15:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JSSypgB6oqTMiE5IhRgfb2RkHwavIh3+SFejh1DsrwY=;
 b=OBPoCQOula7iG9KKuvegfVJ3npiBZS+qJnYUKpaVbYtQBJTJcIwkrUljkVWBX7BRkt
 rqQOmpN683j7dY9lD+RTtGKVuEh/89sZPYjwRvfyL6+T2Hs9kvosNFy85NYYu2s5x/Qa
 MyjBWTOyCf91BY6LkIEOzTEQyL22S3kn1R15Xie9pX11TARhpgX2YKVQK57m2+7ny1ND
 zy09nf1USRFmpDECYCB/Fnd7iSF3RrMy7jJXn4E71dRic8obroD+ahM3M2d8WxyWW0GV
 tz5TaaIawaNS0EO5RVyw7J1o0FHlD5+b+9kjb9Tvb2sKrP/IziR2iw6iiHE4W4mfaRqw
 JC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JSSypgB6oqTMiE5IhRgfb2RkHwavIh3+SFejh1DsrwY=;
 b=eJJMPQlT6Ax6piVFhbBZlY5KnY75tPRkpfZzT6OcWz4TeEDp6yapb00LfF+/al/+74
 zxIdSqtNQNhxT73iuHIwgZpFvLhQqVL5+cSAxpxtx9LWCrUhRaOoeGNZmEIL3aPo3WxV
 OvZmu6w9bMWrtaeeN1t/KBbJUBNGYS9r6RF+CWWasVAJd9AVCwEd4NRnRCNveN+A3tU/
 fToee8rPPYW8b6uOfMj+UowUKd9fOPPAluGn8hZdXJNtdgt+1IHm8z917KMhFc/JvqD5
 f2YaFCgKmFkZzIG6w97woa0tDrY/tI2FW4rxidCkC/igR6pODJp7I6oCoSNXdvpOXGBj
 eQNQ==
X-Gm-Message-State: AOAM530ihXB2jxUzGX5m0Pm9mPCdmn0bf+Zab7NnHh0gpLBJfa60u9bh
 DMnR1OMULwFbOqpVN5eHr/qVsbPW9oVnYQ==
X-Google-Smtp-Source: ABdhPJzojvLgCvsa8i5OeLu5+5YgUsbXzb+31C09kbb+a4mugPTkEt7LzOHDX+DVmxliP4IkxiOXdw==
X-Received: by 2002:a05:600c:4293:: with SMTP id
 v19mr4746652wmc.32.1630102773728; 
 Fri, 27 Aug 2021 15:19:33 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id h11sm14441877wmc.23.2021.08.27.15.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 15:19:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 00:19:30 +0200
Message-Id: <20210827221930.286234-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/glslsandbox: kms needs gbm
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Obviously, KMS/DRM/GBM needs gbm (and so mesa3d which is the only gbm
provider since commit 814bfc5ec1ab49188d1c8cb7f0d8d857b92d6a03):

checking for gbm... no
configure: error: Package requirements (gbm) were not met:

Package 'gbm', required by 'virtual:world', not found

Fixes:
 - http://autobuild.buildroot.org/results/31b3fff9748300e293b4efb5615176ccce48dd15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/glslsandbox-player/Config.in             | 4 ++++
 package/glslsandbox-player/glslsandbox-player.mk | 4 +---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index dc0d2c07f1..b85dff6a2f 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -67,8 +67,12 @@ choice
 config BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS
 	bool "KMS/DRM/GBM"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	depends on BR2_PACKAGE_MESA3D_GBM
 	select BR2_PACKAGE_LIBDRM
 
+comment "KMS/DRM/GBM backend needs mesa3d w/ GBM"
+	depends on !BR2_PACKAGE_MESA3D_GBM
+
 config BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI
 	bool "Allwinner ARM/Mali Frame Buffer"
 	depends on BR2_PACKAGE_SUNXI_MALI_MAINLINE
diff --git a/package/glslsandbox-player/glslsandbox-player.mk b/package/glslsandbox-player/glslsandbox-player.mk
index 5ace69d7dd..4f058772df 100644
--- a/package/glslsandbox-player/glslsandbox-player.mk
+++ b/package/glslsandbox-player/glslsandbox-player.mk
@@ -37,9 +37,7 @@ GLSLSANDBOX_PLAYER_CONF_OPTS += --disable-install-scripts
 endif
 
 ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS),y)
-# gbm dependency is not needed, as it is normally packaged with
-# libegl/libgles drivers.
-GLSLSANDBOX_PLAYER_DEPENDENCIES += libdrm
+GLSLSANDBOX_PLAYER_DEPENDENCIES += libdrm mesa3d
 GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=kms
 else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI),y)
 GLSLSANDBOX_PLAYER_DEPENDENCIES += sunxi-mali-mainline
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
