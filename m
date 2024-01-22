Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15242C47DDC
	for <buildroot@archiver.kernel.org>; Mon, 22 Jan 2024 21:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D19240108;
	Mon, 22 Jan 2024 21:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D19240108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2FtPeK_jrey6; Mon, 22 Jan 2024 21:15:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAC824097C;
	Mon, 22 Jan 2024 21:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAC824097C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E05B1BF3A4
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 21:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBCC960A93
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 21:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBCC960A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Lp9m-7WNINZ for <buildroot@lists.busybox.net>;
 Mon, 22 Jan 2024 21:14:58 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFFF26080B
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 21:14:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFFF26080B
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e490c2115so28376115e9.0
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 13:14:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705958095; x=1706562895;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pn7ESmUF7D0CNDx7lJzo2uGzIUuNIejNv5dkzRoR8yE=;
 b=SVaTtNigJdlLpxZBrOPOxKL7LqOLhnQERlO03QWvVqlQF25T75bD2JEpUc76eBC4IL
 JxBpb10yXmNCI6vnT3/ivWApwCCS4o9/ja5UXZPOH7PIyXKF2kf2Rs/cemmRXPRjcibt
 PBplAvKSi8weMwvRW+fIqxUJDNwz9qaoafu/Jkp0+5bAVuMjYlCzOAVKEYXxikZYR4Hr
 2NRXMN2r5IUIGJ6okUXuPS7LArxyRRuSXkPnnpuBEcxW4BUDxsg3IOM6Bqem0K3zPOzE
 MmDxo7zUrdU86vl++Anf2Y9oXvlLa0SXTG0eQGhvUkz8FgF/hXtUnni4qscilFaHaAr2
 +UZQ==
X-Gm-Message-State: AOJu0Yzup8DXm+isHBRAiZFv7dvdqIdGUSKw6ltRxrWdQBruzx5KcEKO
 DE/YDCfMp0yKTyMOWw0wYIjg88kixny3rfyR+mWNUGHwgPeNzPWXAPT2PsV0
X-Google-Smtp-Source: AGHT+IFPFncY9F8XxOmfPdDJyaoEz2M8ZYvFhesbr9sWC3SVXKYgMfg2n/2duCj+ObXoKk0GgJ43Cw==
X-Received: by 2002:a05:600c:4fd2:b0:40e:70d2:5a79 with SMTP id
 o18-20020a05600c4fd200b0040e70d25a79mr2438148wmq.21.1705958094837; 
 Mon, 22 Jan 2024 13:14:54 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c35c700b0040d1bd0e716sm40614386wmq.9.2024.01.22.13.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 13:14:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Jan 2024 22:14:51 +0100
Message-ID: <20240122211451.3591-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705958095; x=1706562895; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pn7ESmUF7D0CNDx7lJzo2uGzIUuNIejNv5dkzRoR8yE=;
 b=X6JbYtxPNGj1RjwV1sXB9WuanBWDQsqsr8DSYTHGcV+6it3Ig8wMXlekzzZ1jnNP/R
 9ax8cIP5lEhCGqSZXghJaiIP3GP27+p/mcsWvgL8g4wk4Be2OKkbUWrTmwlOAzMBcuua
 wxvW7COKHpvWG/OPz4pFtSnKAmYS58UkJWUMlQFUkhuahHoq7tY/52Bg/ilAH7BYUyNp
 Lctp8R+kjICHU1+tgHglZhQOTZwSdbsa/uAFHA0tOQ4pk193rVNMRR7jzqBniyAZaTCP
 ZYGAxB63Rw5MeFcG5J/OWRU7heQad5/EvlpHQHJMF8m5lNjzoxvoDGo7Rcd7E1S+cVA9
 eWzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=X6JbYtxP
Subject: [Buildroot] [PATCH 1/1] package/weston: fix build without gbm
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without gbm raised since commit
534c22dd606e200969fce49b8d23b27902dec94e:

Message: dmabuf-feedback requires gbm which was not found. If you rather not build this, drop "dmabuf-feedback" from simple-clients option.

Fixes:
 - http://autobuild.buildroot.org/results/ebbba1d73ceeaacee17fde0c6c853415cd316091

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/weston/weston.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 6a5c0e57f5..bf8c7ced85 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -25,9 +25,6 @@ WESTON_CONF_OPTS = \
 ifeq ($(BR2_PACKAGE_WESTON_SIMPLE_CLIENTS),y)
 WESTON_SIMPLE_CLIENTS = \
 	damage \
-	dmabuf-egl \
-	dmabuf-feedback \
-	egl \
 	im \
 	shm \
 	touch
@@ -57,6 +54,9 @@ endif
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGBM)$(BR2_PACKAGE_HAS_LIBGLES),yyy)
 WESTON_CONF_OPTS += -Drenderer-gl=true
 WESTON_DEPENDENCIES += libegl libgbm libgles
+ifeq ($(BR2_PACKAGE_WESTON_SIMPLE_CLIENTS),y)
+WESTON_SIMPLE_CLIENTS += dmabuf-egl dmabuf-feedback egl
+endif
 ifeq ($(BR2_PACKAGE_PIPEWIRE)$(BR2_PACKAGE_WESTON_DRM),yy)
 WESTON_CONF_OPTS += -Dpipewire=true -Dbackend-pipewire=true
 WESTON_DEPENDENCIES += pipewire
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
