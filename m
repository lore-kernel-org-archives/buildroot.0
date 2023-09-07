Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167DBEE14AA
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 00:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80C38821F5;
	Thu,  7 Sep 2023 00:30:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80C38821F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sysFKpKUR9-I; Thu,  7 Sep 2023 00:30:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5D02821E6;
	Thu,  7 Sep 2023 00:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5D02821E6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E43A1BF983
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 00:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2749740148
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 00:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2749740148
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WYcoMvrFPHbT for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 00:30:18 +0000 (UTC)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC35940105
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 00:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC35940105
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-565334377d0so371656a12.2
 for <buildroot@buildroot.org>; Wed, 06 Sep 2023 17:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694046617; x=1694651417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NGdS4nswMBxxyRnbQgz09KxbH9+UqZ51fLQTP6pK4Fs=;
 b=V15gVvSsbfjQRiZfRT+J0x/KFAarBRgqlJDqUoSyVP/SiLRs+Qwj2gk1Ol8Xyo9a8v
 TdC1pFi2vasBqdIWvSIZFNn5IQTp50aXdeqvXVjlXTzqt1OzAhrprSQLepnjMY8lkX/A
 uc0Sh3+50Yw0J3mjKb0bsC41wad450X9YO7ER8LAiP+EDEKC3w9iAjOELlQowLJ/lGIe
 KaA8sECDzy696mYpMrhKQ8R7uySt42+kGBfQe7bw7Wx0XazjjRe31SY+MUElu8RTZggb
 X2vwWFoi2PiLb9IRrZAMIZ4jVoUBdVqPB9x7xBLGyqCP+oyiSxcLJyxHc6+HXSbgfoRo
 MUbw==
X-Gm-Message-State: AOJu0Yz3vrr2HyCXWuoxl4czMtjAgtAW4eUYFgKAFEPd6YoaeX0la6x1
 bqHBsUGGsgpExtMqJ40p/SoNqN7F4ig=
X-Google-Smtp-Source: AGHT+IFFKaEtMIIRyZJAO72HFko3q85lnlaXV0WQabQlyEJYVQPG/6I8fR8bodxlmKLf6Qxc6Zhjfg==
X-Received: by 2002:a05:6a20:3d1e:b0:14c:7b3:9ac6 with SMTP id
 y30-20020a056a203d1e00b0014c07b39ac6mr23667252pzi.41.1694046616999; 
 Wed, 06 Sep 2023 17:30:16 -0700 (PDT)
Received: from gtr.. ([2403:5814:e4c2:0:6876:9fff:feae:cf11])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a62ee0d000000b00684b64da08bsm11304807pfi.132.2023.09.06.17.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 17:30:16 -0700 (PDT)
From: patrick.oppenlander@gmail.com
To: buildroot@buildroot.org
Date: Thu,  7 Sep 2023 10:30:02 +1000
Message-ID: <20230907003002.474334-1-patrick.oppenlander@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230905090732.7616c4de@windsurf>
References: <20230905090732.7616c4de@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694046617; x=1694651417; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NGdS4nswMBxxyRnbQgz09KxbH9+UqZ51fLQTP6pK4Fs=;
 b=Dkxgge1ZxIUNjMA0IYB41ekA49WzBEgcS6V9WAKGrYFoSYJMlKb2w2iie3LDkiy2RL
 1P5YWCwpQJLh0/szq35EyiA5sNZAyIK/tWTUJcQpezujMbDvV8vRKHQHCkOkS3DlFdTQ
 /MNWS3cijirzpj2kcIwxGycXMJcTClKM2S77ZyxZYRPX3vG3uQ6FvU3W7q0PpfVmlO+p
 qsVL2N3DETWXQw3wdjsaqO3M0t0rRgGqpX9Ewm4F2Xpr6XIHGoy3Z4OXRUEbzkqHJAEV
 DsXSSJhOVUmALwn/cXZDFiQ8WyOTq4AqDdARzMMnvu/j1boLSvPT+3BKHLGFFa+zfvgz
 7BpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Dkxgge1Z
Subject: Re: [Buildroot] [PATCH] ti-k3-r5-loader: support devicetree
 customisation
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
Cc: Patrick Oppenlander <patrick.oppenlander@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Patrick Oppenlander <patrick.oppenlander@gmail.com>

This is duplicated from the U-Boot makefile & Kconfig.

Similarly to U-Boot custom boards sometimes need to adjust the U-Boot
devicetree. For example, the AM64x SDRAM controller supports inline ECC
which needs to be enabled in the R5 loader devicetree.

Please note that some versions of U-Boot have broken external devicetree
support and may require manual patching to build. See commit
3609e1dc5f4d4c238dcd23e045ba6223310feffa in the U-Boot tree.

Signed-off-by: Patrick Oppenlander <patrick.oppenlander@gmail.com>
---
 boot/ti-k3-r5-loader/Config.in          | 10 ++++++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 2419babe70..580abf59ec 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -92,3 +92,13 @@ config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE
 	  Path to the TI K3 R5 Loader configuration file.
 
 endif
+
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_DTS_PATH
+	string "Device Tree Source file paths"
+	help
+	  Space-separated list of paths to device tree source files
+	  that will be copied to arch/ARCH/dts/ before starting the
+	  build.
+
+	  To use this device tree source file, the TI K3 R5 Loader
+	  configuration file must refer to it.
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 8311e1b401..012f4ee52d 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -77,7 +77,12 @@ TI_K3_R5_LOADER_MAKE_OPTS += TI_SECURE_DEV_PKG=$(TI_CORE_SECDEV_K3_INSTALL_DIR)
 endif
 endif
 
+TI_K3_R5_LOADER_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_DTS_PATH))
+
 define TI_K3_R5_LOADER_BUILD_CMDS
+	$(if $(TI_K3_R5_LOADER_CUSTOM_DTS_PATH),
+		cp -f $(TI_K3_R5_LOADER_CUSTOM_DTS_PATH) $(@D)/arch/arm/dts/
+	)
 	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
 endef
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
