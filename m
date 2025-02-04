Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89666C02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 16:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C4EE80CE7;
	Tue,  4 Feb 2025 16:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBbIYoiuNZ2p; Tue,  4 Feb 2025 16:36:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B8FB80D0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B8FB80D0E;
	Tue,  4 Feb 2025 16:36:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A27B3185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F497410A8
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4LudcE4rymp for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 16:36:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A84BE405E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A84BE405E7
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A84BE405E7
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:36:26 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38be3bfb045so4520137f8f.0
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 08:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738686984; x=1739291784;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y9MW3mYf/QRMX/G03KlkCX8rUDfBU7JE/eBAG2/+NVc=;
 b=MKjpLtsRR56hGwFLnYuOOuOzUyCSuZHKGDu0DrdjbvgCw6Ohv3y4vg50O70QOslo/n
 H5UlpYpxc7bWaaFjAp/Bit5TV78P/f7TX+kkNoruCXCtryffDHIxF1NBfG9i7gn8gr6L
 eZy8ODhyqCSrrtos6pIHuqsEUavr4or51wx83YM7bcx/vQFbBBANCDvLr+ziBx4vL/OQ
 sHQwvT7J27ZKywsDI0WXGMV3mbM0VXN+pT14GQEM87tFUgPp0RFlBc/qF+NwZCFCQR6X
 GXmnM1JQV83kEmpJikW3G+m8RIWv6sgQIRyHDKo/j7+FrtDbXj+a/bNfrsKxLntP8GT9
 h1oA==
X-Gm-Message-State: AOJu0YzOebKm8bycuSaEbR1BRg6BUyU5GmhXeSdDWJ3A5eKR3Mrt8Dar
 47CX5NLSth+pRLatH9dzOy4yJfeutfsiwU8d1q7o656PViF1CYfMI3wv8mXvJ28z2RAQEBTmNzi
 xFQI=
X-Gm-Gg: ASbGncvCEIdbuAbhEtjqXaZo4ZLLjDUrzgWNL9Ntf64hHrcinLmrS8q8zag22dJDsdY
 UhdBj83RGG8Amtaq+eIArC95nb2kZc+zavj9sk3lLn43fljI8fINcupPG7LzLkm+hdwm0ZjtgbA
 bdzS+Z7kSv5/5UihJ9eBOxfZj9eIkLvWLOmBGtk8wGEtXAL7jTfhpfeTuva2+U54hLaB+EHyGAu
 5GzJ8d+MaL7u0oV28A2bWo6DwkSa8aTGkHl+/HA1/rHXCHKz0d+B4it1zidlW+DT41sU6tn3PZ0
 dB6cBS+aPTtTJ9+AnbiZu60q7nwwqQ8epjBbg0jpzDTJQQqhvFZpChY=
X-Google-Smtp-Source: AGHT+IGShln6v9GLB4gNhidslbpfZ5C3elNc7TN7SroildJdIADvww5xsALdv8WX73zLnGCeVaLGDQ==
X-Received: by 2002:adf:e7c6:0:b0:38b:ee9f:52d5 with SMTP id
 ffacd0b85a97d-38da53b66b3mr2571040f8f.16.1738686984560; 
 Tue, 04 Feb 2025 08:36:24 -0800 (PST)
Received: from P-NTS-Evian.. (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1cf560sm16032693f8f.89.2025.02.04.08.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 08:36:24 -0800 (PST)
To: buildroot@buildroot.org
Cc: Michael Walle <michael@walle.cc>, Niklas Cassel <niklas.cassel@wdc.com>,
 Romain Naour <romain.naour@smile.fr>
Date: Tue,  4 Feb 2025 17:36:16 +0100
Message-ID: <20250204163622.192932-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738686984; x=1739291784; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y9MW3mYf/QRMX/G03KlkCX8rUDfBU7JE/eBAG2/+NVc=;
 b=LQDcZLS9zAPNB9QGtKs9b89TOUWXAUkxco23rfZMr8yodXJ4lAkVB1yTLjS8pzBCBO
 J6GceVB/taxNtgQ+iZUUUzC9xqeS1qBo8asGjPzPgWheibHdwKZYzRf1DcLyLMc+SwUm
 FD14cwgAzvfWnHHAYKesPO23/9B6s9C0CPIZs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=LQDcZLS9
Subject: [Buildroot] [PATCH v5 1/6] linux: add support for device tree
 overlays
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael Walle <michael@walle.cc>

The linux kernel can build device tree overlays (.dtbo) itself. Add
support to build and copy them along with the actual device trees.
These can either be in-tree device tree overlays
(BR2_LINUX_KERNEL_INTREE_DTSO_NAMES) or they can be provided outside of
the kernel (BR2_LINUX_KERNEL_CUSTOM_DTS_PATH). In the latter case, the
overlay source files will be copied into the kernel tree first.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v2: https://lore.kernel.org/buildroot/20240902112735.728574-1-michael@walle.cc/
---
 linux/Config.in | 14 +++++++++++---
 linux/linux.mk  |  7 +++++--
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 63e64c5d65..90aed24775 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -426,12 +426,20 @@ config BR2_LINUX_KERNEL_INTREE_DTS_NAME
 	  the trailing .dts. You can provide a list of
 	  dts files to build, separated by spaces.
 
+config BR2_LINUX_KERNEL_INTREE_DTSO_NAMES
+	string "In-tree Device Tree Overlay file names"
+	help
+	  Names of in-tree device tree overlay, without the trailing
+	  .dtso which should be built and installed into the target
+	  system, separated by spaces.
+
 config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	string "Out-of-tree Device Tree Source file paths"
 	help
-	  Paths to out-of-tree Device Tree Source (.dts) and Device Tree
-	  Source Include (.dtsi) files, separated by spaces. These files
-	  will be copied to the kernel sources and the .dts files will
+	  Paths to out-of-tree Device Tree Source (.dts), Device Tree
+	  Source Include (.dtsi) and Device Tree Overlay Source (.dtso)
+	  files, separated by spaces. These files will be copied to the
+	  kernel sources and the .dts files will
 	  be compiled from there.
 
 config BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME
diff --git a/linux/linux.mk b/linux/linux.mk
index 12699b8ee4..9c621c18d5 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -203,14 +203,17 @@ endif
 LINUX_VERSION_PROBED = `MAKEFLAGS='$(filter-out w,$(MAKEFLAGS))' $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
 
 LINUX_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
+LINUX_DTSO_NAMES += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTSO_NAMES))
 
 # We keep only the .dts files, so that the user can specify both .dts
 # and .dtsi files in BR2_LINUX_KERNEL_CUSTOM_DTS_PATH. Both will be
 # copied to arch/<arch>/boot/dts, but only the .dts files will
 # actually be generated as .dtb.
-LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
+LINUX_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))
+LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(LINUX_CUSTOM_DTS_PATH))))
+LINUX_DTSO_NAMES += $(basename $(filter %.dtso,$(notdir $(LINUX_CUSTOM_DTS_PATH))))
 
-LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME))
+LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME)) $(addsuffix .dtbo,$(LINUX_DTSO_NAMES))
 
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_NAME))
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
