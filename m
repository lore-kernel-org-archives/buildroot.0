Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9BCCD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 904CE4192F;
	Wed,  3 Apr 2024 19:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1SSXmT-IhbL; Wed,  3 Apr 2024 19:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFDAA41937
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFDAA41937;
	Wed,  3 Apr 2024 19:54:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25A8A1BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 919ED6073E
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WzOywrm3wWZy for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:54:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 14F326080B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14F326080B
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14F326080B
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:54:11 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3434c6e1941so105736f8f.0
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 12:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712174050; x=1712778850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W9GwVenUutWlyUlHlqJHDSHCEdEls2M/DihmVeGIs4s=;
 b=o7lxnZiQd3ja/W9MqETrgyGlqQNd2/3Gmh3zb1tJkJpb3OS+cmycYZ+4GIG07dbTob
 AxSl8R/oorgJW8c4gOkWVYn60Fh4msi79luZaMEhTqmjEXK0QdPSNFkXTLvzRZ/QCNV3
 2SDNudL0FZWW1N3u/0pJr0aV7o6XTYuoIHCiHYDNppkKF6JEimoV6LIJz+F+NITpQFaF
 J+q9A6V1bUIS3jZjDvVAJH14f29HNwHOibFK3s9vSXgMUwP40ZCXzc2V9JnS9YK/lTpr
 BlU5/yf90wQie2zDOMShH3nbKUqJeIaYYgkWJ/2Q+hTOtskNna2zMTQnwhGHkIXiZfkX
 jDhA==
X-Gm-Message-State: AOJu0Yw5jyASTB/qCG1iS7L3ZXe2tuK0TpIceBQhjtxAp2cZz5O+ih3H
 jvsW2clxqDd3SIs7/gozpPk0uBkKX6Yf0r7UZUQJWHcnYcPf267kCG7t1VPzhJoq3nYC5p2HmNB
 Q
X-Google-Smtp-Source: AGHT+IFDuiX/lH+elu/HLZiYElBr4B/uJg32smPF/yzfT1K87V/Ur96t/4RUWLy8kVgxfEBiKdHyzA==
X-Received: by 2002:a5d:4a0a:0:b0:341:bdd4:aedf with SMTP id
 m10-20020a5d4a0a000000b00341bdd4aedfmr345880wrq.25.1712174050233; 
 Wed, 03 Apr 2024 12:54:10 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 cc13-20020a5d5c0d000000b00341b8edbe8csm15595571wrb.87.2024.04.03.12.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 12:54:10 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 21:53:41 +0200
Message-ID: <20240403195403.1359007-8-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403195403.1359007-1-romain.naour@smile.fr>
References: <20240403195403.1359007-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712174050; x=1712778850;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W9GwVenUutWlyUlHlqJHDSHCEdEls2M/DihmVeGIs4s=;
 b=0hZ1H71mJrvDykkvPWqqZGcCZNdaL7FKR/iaHfB+d4xpaUXNUFdAfZCGHMZYbf8Fvi
 NEI6nWRu01IMmgJVLyslvYCK4NGoWma+sUzE/+aYXj0F2nqWjZl6ZguE5tWlZmPWqfJ9
 DkQWwZtTnFcb6bzR2mgUX/X05Tmoxme833XNq/T5MZHd3CM/T2un65xMe9ZxOQgrnWNa
 zzNfhda6psXOVzvYZg5S6uhdLdlA198Lf8ZPzYICnufQKPnSqbz0z3t1gLIMb4iwAWBq
 Ow4a+e7EvvNW5TM61ly2Sfm4Rd+Xfk+CEAiK5TwZfJMSnk5lWNyxwfvImF0fqbi5L9Im
 EWEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=0hZ1H71m
Subject: [Buildroot] [PATCH v11 07/17] boot/ti-k3-r5-loader: install
 tiboot3.bin and sysfw.itb to BINARIES_DIR
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dario Binacchi <dario.binacchi@amarulasolutions.com>

U-boot for k3 r5 core (ti-k3-r5-loader) can install different target
image (tiboot3*.bin) depending on the k3 SoC variant using different
boot flow [1]:

- Split binary with a combined firmware: (eg: AM65)
- Combined binary with a combined firmware: (eg: AM64)
- Split binary with a split firmware: (eg: J721E)
- Combined binary with a split firmware: (eg: AM62)

