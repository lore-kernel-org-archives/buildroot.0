Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32439C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 17:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02B0D419C9;
	Wed,  5 Jun 2024 17:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pFes9_ukCAcE; Wed,  5 Jun 2024 17:53:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9248541A36
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9248541A36;
	Wed,  5 Jun 2024 17:53:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B0B1F1BF5B3
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9494840259
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3g0QfNJYQEQe for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 17:53:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1661B400E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1661B400E8
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1661B400E8
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 17:53:28 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-35e5604abdcso788336f8f.0
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 10:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717610006; x=1718214806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jFSSl6YaRY5dBvQVhwvDFf7zUMet5m0aGDwcq/z+t9Y=;
 b=gsxQxd6YedCjKYs4N3+74jhAV3ioDu0rRBKkbdgYnrYnIAcqDa+YWNHkLA45gXCe7/
 ovOl0RREQYG1eJ79M7dk9tjMwKaSg682Tax2itI/S7c6xbNFONhEXtfpyhhtkI+Jyy3D
 4LE4YPHj6t5usShj05RR9EXSvzb28xnnPGqWxgrf1rYsMT1BcjawAhBH4NxO8Wx5zbG4
 dPil1d9cCd0up9Dg09qpMzOcc+Vs7RId8sG4j0g0mETprsCGpb68t7TetFaYYN5kx+Xj
 0+1VeiF5EN1fEF3LA9jBBkR3gEEZHe5Re+za4d6vhDBr1vv7Xk1loF4KWpt5G/Tvk7eP
 w96A==
X-Gm-Message-State: AOJu0YxUh+bzKLmqHQgGka5Cn0/PF2VRn691YRkyvSd+QH/xEw0i3j5s
 RDTo+o6FwmFHiu8tefvwWf2Lc5lNraZgWDBMhZ3lQxEBDA36y168Zca09g==
X-Google-Smtp-Source: AGHT+IFHOl3UP1WkU7PYSoefztsGdt/ODvRT5/6k/3tIyK4Ayn1zB3zbDx/cnxVQbffCf3V3/wzkIg==
X-Received: by 2002:a5d:46cc:0:b0:354:f4a9:b88a with SMTP id
 ffacd0b85a97d-35ef0d84474mr356160f8f.21.1717610006423; 
 Wed, 05 Jun 2024 10:53:26 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04d90a8sm15520821f8f.46.2024.06.05.10.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 10:53:26 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 19:53:22 +0200
Message-ID: <f4334264ed663d495ff9c8a095c0f56b4b4daaa3.1717609998.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717609998.git.yann.morin.1998@free.fr>
References: <cover.1717609998.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717610006; x=1718214806; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jFSSl6YaRY5dBvQVhwvDFf7zUMet5m0aGDwcq/z+t9Y=;
 b=d5EK7OdQvnTu1mCfjwE2Nb/KHWaZmo9oB90h1t4HpXYIh4BuDdMuXddE2OBBVjhwO3
 B58kF2nZHWeJJNDK1P14xP0l/c+ux7oa56dnG3wFYjXAyEQXKqDitj6m5JZPgA54NY0+
 kaVa1qsF9TTKrNtziP+xA+QzEpYfVrc81MPziAgZdsfnnUEMjVTTW7d/1/OTModtE/2A
 mfutUnmbBU/Mz04Fh21F3qgcrEWTUCsszp+yvoCb16sFmTeHJMti6TrNog+Q7vXdzKUd
 NJEsc5zic9mpP22iHWemNVEBXIgoWXEYNLD+/bhTQHDrZ8k4kcp3rp6BGQiVz7Voq6y4
 dC3w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d5EK7OdQ
Subject: [Buildroot] [PATCH 10/10 v2] package/sunxi-mali-utgard-driver:
 handle patching the Buildroot way
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-build.sh-do-not-apply-patches.patch  | 39 +++++++++++++++++++
 .../sunxi-mali-utgard-driver.mk               |  3 +-
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 package/sunxi-mali-utgard-driver/0001-build.sh-do-not-apply-patches.patch

diff --git a/package/sunxi-mali-utgard-driver/0001-build.sh-do-not-apply-patches.patch b/package/sunxi-mali-utgard-driver/0001-build.sh-do-not-apply-patches.patch
new file mode 100644
index 0000000000..02c6aa7884
--- /dev/null
+++ b/package/sunxi-mali-utgard-driver/0001-build.sh-do-not-apply-patches.patch
@@ -0,0 +1,39 @@
+From 079ed8aa57ba6629b992c3d0d01904d3e5170d3b Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Wed, 5 Jun 2024 13:06:16 +0200
+Subject: [PATCH] build.sh: do not apply patches
+
+In Buildroot, we handle applying the patches in a generic way, with
+appropriate tools (e.g. with a proper tar).
+
+Upstream: not applicable
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ build.sh | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/build.sh b/build.sh
+index d1fedff..26efc53 100755
+--- a/build.sh
++++ b/build.sh
+@@ -10,6 +10,8 @@ BUILD_OPTS="USING_UMP=0
+ 	    USING_DEVFREQ=1"
+ 
+ apply_patches() {
++    return 0  # Patching handled by Buildroot
++
+     pushd $2
+ 
+     quilt push -a
+@@ -22,6 +24,8 @@ apply_patches() {
+ }
+ 
+ unapply_patches() {
++    return 0  # Patching handled by Buildroot
++
+     pushd $2
+ 
+     quilt pop -a
+-- 
+2.45.1
+
diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
index 72fade58ed..b8a12247d3 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
@@ -16,8 +16,7 @@ SUNXI_MALI_UTGARD_DRIVER_MAKE_OPTS = \
 
 define SUNXI_MALI_UTGARD_DRIVER_USE_APPLY_PATCHES
 	ln -sf $(SUNXI_MALI_UTGARD_REV)/series $(@D)/patches
-	$(SED) 's|quilt push -a|$(TOPDIR)/support/scripts/apply-patches.sh . ../patches|' \
-		$(@D)/build.sh
+	$(APPLY_PATCHES) $(@D)/$(SUNXI_MALI_UTGARD_REV) $(@D)/patches
 endef
 
 SUNXI_MALI_UTGARD_DRIVER_POST_PATCH_HOOKS += SUNXI_MALI_UTGARD_DRIVER_USE_APPLY_PATCHES
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
