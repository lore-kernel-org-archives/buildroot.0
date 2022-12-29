Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6163C3DA79
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 427AC404CC;
	Thu, 29 Dec 2022 09:30:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 427AC404CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nda7fCgS7LXS; Thu, 29 Dec 2022 09:30:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EAA0403F5;
	Thu, 29 Dec 2022 09:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EAA0403F5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EAEE31BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5DEA40102
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5DEA40102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EUxNdGKC5rTu for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:30:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB7C2400DD
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB7C2400DD
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:30:36 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 fm16-20020a05600c0c1000b003d96fb976efso10708113wmb.3
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 01:30:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EdZER1V6CCR1S2t5/m4jn2MK0NQPYsNhDjGLUL2ejtE=;
 b=kLiWEw8Jr58ACCfOcpj5xE5KNGA9KTCMwQLHyqnt/JL1OfvqYbyuo+j9MiIV4YL1sP
 f3rinscAyhaW3owrAPS0qha9rRJJJ5HiHfOaZPFKukBkqTXhW1Z/lakcMW54+93sv/vz
 255e8M8/DcX5/EXlLexzNyXpXxPOQ9fVBJIdGShRb9Bx2buxmo3eCEcfTmz9ni2pjsNG
 ndFCFS+dFhj/zT2drYhRSLa/1+qA9Br1bVYKK9X55LPM9QpWbrLxCGMUVjh/6T0PFDnH
 aSVuJ2xsVebNAxx2WANnEItVgcBLCQyCix9DapH95yLS2PG/n33LwK3bZYe0tEoCZT0u
 LeQQ==
X-Gm-Message-State: AFqh2krwhE2Q2Utjp3Xc+Rpyrup3UtxUYXkw4iehYmVOkD2934K9gCbi
 uh3SLBGwLWshWO0ImCgAbGOlfkBAFTI=
X-Google-Smtp-Source: AMrXdXtblqTlCciFieCtLCjcc9WAhbhBpOJlEwSFR0qM98VnasJssf7z1YAj02Xmtd2iEXkF/F+cwg==
X-Received: by 2002:a05:600c:6016:b0:3d3:3c93:af5e with SMTP id
 az22-20020a05600c601600b003d33c93af5emr19783868wmb.35.1672306234599; 
 Thu, 29 Dec 2022 01:30:34 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 c4-20020a05600c0a4400b003cf75213bb9sm33101739wmq.8.2022.12.29.01.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 01:30:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:30:27 +0100
Message-Id: <20221229093029.264681-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EdZER1V6CCR1S2t5/m4jn2MK0NQPYsNhDjGLUL2ejtE=;
 b=XiPsJBufKf6l1q3TmU4hIuz6Wk+Ye85pamhcOL66osY6+ElOjWWttErCHDI9aqW2RU
 VyffznrHw02G56Ywk4liMoTPzseBuRQNAjOZ+d20sb8W6eF0VFMZ+GIABq6wuopq4xJf
 3oYkDjvg8bMDSjuLRl3vkLLdr2AqA5ahrsJ9tRO8CzvOcO6SjG1pj8Qdpc9mrHPgQ7cG
 ddA1miXN+yDK8ekKc4XMFdi1aig/DW0gHCcC1GXccBxhxQ7fJ/z8M3RAdYLjcy0qh+bZ
 1doS9EA6W0/+TQ/vttGhZx4QTYBIp5yC02+KEC4D1n8T6tZ54ic7rjamvHLmWcYd3pF1
 JugA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XiPsJBuf
Subject: [Buildroot] [PATCH 1/3] package/tiff: add zstd optional dependency
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

zstd is an optional dependency which is enabled by default since version
4.0.10 and
https://gitlab.com/libtiff/libtiff/-/commit/62b9df5d2af68262fa6fcfb66086bf128f7d67c3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tiff/Config.in | 4 ++++
 package/tiff/tiff.mk   | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index cc9aa5cfd0..d1004d6668 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -72,4 +72,8 @@ config BR2_PACKAGE_TIFF_UTILITIES
 	help
 	  Install all tiff utilities.
 
+config BR2_PACKAGE_TIFF_ZSTD
+	bool "ZSTD compression"
+	select BR2_PACKAGE_ZSTD
+
 endif
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index a753065fde..90b28ff37a 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -100,5 +100,12 @@ else
 TIFF_CONF_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_PACKAGE_TIFF_ZSTD),y)
+TIFF_CONF_OPTS += --enable-zstd
+TIFF_DEPENDENCIES += zstd
+else
+TIFF_CONF_OPTS += --disable-zstd
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
