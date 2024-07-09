Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FB1C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 16:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A15A40B3B;
	Tue,  9 Jul 2024 16:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4llDd8AvATSg; Tue,  9 Jul 2024 16:56:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B91341137
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B91341137;
	Tue,  9 Jul 2024 16:56:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CEE9C1BF348
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 16:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9C6181E17
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 16:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LMeFUW6xWYZx for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 16:56:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AB436813A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB436813A9
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB436813A9
 for <buildroot@busybox.net>; Tue,  9 Jul 2024 16:56:12 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-367a2c2e41aso2736860f8f.2
 for <buildroot@busybox.net>; Tue, 09 Jul 2024 09:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720544170; x=1721148970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cvt8sFO+SSOYLZ2EMLN6JXKYwN9Fza+HyRIm7K6yPsI=;
 b=GCyXZJoANiiM2Yp++oFp6mKsGJo+wjYg87rgROrrx+6VTqkNDl4PilZFdKwkActBVj
 IGukj1Vnznc4bI5RYqqu5Th6wS5iokbrQMVcVu4LWWP+4MHxnFd7KocOvKCBHX5UGCD+
 iD3LmpLMO/+o6Z1vX5CHesXXYTqsp2WeF3P9tefnqNLOR5YBOhJXpcVrZ5pa/4wjACWG
 ONGSx28vQ0/LqWTxxUDS8MGeX501K9sd8/QzCNtIry5bw8GpAOpNlvTmK/zJCctVFHR4
 BxCh1q9ZCVAs6zDgSGvRuJyoMxQdsJGswHXZZtNemh7QRAj+gr3GuUqAWEXldMEcuBix
 2fiQ==
X-Gm-Message-State: AOJu0YzdZqaIznPl9VVOw1qw2v9Dbo5OdN3xFoeuRNNXRVj6hIbflCND
 KL8uC1q5K78zTouwS1yO61vjZoqXl1u4QToRCCOsEjLfaS25ruyyxmIGy40sSG67PoCJC3QSzyc
 aTQ==
X-Google-Smtp-Source: AGHT+IHEn25Kn8fdtsu7EDNsdKNTVWHMwkaYQ9Bv7/nDfnUYK5hvN53sb25kwKZrdRtD0efubpkqXA==
X-Received: by 2002:a5d:5602:0:b0:367:9625:bd06 with SMTP id
 ffacd0b85a97d-367cea9640cmr2275616f8f.42.1720544170318; 
 Tue, 09 Jul 2024 09:56:10 -0700 (PDT)
Received: from vm-2404.. ([37.66.35.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7e1b3sm3024214f8f.20.2024.07.09.09.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 09:56:09 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue,  9 Jul 2024 18:54:20 +0200
Message-ID: <20240709165421.2685663-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709165421.2685663-1-francois.perrad@gadz.org>
References: <20240709165421.2685663-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1720544170; x=1721148970; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cvt8sFO+SSOYLZ2EMLN6JXKYwN9Fza+HyRIm7K6yPsI=;
 b=HS87NB/jzyVvYrXMPheprVcd7qpcGtem6gAz3ZArufLN/SEYV+8XQT+lRUd4ZfE5ra
 ZXKJ30X1FsFheJWrIGoWsKXR/f7JN8vWD2WWxIx/4QZ2QK1tAsi5Evq67mJhbbZqucST
 5CQyooF0JhUouiR8A5U252+/bfc21jptif9IkUD2HNSN2RtNgiXUUkiqDrfSmwnHfOmO
 wfFQBxvpMFRsW+qV9IHK2fTrx+ojEPZISgsxtXKuozpWSJZZghPvq8pAc/umH6lhtSmR
 1XpzWZRH/g9daErBdAOBzg5iChM0ASaPxqjzDwjG4L7FxUPE2QvSjRLhbduibFc3s6aD
 /niw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=HS87NB/j
Subject: [Buildroot] [PATCH 2/2] configs/olimex_a20_olinuxino_lime*: add
 hashes
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

and enable BR2_DOWNLOAD_FORCE_CHECK_HASHES

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .checkpackageignore                                           | 2 --
 .../a20_olinuxino/patches/linux-headers/linux-headers.hash    | 1 +
 board/olimex/a20_olinuxino/patches/linux/linux.hash           | 2 ++
 board/olimex/a20_olinuxino/patches/uboot/uboot.hash           | 2 ++
 configs/olimex_a20_olinuxino_lime2_defconfig                  | 4 ++++
 configs/olimex_a20_olinuxino_lime_defconfig                   | 4 ++++
 6 files changed, 13 insertions(+), 2 deletions(-)
 create mode 120000 board/olimex/a20_olinuxino/patches/linux-headers/linux-headers.hash
 create mode 100644 board/olimex/a20_olinuxino/patches/linux/linux.hash
 create mode 100644 board/olimex/a20_olinuxino/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 8a21b3f15..e30d348b3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -234,8 +234,6 @@ configs/odroidc2_defconfig lib_defconfig.ForceCheckHash
 configs/odroidxu4_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a10_olinuxino_lime_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a13_olinuxino_defconfig lib_defconfig.ForceCheckHash
-configs/olimex_a20_olinuxino_lime2_defconfig lib_defconfig.ForceCheckHash
-configs/olimex_a20_olinuxino_lime_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a20_olinuxino_micro_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a33_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a64_olinuxino_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/olimex/a20_olinuxino/patches/linux-headers/linux-headers.hash b/board/olimex/a20_olinuxino/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000..5808d92af
--- /dev/null
+++ b/board/olimex/a20_olinuxino/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/olimex/a20_olinuxino/patches/linux/linux.hash b/board/olimex/a20_olinuxino/patches/linux/linux.hash
new file mode 100644
index 000000000..8ffd3e4fb
--- /dev/null
+++ b/board/olimex/a20_olinuxino/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  b9676828b737e8fb8eaa5198303d35d35e8df019550be153c8a42c99afe0cdd5  linux-6.6.36.tar.xz
diff --git a/board/olimex/a20_olinuxino/patches/uboot/uboot.hash b/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
new file mode 100644
index 000000000..726998010
--- /dev/null
+++ b/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index f71d2d3a0..765504d1f 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -10,6 +10,10 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 # glibc is needed for sunxi-mali-utgard package.
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 
+# Build
+BR2_GLOBAL_PATCH_DIR="board/olimex/a20_olinuxino/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 6546cac0d..27cd87d9a 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -10,6 +10,10 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 # glibc is needed for sunxi-mali-utgard package.
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 
+# Build
+BR2_GLOBAL_PATCH_DIR="board/olimex/a20_olinuxino/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
