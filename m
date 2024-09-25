Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C942CF58C3
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 13:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CEF942665;
	Wed, 25 Sep 2024 13:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CP5tlLU0Hv3k; Wed, 25 Sep 2024 13:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96B4A42662
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96B4A42662;
	Wed, 25 Sep 2024 13:35:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DDC801BF38D
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 13:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD60D84902
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 13:35:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_0ZAC5l2EN1 for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 13:35:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9F5DC848FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F5DC848FE
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F5DC848FE
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 13:35:25 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3780c8d689aso4545760f8f.0
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 06:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727271323; x=1727876123;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XfLKLOO065aWOSWAHhWTRMSU2u+vMaBmDdNYs3Dp5zw=;
 b=E1l+aQ6bAjRZ9MvxRUvocyaXmJR+wNlvjAKiDdxCfAKey6hBrRpXYP7KzaBubh7W1d
 uHCfJ7e1LgqAplrE/BM9rqkG/6DK6Ud5MFSStb3ufbl/ani5+PlDxJoHeLM+poApzF7P
 Do3NZuUEBW64O/ru+rJWCtYNqFWx5PfDlpUwssI++E3L99YPIrrMufx8jNDuOdaeh1y5
 QfbvaS7V9lzwDnaJOpfYUkUutTspKC8AhMT4OIgNAEpu8IISn8DJefnf+BMr6+1xrpbc
 lBSHrW3b32VsgM2foyU9XRRXF+lv3cTkDCPBJV/swHrFK72TaNQ/uQ4RQEWBnQdg8cGP
 PxzQ==
X-Gm-Message-State: AOJu0YxTMf6tqgGGSXQoh5EeMwX4GsIfGLs5PGQ2ODiKEfCpxshla0Xa
 vukS+w5uKH2gqkbUbh9vIdx+oqten0cKmbYDtfBL3UsgoD6bUP6Gsc5YumDkFrpYMwrRVP1BElv
 8Yg==
X-Google-Smtp-Source: AGHT+IEP5Jmg0uSDDVOlNzYk7iRA7EJq0RviaCAp0YnWbvGku73VXZTZzdFkPTKjJew7XumyRuD2eg==
X-Received: by 2002:a5d:44c3:0:b0:378:fe6e:50fb with SMTP id
 ffacd0b85a97d-37cc245c0f0mr1771871f8f.10.1727271323279; 
 Wed, 25 Sep 2024 06:35:23 -0700 (PDT)
Received: from vm-2404.. (55.6.65.37.rev.sfr.net. [37.65.6.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e969e18f7sm19052935e9.5.2024.09.25.06.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 06:35:22 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 25 Sep 2024 15:35:11 +0200
Message-ID: <20240925133512.3899750-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1727271323; x=1727876123; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XfLKLOO065aWOSWAHhWTRMSU2u+vMaBmDdNYs3Dp5zw=;
 b=g+ezuWUK8vEAJKU4IjBw7PBoeLwJOvsUnYGWwS3+Osr6DoAqZxZUvSpcdWCp20lSjM
 Zpz8WMiH2RgtXw6laEsYBYG7pCd9o40KaO0LnsmVYGphevqPFD+hFv/NAVjSr3JFEZIJ
 pL1RaTffu2DLWN5VXVrfvTk7WKAErZzedXEworI/taIdGYJEhqMorJp5FABMWyGbQicK
 a8hqhUi44WVAsJGYBVB/bCUIdDvdNRioThL5eNh15pztj21sMI6MEMYj6PIdJpHiKKME
 +78M1j1C6ErR86oDRsgKKstWPVtMBRWZpJ/R/LBar4Bd/ba6g7eKLk15xvsoJa9eRdxy
 t0Pw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=g+ezuWUK
Subject: [Buildroot] [PATCH] package/freetype: bump to 2.13.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/freetype/freetype.hash | 6 +++---
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index e7331d5ba..fcd99319c 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.13.2/
-sha1  2d8d5917a1983ebd04921f2993a88858d6f72dec  freetype-2.13.2.tar.xz
-sha256  12991c4e55c506dd7f9b765933e62fd2be2e06d421505d7950a132e4f1bb484d  freetype-2.13.2.tar.xz
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.13.3/
+sha1  2437819d11c1205e81141735dcb0a36c0d541e96  freetype-2.13.3.tar.xz
+sha256  0550350666d427c74daeb85d5ac7bb353acba5f76956395995311a9c6f063289  freetype-2.13.3.tar.xz
 
 # Locally calculated
 sha256  2e3bbb7d7c5c396368dd0853a790ec29ce5b8647163dde42a0493fb0d6556b2b  LICENSE.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 5032414d6..ad8cd00ec 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.13.2
+FREETYPE_VERSION = 2.13.3
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
