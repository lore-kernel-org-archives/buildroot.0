Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE12CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 09:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C6C582093;
	Sun,  7 Apr 2024 09:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LomuuJt4pumI; Sun,  7 Apr 2024 09:22:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E9E782098
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E9E782098;
	Sun,  7 Apr 2024 09:22:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 731E01BF296
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 09:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 606564052E
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 09:22:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jSi6U6HlZhZC for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 09:22:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5CC9A403E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CC9A403E9
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CC9A403E9
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 09:22:53 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-415446af364so26127775e9.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 02:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712481771; x=1713086571;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f+j8b5P2xcpcgY1TnQQHitPwnnigG/sFB+d2c6cOrx8=;
 b=APelGVPkCwc2wXefT48ltYdZA3Hi0SRXseG0Xzj+X/fqT2UKTNddM5yRviBmbjCzOe
 gsxsgY5yNHvkifV7llrw7JeL3Cp/SzaEakP+uQeh6zc4CaGPdx05enLM6bLvN9DeR+NF
 P67cTns/YgH71ErVZen3vZ8kpzsohpfszXcmpM0eRPzsYP8OPlGEkgG8bLXP7Akju3kK
 dvpNt9rZ2KQ85qri+1yW00hdCUhR4XNxWxgWJNq/P0KnQLgDGybrmE390CdCyByTbBMf
 5Zp6GoVjdmy4ObbCMVUwasUkmhI5hq8fAVwbGRXnkfZct2XwxEUwkq6icx9xSNMkuSBQ
 OctA==
X-Gm-Message-State: AOJu0Yyi1ZRAkTlW5D4UdF5dBrgIFXM9XAXowZEcyB8sUnabDNB+yzJk
 +Nba6/Yr174P41ESqptP8QAMJ4fzM2raq+uiFlZ5mzxp30viqYBMh9v+PAxh
X-Google-Smtp-Source: AGHT+IEqT7wbVMGwnMrjBZF1F5Y+EG8DU2RVRIprR3gnbPuwm+6j/oLZqqTqvPkJtrUO4bz6GN+6jw==
X-Received: by 2002:a05:600c:3ba7:b0:416:2abe:b886 with SMTP id
 n39-20020a05600c3ba700b004162abeb886mr5642266wms.0.1712481771105; 
 Sun, 07 Apr 2024 02:22:51 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c4ece00b0041633f1513bsm5635076wmq.46.2024.04.07.02.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 02:22:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 11:22:47 +0200
Message-ID: <20240407092247.277457-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712481771; x=1713086571; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f+j8b5P2xcpcgY1TnQQHitPwnnigG/sFB+d2c6cOrx8=;
 b=OnusPIyhjBCVRqqwzisXianwMnJy2AZrUfRFeHkWsWtB19cTlsaWtiCHVa5jtYXwBV
 1y95UOTYu/dIaiypT5z1y7sbPnKVm8978vojIiBHbBpCb85MaKMdWK42WeGXcWjZsOXw
 aP09eNlZqMjTQr1OGDH+b6hiPS3n0/aMsq3EeBzsrE2VbivS1waMXc5Nm8rZQNpM8Y4Z
 udOrK5D7kzgKSVdgzx7GaPey7WL6TWqNfrihDqjP2MFUMRVpGJLLjM26Id82o9v+JrJI
 TceXe3O+vTOs8h2qKKQpUig+OgQwtYifPolA0aNBn8ruaKTyLShjRHaqwp0zA8OCuers
 wbdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OnusPIyh
Subject: [Buildroot] [PATCH 1/1] package/android-tools: add libxcrypt
 optional dependency
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/aarch64_be-buildroot-linux-gnu/12.3.0/../../../../aarch64_be-buildroot-linux-gnu/bin/ld: cannot find -lcrypt: No such file or directory

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/ab7c1ff0649bec21584654431e722efe2dc88c3d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/android-tools/Config.in        | 1 +
 package/android-tools/android-tools.mk | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
index bc76d545c1..a688182ed9 100644
--- a/package/android-tools/Config.in
+++ b/package/android-tools/Config.in
@@ -68,6 +68,7 @@ config BR2_PACKAGE_ANDROID_TOOLS_ADB
 config BR2_PACKAGE_ANDROID_TOOLS_ADBD
 	bool "adbd"
 	depends on BR2_USE_MMU # uses fork()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
index 3d5c76a322..f273ea5cdf 100644
--- a/package/android-tools/android-tools.mk
+++ b/package/android-tools/android-tools.mk
@@ -63,7 +63,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_ANDROID_TOOLS_ADBD),y)
 ANDROID_TOOLS_TARGETS += adbd
-ANDROID_TOOLS_DEPENDENCIES += zlib openssl
+ANDROID_TOOLS_DEPENDENCIES += \
+	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
+	zlib openssl
 endif
 
 # Build each tool in its own directory not to share object files
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
