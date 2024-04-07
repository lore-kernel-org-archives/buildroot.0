Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E5DCD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 10:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F84F4189B;
	Sun,  7 Apr 2024 10:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kfyfg5_Qkmb6; Sun,  7 Apr 2024 10:35:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CA89417C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CA89417C9;
	Sun,  7 Apr 2024 10:35:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A8A461BF94D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96563822AF
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRmjW2CxJ8jW for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 10:35:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C251822A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C251822A9
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C251822A9
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 10:35:20 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-344047ac7e4so595928f8f.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 03:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712486118; x=1713090918;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8O5k9R+V9W4l6wDTdNo3pQXas1k84HgBXRpOJcSgdjE=;
 b=RnPHVlzvOy/nkFla90eFctoezWWMxo8MRp/PMFLj//XqRyQf99nItzr7IKwhPqEq+v
 OpPzDYBr+4Tu+wDyJADgNjJqxWFnudK3YAZA0gBtznb96cCv0gbjLN49v49Cyx0T3F0j
 hLScA3Np7zded0Ez/hXUewN76YHxizymJ2YZAdwTcJPkDNGFUKeGVPp9qkRs5x5aHV3l
 P8SOBguwk8ySu5ffD5LGxz+xfiM3yHkVSBIlvMlhWGtO2JMjzxcmVli171dr4CDy02vc
 IgeunKcu4EIfzJtRY3Gq6RB0Gn2Abki4EpUOjDfvSuLu+CFk4iXfVT6T9ZZZP/TDru4y
 16Ag==
X-Gm-Message-State: AOJu0Yw8eta5gmCp7kZf/IJQ8vtwRnpvYVr4aTkZQH5KWBybIY4/6zT0
 Ws2kSq8V7MbXUUvJF4QfyXdk+sexqW12Ok3l4DpqMYwwT19GgBG78lyM/bLFReBQoAvz2F4PPfu
 d
X-Google-Smtp-Source: AGHT+IHqk7vtFSN+rjmZXEwnqvmcR5KICkghrFZYZKnCerFKkZzBwL6YOK9TmQwmTWyVXrwgbyxlyQ==
X-Received: by 2002:a5d:660b:0:b0:343:cee1:cbc1 with SMTP id
 n11-20020a5d660b000000b00343cee1cbc1mr6245638wru.14.1712486118230; 
 Sun, 07 Apr 2024 03:35:18 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 je4-20020a05600c1f8400b004149536479esm9486542wmb.12.2024.04.07.03.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 03:35:18 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 12:34:58 +0200
Message-ID: <20240407103512.1112712-6-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240407103512.1112712-1-romain.naour@smile.fr>
References: <20240407103512.1112712-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712486118; x=1713090918;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8O5k9R+V9W4l6wDTdNo3pQXas1k84HgBXRpOJcSgdjE=;
 b=GyFxGZv2z96Qf97mFtjsHEU0w2xw6tNMjEOncUzBAFqYs+JwcFassHTDt3UnsKPGc4
 cdUxZgkS7nNvCUmqcN2vTgjhF67aOJ4xPDXEB1Z48FmVZS6SoheYa+AsYxVEx9XXKcI2
 kDRn40TosmU26IL5yZc+kVp6bkovwD991KLW0s0FLJNoLw3X1amV2NPArRK+7uBfjRy/
 ex0CQRq+QtJMgs5uI5gNR29zLGVrvnjtQFNAFt9jhUEhqmfmfHiI0KCARDHyfEYAZbZM
 jIrQ7DYLh36cMECY7Tmmi7wqr+ad2bCs1WpSpgTG3bOZY3/HEgIKKuMF69Vne4dQpD4N
 X4FA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=GyFxGZv2
Subject: [Buildroot] [PATCH v12 05/16] boot/uboot: add
 BR2_TARGET_UBOOT_USE_BINMAN option
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

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts.

This tool uses additional host python modules that must be provided by
Buildroot. So introduce a new option BR2_TARGET_UBOOT_USE_BINMAN to
add additional host packages in U-Boot build dependency to use binman.

The binman requirement is directly included in buildman dependency
(tools/buildman/requirements.txt) since within U-Boot, binman is
invoked by the build system, here buildman [1].

[1] https://docs.u-boot.org/en/v2024.01/develop/package/binman.html#invoking-binman-within-u-boot

Co-developed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Changes in v12:
- remove BR2_PACKAGE_TI_K3 part since this option has been removed from this series
- remove TI K3 specific part from the commit log

Changes in v11:
- Add ti-k3-boot-firmware depedendency when both BR2_TARGET_UBOOT_USE_BINMAN
  and BR2_PACKAGE_TI_K3 are set
- drop BR2_TARGET_UBOOT_NEEDS_TI_K3_DM related changes

Changes in v7:
- Replace ifneq ($(BR2_TARGET_UBOOT_USE_BINMAN),y) with
  ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),).
- Update the commit message

Changes in v6:
- BR2_TARGET_UBOOT_USE_BINMAN
- Binman tool is not specific to TI K3 platform, so add an option to specify
  the use of Binman in U-Boot.
- Add runtime dependencies
- Update commit message
- Add SOB and COB tags of Romain Naour

Changes in v5:
- Drop "DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f"
  from UBOOT_MAKE_OPTS.

no changes since v1:
---
 boot/uboot/Config.in | 11 +++++++++++
 boot/uboot/uboot.mk  |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index e310c09217..39e49d681b 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -295,6 +295,17 @@ config BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN
 	  This option makes sure that the needed binary blobs are copied
 	  into the U-Boot source directory.
 
+config BR2_TARGET_UBOOT_USE_BINMAN
+	bool "U-Boot use binman"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py -> python-jsonschema
+	select BR2_TARGET_UBOOT_NEEDS_PYTHON3
+	select BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS
+	select BR2_TARGET_UBOOT_NEEDS_PYLIBFDT
+	help
+	  Use binman tool for generation and signing of boot images.
+
+	  https://docs.u-boot.org/en/v2024.01/develop/package/binman.html
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 47fb419e92..398485195e 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -279,6 +279,14 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_XXD),y)
 UBOOT_DEPENDENCIES += host-vim
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
+# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt
+UBOOT_DEPENDENCIES += \
+	host-python-jsonschema \
+	host-python-pyyaml
+UBOOT_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
+endif
+
 # prior to u-boot 2013.10 the license info was in COPYING. Copy it so
 # legal-info finds it
 define UBOOT_COPY_OLD_LICENSE_FILE
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
