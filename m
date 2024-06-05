Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F38C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 14:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61049613BF;
	Wed,  5 Jun 2024 14:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9iOZaUJF_q8; Wed,  5 Jun 2024 14:18:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04F65613B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04F65613B7;
	Wed,  5 Jun 2024 14:18:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11E6C1BF23C
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 14:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4EC661116
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 14:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cLaUUyh9ukX7 for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 14:18:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 53B9161034
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53B9161034
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53B9161034
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 14:18:23 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-421555a4454so11933585e9.3
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 07:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717597101; x=1718201901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jFSSl6YaRY5dBvQVhwvDFf7zUMet5m0aGDwcq/z+t9Y=;
 b=qPfLL/dXKndr3kT5+4I/n52w4d6pphEmGmLTBVTYw6kG/27Q9k1kUpKCxorPu0pTc0
 PtBGnXGPO4f3XpshEjZigRGiU2UteSWG0h6cvrk4nHxacmSP8B8A3qE2qeM1Bus0tAax
 W6WXm3walx+5J3j+jBjFoHBvBK9lj2mkqVIVrb8guZfXrpT6IdcLfgtAleOE44K1ghdn
 VTrUjIhs5Du0ZvOl5RouV1Zo0DA41cyGQB78G9diRdI+MRAjlKDy7Xgx7sytWyQGvIWO
 VBoWhYif17u9BA455qop0GbrUexPgmFBSqQiAM9eEP5+4Pgpjq1qAXh14tDLNP8ES6Gt
 /tUg==
X-Gm-Message-State: AOJu0YwFyHkmnAc6CO5BopynXl1lNWS9lRmk8l2R+FjfOgZ1sv/wxyo+
 W0Cr+6/1RaSx4kAZDIQ+mk7+H105a0M6Ntmxoc6vtlaiwfXpqVma0ZKM6A==
X-Google-Smtp-Source: AGHT+IFT9BWwlMcqSqTaqvzdDJrA/k571nlJP2lINywgmL4wCCdwGzznL1NF3ZcBZ06JuBVxP9Zy+w==
X-Received: by 2002:a05:600c:1908:b0:421:29c6:e2ce with SMTP id
 5b1f17b1804b1-421562d46b7mr23065465e9.7.1717597101288; 
 Wed, 05 Jun 2024 07:18:21 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158149057sm24253925e9.36.2024.06.05.07.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 07:18:21 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 16:18:17 +0200
Message-ID: <0e81bf8d1e4ff380bdf559db0ba900c59cbab6b6.1717597094.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717597094.git.yann.morin.1998@free.fr>
References: <cover.1717597094.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717597101; x=1718201901; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jFSSl6YaRY5dBvQVhwvDFf7zUMet5m0aGDwcq/z+t9Y=;
 b=MDk5C7oaNCsej0uFxzsZFzlwy+2fRUl84cmW/e3eXKbS1z2/D9izMwSulJtk11RzOm
 6M5W7HYHkRM9vOTUWI8EyADeClXHTrtPTnOe9Qlo0tLFDH6gIcTcUgPgOqf4ifDHDt8T
 p9GgHO3VcXd+30T/cImcFJ45AO+VWXGIE9fLs1gCNWV5vPpypa/ZcycCn5QLk+AIiJVj
 KC/vgyuOGrGzBMDTfNZ1WzAYIJ7rKb6lNl5fwAfvqBn+NtdQggADkRdkbr/N77N6mG3+
 pVDi+ur2ucTe26wLn7XAmhxxYOYx7d0qu6cH4UCP0IteIuiS8mLwwTsmKM4R82Ow1T7M
 LqFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MDk5C7oa
Subject: [Buildroot] [PATCH 9/9] package/sunxi-mali-utgard-driver: handle
 patching the Buildroot way
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
