Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A394C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3548A4162C;
	Tue, 13 Feb 2024 17:29:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I1yjMJh5QfYw; Tue, 13 Feb 2024 17:29:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E4A44171B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E4A44171B;
	Tue, 13 Feb 2024 17:29:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A3E71BF909
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 079EE4010F
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M8wphulbZ-tI for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:28:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 46B34400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46B34400D8
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46B34400D8
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:28:27 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33ce2d1ab86so227039f8f.2
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 09:28:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845306; x=1708450106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kfDwLoKjM9sVqq3fHZNTVS5t53WgwzvXXRi2OxAT9Ic=;
 b=EsV6esBW+w2ZHdfQUyauG6s3hCEfEmux+JOoh+TW7dTMuSQQF8STRLpiZ8yj5vVS07
 qzWtTWHq5gEnEoyAUoZhfz2a4ExF4sBM6PSkVZl6SmWnWGcD48RyCjElrADp/y9D1PzT
 O00ttbcjDFkdbw3CmBo5h36Ig1jEhtkDfbn4jZ0s55PW6J1BmtRP3ZdoUHpalUM/e3sa
 v5V2w/rqjlgBwqnu0nzvKZlXhFb/geZxyOU+Bo7ar8sgw0nuOj/jYIJ7PeMyRAyQHvRz
 +T/6P5X9FAN5DbH0w2x6HhJuIxezYQnBqHa1mh5zIHnSoVUk7WU93uMmvtQ2Zci4FwZc
 UGYg==
X-Gm-Message-State: AOJu0YxK57smzpv75F1RkrIzazfuccDHkRmIh+RedJVQh4jjhfHpZsYz
 /jP5N0Pwg9iSL/KGTcMUHdrT001OT3b11HZI+S7neDTvlhOZIMxH7NcE8pJfTgfoRwHyV759gsP
 4
X-Google-Smtp-Source: AGHT+IHt1mzyx0VCSuFugUtBvc4dykgxn7iv0PUBo82U3vjb+2QTJyOfZ8rvU6xpf965jGNlQUm2fg==
X-Received: by 2002:a05:6000:1245:b0:336:76de:c171 with SMTP id
 j5-20020a056000124500b0033676dec171mr7522742wrx.62.1707845305872; 
 Tue, 13 Feb 2024 09:28:25 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 by19-20020a056000099300b0033b79440fa9sm7850146wrb.111.2024.02.13.09.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:28:25 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 18:28:07 +0100
Message-ID: <20240213172817.2872849-12-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213172817.2872849-1-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707845306; x=1708450106;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kfDwLoKjM9sVqq3fHZNTVS5t53WgwzvXXRi2OxAT9Ic=;
 b=UNXefpVTVBX6mv9Hs64siHeEIO3OVngScOoo/JIB3HmVgZBtY2TJvJEuE/s2EfgF03
 iddznKMPCI/NXDbkz5nLqHP2/+IqkOhQuCItgLe65hh8SRofumZDtBa6yHxHrRVv/7m2
 FWO8v0JSexas6gS1wnvu1fkD10LvQrGVHkH3sYDW3Ljocg0pVdoqu+hNIwTm5fUh03K1
 LXQNcENv/RrZujEPTVplIC4EGMLno9J0802iaErGXN0TfwQ1G2hYOLhNpDuhOEZX7vso
 XxPUNIYVpclrMq6/XOByR6A7WeW/zHg47VLsvTy7eMzZ3tQFl7+UW+AHDoIMl9NEdX9J
 CN6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=UNXefpVT
Subject: [Buildroot] [PATCH 11/21] boot/ti-k3-r5-loader: install tiboot3.bin
 and sysfw.itb to BINARIES_DIR
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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

So boards using HS (High Secure) K3 SoC variant must update the
tiboot3.bin (and sysfw.itb) in their post-build script.

ti-k3-r5-loader must install any tiboot3*.bin (and sysfw*.itb)
to BINARIES_DIR let the user which one should be used in a
post-build script.

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

[1] https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/doc/board/ti/k3.rst

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 8f86e0fb07..b3c756dc47 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -78,8 +78,17 @@ define TI_K3_R5_LOADER_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
 endef
 
+# sysfw*.itb are only generated for Split binary based Boot Flow (eg: am65, j721e)
 define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
 	cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
+	for f in $(@D)/tiboot3*.bin ; do \
+		$(INSTALL) -D -m 0644 $$f $(BINARIES_DIR)/`basename $$f` || exit 1; \
+	done
+	for f in $(@D)/sysfw*.itb ; do \
+		if test -e $$f ; then \
+			$(INSTALL) -D -m 0644 $$f $(BINARIES_DIR)/`basename $$f` || exit 1; \
+		fi ; \
+	done
 endef
 
 $(eval $(kconfig-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
