Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13653C48BF8
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 10:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D722A41B47;
	Thu, 22 Feb 2024 10:17:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bIrW5dL7Xez6; Thu, 22 Feb 2024 10:17:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DB4741C2D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DB4741C2D;
	Thu, 22 Feb 2024 10:17:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE4961BF3FF
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D98F541850
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eNl6rpF0wHvB for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 10:17:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9660241851
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9660241851
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9660241851
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 10:17:02 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41279488d3cso9088525e9.2
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 02:17:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708597020; x=1709201820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mptyUsIJ4XYXNLgMBA7zAI/5E7MO6+y6PB/xCvpPt50=;
 b=KP3M79h6MJdOgm+wCdqNzpThDRS95yBBODn/uEKwVPqMBr8/NjiPDAAGgqNqh9nLae
 +Nw1RbZs1io5EoNq56T21I9sHVy31uTjx5sjO8BeuYd7OnF6yYjW9EQMiREd72dRbbMV
 bqvklFj9/Lwb0I5/p2uVaZDhyvP1ViRyPNzhR6v4t/ZsOk5c5jjlLxdygkWgOoTKgzzH
 zDKwvDjaNKlqQHU4F4+66lK6h5UZZiU1WsvJb6OpTggarW4VF+xSFPSXSkRPIu2Ei+bb
 ra1gSqOnkUkNxcHTpuCMzJrPOEysVvgfmqamaCu0JMBCgUYkVc1ZDt0mmtODS39Yi25a
 jNgQ==
X-Gm-Message-State: AOJu0Yxhkjw5mNsvqA9i5vjGtEoMGc8H1wPSpYOpL0t+zDdqc/x3ZU9D
 yTm6ivvk2PlmXfBK/G9lolO+dFbzw+1lIHSIPGuYotRysUrZvq2U9jiRGsDS35MtpWvCGdLHrzk
 KjZw=
X-Google-Smtp-Source: AGHT+IHe+lac98IHAEddWn/Od8I6f1fF/VQwQdv/v7rFzHFrnMM4DVqxbC3Kh8m/451OXDuiwhO47Q==
X-Received: by 2002:a05:600c:3515:b0:412:4a57:388c with SMTP id
 h21-20020a05600c351500b004124a57388cmr13244514wmq.14.1708597020433; 
 Thu, 22 Feb 2024 02:17:00 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4f68:2b3f:b15d:b5a9])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a05600c365100b004126101915esm5619349wmq.4.2024.02.22.02.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 02:16:59 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 22 Feb 2024 11:16:12 +0100
Message-ID: <20240222101617.18422-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
References: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708597020; x=1709201820;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mptyUsIJ4XYXNLgMBA7zAI/5E7MO6+y6PB/xCvpPt50=;
 b=jafrRFm+qN+53iNXmn/lStbgREeMP3i/Vh6L0IaiWw/NWeasiBzIvk2p/eeDqK5tEM
 bGYlw9RkVZNJE+/x+bJbfWDOshH472e6bMbUgrjwLrSf+HBPcuKsAGzkubHChMLxJQjg
 +0OojKzx1jW02pwlTeh7Xx8n1obmAODH1l6Iw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=jafrRFm+
Subject: [Buildroot] [PATCH v5 11/16] boot/ti-k3-r5-loader: set binman
 environment
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

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts.

The patch set the BINMAN_INDIRS environment variable to provide the
directory to search for binary blobs and select the packages required by
binman.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Co-developed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v5:
- Add dependecy on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
- Drop runtime dependecies
- Add host-python-pylibfdt dependency without requiring
  BR2_TARGET_UBOOT_NEEDS_PYLIBFDT configuration
- Add host-python3 and host-python-setuptools dependencies
- Add SOB and COB tags of Romain Naour

Changes in v4:
- Drop the BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option

Changes in v2:
- Change commit message
- Add BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option
- Select packages required by binman if
  BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN is enabled

 boot/ti-k3-r5-loader/Config.in          | 1 +
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 5f86c045c99f..fc71337e80cc 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -1,6 +1,7 @@
 config BR2_TARGET_TI_K3_R5_LOADER
 	bool "ti-k3-r5-loader"
 	depends on BR2_aarch64
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py -> python-jsonschema
 	help
 	  Separate U-Boot SPL build for R5 core on TI's K3 processors.
 	  Usually used to build tiboot3.bin with k3-image-gen.
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 0ffcb8235f2e..fdb058f3b72a 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -39,7 +39,12 @@ TI_K3_R5_LOADER_DEPENDENCIES = \
 	host-pkgconf \
 	$(BR2_MAKE_HOST_DEPENDENCY) \
 	host-arm-gnu-toolchain \
-	host-openssl
+	host-openssl \
+	host-python-jsonschema \
+	host-python-pyyaml \
+	host-python3 \
+	host-python-setuptools \
+	host-python-pylibfdt
 
 TI_K3_R5_LOADER_MAKE = $(BR2_MAKE)
 TI_K3_R5_LOADER_MAKE_ENV = $(TARGET_MAKE_ENV)
@@ -58,6 +63,7 @@ TI_K3_R5_LOADER_MAKE_OPTS = \
 	CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi- \
 	ARCH=arm \
 	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
+	BINMAN_INDIRS=$(BINARIES_DIR) \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)"
 
 define TI_K3_R5_LOADER_BUILD_CMDS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
