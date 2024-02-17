Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B30C48BC3
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 16:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F12EB83F3D;
	Sat, 17 Feb 2024 16:03:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cZJ8emx256RC; Sat, 17 Feb 2024 16:03:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A25C83F3F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A25C83F3F;
	Sat, 17 Feb 2024 16:03:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2FD321BF5A3
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2185D83D88
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VMGXQNHVsulW for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 16:03:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC85A83D7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC85A83D7C
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC85A83D7C
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 16:03:22 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-51147d0abd1so3340954e87.1
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 08:03:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708185800; x=1708790600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w6sT05rYH+5TIZE2wKL+Xp5WS6E7RC6kSQCmbiVwc+Y=;
 b=JMyJOCKGGLM7mAEYjjrs4zxMlVE6LlSv8J2DDNuKBgb9UQyFPfjUfd+sEYTKeFX1K4
 hC0/0Ip6mCpRCMp+Biqpsh/1j1JZz7JR1RsBxK2V36opevKv4OCzY5YNFJPDWzJZNNK5
 Is9uzw8/h0F9FHZa7EZYC6urseA+H1oPGBEHhTA9EP1MAw1tEYJ+mKRR8IJ3DA9dXK1q
 aJamf1oSJu2JE0Rl+iskfCPFf3wuXICpF3h5JKKv4uD/YIwK3CjIfiQHvIwRqiys6htR
 0U8/uuVRY7yxyOol3ZQ+U0grsOBhzuo52Mgh/3dV/6sfXOI+WDzGQlhwZf1Hzzug0Zm8
 5beA==
X-Gm-Message-State: AOJu0Ywr8eQxG18xq6LzWgRNVgs1GBcIj/c4Emd6alk0RYq8D6gEAN9k
 OXJBIBtO6UkSwGhlVzB2sgi/zTHJ+cYk5TxdARvsKNLFyE+yUjOdQaX+mZybMM3v4yf9gNaRwvt
 SSqc=
X-Google-Smtp-Source: AGHT+IHbuitVIqUqLPwHjyDVlUOroAaf2ls3qoK2XJQemnicvC8qW+uPvnZBYh8oPVIyu5GKxuOXsg==
X-Received: by 2002:a05:6512:138c:b0:511:5411:1144 with SMTP id
 fc12-20020a056512138c00b0051154111144mr6632112lfb.14.1708185800165; 
 Sat, 17 Feb 2024 08:03:20 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 dj13-20020a05640231ad00b0055f0b3ec5d8sm973414edb.36.2024.02.17.08.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 08:03:19 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 17:02:41 +0100
Message-ID: <20240217160244.1320482-18-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708185800; x=1708790600;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w6sT05rYH+5TIZE2wKL+Xp5WS6E7RC6kSQCmbiVwc+Y=;
 b=bHfMwJqEFNG3s+gZK1rhHgI9B+b2PqNy3J8lrKSEilhb5fgOnQk1cmei+XChd+s1lc
 iYAo6tFxnco58Be8ImooJvkCWQdPcScJisUywLXdNlwzY1/LBvDZeHwAJuweRgho56nZ
 uLHdbpoycyC/ayzLQ/5BoZyLVg1gYgNF7psUs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=bHfMwJqE
Subject: [Buildroot] [PATCH v4 17/20] boot: move ti-k3-* packages to 'ti-k3'
 directory
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Move all TI K3 packages to the directory ti-k3.
This patch is preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Added in v4

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/Config.in                                      |  5 +----
 boot/ti-k3/Config.in                                | 13 +++++++++++++
 boot/ti-k3/common.mk                                |  1 +
 boot/{ => ti-k3}/ti-k3-boot-firmware/Config.in      |  0
 .../ti-k3-boot-firmware/ti-k3-boot-firmware.hash    |  0
 .../ti-k3-boot-firmware/ti-k3-boot-firmware.mk      |  0
 boot/{ => ti-k3}/ti-k3-core-secdev/Config.in        |  0
 .../ti-k3-core-secdev/ti-k3-core-secdev.hash        |  0
 .../ti-k3-core-secdev/ti-k3-core-secdev.mk          |  0
 boot/{ => ti-k3}/ti-k3-image-gen/Config.in          |  0
 .../ti-k3-image-gen/ti-k3-image-gen.hash            |  0
 boot/{ => ti-k3}/ti-k3-image-gen/ti-k3-image-gen.mk |  0
 boot/{ => ti-k3}/ti-k3-r5-loader/Config.in          |  0
 .../ti-k3-r5-loader/ti-k3-r5-loader.hash            |  0
 boot/{ => ti-k3}/ti-k3-r5-loader/ti-k3-r5-loader.mk |  0
 configs/ti_am62x_sk_defconfig                       |  1 +
 configs/ti_am64x_sk_defconfig                       |  1 +
 17 files changed, 17 insertions(+), 4 deletions(-)
 create mode 100644 boot/ti-k3/Config.in
 create mode 100644 boot/ti-k3/common.mk
 rename boot/{ => ti-k3}/ti-k3-boot-firmware/Config.in (100%)
 rename boot/{ => ti-k3}/ti-k3-boot-firmware/ti-k3-boot-firmware.hash (100%)
 rename boot/{ => ti-k3}/ti-k3-boot-firmware/ti-k3-boot-firmware.mk (100%)
 rename boot/{ => ti-k3}/ti-k3-core-secdev/Config.in (100%)
 rename boot/{ => ti-k3}/ti-k3-core-secdev/ti-k3-core-secdev.hash (100%)
 rename boot/{ => ti-k3}/ti-k3-core-secdev/ti-k3-core-secdev.mk (100%)
 rename boot/{ => ti-k3}/ti-k3-image-gen/Config.in (100%)
 rename boot/{ => ti-k3}/ti-k3-image-gen/ti-k3-image-gen.hash (100%)
 rename boot/{ => ti-k3}/ti-k3-image-gen/ti-k3-image-gen.mk (100%)
 rename boot/{ => ti-k3}/ti-k3-r5-loader/Config.in (100%)
 rename boot/{ => ti-k3}/ti-k3-r5-loader/ti-k3-r5-loader.hash (100%)
 rename boot/{ => ti-k3}/ti-k3-r5-loader/ti-k3-r5-loader.mk (100%)

