Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727BFE87841
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 15:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38BCC40C00;
	Tue,  3 Feb 2026 15:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZKwP7VY4KhYr; Tue,  3 Feb 2026 15:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F35040BC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770133003;
	bh=/EUwsyobSYvmTMuEll7FA6YeSUDJr26kbtV1nHqIul8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=r8VvUyfl5ObjOt1fa8wTh/+FwTV3LOCxqkrv2dtHnKJK6C2qNGz3znLhUU1y7N+BW
	 HJxCCGoUapj8ZQfDUJWr1tOBGgq6QDriFHNEqyYgfFQ47VPmXPtsN1/Ob5OOnKkJJE
	 y//0YVbLw6IBjlr8QCJm77aV+is7McLV47URTU7B8QeTjc7Y2d/e0ESDzyVyFI4Lh2
	 WDT1q4qlgMVnljzz1Eif7LGwyjW/ajymxBf/3ljl+8i6RgVS1n4NeK+6XgB5789wj5
	 1wfG1m+22ybwdfUzgZP5xAtS2CXWSdlvuCPqmvT17I+d2p8LKvsI+DSr1XH+pxTj2r
	 0JfPfSYwpK43A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F35040BC5;
	Tue,  3 Feb 2026 15:36:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0C00F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEBC640A80
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aub_RWFzBYXK for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 15:36:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=laurentiumihalcea111@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F08A6405C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F08A6405C9
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F08A6405C9
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:39 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47fedb7c68dso59047005e9.2
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 07:36:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770132997; x=1770737797;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=D62NId16QlNG1wL7A7V8DDxXHF5+qTTfuvIWjPTdxh8=;
 b=c8BnmAJdSCp0H9Rriu8ptcW5FZKtfuK8nIs6pxXgcgIFjeepz4jppnmWlb57eP77Pg
 0L/dbMeisfXOGtg+mbnwUmBMC+P5bLL63uAJWEAym/Jw6FsAq8a80/auSrGQ10cH5QKL
 1W0xhALsC0n6GaVQca+w3wpLNlQxyjtbWtLrdyAyV+LOOfknEWHWoC8RHB5k2zuwACwu
 J3zveGK90I+gTiUoLJHOph2LRVSFvi/A3BMHkdDyr0gBcymAvDocNUQJy8UFSy3NtRd8
 1x6FIUqFfWRYteiJKh5/dHh97d9196Ns8khug5EfZfSH9wHFjg8ffqXtvJ3FGoxvleeU
 gKfA==
X-Gm-Message-State: AOJu0YyoPQ3+W3GB/7q6bmIRfkb7fPUUrsRlZN3/ceiDjqfiWEMIMfvc
 WElDdbwiRT6/G/pFLBggaTjKhjyj2hF8L45vu2uCc/xBc8/G4smeLw8IHzITrQuu
X-Gm-Gg: AZuq6aLhxCeyOmNo7IVsf1aDcOQObTzzegGuolDaOyuJWK18Fd+5Hl1b+yAwN6fHAZ4
 kQI4k+NPGYLI9FPID6WsbbS4Q9wsXjjcHAVSMyPwfrk1iIDhE5RGIG5oVbp4cRXr0t+i/khEg+i
 UK9ih6K+QimU9XF1DZb1xh0JdMaZFb71r2FvUXzd7uR7AuQygmw1z7VP0f6e2y5Q37/d/v6BSN1
 hu+PglT9LMyHOp8Udb/8C9fco0c6g1sAG3/0rp/+Ys3yElA3lpKOgK9JMiMfljBhmLOnbglZI7m
 eBgzl18tiEJo/NMUH/wK/8HBstUafZ4Ec/dxTVV14y81B+mfz71mW2NsdhxiNltQIAR4/FWVG4Z
 RiabirqmFNeNzW+2zyvwnyHfIJxUzOTt1SfK/C4AEOwqAiM5RgbVCn/6JIrqyGdOubIrPSBeHEk
 WM21vLt7nZfVdDLXtyi146v8NnMK/iWQ4Eh/yczA==
X-Received: by 2002:a05:600c:4e4f:b0:477:89d5:fdb2 with SMTP id
 5b1f17b1804b1-4830e931dfamr771505e9.14.1770132997015; 
 Tue, 03 Feb 2026 07:36:37 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48305161534sm62812055e9.12.2026.02.03.07.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 07:36:36 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Feb 2026 07:36:10 -0800
Message-ID: <20260203153617.80012-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
References: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770132997; x=1770737797; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D62NId16QlNG1wL7A7V8DDxXHF5+qTTfuvIWjPTdxh8=;
 b=QZQJ9T95y+0fnD5uYLpDY/Tn+buRbT6oOyaO6oYzTucKyO62GQhRcmFmLfv6c8puhW
 CivYi2jb74wUdBLrxJdLSvkPfnizI/G2SgqDE0xl7BSZ9DvyyJEZNhJl7elfD7wEyWxR
 goFDLaZAV08yhymvGUV506JI3iho8kItZXKw4Vw7dzTQOH2GvrAdXqvgHbe912/G+Vqo
 B/JiX20uaHSqD/JO+bawVjpqUSolkkSZg1SzCR/7ZA8WTwBW2l08AEcUL/5hAmV5oGva
 XmXWLoLSQHaHUpy89mZTeGLnHKKZ9aye/7oQQUVy3ESUtjYfQg9WGbfgNYLKURJMjHm/
 Llxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QZQJ9T95
