Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D90C48BC3
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 16:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 347D383D70;
	Sat, 17 Feb 2024 16:03:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pubWfTDt37fK; Sat, 17 Feb 2024 16:03:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBECF83D7A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBECF83D7A;
	Sat, 17 Feb 2024 16:03:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BDC7A1BF5A3
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9EE24076E
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2lHCxp7B1aKn for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 16:03:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7C0D64076A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C0D64076A
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C0D64076A
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 16:03:07 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56439b7c7a9so248786a12.3
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 08:03:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708185785; x=1708790585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LxoK0wXZRjnm5ouPEha6hjnbLPaEL1fB9DCk54pXwSE=;
 b=foMK/WQn7u/Q+H9oK6i+ffA6W6RstoFtc2KT6zD6gmYZPOkBByJ75XY1oRKY1ofk9k
 500W524YTLwJTHFsN5+QiuvwhbVrB8WA8rwB4ouNdJ40UuQ10xAAk05OWT88SHAGWUNX
 kA/IbG6GaRaLICF2TjTRBmqIPkvpcxd3DVAvixQsm0j6Ws80YRSF8lIwFmXqH7E/AfjS
 PPaVrStVUMv/I9b+0Oixv22TNnvCMlMmqka99pGHj2vCfCoCoYit6/zilF5JUf4tW6JA
 NwYyNoyazCcarnbg8jCorJqtE4aoPyg/speb02QoksbX0LBqeiLVlRCo6wv1e5nm0Fsz
 b7YA==
X-Gm-Message-State: AOJu0YzgZZhPuHuXFRzxMYY1MkbGjgffOsVTOnlosPyQA2zSkJv2FpME
 UG7POw7r10IT4MDVjWNA22rvW1jAE0QY5jpgtvjJRCoaHX/4N/QObdHA3kJKIXLkVSeUlUcpocY
 vG0g=
X-Google-Smtp-Source: AGHT+IHgDnwOFqlM5HF3rbdW9Hb37n2Y8OyX/w3aOX13ilqzJpoHQGkaATSrw4ofZ0PGM/7ChtcUGA==
X-Received: by 2002:aa7:d341:0:b0:561:8bc4:b05f with SMTP id
 m1-20020aa7d341000000b005618bc4b05fmr6346590edr.0.1708185785381; 
 Sat, 17 Feb 2024 08:03:05 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 dj13-20020a05640231ad00b0055f0b3ec5d8sm973414edb.36.2024.02.17.08.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 08:03:05 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 17:02:30 +0100
Message-ID: <20240217160244.1320482-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708185785; x=1708790585;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LxoK0wXZRjnm5ouPEha6hjnbLPaEL1fB9DCk54pXwSE=;
 b=AlaWAkQyVk4UK2Ctdy8lUXY/6IIyBve/Wk6IlueeAOPl5pg1diu1DLih0TpDemT4Z3
 jDOzH52cLwu6liqE0nw21XN5zq3G3sdSn5FYhWLhje9x66ynhCkGvgnEf+l1QJN0YX/4
 9zUzd3c8NPUDlecVIaK2O4qm3XcNW2py2yNx8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=AlaWAkQy
Subject: [Buildroot] [PATCH v4 06/20] boot/ti-k3-core-secdev: new package
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

This is a security development package containing tools for
High-Security(HS) TI K3 platform devices.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v4:
- Remove the trailing '/' at the end of the url in the help of
  Config.in
- Fixed license issues
- Use $(BINARIES_DIR)/ti-k3-core-secdev as the directory where to
  install files.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS                                    |  1 +
 boot/Config.in                                |  1 +
 boot/ti-k3-core-secdev/Config.in              |  9 ++++++++
 boot/ti-k3-core-secdev/ti-k3-core-secdev.hash |  3 +++
 boot/ti-k3-core-secdev/ti-k3-core-secdev.mk   | 22 +++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 boot/ti-k3-core-secdev/Config.in
 create mode 100644 boot/ti-k3-core-secdev/ti-k3-core-secdev.hash
 create mode 100644 boot/ti-k3-core-secdev/ti-k3-core-secdev.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0d12c3abcb11..33d99ab2440f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -753,6 +753,7 @@ F:	package/xinetd/
 N:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
 F:	board/bsh/
 F:	board/stmicroelectronics/stm32f769-disco/