diff --git a/boot/Config.in b/boot/Config.in
index 18a7d268f95a..74a64a096afc 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -19,10 +19,7 @@ source "boot/opensbi/Config.in"
 source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
 source "boot/syslinux/Config.in"
-source "boot/ti-k3-boot-firmware/Config.in"
-source "boot/ti-k3-core-secdev/Config.in"
-source "boot/ti-k3-image-gen/Config.in"
-source "boot/ti-k3-r5-loader/Config.in"
+source "boot/ti-k3/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
 
diff --git a/boot/ti-k3/Config.in b/boot/ti-k3/Config.in
new file mode 100644
index 000000000000..06dda2f156a9
--- /dev/null
+++ b/boot/ti-k3/Config.in
@@ -0,0 +1,13 @@
+config BR2_TARGET_TI_K3
+	bool "TI K3"
+	help
+	  The TI K3 bootloaders and tools.
+
+if BR2_TARGET_TI_K3
+
+source "boot/ti-k3/ti-k3-boot-firmware/Config.in"
+source "boot/ti-k3/ti-k3-core-secdev/Config.in"
+source "boot/ti-k3/ti-k3-image-gen/Config.in"
+source "boot/ti-k3/ti-k3-r5-loader/Config.in"
+
+endif
diff --git a/boot/ti-k3/common.mk b/boot/ti-k3/common.mk
new file mode 100644
index 000000000000..18a1329baa4c
--- /dev/null
+++ b/boot/ti-k3/common.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard boot/ti-k3/*/*.mk))
diff --git a/boot/ti-k3-boot-firmware/Config.in b/boot/ti-k3/ti-k3-boot-firmware/Config.in
similarity index 100%
rename from boot/ti-k3-boot-firmware/Config.in
rename to boot/ti-k3/ti-k3-boot-firmware/Config.in
diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash b/boot/ti-k3/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
similarity index 100%
rename from boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
rename to boot/ti-k3/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk b/boot/ti-k3/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
similarity index 100%
rename from boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
rename to boot/ti-k3/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
diff --git a/boot/ti-k3-core-secdev/Config.in b/boot/ti-k3/ti-k3-core-secdev/Config.in
similarity index 100%
rename from boot/ti-k3-core-secdev/Config.in
rename to boot/ti-k3/ti-k3-core-secdev/Config.in
diff --git a/boot/ti-k3-core-secdev/ti-k3-core-secdev.hash b/boot/ti-k3/ti-k3-core-secdev/ti-k3-core-secdev.hash
similarity index 100%
rename from boot/ti-k3-core-secdev/ti-k3-core-secdev.hash
rename to boot/ti-k3/ti-k3-core-secdev/ti-k3-core-secdev.hash
diff --git a/boot/ti-k3-core-secdev/ti-k3-core-secdev.mk b/boot/ti-k3/ti-k3-core-secdev/ti-k3-core-secdev.mk
similarity index 100%
rename from boot/ti-k3-core-secdev/ti-k3-core-secdev.mk
rename to boot/ti-k3/ti-k3-core-secdev/ti-k3-core-secdev.mk
diff --git a/boot/ti-k3-image-gen/Config.in b/boot/ti-k3/ti-k3-image-gen/Config.in
similarity index 100%
rename from boot/ti-k3-image-gen/Config.in
rename to boot/ti-k3/ti-k3-image-gen/Config.in
diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.hash b/boot/ti-k3/ti-k3-image-gen/ti-k3-image-gen.hash
similarity index 100%
rename from boot/ti-k3-image-gen/ti-k3-image-gen.hash
rename to boot/ti-k3/ti-k3-image-gen/ti-k3-image-gen.hash
diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.mk b/boot/ti-k3/ti-k3-image-gen/ti-k3-image-gen.mk
similarity index 100%
rename from boot/ti-k3-image-gen/ti-k3-image-gen.mk
rename to boot/ti-k3/ti-k3-image-gen/ti-k3-image-gen.mk
diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3/ti-k3-r5-loader/Config.in
similarity index 100%
rename from boot/ti-k3-r5-loader/Config.in
rename to boot/ti-k3/ti-k3-r5-loader/Config.in
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash b/boot/ti-k3/ti-k3-r5-loader/ti-k3-r5-loader.hash
similarity index 100%
rename from boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
rename to boot/ti-k3/ti-k3-r5-loader/ti-k3-r5-loader.hash
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3/ti-k3-r5-loader/ti-k3-r5-loader.mk
similarity index 100%
rename from boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
rename to boot/ti-k3/ti-k3-r5-loader/ti-k3-r5-loader.mk
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 4de39fb897fd..cd26235342e4 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -23,6 +23,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="am62x"
+BR2_TARGET_TI_K3=y
 BR2_TARGET_TI_K3_IMAGE_GEN=y
 BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X=y
 BR2_TARGET_TI_K3_R5_LOADER=y
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 5fd9653b5b8f..1befeb4ab96c 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -23,6 +23,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am64x"
 BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="am64x"
+BR2_TARGET_TI_K3=y
 BR2_TARGET_TI_K3_IMAGE_GEN=y
 BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X=y
 BR2_TARGET_TI_K3_R5_LOADER=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
