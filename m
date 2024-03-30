Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7014CC6FD1F
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 16:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 474128228F;
	Sat, 30 Mar 2024 16:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmrWxZhYKLmp; Sat, 30 Mar 2024 16:02:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 282988229E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 282988229E;
	Sat, 30 Mar 2024 16:02:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 08A281BF3DF
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 16:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8982406CC
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 16:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Afd9xTyocCx3 for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 16:02:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 82294406CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82294406CB
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82294406CB
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 16:02:53 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56c2c41cbdaso1564034a12.2
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 09:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711814571; x=1712419371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MHvfJ0eKgtiCEVRndHATYfEiZnu5tEmA4V3DweUFaV0=;
 b=ai2yNkXMhh78oyLPYf/03rcadlVKPWtmGZlSQ48T8YonDl+QHIZtZbSUgCW9yAdw7o
 CrEWZPmz0CkBUMSG/jVfXbMoiP4NiiphK5pL1wD70xgAiKPsFnDSqSOkJb0VvSBmNzFI
 F4UMKpJY4dSHbSUJEp0mpwOyATdAJ/cr2ExnwESPkJJHRz5PP8AWsi8R3tHV1L8651N0
 OfGUpnGdli98TKHw5y7GUwzI4MJW5bR+L2Qvd7AF1lCUWQBAMvwtKqkcyFqrRlvUSBcI
 /XqrARhETWSFHNZf5cM11MMBgqCdDINSp+dKAhU0AaWJlmmG8cUOrJEAB/1LDicPk8yY
 EWHg==
X-Gm-Message-State: AOJu0Yw3iTyc+H9UtDdWkt1RkZ/Tz2fCE7eXQLWuj/8N6LMGE//Wcl42
 o3GAn0jsaKOVQ0otS9KcxcjUjdzier+ttIvFo1GS0ldS7qZ+Z4L19oDSHOWpQWvDfccsE4+LiQ/
 aPSM=
X-Google-Smtp-Source: AGHT+IF7klqFlr6l/6aJjh3A0QCwXlW+xWpJRPnZw+1pMfdA9Sfh0w9iJ5nyjcPxBTvFsVoWs9iqRw==
X-Received: by 2002:a50:a682:0:b0:56b:f54a:8485 with SMTP id
 e2-20020a50a682000000b0056bf54a8485mr4483237edc.0.1711814571523; 
 Sat, 30 Mar 2024 09:02:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-8-99-67.retail.telecomitalia.it. [87.8.99.67])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a056402004d00b0056c633354c6sm2127107edu.45.2024.03.30.09.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 09:02:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 17:02:34 +0100
Message-ID: <20240330160244.3214733-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
References: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711814571; x=1712419371;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MHvfJ0eKgtiCEVRndHATYfEiZnu5tEmA4V3DweUFaV0=;
 b=fZKK9ab/cHsIum8TLsu5mZIy2acfBhlgS/SbJRUvuNWkibX1lMvIeoKNzykfaAw0Rk
 T7uClmj79A6APJ2xtuPYmqSgYZOE++8M9C7lVnReamRmdWMIlpjeSLO3u8hXmAseQTFx
 bl70rTMOtddGJfOaSRhFelHkD4a2Pfob+lXfs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=fZKK9ab/
Subject: [Buildroot] [PATCH v10 02/12] boot/ti-k3-r5-loader: set binman
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
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "Yann E . Morin" <yann.morin.1998@free.fr>, bryce@redpinelabs.com,
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

The dependency of binman is not really easy to follow. First we have the
packages list from binman.rst [1] then we have to install additional python
modules [2]. Maybe in the future it will be necessary to add host-lzma and
host-lz4 in the dependencies list.

[1] https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/binman/binman.rst?plain=1#L377
[2] https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt
Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Co-developed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v6:
- Update the commit message adding the links of requirements.

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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
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
