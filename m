Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF63C4338F
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 06:49:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5730A61212
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 06:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5730A61212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2181B605F6;
	Tue, 24 Aug 2021 06:49:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ruh83de_iT6n; Tue, 24 Aug 2021 06:49:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DA2060723;
	Tue, 24 Aug 2021 06:49:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A8521BF339
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 06:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0739C60723
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 06:49:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8QgdV9In9I-7 for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 06:49:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BC24605F6
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 06:49:22 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 w21-20020a7bc1150000b02902e69ba66ce6so1544402wmi.1
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 23:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iXle1BsAIxATICcNxPLbzEacmc9KmtDWKPUmjCCdV0Q=;
 b=b5e/96ZHK8us89UMDWYck4lcDjIdPlJydeUaQmZwBGINDBKGnuq/rsHelu3Hw8Z9I8
 drFapjShUlXeeWWWjI5daEq65Cznfwy77+5b2Uwlz4l8PI0kLMcQnrJ6yTLSui5Jscut
 hUuifC5fnukN1H0bMU2WK2d0XLx1ZVkcXLmPzUWkFgcWiNbaRTk8fcIDx5Lf6BRo2T9s
 r3sntc8zXYWVcyjDFybZ8h0GZRXxyLMlHd5eBcu/TCFEaOjlr1AlaZ1mECuuXwMpQZOi
 E1RHHER0jpisyr1txlXtLCE6v7jh/y9q5LhbxNuFz6aO51d07Cyzfo5cj/OxUuCRwKFr
 nGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iXle1BsAIxATICcNxPLbzEacmc9KmtDWKPUmjCCdV0Q=;
 b=WP38bYi8oAhVNRyuH88qQ+WiMMPoWZDCUjgPVw/5Trh071PqMj8MGGPN1G0fqzKj/t
 7GmRUVW5TLo84KBlKD0/Tv3sV6+pHnS2/nzuUXnOpg10gKv3GBlTSWKUALI97ZrUyqAB
 6CVzEPvrehv5L3BewuIdVI2rpgv+iy+Nfxeo1kl03cz5HEpELARpbg5qkTpSX77Mme0N
 QIzGSjNBrjittiOKOnT7A/UkFX4bC+r9MNMJhJcyV1qOUbBnbWIa0oygWCqz4l7blCp4
 kj0BVad8JQzsYXS4Pg5vHFk7FGA5/9s9aBCi6QPvP/9pFZtpNHqE0ryvBiugO3LAgbIv
 NEig==
X-Gm-Message-State: AOAM530SbNWCfaaNquIqyB0I79oUD3uugQbZGvsuyyZ8wP/UsWk2NHe3
 +iBMm195vs+SHqNSu5beSkRQirJovlwvpA==
X-Google-Smtp-Source: ABdhPJzOpVTBQIjJGTIbGsMoEEa7dqyvI10zk2Z5sBzCVBzUFeC2Zuni96KoUen73KViu7nEFhaw+g==
X-Received: by 2002:a05:600c:3641:: with SMTP id
 y1mr2395688wmq.43.1629787759968; 
 Mon, 23 Aug 2021 23:49:19 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id z7sm1327805wmi.4.2021.08.23.23.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 23:49:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 24 Aug 2021 08:49:16 +0200
Message-Id: <20210824064916.92551-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mpv: use BR2_PACKAGE_MESA3D_GBM
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Use BR2_PACKAGE_MESA3D_GBM instead of BR2_PACKAGE_MESA3D_OPENGL_EGL as
GBM can also be provided by a DRI driver

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpv/Config.in | 2 +-
 package/mpv/mpv.mk    | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 81b1e24b5f..51c9799de8 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_MPV_SUPPORTS_VAAPI
 	bool
-	default y if BR2_PACKAGE_LIBDRM && BR2_PACKAGE_MESA3D_OPENGL_EGL
+	default y if BR2_PACKAGE_LIBDRM && BR2_PACKAGE_MESA3D_GBM
 	default y if BR2_PACKAGE_WAYLAND
 	default y if BR2_PACKAGE_XORG7
 
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index f8ecaeb78a..e2910d9d97 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -46,8 +46,7 @@ else
 MPV_CONF_OPTS += --disable-alsa
 endif
 
-# GBM support is provided by mesa3d when EGL=y
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
+ifeq ($(BR2_PACKAGE_MESA3D_GBM),y)
 MPV_CONF_OPTS += --enable-gbm
 MPV_DEPENDENCIES += mesa3d
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
@@ -184,7 +183,7 @@ endif
 ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_MPV_SUPPORTS_VAAPI),yy)
 MPV_CONF_OPTS += --enable-vaapi
 MPV_DEPENDENCIES += libva
-ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),yy)
+ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_MESA3D_GBM),yy)
 MPV_CONF_OPTS += --enable-vaapi-drm
 else
 MPV_CONF_OPTS += --disable-vaapi-drm
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
