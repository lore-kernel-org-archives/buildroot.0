Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95DECA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 14:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 628BD615E8;
	Fri, 29 Aug 2025 14:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 40mh_Nwb-BOI; Fri, 29 Aug 2025 14:43:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EA186148A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EA186148A;
	Fri, 29 Aug 2025 14:43:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2371569
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 150164180C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EXG4c3U3d3ap for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 14:42:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CAF62416B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAF62416B6
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CAF62416B6
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:42:57 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-3cd59c5a953so1403013f8f.0
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756478576; x=1757083376;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RRnm6tUjrL18MP5v+zr2prkFyysvxOfvbncijRxJR0M=;
 b=xN1w2Lp5SQDI1YiQtd4YIL0c9GkgwsYm6jPUQS3BjUnmOB0RQltZD4BjQQihMHcWED
 B7UaQ6u67wdlbybpM53PUaB9oLZWS2FpgYZUvWel0h2f+GOaezdFlLIebrQ81+Hvl1k8
 /YT+nRY/AaHZPV2q8eyuugbIYDOfMotmnb87Z64AdYDQLaOk9iyn5i94HrV/kdWVddcp
 Qi4p8qU+AR/QHcbOi4N78Remc/5Ja+UEKcI9IIsFguxdVOagxHuTEQPjEo7P0Fa4CCWS
 0IGfLp5NI4h4gbbyCqVppJjYPMAoudQ9CtXNYIuS1CgluUAnPPTkAcDygv9ohgEJ9LfV
 BCOA==
X-Gm-Message-State: AOJu0YzbsjR8hoz7EWgodCup1FmRi2Wl7Rr1+LL+Bqqa2imT38wRwAgZ
 n+zbQ8X0gsf028LoMxyoy5Wo22XYCPedCUMyhA/DgEQP4Qi2559/C+fX0TdS6so+aw0wqbCCv6F
 F0/LN4Z/66i3N9hY=
X-Gm-Gg: ASbGncufCI/jkUwV0+gd7hEivRfjHGdd6zsb+s1DogiWWKMC6ryx7RHc0cxzEkz8YZb
 nf3Ai2ZleDIxIFHb13LHhm/a1wCHiqp/wwwClWlBd8iSHm31QzndEjTn01pZfQ8U11qkyRqN365
 YkP92t7WXG3QAej1fhSUn7sjGTcHlfGCXMryhcwy6xnUBbRpvcNLptpRY+Uj9jZ9qNZiOHBOc5U
 n07cLtpaG/TOCnGYFSgeY3fus5AwmSzWmpkK5Yag4d9xly4gLAXpdcG4sDpIPa7VVhVrqqUMW7Q
 ihUOBIPZluaRIIE3O7Gtn3jG3bW6C5JzCR2qwS2sVQvACJ9TjAF9w+ZCL4qX/WJaTcn3lObrYPr
 cOuQLiga3+8ATypkfBc3G+jT6vO1FfZt0iSemKodOZ16phbSgugMJ420X5WOmgBsdas8AgkxvIr
 v5WGPw9Q==
X-Google-Smtp-Source: AGHT+IHbyZRiAGkxw0vuY8kd9b4+dB2Dt0VnEFJ/iOdFR02tJ5WfXiU/hKaMuRe76uEP6duRfYst4Q==
X-Received: by 2002:a05:6000:290f:b0:3d0:b3cc:c1ff with SMTP id
 ffacd0b85a97d-3d0b3ccc6bdmr2031693f8f.39.1756478575660; 
 Fri, 29 Aug 2025 07:42:55 -0700 (PDT)