Subject: [Buildroot] [PATCH 03/10] package/freescale-imx/imx-sm: add SM
 package
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add System Manager (SM) package.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 DEVELOPERS                               |  3 +++
 package/freescale-imx/Config.in          |  1 +
 package/freescale-imx/imx-sm/Config.in   | 15 +++++++++++
 package/freescale-imx/imx-sm/imx-sm.hash |  4 +++
 package/freescale-imx/imx-sm/imx-sm.mk   | 33 ++++++++++++++++++++++++
 5 files changed, 56 insertions(+)
 create mode 100644 package/freescale-imx/imx-sm/Config.in
 create mode 100644 package/freescale-imx/imx-sm/imx-sm.hash
 create mode 100644 package/freescale-imx/imx-sm/imx-sm.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 08c98ec53b..a31458f9d7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2111,6 +2111,9 @@ F:	package/open-lldp/
 N:	Laurent Vivier <laurent@vivier.eu>
 F:	package/petitboot/
 
+N:	Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
+F:	package/freescale-imx/imx-sm/
+
 N:	Lee Jones <lee.jones@linaro.org>
 F:	boot/afboot-stm32/
 
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index c885b4fc23..30c0d69970 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -218,6 +218,7 @@ source "package/freescale-imx/firmware-imx/Config.in"
 source "package/freescale-imx/firmware-upower/Config.in"
 source "package/freescale-imx/imx-sc-firmware/Config.in"
 source "package/freescale-imx/imx-seco/Config.in"
+source "package/freescale-imx/imx-sm/Config.in"
 source "package/freescale-imx/imx-vpu-hantro-daemon/Config.in"
 source "package/freescale-imx/imx-vpu-hantro-vc/Config.in"
 if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
diff --git a/package/freescale-imx/imx-sm/Config.in b/package/freescale-imx/imx-sm/Config.in
new file mode 100644
index 0000000000..b06d797f99
--- /dev/null
+++ b/package/freescale-imx/imx-sm/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_IMX_SM
+	bool "imx-sm"
+	help
+	  imx-sm contains the source code for the System Manager (SM)
+	  firmware used on NXP SoCs such as MX95 and MX943.
+
+	  https://github.com/nxp-imx/imx-sm
+
+if BR2_PACKAGE_IMX_SM
+config BR2_PACKAGE_IMX_SM_CFG
+	string "Target configuration"
+	default "mx95evk"
+	help
+	  Which configuration to use in the build process.
+endif # BR2_PACKAGE_IMX_SM
diff --git a/package/freescale-imx/imx-sm/imx-sm.hash b/package/freescale-imx/imx-sm/imx-sm.hash
new file mode 100644
index 0000000000..b566c6047f
--- /dev/null
+++ b/package/freescale-imx/imx-sm/imx-sm.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  3efe6a9e8b5f87cade9f2fe3116473d7629098487227da34c224a3846ee3aa51  imx-sm-lf-6.12.49-2.2.0.tar.gz
+sha256  ea2ae6b89b80c3c7cd0b4d0b86d84d927e1fc3e3ef81f65e6917162f13c78542  LICENSE.txt
+sha256  181f7f133c5b38874f0d3a41d9bbd03e724f8a8db864a403eeb40ccc19025775  SCR.txt
diff --git a/package/freescale-imx/imx-sm/imx-sm.mk b/package/freescale-imx/imx-sm/imx-sm.mk
new file mode 100644
index 0000000000..666a10be3c
--- /dev/null
+++ b/package/freescale-imx/imx-sm/imx-sm.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# imx-sm
+#
+################################################################################
+
+IMX_SM_VERSION = lf-6.12.49-2.2.0
+IMX_SM_SITE = $(call github,nxp-imx,imx-sm,$(IMX_SM_VERSION))
+IMX_SM_LICENSE = BSD-3-Clause
+IMX_SM_LICENSE_FILES = LICENSE.txt SCR.txt
+
+IMX_SM_DEPENDENCIES += host-arm-gnu-toolchain
+
+IMX_SM_OUTPUT_BIN = m33_image.bin
+
+# note: we don't use the TOOLS variable here as recommended by the SM
+# documentation because buildroot adds the "host-" prefix to the
+# toolchain's directory name, which wouldn't work. Instead, we use
+# SM_CROSS_COMPILE, which is normally based on TOOLS.
+IMX_SM_MAKE_OPTS = \
+	SM_CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi-
+
+define IMX_SM_BUILD_CMDS
+	$(IMX_SM_MAKE_OPTS) $(MAKE) -C $(@D) config=$(BR2_PACKAGE_IMX_SM_CFG) cfg
+	$(IMX_SM_MAKE_OPTS) $(MAKE) -C $(@D) config=$(BR2_PACKAGE_IMX_SM_CFG) all
+endef
+
+# the output binary is used to build the boot container
+define IMX_SM_INSTALL_TARGET_CMDS
+	cp $(@D)/build/$(BR2_PACKAGE_IMX_SM_CFG)/$(IMX_SM_OUTPUT_BIN) $(BINARIES_DIR)/$(IMX_SM_OUTPUT_BIN)
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
