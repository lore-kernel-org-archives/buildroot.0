Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B32CD1288
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 08:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72C3840B14;
	Sat, 30 Mar 2024 08:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tu9PZ4SdogE4; Sat, 30 Mar 2024 08:32:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58A1840B3A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58A1840B3A;
	Sat, 30 Mar 2024 08:32:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FB541BF471
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 08:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39D8B608D4
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 08:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VlUL_nRe7UT4 for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 08:32:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0F2B7608AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F2B7608AC
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F2B7608AC
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 08:32:12 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3417a3151c5so1725774f8f.1
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 01:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711787530; x=1712392330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6phyVDUQW7bGMa5hjdcYcUMzUSj0jtKnKLR2B2zEohE=;
 b=OGySXaM2v1H6+HwamF7KpjCyg7pygDannftlin24z13jTjw+XhPcZwHdWWSpCEbad3
 GjXMZuiFly8d8FZbCLxKj+l0z4V1ghH0weBtq/tmDJbkTY2tVKRRQiYzAnZbkpUcdBU5
 0vKqqMBIaN9Uyv08pDW7iIkZGrM7sUGa1sKen+RKK6Mc1bjVflQoPFgbmpBOQehtmMCv
 yyUNuCljPNO3Uzx8NatfLxZEzf/s63XqKzQVAdO6bHkizhDT1Idh1ZWolarSRnx/J/Yg
 jeAj6bd646u8ACHYR2xl+DNPUBjoh2k4qDARMrnW3cepirZBV5ma7aRQ4fKG0umHo2ty
 GvMw==
X-Gm-Message-State: AOJu0Yxoe1Dfbv6KTo4Xn0QlXNUEdbis6n5BzuLN6AadExfguN6pcEU+
 QEDDjy43g5EJs3sSFhkvuS85pqiGvexza+ErSbpznJPh63404ITn/T3TrCV/
X-Google-Smtp-Source: AGHT+IGVOM+WFkvPullUAsEexC8JS69EYMW+RnDk3KyuJCuq2Der/IMQPoIVtJj9dam5Ok260pPoIA==
X-Received: by 2002:a05:6000:196b:b0:33d:5484:e451 with SMTP id
 da11-20020a056000196b00b0033d5484e451mr2972173wrb.34.1711787529792; 
 Sat, 30 Mar 2024 01:32:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 cp32-20020a056000402000b00341c88ab493sm5983027wrb.10.2024.03.30.01.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 01:32:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 09:32:07 +0100
Message-ID: <20240330083207.227006-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711787530; x=1712392330; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6phyVDUQW7bGMa5hjdcYcUMzUSj0jtKnKLR2B2zEohE=;
 b=fEKXwXmyDnIXaIljalTU2Dwl6ti0prIwvbwAQlHL8LPaFIO/h/2royULLHHumY4slo
 fCil+OqLmmSXx/LAAyXJrhLrNyyqAqfj8sJJdImgTpIEMi4N+dqrS217TSVpyvA9dmjA
 EDteox7AvE/9JgDX73/rGirACTPJu4v44Lu2s92vk3wVPzcq5keez0xxnWn5r1rsXJN1
 wS6wNaxYnwwfIbqk6YBnfMPS2KX6vY/oy1s48RvXO5RPaxgklfbpet5R7H+zkY7uKHW6
 Ig1mJ1Z50jxg5dhtZkYbulyohavOUV4kQHKrHKXlvpSE/PIBt0UK4MPfy4R+5T+XTj09
 5PuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fEKXwXmy
Subject: [Buildroot] [PATCH 1/1] package/davfs2: fix build with neon 0.33
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

Fix the following build failure raised since bump of neon to version
0.33 in commit 00f7bd06d66b05ec694f8a3e90d56e5c4f532e6b:

configure: incompatible neon library version 0.33.0: wanted 0.27 28 29 30 31 32
configure: error: could not find neon

Fixes: 00f7bd06d66b05ec694f8a3e90d56e5c4f532e6b
 - http://autobuild.buildroot.org/results/3386c44447b09e434c60837ddd7eb08b5ef3d9a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...2-configure.ac-add-neon-version-0.33.patch | 27 +++++++++++++++++++
 package/davfs2/davfs2.mk                      |  2 ++
 2 files changed, 29 insertions(+)
 create mode 100644 package/davfs2/0002-configure.ac-add-neon-version-0.33.patch

diff --git a/package/davfs2/0002-configure.ac-add-neon-version-0.33.patch b/package/davfs2/0002-configure.ac-add-neon-version-0.33.patch
new file mode 100644
index 0000000000..93eff48cd5
--- /dev/null
+++ b/package/davfs2/0002-configure.ac-add-neon-version-0.33.patch
@@ -0,0 +1,27 @@
+From 1c539d158ae73e867d0d30b8c3d27f48d742ed06 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 30 Mar 2024 09:18:15 +0100
+Subject: [PATCH] configure.ac: add neon version 0.33
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://savannah.nongnu.org/bugs/?65247
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4f86cde..ede9b1e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -36,7 +36,7 @@ AC_PROG_LN_S
+ # Checks for libraries.
+ AM_GNU_GETTEXT_VERSION(0.19.8)
+ AM_GNU_GETTEXT([external])
+-NE_REQUIRE_VERSIONS([0], [27 28 29 30 31 32])
++NE_REQUIRE_VERSIONS([0], [27 28 29 30 31 32 33])
+ DAV_CHECK_NEON
+ 
+ # Checks for header files.
+-- 
+2.43.0
+
diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
index a67c506250..9f9e4a7073 100644
--- a/package/davfs2/davfs2.mk
+++ b/package/davfs2/davfs2.mk
@@ -9,6 +9,8 @@ DAVFS2_SITE = http://download.savannah.nongnu.org/releases/davfs2
 DAVFS2_LICENSE = GPL-3.0+
 DAVFS2_LICENSE_FILES = COPYING
 DAVFS2_CPE_ID_VENDOR = werner_baumann
+# 0002-configure.ac-add-neon-version-0.33.patch
+DAVFS2_AUTORECONF = YES
 
 DAVFS2_DEPENDENCIES = \
 	neon \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