K3 SoC using Split Binary Boot Flow also requires sysfw-*.itb file
to boot (eg: am65, j721e). Only tiboot3*.bin is needed for other
boot flow.

From [1]:
"It's important to rename the generated tiboot3.bin and sysfw.itb
to match exactly tiboot3.bin and sysfw.itb as ROM and the wakeup
UBoot SPL will only look for and load the files with these names."

See the list of all tiboot3*.bin and sysfw*.itb file variant found in meta-ti:

  meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf:UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
  meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf:UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
  meta-ti-bsp/conf/machine/include/am62axx.inc:IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/am62axx.inc:IMAGE_BOOT_FILES += "tiboot3-am62ax-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/am62axx.inc:IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-evm.bin"
  meta-ti-bsp/conf/machine/include/am62pxx.inc:IMAGE_BOOT_FILES += "tiboot3-am62px-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/am62xx.inc:IMAGE_BOOT_FILES += "tiboot3-am62x-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/am62xx.inc:IMAGE_BOOT_FILES += "tiboot3-am62x-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/am62xx.inc:IMAGE_BOOT_FILES += "tiboot3-am62x-hs-evm.bin"
  meta-ti-bsp/conf/machine/include/am64xx.inc:IMAGE_BOOT_FILES += "tiboot3-am64x_sr2-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/am64xx.inc:IMAGE_BOOT_FILES += "tiboot3-am64x-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/am64xx.inc:IMAGE_BOOT_FILES += "tiboot3-am64x_sr2-hs-evm.bin"
  meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES += "tiboot3-am65x_sr2-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES += "tiboot3-am65x_sr2-hs-evm.bin"
  meta-ti-bsp/conf/machine/include/j7200.inc:IMAGE_BOOT_FILES += "tiboot3-j7200-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/j7200.inc:IMAGE_BOOT_FILES += "tiboot3-j7200_sr2-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/j7200.inc:IMAGE_BOOT_FILES += "tiboot3-j7200_sr2-hs-evm.bin"
  meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "tiboot3-j721e-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "tiboot3-j721e_sr2-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "tiboot3-j721e_sr1_1-hs-evm.bin"
  meta-ti-bsp/conf/machine/include/j721s2.inc:IMAGE_BOOT_FILES += "tiboot3-j721s2-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/j721s2.inc:IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/j722s.inc:IMAGE_BOOT_FILES += "tiboot3-j722s-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/j784s4.inc:IMAGE_BOOT_FILES += "tiboot3-j784s4-gp-evm.bin"
  meta-ti-bsp/conf/machine/include/j784s4.inc:IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-fs-evm.bin"
  meta-ti-bsp/conf/machine/include/k3r5.inc:SPL_BINARY = "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.${SPL_SUFFIX}"

  meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES += "sysfw.itb"
  meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES += "sysfw-am65x_sr2-gp-evm.itb"
  meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES += "sysfw-am65x_sr2-hs-evm.itb"
  meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "sysfw.itb"
  meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "sysfw-j721e-gp-evm.itb"
  meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "sysfw-j721e_sr2-hs-fs-evm.itb"
  meta-ti-bsp/conf/machine/include/j721e.inc:IMAGE_BOOT_FILES += "sysfw-j721e_sr1_1-hs-evm.itb"

Define BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN and
BR2_TARGET_TI_K3_R5_LOADER_SWSFW_ITB strings set with the binary file
to use according to the SoC family choice and the Security type.

[1] https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/doc/board/ti/k3.rst

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Changes in v11:
- Introduce BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN and BR2_TARGET_TI_K3_R5_LOADER_SWSFW_ITB
  strings to provide firmware name to copy at the end of ti-k3-r5-loader build.
  This replace the "find . -regex" from provious patch version.
- Add sysfw.itb handling needed to TI K3 SoC using Split Binary Boot Flow.

Changes in v8:
- Use the `find' command in pipe with the `cp' command.

Changes in v6:
- Replace `find' command with `cp' one.

Changes in v5:
- Replace tiboot3-*-$(TI_K3_R5_LOADER_SECTYPE)-*.bin with
  tiboot3-$(TI_K3_R5_LOADER_SOC)-$(TI_K3_R5_LOADER_SECTYPE)-*.bin

