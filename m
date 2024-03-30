Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15961CD1288
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 16:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C45E08226D;
	Sat, 30 Mar 2024 16:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1zZqQg0yGZh; Sat, 30 Mar 2024 16:03:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7416F822AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7416F822AF;
	Sat, 30 Mar 2024 16:03:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D8551BF3DF
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 16:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 243E5406CB
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 16:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HcVq_AazoHZC for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 16:02:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6C948406C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C948406C9
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C948406C9
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 16:02:53 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5157af37806so3184366e87.0
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 09:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711814570; x=1712419370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cv7VlLAcvnxrbd6d8Ys+/QLZBy+FUh8l9zhQL3I/tAI=;
 b=wAst+F7BB4SKMRDpxVaPXEjFfR9dNXvtCZQ84Xw7boRgiNJokO7uHWs/qRNj7F7To5
 HQE4OzVokvBLkitu1g/NaFaQnvJRqOAhLG7tl7RbZ2VE3bN+7g6mFZfcHDqYsIJpUjue
 m5lu72eVR9iuRpUFn3Atvg6fZoZQKPpnubQdnEgL4tfNHPfjE/7cuN8yQmQVJwp1UUB9
 vN/AJr0C497IAB9USKdYEo2LWX/GJSsrjJ4tsjmQOM0H7LhQl6GDzqi6WFa3HV4mmfoA
 NOF4qtu+a2LSrzPUt9fu96skrnsTHsb2qPp8kuuwYAIIFfsbqjKAZoB8+uSEL+TDs9Up
 j35A==
X-Gm-Message-State: AOJu0Yy2wI+gfeT5Cm3fIK8wdlPeKX/qiLFBhsbIeOmoDoMt0nwa7p2n
 PUNLGnNIFMEa7IOrMQ49atzbYKHhMDgy3KR/uYOckbDBKeMSNDMR98vKXFgVP//WBUwkR7eQLb1
 aswA=
X-Google-Smtp-Source: AGHT+IEmT+ZQxZyvY7jIYThOPMMFBtq6c2VeG2VxDo2gHZcQeNXSWp879OgfqPpvbBog/A3ober1YQ==
X-Received: by 2002:a05:6512:32c3:b0:513:bc63:3451 with SMTP id
 f3-20020a05651232c300b00513bc633451mr3892330lfg.43.1711814570304; 
 Sat, 30 Mar 2024 09:02:50 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-8-99-67.retail.telecomitalia.it. [87.8.99.67])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a056402004d00b0056c633354c6sm2127107edu.45.2024.03.30.09.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 09:02:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 17:02:33 +0100
Message-ID: <20240330160244.3214733-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
References: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711814570; x=1712419370;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cv7VlLAcvnxrbd6d8Ys+/QLZBy+FUh8l9zhQL3I/tAI=;
 b=BTlHzZ7be2Mpu/7WUGK6tRcheaBsqUDIe+MPkTv44fIHjvv5dA1D4/zs+8u2r7Dmav
 c8WuBdApsNjn1ib1WBWGwKs9+EooyBv1F1JJQly1LmtaFxLkrJOcOoDDSTAS2wri1mPe
 QjZIr68zM+2DD1QdXWEowjtsE+EYCA9QSRwr0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=BTlHzZ7b
Subject: [Buildroot] [PATCH v10 01/12] boot/ti-k3-r5-loader: drop hash for
 version 2022.10
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
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "Yann E . Morin" <yann.morin.1998@free.fr>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch removes the hash for version 2022.10 of ti-k3-r5-loader
(i. e. U-Boot), still allowing the ti_am6{2,4]x_sk_defconfig configurations
to properly validate the downloaded package with the appropriate hash.

Link: https://patchwork.ozlabs.org/project/buildroot/patch/20240304153253.732708-6-dario.binacchi@amarulasolutions.com
Suggested-by: Yann E. Morin <yann.morin.1998@free.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Added in v10

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash | 2 ++
 board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash | 2 ++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash                      | 1 -
 configs/ti_am62x_sk_defconfig                                  | 1 +
 configs/ti_am64x_sk_defconfig                                  | 1 +
 5 files changed, 6 insertions(+), 1 deletion(-)
 create mode 100644 board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
 create mode 100644 board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash

diff --git a/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
new file mode 100644
index 000000000000..2a5c99c459f2
--- /dev/null
+++ b/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2
diff --git a/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
new file mode 100644
index 000000000000..2a5c99c459f2
--- /dev/null
+++ b/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
index 279cb7763afd..fbe5d215409d 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -1,4 +1,3 @@
 # Locally computed:
-sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2
 sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index a129e216d25b..37df7a93f77a 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,5 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
+BR2_GLOBAL_PATCH_DIR="board/ti/am62x-sk/patches"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 26195194c7d6..1ebdec68ac01 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -1,5 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
+BR2_GLOBAL_PATCH_DIR="board/ti/am64x-sk/patches"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am64x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
