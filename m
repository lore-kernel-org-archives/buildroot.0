Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475A3C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 21:47:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9B5461107
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 21:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9B5461107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC12940259;
	Sun,  7 Nov 2021 21:47:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rarc7I9xdVsl; Sun,  7 Nov 2021 21:47:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 050BA40257;
	Sun,  7 Nov 2021 21:47:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C90BD1BF335
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 21:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C55F780DA4
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 21:47:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yab6g98U1EQ8 for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 21:47:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE7DC80D2D
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 21:47:22 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d3so23496605wrh.8
 for <buildroot@buildroot.org>; Sun, 07 Nov 2021 13:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dQfeFlbrsdA9qq3l45lzQ+u06K2iP6+oE4cKe6A8BpA=;
 b=UvAvpIz4QhVzh6jpJh+NZnQAzd6PONPC28FrBBMGogPWf16sOId8fii4+6TRi+W/0d
 Fkm9Dd1ezCmraQ5/3/CdA/b/7F65qrtb11yw3LiSh2eUYA761uyat6xaWfrWHps1Xq+6
 Fj7mG89FFfPRWm26bHwTb6ZM3dTaq56siz251LuGKPLr0MnNqskEmrEiITfPgsClN8XT
 AI2YdZfnMHrYZIc/RqiJ4voaa4Mo5FVTHAL7/QFtICj4Iqx63Cn4vA5vWCW2Yu+O1GrR
 oVg0Mdlcsw2vOInksBfIn3LR1SPoCppjpw6xUPrG/g9FjfrTumbzKNXfm/vyhyveTXJy
 cE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dQfeFlbrsdA9qq3l45lzQ+u06K2iP6+oE4cKe6A8BpA=;
 b=tb1is7kl7eDJmf/gQb5I67Vws08dUdC8/3Qn/HqwRYSv8JcJVmpjlMKdbnhF02TYqD
 HYNhwumVqkDlBhKSvpbI5mW9/DrgI6p1tR9JIMuNrhzYWXZu+yzzh/3Wu+R//wGe/UL1
 zugl8ncCaNGpQAmmbcnk+FkvuVU65DrVnyk1LGT23gOY3KMZGiACJjjCUqjujkK34Aq9
 IAWiGDZkkQjJbedw2n8dX0tjsclKJjm0cXH/Hwo6fuDzBaJxQkUVRFjhPMZkijNMiF+p
 tpnIMKhAgowVb9bgWqBNvi1brPsUjN2egG9U6SmQTfCbxOIt2K0gH4rzCuePgZ7VKhe8
 qrOg==
X-Gm-Message-State: AOAM531xjsyEOWQg4d+2Iuq26/N1GLPHOayr6Mzp00pEeNXs5BmwVvKd
 ZJn34jdjYgpjoUt6kJRvSGMnmO2ejyI=
X-Google-Smtp-Source: ABdhPJxEZRIXYvN033XeCRiNC8p6m+Bw66PYLVpOH8EgTYuFV/3lwh6af/NJARqt3OeJ7s2TtkhIPg==
X-Received: by 2002:a05:6000:1548:: with SMTP id
 8mr60788496wry.279.1636321640793; 
 Sun, 07 Nov 2021 13:47:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id r1sm18763440wmr.36.2021.11.07.13.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 13:47:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 22:45:05 +0100
Message-Id: <20211107214505.3620429-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mono: fix build with autoconf >=
 2.70
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For an unknown reason, the following build failure is raised on one of
the autobuilder with host gcc 6.3.0 since bump of autoconf to version
2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:

icall.c: In function 'mono_create_icall_signatures':
icall.c:9513:20: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
   gsize_a *types = (gsize*)(sig + 1);
                    ^

Add an upstream patch to fix it.

Fixes:
 - http://autobuild.buildroot.org/results/1d1d82b505abd16d014d754b6a4a48fb1271e3b6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0002-Ongoing-work-on-the-cmake-build.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/mono/0002-Ongoing-work-on-the-cmake-build.patch

diff --git a/package/mono/0002-Ongoing-work-on-the-cmake-build.patch b/package/mono/0002-Ongoing-work-on-the-cmake-build.patch
new file mode 100644
index 0000000000..afe618f193
--- /dev/null
+++ b/package/mono/0002-Ongoing-work-on-the-cmake-build.patch
@@ -0,0 +1,34 @@
+From 17650f7e0f571287bb14bb9b4fbde7b91d842bb4 Mon Sep 17 00:00:00 2001
+From: monojenkins <jo.shields+jenkins@xamarin.com>
+Date: Thu, 24 Sep 2020 12:17:34 -0400
+Subject: [PATCH] Ongoing work on the cmake build. (#20428)
+
+* Fix some warnings.
+* Avoid creating netcore/config.make.
+* Fix CPU_COUNT test.
+* Add missing source file.
+
+Co-authored-by: vargaz <vargaz@users.noreply.github.com>
+
+[Retrieved (and updated to keep only update of icall.c) from:
+https://github.com/mono/mono/commit/17650f7e0f571287bb14bb9b4fbde7b91d842bb4]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ mono/metadata/CMakeLists.txt | 1 +
+ mono/metadata/icall.c        | 2 +-
+ mono/mini/CMakeLists.txt     | 5 +++++
+ 3 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/mono/metadata/icall.c b/mono/metadata/icall.c
+index fa991bc72e57..f2c003ac1ff1 100644
+--- a/mono/metadata/icall.c
++++ b/mono/metadata/icall.c
+@@ -9605,7 +9605,7 @@ mono_create_icall_signatures (void)
+ 	int n;
+ 	while ((n = sig->param_count)) {
+ 		--sig->param_count; // remove ret
+-		gsize_a *types = (gsize*)(sig + 1);
++		gsize_a *types = (gsize_a*)(sig + 1);
+ 		for (int i = 0; i < n; ++i) {
+ 			gsize index = *types++;
+ 			g_assert (index < G_N_ELEMENTS (lookup));
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
