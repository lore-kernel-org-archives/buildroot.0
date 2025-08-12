Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7605CA0EDC
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 23:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BF3C606B8;
	Tue, 12 Aug 2025 23:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8t52z86NRNdU; Tue, 12 Aug 2025 23:14:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8890B60704
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8890B60704;
	Tue, 12 Aug 2025 23:14:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EFEAD938
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 23:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E167140186
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 23:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Lzhg68c0dVb for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 23:14:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A18940156
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A18940156
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A18940156
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 23:14:49 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-76bdea88e12so5175545b3a.0
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 16:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755040488; x=1755645288;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ER76QLeGioAiJi+w9MG2fsG05Gb/osihOiI5oSnCDWo=;
 b=G+XF0jNUb1N2FxL4Mp5dZg8G2esdhdI25l/wPEmdB6PYVxvSTCI1pTnJGYc63gkzYf
 0VjcTFOsiQiVWdaTK/FDL8tGY8cCBRIEDiVce0/cp5QwXQIjHh8BH5aVsRjWaBiBoSoI
 /SQyYuRcatGoTxXYM4ftbWw2GKlAVdfrqpq3Tyvj1t0MiR1a9C6vquy9E5Xb86AtNKAi
 xgFJSa+u92vcypT0rJj8uKS5SOGcMFntY1m7QYwpSlylEbiZpaAaGjOjpOmqtlYzlGpZ
 hXRlgYcwNuy2fpo2HsiGKprGUTmovvTBi6lwqYwbRsDY7hxMh2hSZnQshV8ek562xD4N
 0Chg==
X-Gm-Message-State: AOJu0YzdOmtVs0Wkv9GS5dTRMS2wcj4jwTFV8w2yRi73fvchNCDL8vmK
 5mNUfcZK1GF/X1zCborX+uIByZs96mE0P5QVhTprd16l6shxMKb+CPUoFhLwRw==
X-Gm-Gg: ASbGncs58Or2IxUDdDy0t0mZf9c7LKY6ffc9642gdnVPxEDphzp59+HFNtZAIxJCPwg
 yVqWnrOZOCE51XnKbI+QRH4wvg3TQlOqbmjAsE2MfzoKJykWLcZ3Jhgjfzi6zJMEfSfH0SGYQ/K
 2+RI0MrA59TD5SSk+qTiw1pwRlvqQzeZXL88KiVRBwNRtcBGHbef1gvdi1dF3BQHDQuKck7yEdY
 UNt1Z7ZpNFoh8MG83Uhp3Sl58v+t9NW6MCa5qFJOapSCtSrwvX7WOslRbN4p76TviWODkRED/5d
 cKU8fqNF2i9SAa8Xh3BDHIRck8b35sq9SzEpUtIqh/pEI22vvq52V6HfcqftIBO+a1kr/P1+bke
 yCz+KlJDepV63JUyTCl8wkjNyvy6TAc1NUtnGYHvt0WwmFsE=
X-Google-Smtp-Source: AGHT+IGGQTkKwfDxqTkvAz6kBs7A6osdDoo1RzpumJBRFYcUeqSc70ztLetktlhzpsuU/zRvok0Png==
X-Received: by 2002:a05:6a20:258d:b0:23f:31ab:371b with SMTP id
 adf61e73a8af0-240a8a47f61mr1759745637.17.1755040487817; 
 Tue, 12 Aug 2025 16:14:47 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:4c8c:4a84:8608:9a5a])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bfaf78c94sm23486904b3a.19.2025.08.12.16.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 16:14:47 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Cc: breno.lima@nxp.com,
	Fabio Estevam <festevam@gmail.com>
Date: Tue, 12 Aug 2025 20:14:17 -0300
Message-Id: <20250812231417.1249446-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755040488; x=1755645288; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ER76QLeGioAiJi+w9MG2fsG05Gb/osihOiI5oSnCDWo=;
 b=P+TTeZpQuZ+V+M7gfSNhe+7MPY4zMlTOJ4ggJaZ1NTwYsfoclBabk/t8b/1KAcZkv7
 rApDkrDm1FNGpFwOnf2wxC8R+MjbEXgKuxfneN6+jPMDM/GvI/hqcB+9FT3jXjeaZIaN
 Up4xGQM+TuOnfXldV82nWq9SIUn2pT6S3/veZDH0l9qdCTkoyapTGYO4D+3Ju9Cbhk77
 IjSMLpZFRVMMcJwFP7MbfcI4PScdKgoN/ClBRyRb9OlJ/ZyDUROptqzhAnCwJccf5pxb
 Zkw07Z4yOV+eaHxkgR24mmO5WiTDK29Kz7A3NmWwTuwMlho+0hOFcnEfkkC8VMFzPANN
 yLhQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=P+TTeZpQ
Subject: [Buildroot] [PATCH] freescale_imx93evk_defconfig: Add OP-TEE OS
 support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Breno Lima <breno.lima@nxp.com>

Add OP-TEE OS Support from the NXP BSP lf-6.12.3-1.0.0 version.

The i.MX93 Boot Container requires a raw TEE binary without a TEE header.
Update the imx9-bootloader-prepare.sh script and Config.in accordingly
to ensure compatibility with this requirement.

Signed-off-by: Breno Lima <breno.lima@nxp.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/freescale/common/imx/imx9-bootloader-prepare.sh | 2 +-
 boot/optee-os/Config.in                               | 2 +-
 configs/freescale_imx93evk_defconfig                  | 7 +++++++
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/board/freescale/common/imx/imx9-bootloader-prepare.sh b/board/freescale/common/imx/imx9-bootloader-prepare.sh
index 2db887a785..a267114d43 100755
--- a/board/freescale/common/imx/imx9-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx9-bootloader-prepare.sh
@@ -20,7 +20,7 @@ main ()
 		"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -c \
 			-ap "${BINARIES_DIR}/bl31.bin" a55 ${ATF_LOAD_ADDR} \
 			-ap "${BINARIES_DIR}/u-boot-hash.bin" a55 0x80200000 \
-			-ap "${BINARIES_DIR}/tee.bin" a55 0x96000000 \
+			-ap "${BINARIES_DIR}/tee-raw.bin" a55 0x96000000 \
 			-out "${BINARIES_DIR}/u-boot-atf-container.img"
 	else
 		"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -c \
diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 433dae90d8..e737d2a0ac 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -167,7 +167,7 @@ config BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES
 
 config BR2_TARGET_OPTEE_OS_CORE_IMAGES
 	string "Binary boot images"
-	default "tee.bin tee-*_v2.bin"
+	default "tee.bin tee-raw.bin tee-*_v2.bin"
 	help
 	  Names of generated image files that are installed in the
 	  output images/ directory.
diff --git a/configs/freescale_imx93evk_defconfig b/configs/freescale_imx93evk_defconfig
index 1140747825..0a39859342 100644
--- a/configs/freescale_imx93evk_defconfig
+++ b/configs/freescale_imx93evk_defconfig
@@ -25,6 +25,13 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.12.3-1.0.0)/imx-atf-lf-6.12.3-1.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx93"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y
+BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-optee-os,lf-6.12.3-1.0.0)/imx-optee-os-lf-6.12.3-1.0.0.tar.gz"
+BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
+BR2_TARGET_OPTEE_OS_PLATFORM="imx"
+BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="mx93evk"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