Received: from dragon.local.ess-mail.com (31-207-9-44.static.ef-service.nl.
 [31.207.9.44]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7d97b5bbsm27087265e9.1.2025.08.29.07.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 07:42:55 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Date: Fri, 29 Aug 2025 16:42:44 +0200
Message-ID: <20250829144244.154577-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756478576; x=1757083376; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RRnm6tUjrL18MP5v+zr2prkFyysvxOfvbncijRxJR0M=;
 b=Z/APKXLL0UqGYqdeUKWdYo6LJQBDtDOBurryZPeZC8vAL6ht/6Aiu0rnjwwlXnUyi/
 jOxjRHEc2iAJqZqYii3jEY7A6KLRXLKEg1sQbUBCg/RXOQIBAeyjPaCsxPPl76huoRtV
 5469JFo+f868M+RaeolWruwXg1VHZe++azz/ZnHLmHRwqPsQFGIo0+e/riDjCmkVUgT6
 my2NcQBdDwwxQW1PKZmXFFTPqMhvinlLVfL2CaYDnDQw5iv5/HDfgb0YeCeLmKCvVCXP
 WyB3EIwhVFblkuY8a4HtQ9+1X9U0VE/itBXb8Oj7Z2ybNr6/CzB75V20xI7xDUhpjyOZ
 DXjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Z/APKXLL
Subject: [Buildroot] [PATCH] package/fbtft: remove package
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The fbtft linux extension was only needed for very old kernels (<4.0)
that are no longer available in Buildroot.

Let's therefore remove it.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Config.in.legacy                              |  7 ++++++
 ...ding-packages-linux-kernel-spec-infra.adoc |  3 +--
 linux/Config.ext.in                           | 21 ------------------
 linux/linux-ext-fbtft.mk                      | 22 -------------------
 package/Config.in                             |  1 -
 package/fbtft/Config.in                       | 13 -----------
 package/fbtft/fbtft.hash                      |  3 ---
 package/fbtft/fbtft.mk                        | 12 ----------
 utils/checksymbolslib/test_makefile.py        |  3 ---
 9 files changed, 8 insertions(+), 77 deletions(-)
 delete mode 100644 linux/linux-ext-fbtft.mk
 delete mode 100644 package/fbtft/Config.in
 delete mode 100644 package/fbtft/fbtft.hash
 delete mode 100644 package/fbtft/fbtft.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index f761c9063a..056cb68b40 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_LINUX_KERNEL_EXT_FBTFT
+	bool "FB TFT drivers are deprecated"
+	select BR2_LEGACY
+	help
+	  FB TFT drivers were only needed for linux kernels until v3.19,
+	  since v4.0 the drivers are included in the staging area.
+
 config BR2_PACKAGE_THTTPD
 	bool "thttpd has been removed"
 	select BR2_LEGACY
diff --git a/docs/manual/adding-packages-linux-kernel-spec-infra.adoc b/docs/manual/adding-packages-linux-kernel-spec-infra.adoc
index 9fd3b566a5..22ffc5496f 100644
--- a/docs/manual/adding-packages-linux-kernel-spec-infra.adoc
+++ b/docs/manual/adding-packages-linux-kernel-spec-infra.adoc
@@ -99,8 +99,7 @@ tree. The Buildroot's Linux kernel extensions infrastructure provides
 a simple solution to automatically do this, just after the kernel
 sources are extracted and before the kernel patches are
 applied. Examples of extensions packaged using this mechanism are the
-real-time extensions Xenomai and RTAI, as well as the set of
-out-of-tree LCD screens drivers +fbtft+.
+real-time extensions Xenomai and RTAI.
 
 Let's look at an example on how to add a new Linux extension +foo+.
 
diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 3cbf42d344..b392a48ffe 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -65,27 +65,6 @@ config BR2_LINUX_KERNEL_EXT_EV3DEV_LINUX_DRIVERS
 
 	  https://github.com/ev3dev/lego-linux-drivers
 
-#-------------------------------------------------------------------------------
-# fbtft
-config BR2_LINUX_KERNEL_EXT_FBTFT
-	bool "FB TFT drivers"
-	select BR2_PACKAGE_FBTFT
-	help
-	  Linux Framebuffer drivers for small TFT LCD display modules,
-	  e.g. Adafruit PiTFT displays for Raspberry Pi (this extra
-	  package is only needed for linux kernels until v3.19, since
-	  v4.0 the drivers are included in the staging area).
-
-	  To enable fbtft, e.g. for Adafruit 2.8 PiTFT, enable the
-	  following kernel configurations:
-	  - CONFIG_SPI
-	  - CONFIG_GPIOLIB
-	  - CONFIG_FB
-	  - CONFIG_FB_TFT
-	  - CONFIG_FB_TFT_ILI9341
-
-	  https://github.com/notro/fbtft
-
 # aufs-standalone
 config BR2_LINUX_KERNEL_EXT_AUFS
 	bool "Aufs Filesystem Module patch"
diff --git a/linux/linux-ext-fbtft.mk b/linux/linux-ext-fbtft.mk
deleted file mode 100644
index cbc9c58ed3..0000000000
--- a/linux/linux-ext-fbtft.mk
+++ /dev/null
@@ -1,22 +0,0 @@
-################################################################################
-#
-# Patch the linux kernel with fbtft extension
-#
-################################################################################
-
-LINUX_EXTENSIONS += fbtft
-
-# for linux >= 3.15 install to drivers/video/fbdev/fbtft
-# for linux < 3.15 install to drivers/video/fbtft
-define FBTFT_PREPARE_KERNEL
-	if [ -e $(LINUX_DIR)/drivers/video/fbdev ]; then \
-		dest=drivers/video/fbdev ; \
-	else \
-		dest=drivers/video ; \
-	fi ; \
-	mkdir -p $(LINUX_DIR)/$${dest}/fbtft; \
-	cp -dpfr $(FBTFT_DIR)/* $(LINUX_DIR)/$${dest}/fbtft/ ; \
-	echo "source \"$${dest}/fbtft/Kconfig\"" \
-		>> $(LINUX_DIR)/$${dest}/Kconfig ; \
-	echo 'obj-y += fbtft/' >> $(LINUX_DIR)/$${dest}/Makefile
-endef
diff --git a/package/Config.in b/package/Config.in
index c22978408c..61910321f1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -515,7 +515,6 @@ endmenu
 	source "package/ev3dev-linux-drivers/Config.in"
 	source "package/evemu/Config.in"
 	source "package/evtest/Config.in"
-	source "package/fbtft/Config.in"
 	source "package/flashrom/Config.in"
 	source "package/fmtools/Config.in"
 	source "package/freeipmi/Config.in"
diff --git a/package/fbtft/Config.in b/package/fbtft/Config.in
deleted file mode 100644
index 0a4de19091..0000000000
--- a/package/fbtft/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-# Prompt-less option, because this package is not doing anything
-# except downloading the FB TFT sources. The real work is done by a
-# Linux extension.
-config BR2_PACKAGE_FBTFT
-	bool
-	depends on BR2_LINUX_KERNEL
-	help
-	  Linux Framebuffer drivers for small TFT LCD display modules,
-	  e.g. Adafruit PiTFT displays for Raspberry Pi.
-
-	  This is only the download helper for the kernel patch.
-
-	  https://github.com/notro/fbtft
diff --git a/package/fbtft/fbtft.hash b/package/fbtft/fbtft.hash
deleted file mode 100644
index 5d08d0ef85..0000000000
--- a/package/fbtft/fbtft.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally computed
-sha256  0e81de89fdd7ab810716fc0549e767527f342e829309dee5c2cca1e9d1728770  fbtft-274035404701245e7491c0c6471c5b72ade4d491.tar.gz
-sha256  a9ca80d65a5ef10fe614a6c1e8c8d4d3b96637e8855a96c7cf0fa438526097a7  fbtft-core.c
diff --git a/package/fbtft/fbtft.mk b/package/fbtft/fbtft.mk
deleted file mode 100644
index cc11d867fc..0000000000
--- a/package/fbtft/fbtft.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# fbtft
-#
-################################################################################
-
-FBTFT_VERSION = 274035404701245e7491c0c6471c5b72ade4d491
-FBTFT_SITE = $(call github,notro,fbtft,$(FBTFT_VERSION))
-FBTFT_LICENSE = GPL-2.0
-FBTFT_LICENSE_FILES = fbtft-core.c
-
-$(eval $(generic-package))
diff --git a/utils/checksymbolslib/test_makefile.py b/utils/checksymbolslib/test_makefile.py
index 1dc6564b2f..9d24484124 100644
--- a/utils/checksymbolslib/test_makefile.py
+++ b/utils/checksymbolslib/test_makefile.py
@@ -250,9 +250,6 @@ check_filename = [
     ('fs/cramfs/cramfs.mk',
      'fs/cramfs/cramfs.mk',
      True),
-    ('linux/linux-ext-fbtft.mk',
-     'linux/linux-ext-fbtft.mk',
-     True),
     ('package/ace/ace.mk',
      'package/ace/ace.mk',
      True),
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