+F:	boot/ti-k3-core-secdev/
 F:	configs/imx8mn_bsh_smm_s2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
 F:	configs/stm32f769_disco_sd_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index e5fdf7ad439e..18a7d268f95a 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -20,6 +20,7 @@ source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/ti-k3-boot-firmware/Config.in"
+source "boot/ti-k3-core-secdev/Config.in"
 source "boot/ti-k3-image-gen/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
diff --git a/boot/ti-k3-core-secdev/Config.in b/boot/ti-k3-core-secdev/Config.in
new file mode 100644
index 000000000000..f7b4e2962042
--- /dev/null
+++ b/boot/ti-k3-core-secdev/Config.in
@@ -0,0 +1,9 @@
+config BR2_TARGET_TI_K3_CORE_SECDEV
+	bool "ti-k3-core-secdev"
+	depends on BR2_aarch64
+	help
+	  This package downloads and installs development tools for
+	  High-Security(HS) TI K3 platforms (which include AM62x,
+	  AM64x, AM65x and more).
+
+	  https://git.ti.com/cgit/security-development-tools/core-secdev-k3
diff --git a/boot/ti-k3-core-secdev/ti-k3-core-secdev.hash b/boot/ti-k3-core-secdev/ti-k3-core-secdev.hash
new file mode 100644
index 000000000000..e3074a398d62
--- /dev/null
+++ b/boot/ti-k3-core-secdev/ti-k3-core-secdev.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  b6d3bca0d561d055c6869c5564b06f2fb1b9f67e4ef180c2baf8a14a6a6afa06  core-secdev-k3-08.06.00.007.tar.xz
+sha256  3e5cf4f5ab9f0333f46cd68fabede3f21e55de1a9e3c6ad673f241f4514d8369  manifest/k3-secdev-0.2-manifest.html
diff --git a/boot/ti-k3-core-secdev/ti-k3-core-secdev.mk b/boot/ti-k3-core-secdev/ti-k3-core-secdev.mk
new file mode 100644
index 000000000000..f7655a0fefc8
--- /dev/null
+++ b/boot/ti-k3-core-secdev/ti-k3-core-secdev.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# ti-k3-core-secdev
+#
+################################################################################
+
+TI_K3_CORE_SECDEV_VERSION = 08.06.00.007
+TI_K3_CORE_SECDEV_SITE = https://git.ti.com/cgit/security-development-tools/core-secdev-k3/snapshot
+TI_K3_CORE_SECDEV_SOURCE = core-secdev-k3-$(TI_K3_CORE_SECDEV_VERSION).tar.xz
+TI_K3_CORE_SECDEV_INSTALL_IMAGES = YES
+TI_K3_CORE_SECDEV_LICENSE = BSD-3-Clause
+TI_K3_CORE_SECDEV_LICENSE_FILES = manifest/k3-secdev-0.2-manifest.html
+
+TI_K3_CORE_SECDEV_INSTALL_DIR = $(BINARIES_DIR)/ti-k3-core-secdev
+
+define TI_K3_CORE_SECDEV_INSTALL_IMAGES_CMDS
+	mkdir -p $(TI_K3_CORE_SECDEV_INSTALL_DIR)
+	cp -dpfr $(@D)/keys $(TI_K3_CORE_SECDEV_INSTALL_DIR)/
+	cp -dpfr $(@D)/scripts $(TI_K3_CORE_SECDEV_INSTALL_DIR)/
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
