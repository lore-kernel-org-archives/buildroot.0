Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC3BC4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 15:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6F4D4016C;
	Thu, 29 Dec 2022 15:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6F4D4016C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4flGWzIfiAOg; Thu, 29 Dec 2022 15:37:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04495400DD;
	Thu, 29 Dec 2022 15:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04495400DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 21F7C1BF398
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 15:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F12D260A8D
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 15:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F12D260A8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CYVg8wLUOetD for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 15:37:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9DA26068B
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9DA26068B
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 15:37:41 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so10949977wmb.2
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 07:37:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CE9ECQXHwmAtk/TS8CdICkSkxBsElv7IbmUpSBj6co0=;
 b=ho+9X4rXrMHxlYDm+r9WQqbMSZXK77YtT1uPZ5KRnD3Sl44UgAoBEzVnVN06SP9hdF
 NI2u+ejqnGhd5VaO31ZlTbaolgANiW1uJh7erw04wbSxAkwcmowvu81wMBw5oSW//GRC
 fpUKcrDoFtiUKIL5FQf5FM3ozj1QApbLheGy4qLhQbF4ED2gtASua1cd/xdV2W5zQrJx
 HnFuPzoBGlAqIj1x5J/sMPGyUIuyU3i2OjLD58bVt5JLZ6yp3d/8QinaaZbnRqRdZY1P
 SVza2uiDvlW7V43A+Jj5jbz5hvOQHJRovPIo/o7AgKHiZFUay5+oH1ulwEMppTMCF7Ts
 ruQQ==
X-Gm-Message-State: AFqh2kpM4Lc++lVEZ3AR3V2ic5KCO+eD3AAobfNQhOIpnEp/uTp+nUvW
 8XrNALu0hRPWp65XVkKu47g0zp2uo7U=
X-Google-Smtp-Source: AMrXdXuBctu360F4aAf71TMPyqugG2rNomWDfoB7JmmZKWuxf2PPVssPGOHoKqoi2+EGF5UvCb9m9g==
X-Received: by 2002:a05:600c:4e90:b0:3cf:894f:964b with SMTP id
 f16-20020a05600c4e9000b003cf894f964bmr21264267wmq.16.1672328259155; 
 Thu, 29 Dec 2022 07:37:39 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 fc7-20020a05600c524700b003a3442f1229sm33501441wmb.29.2022.12.29.07.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 07:37:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 16:37:35 +0100
Message-Id: <20221229153735.12524-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CE9ECQXHwmAtk/TS8CdICkSkxBsElv7IbmUpSBj6co0=;
 b=BAVEt2XMdtwcozw33UL7lz8SWiAoPw1nQRn7QcBCgEgI4sMKu28r2FT68MB27KbFyD
 eojJwdUPel2CdxzSdzukekL86MY8hIw8XX+MR00UuC7RpCPzImWuKeC8nw0+nA+YEmpn
 8V5XPobMPIPiIa07aruWfFWU1/rYaXQjFkaUfFgeiID8FdIYk3Brc2ODWZNZSsx9kLMR
 /vDElY0S/s61Bkwb/0IPm7iAPD/sGbACn3t++0l+Jf5Yls2pKcXkyehob92Wg9vJpfdw
 8aEUCHteBWAponWXhzWbjI6vOcWq+MYNrIe8cJkELSTq6V1qfTbLWs0XeXEQHhlZkptQ
 aPlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BAVEt2XM
Subject: [Buildroot] [PATCH 1/1] Revert "package/tiff: add webp optional
 dependency"
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

This reverts commit 3fd6ada8dbca3370b9bb67feb2971e637cb4b11f to fix the
following build failure raised because tiff is already an optional
dependency of webp:

package/tiff/tiff.mk:122: *** Recursive variable 'TIFF_FINAL_RECURSIVE_DEPENDENCIES' references itself (eventually).  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/d8486cd1d5e56fb3719dc88b8aebc76c3e23cdc9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tiff/Config.in | 4 ----
 package/tiff/tiff.mk   | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index b9e3656e6f..d1004d6668 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -72,10 +72,6 @@ config BR2_PACKAGE_TIFF_UTILITIES
 	help
 	  Install all tiff utilities.
 
-config BR2_PACKAGE_TIFF_WEBP
-	bool "WEBP compression"
-	select BR2_PACKAGE_WEBP
-
 config BR2_PACKAGE_TIFF_ZSTD
 	bool "ZSTD compression"
 	select BR2_PACKAGE_ZSTD
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index c2a4108f35..f0b56150b1 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -105,13 +105,6 @@ else
 TIFF_CONF_OPTS += --disable-tools
 endif
 
-ifeq ($(BR2_PACKAGE_TIFF_WEBP),y)
-TIFF_CONF_OPTS += --enable-webp
-TIFF_DEPENDENCIES += webp
-else
-TIFF_CONF_OPTS += --disable-webp
-endif
-
 ifeq ($(BR2_PACKAGE_TIFF_ZSTD),y)
 TIFF_CONF_OPTS += --enable-zstd
 TIFF_DEPENDENCIES += zstd
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