Added in v4
---
 boot/ti-k3-r5-loader/Config.in          | 19 +++++++++++++++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 13 +++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index cfae45ac98..a580b6ca61 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -101,4 +101,23 @@ config BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
 
 	  https://docs.u-boot.org/en/v2024.01/develop/package/binman.html
 
+config BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN
+	string
+	default "tiboot3-am62ax-gp-evm.bin" if BR2_PACKAGE_TI_K3_SOC_AM62AX && BR2_PACKAGE_TI_K3_SECTYPE_GP
+	default "tiboot3-am62ax-hs-evm.bin" if BR2_PACKAGE_TI_K3_SOC_AM62AX && BR2_PACKAGE_TI_K3_SECTYPE_HS
+	default "tiboot3-am62ax-hs-fs-evm.bin" if BR2_PACKAGE_TI_K3_SOC_AM62AX && BR2_PACKAGE_TI_K3_SECTYPE_HS_FS
+	default "tiboot3-am62x-gp-evm.bin" if BR2_PACKAGE_TI_K3_SOC_AM62X && BR2_PACKAGE_TI_K3_SECTYPE_GP
+	default "tiboot3-am62x-hs-evm.bin" if BR2_PACKAGE_TI_K3_SOC_AM62X && BR2_PACKAGE_TI_K3_SECTYPE_HS
+	default "tiboot3-am62x-hs-fs-evm.bin" if BR2_PACKAGE_TI_K3_SOC_AM62X && BR2_PACKAGE_TI_K3_SECTYPE_HS_FS
+	default "tiboot3-am64x-gp-evm.bin" if BR2_PACKAGE_TI_K3_SOC_AM64X && BR2_PACKAGE_TI_K3_SECTYPE_GP
+	default "tiboot3-am64x_sr2-hs-evm.bin" if BR2_PACKAGE_TI_K3_SOC_AM64X && BR2_PACKAGE_TI_K3_SECTYPE_HS
+	default "tiboot3-am64x_sr2-hs-fs-evm.bin" if BR2_PACKAGE_TI_K3_SOC_AM64X && BR2_PACKAGE_TI_K3_SECTYPE_HS_FS
+	default "tiboot3-am65x_sr2-gp-evm.bin" if BR2_PACKAGE_TI_K3_SOC_AM65X && BR2_PACKAGE_TI_K3_SECTYPE_GP
+	default "tiboot3-am65x_sr2-hs-evm.bin" if BR2_PACKAGE_TI_K3_SOC_AM65X && BR2_PACKAGE_TI_K3_SECTYPE_HS
+
+config BR2_TARGET_TI_K3_R5_LOADER_SWSFW_ITB
+	string
+	default "sysfw-am65x_sr2-gp-evm.itb" if BR2_PACKAGE_TI_K3_SOC_AM65X && BR2_PACKAGE_TI_K3_SECTYPE_GP
+	default "sysfw-am65x_sr2-hs-evm.itb" if BR2_PACKAGE_TI_K3_SOC_AM65X && BR2_PACKAGE_TI_K3_SECTYPE_HS
+
 endif
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index cf18b43871..ef7f8df6f7 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -73,14 +73,27 @@ TI_K3_R5_LOADER_DEPENDENCIES += \
 	host-python-pylibfdt \
 	host-python-setuptools
 TI_K3_R5_LOADER_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
+define TI_K3_R5_LOADER_INSTALL_TIBOOT3_BIN
+	cp $(@D)/$(TI_K3_R5_LOADER_TIBOOT3_BIN) $(BINARIES_DIR)/tiboot3.bin
+endef
+# sysfw*.itb are only generated for Split binary based Boot Flow (eg: am65, j721e)
+ifneq ($(BR2_TARGET_TI_K3_R5_LOADER_SWSFW_ITB),)
+define TI_K3_R5_LOADER_INSTALL_SWSFW_ITB
+	cp $(@D)/$(BR2_TARGET_TI_K3_R5_LOADER_SWSFW_ITB) $(BINARIES_DIR)/sysfw.itb
+endef
+endif
 endif
 
 define TI_K3_R5_LOADER_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
 endef
 
+TI_K3_R5_LOADER_TIBOOT3_BIN = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN))
+
 define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
 	cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
+	$(TI_K3_R5_LOADER_INSTALL_TIBOOT3_BIN)
+	$(TI_K3_R5_LOADER_INSTALL_SWSFW_ITB)
 endef
 
 $(eval $(kconfig-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
