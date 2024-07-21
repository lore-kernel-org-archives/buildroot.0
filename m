Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67EBC3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 19:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24C7040208;
	Sun, 21 Jul 2024 19:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kzslamR4c9Wc; Sun, 21 Jul 2024 19:18:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F12C8402D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F12C8402D6;
	Sun, 21 Jul 2024 19:18:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 966351BF2AB
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 19:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84992605D0
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 19:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4DNrUsO4Ur74 for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 19:18:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4D8B8600B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D8B8600B6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D8B8600B6
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 19:18:46 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-427d2c8c632so24924035e9.2
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 12:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721589523; x=1722194323;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/WAL7uqEHrpixwdPhNyajCpXs8giEaApfpsqeY+5SBM=;
 b=o3HQrq58+hPiqwG9jFt7f8UB8B4t59XqBBK33iufE9kSOTHulolJNP8EjPXvhWhOSb
 yR6d5cUl4jiTkqhxPpR1vJcgBtqIHpWmvvglsJtBr3ChChD6ogo8N9Q6cb+bdyUMITP4
 UYIh3rhGLyawgXLYEVP6QLoX/Syqv3WpWouXV7cODz8oUe7QKGomSDVPcyQ7xywtYXYz
 15Wonhjlrt+yqI2OWZja90eRKJphzUq8gxOWmgRNq0Gmd5oOXMq9MIL+31rivvhfEcqZ
 UN3Hdh5onhQpExhut/bj+U0U0zUFbEhqrURKSFudATvYgteA36q4mTnuwZBgB8BB32Fi
 P1cw==
X-Gm-Message-State: AOJu0YxMJyDfOe6pj4AYrWf4JZLDiY9qnK4qshoeDoAUP5AgWZVeVNFS
 o6VawthxLESTK8bDwhc5bfEMHk2PGR7S6dJZHwXpYSxAwYibATFsgbDfGg==
X-Google-Smtp-Source: AGHT+IEZOtAyw+a3/Wk5qnVaVKyOEhcpajhy1Aw/qY/jNNLiz8ZaAjEdwFkmBjarVKHsqX9HFWN5ng==
X-Received: by 2002:a05:600c:1e8e:b0:427:d8f2:5dee with SMTP id
 5b1f17b1804b1-427dc548f66mr30188585e9.15.1721589523161; 
 Sun, 21 Jul 2024 12:18:43 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d6901451sm99578465e9.17.2024.07.21.12.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 12:18:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 21:18:39 +0200
Message-ID: <20240721191839.2757527-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721589523; x=1722194323; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/WAL7uqEHrpixwdPhNyajCpXs8giEaApfpsqeY+5SBM=;
 b=aqIrEIIjC6ydy05TKnXt7uvyfLIYBv+LFmGth2D2XXVYrTaaLLcNb1lQGv76rGsnqt
 lKjSaGAghC8uDLq82gMfE8wbgArMtewTQgQM2QXUAtgYXCwiNR+FyyleNWkrTKssjGVz
 o9hF1cyT2lwMRvP0xwlnZB9e2MsNMVqAyGFoEfmfmyjWsbZ4OFOqIGp7Denisok5Voce
 4KfV0e3bqDi8M2PTnpwuha5AolexLCzpqBVWO00q1mFmmJRNg1iRJFI0mr8X8uMm3xax
 vrPxrHX01nx3fSLAj3cZQ0eGwSUJCeJuC3ZB3ZXkYEsR+BzS4tYm+y8LCNQh9y67ILo1
 Bvxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aqIrEIIj
Subject: [Buildroot] [PATCH 1/1] package/mtd: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mtd ubifs unconditionally calls the (deprecated) ENGINE_* logic in
libopenssl resulting in a build failure when
!BR2_PACKAGE_LIBOPENSSL_ENGINES since commit
623d3bbe43e9193aa8e3395367d01af59071b859:

  CCLD     mkfs.ubifs
/home/autobuild/autobuild/instance-1/output-1/host/lib/gcc/powerpc64-buildroot-linux-gnu/13.3.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: ubifs-utils/mkfs.ubifs/mkfs_ubifs-sign.o: in function `sign_superblock_node':
sign.c:(.text+0x328): undefined reference to `ENGINE_load_builtin_engines'

Fixes: 623d3bbe43e9193aa8e3395367d01af59071b859
 - http://autobuild.buildroot.org/results/1fd49b193a3623d244ace602c46f15914bfbcff4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mtd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 57a562c108..0c95e3cc54 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_MTD_JFFS_UTILS
 
 config BR2_PACKAGE_MTD_UBIFS_UTILS
 	bool
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
