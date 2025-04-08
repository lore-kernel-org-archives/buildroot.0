Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB553C3600C
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 07:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 257CB410A8;
	Tue,  8 Apr 2025 07:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3y7c6qOwYul; Tue,  8 Apr 2025 07:25:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FAD140D1D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FAD140D1D;
	Tue,  8 Apr 2025 07:25:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 05DB91F1
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 07:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC38A4194A
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 07:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ict6M3_Vb95z for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 07:25:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AFD9B40A20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFD9B40A20
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFD9B40A20
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 07:25:07 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39c0e0bc733so4485528f8f.1
 for <buildroot@buildroot.org>; Tue, 08 Apr 2025 00:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744097105; x=1744701905;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fQ1vFfZBBtiM2hvDevdp5xkUEA902oJj2O6hw5Et9LY=;
 b=NuN7EMV6LwsyOQkxHvuZqcgmv5SM1nr94AYM2OBxUDCYzjsozJRXzYs3P/hJcCby6b
 Ju7FZgz2tZUaNNl0iPrTlc1CjYEI0xv94lMvgaVUhK42uDURPv3f/zrgOEsVCZOsacoQ
 s1Nb23jq8FlUDAgRiPvZvdH0gplbjMcsS1JhA9ZC1d8hIqpMwomx8hDlGKfNebIXiM0K
 E9vC9XJzwiQKMFkFj7H6pmTDYnYQjOvouEs3za4f4GCQcK7yD2M+abCLpmSdhd+1AE3c
 8cdOt3bcNCDM9v1bQBJ0ONx1XlqvHUjgDMe46IxUKrz5B1oLM6+/eqYwaOnTsgtbWFmD
 mTSg==
X-Gm-Message-State: AOJu0YxTYBR3PvlGEsbkY0KKWpsO3RWKCcVnWMDESnElbOnNXr0E3vtF
 iAPeGDpN6kOEzIWugu4iDK+JUz3j88J/K0BvkpMeYAL3xE+cMPaynAZ+QoLOOxKqUey9JQlv3ku
 m
X-Gm-Gg: ASbGncsHz8TQQqOaLFv4y2SlqULjorP2HqaJlkPRlEfsiDUtMVodyXSVVgvAq4dqcco
 zpG9Dh17+OPkVfY3UlS4uTQbhpl3AQegVRyymFm7TJW1Ioz2fbzreGRZYW+8aJRJLfhzMbJPY7u
 phxisHfzdTEMC0Ci6d1xRUUFzYIi86NiPNC7BRSBB/19ITcPKfKpId27TKiI2rvsTWnGdiG6raf
 UXXBXC00cbHDWDns3lvBiLkOWglcfbwNEQFOqJGPbYqXZdFMg2IJ4odf3/cDzFg9H3DD2H2i+iq
 QZOeiwKqw0owXU1SSyGIPt+DBlPjn53V9sReaicnFXHyR7JyyLWRq2xtn0lOE01enWP974XvQaQ
 M2xYbM0qvCw==
X-Google-Smtp-Source: AGHT+IFd9co033c3Q6jBT/859TL4okNW31abfV2MF1pTiM4QbMsyo3P2mRi0Zlp6AfuSRa4VAp9ujw==
X-Received: by 2002:a5d:64cc:0:b0:391:255a:748b with SMTP id
 ffacd0b85a97d-39cba982631mr12177800f8f.39.1744097105326; 
 Tue, 08 Apr 2025 00:25:05 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.170])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c3020d980sm14262235f8f.61.2025.04.08.00.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 00:25:04 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue,  8 Apr 2025 09:25:00 +0200
Message-ID: <20250408072500.1771475-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1744097105; x=1744701905;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fQ1vFfZBBtiM2hvDevdp5xkUEA902oJj2O6hw5Et9LY=;
 b=Ht+yaxfUHgjQeeNfkEZPAxexWgSDgJLA84LzwsAjGLteBW0zKn9DnVwcmPAxNNMdAp
 f38aLZDaRJmLnVDfZxlPy0k8UDZ3pjHFaukbVr2himrgvdFDqpZddp/YlbJj4YsLLnSo
 coYis5RXpMNOMLhWx4EjZQ/KlKEyztCdFyX+E=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Ht+yaxfU
Subject: [Buildroot] [PATCH 1/1] boot/uboot: bump to version 2025.04
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

Release announcement:
https://lists.denx.de/pipermail/u-boot/2025-April/586033.html

Changelog:
https://github.com/u-boot/u-boot/compare/v2025.01...v2025.04

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/uboot/Config.in  | 6 +++---
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 6739d53cb8fe..a2301b774742 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -41,7 +41,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2025.01"
+	bool "2025.04"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -85,7 +85,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2025.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2025.04"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
@@ -340,7 +340,7 @@ config BR2_TARGET_UBOOT_USE_BINMAN
 	help
 	  Use binman tool for generation and signing of boot images.
 
-	  https://docs.u-boot.org/en/v2025.01/develop/package/binman.html
+	  https://docs.u-boot.org/en/v2025.04/develop/package/binman.html
 
 menu "U-Boot binary format"
 
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index b619a70423c4..8954e2cf34b0 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
+sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
