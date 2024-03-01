Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033C3C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 13:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4BC38356E;
	Fri,  1 Mar 2024 13:37:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZE5W6UJ_QR9m; Fri,  1 Mar 2024 13:37:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1A6A835A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1A6A835A3;
	Fri,  1 Mar 2024 13:37:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E1201BF2C1
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BA5B41E06
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Stkk6CKXkRQO for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 13:36:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 08F3241C61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08F3241C61
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08F3241C61
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 13:36:39 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-563bb51c36eso3165496a12.2
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 05:36:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709300198; x=1709904998;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MHvfJ0eKgtiCEVRndHATYfEiZnu5tEmA4V3DweUFaV0=;
 b=G7NNplAwOdAdf/9rqcHlMvJAEeY6GhD/Hwjsw8U7fbIF10Zsbg9LrOAXtZ4iMh5Dmf
 z1rSlSD3lHayAm7ZLy5dE70jswRIsu27cz3NsqaTsIKC5lBrZwRT5Cyp4ujt2XGMpXli
 Lr2YBTCm4C1iBFApoH9WUt7Zo4tLG4JPaSrKked0qFi1w2p7Zf+/h98rVfmt11vY7xHK
 9A7AfFi4cUdKho/gupwIGNwTVKNEjxMfnpMrkcgTCCkqalJf5ZfZIPKLrf53xxeyHlyI
 11nawMXb2uaQDULpjg4HHaDTwM5EMzFgoifSwcEjCBWeOM1odWkONiQegFOhi8pdHn/2
 uM5Q==
X-Gm-Message-State: AOJu0YxFvdEONnyC0qcu0kDbewbZas0hKtn3VTqUcVLCcTufnruVlidQ
 WPziz+cU21BCoA2edw/KTjOD/D0vXVtDKs0ukNIFxJ7J88ssayMueE3Xan41SAXPUyXzdr0yXV9
 jjgI=
X-Google-Smtp-Source: AGHT+IFkhfEmmGwvkHHoQahtf2QF0aoNhkytwwfIVMZvPr6z+R7c8xPavPV8DsiV8Rz5BQOr/Y165A==
X-Received: by 2002:a50:cb8c:0:b0:566:aa2:843f with SMTP id
 k12-20020a50cb8c000000b005660aa2843fmr1228509edi.10.1709300197959; 
 Fri, 01 Mar 2024 05:36:37 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5260:58bc:42cc:9d46])
 by smtp.gmail.com with ESMTPSA id
 q28-20020a056402033c00b005659ea1caf0sm1566608edw.6.2024.03.01.05.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 05:36:37 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 14:36:08 +0100
Message-ID: <20240301133620.3547430-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709300198; x=1709904998;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MHvfJ0eKgtiCEVRndHATYfEiZnu5tEmA4V3DweUFaV0=;
 b=PPUVHK20s+kWEa2rg6RNt5euNzbm24OBnGvY8bQeORDfrAjPLxu4+WG/JYIQrZyLV0
 vGFlRsChQl9F6U2m4J48bA2+7Fz7IUmuiG8jgEhPnrgj7ODceHcHQwBExAogGzg8T6J8
 M5+dfC6s8327kSUI+9jxY8BLDo7Q5A/wQxiNU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=PPUVHK20
Subject: [Buildroot] [PATCH v8 11/23] boot/ti-k3-r5-loader: set binman
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
