Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CFCC43602
	for <buildroot@archiver.kernel.org>; Tue,  7 Jul 2026 10:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08545406FE;
	Tue,  7 Jul 2026 10:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2iEFDXt8dYkB; Tue,  7 Jul 2026 10:08:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 226914071C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783418931;
	bh=wICmlj++PI0MnJIGJtR4NTDDw77mA5YszckuON8pFwc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mUp46rKt3rxQctqXWYf1DkuO3c2m3T25EL32O9zyu+ehAWlRL7l3kG98EUsLnFI08
	 N4POIkAxycUF5fsM+NRe35IOylFKl2ATrYtv9yphi5EVOJwgjeyCHryA0qIC7HexRw
	 2dAdDDgL7y8pU67kz83PkS48+wByoNAD1Pqn+w6UYRuTc7SzyrvsNI2kvBLkmz/c38
	 3ROwJ2JC6dUHg8eCT6ue9KzcD/5SZv5L3JC38sBaUtKZFKIga6QNGtshfX/oGfCSAc
	 ByvOW3DkWufCG0hl9kYGwq/GBUHQxYj/7ZAw8bRn5pjvhmU9uZHWfW80WeCwqrx+JU
	 r3zFmfzt9x/Mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 226914071C;
	Tue,  7 Jul 2026 10:08:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85CA1315
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 10:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C520400E9
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 10:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BWwIkCIJgX7 for <buildroot@buildroot.org>;
 Tue,  7 Jul 2026 10:08:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33B9F40093
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33B9F40093
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33B9F40093
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 10:08:47 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-493ae59eca6so28696115e9.1
 for <buildroot@buildroot.org>; Tue, 07 Jul 2026 03:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783418926; x=1784023726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SZgGRtUTdxkAj5x5xKd0XcdvoqRNDi95aNVMwJA5Ots=;
 b=VQMQVYja62mXLbWZPMo9hXWKgFg09vUzJrePpOLV+Iq/E+voYQEfCnGdUC3m4/VA0w
 Ur+SLEEgSGvtuOkzDU7QQ/yVQ1avor2I/IDqus4BmJ7FsXfuoUiDXG/OLN701y9WHwRw
 +cioJSHm1kwHqAu3508pO2hF/AORrn/MZgG72NbH+s2KLga6CdRpwSQMyv+TYAPVnu7F
 XF96Nx6mqzQHYd9xfq70pvYNyHrGjnrE9VfaopjY3nBv4llG3bk6BEWa930l9eBijY/C
 HUssJN7PufwXz13xTNubcj/BNM78xIDgXIXYlJYnsq16+iu47GBizmvJd2RjYViaxuPT
 1/Zg==
X-Gm-Message-State: AOJu0YzIIIDlzGIbH4+br11aVSOacHi74dLe5LKnsSnZVfuFb4WKxlCd
 3J9xOQrqYlNJoqyL5GQ84EbWc2fZdk38xNv2gdGGIT2Ur1G98JxQaZJN7xl3mdV8yx2pPWJaKFm
 ThvzE2rA=
X-Gm-Gg: AfdE7ck3bAGu1EpnbCz0BomdvRqPaNNCDqcYZXFde5Qud1ZV7cdGAOHIPuRNssdvIkl
 LjcQV+/nMRHwZDkPE2M17rfWcS4EcbMFYxvfUGPSZ831DM6ZHnDdat/FlLyPTZArERiSYYB8GA3
 5DJYv2lvJX8zcjjQk3/RL3nww9w2/rsmhKVd8vIjqAZaDJDk+1VDBIWDxNgqj2LBtfL7OrJg+4A
 2NgXIGd+rCXXnsgvNOIh8MI93wYAILgcRgaPuy+gXcDjB092IPVY9V/e4YsKlgz2Z3N6MfeUM8e
 UFK12tE4i49AvPBqqIUYXyE7rfCOrtuD76jFGVEanNnCDiO2Fp0/NIIyzPs7CYBjOQHSTknrZSx
 eem5yUJn9r+77x+NJGWDuUKHJGSp50IQohqAno2xGgyMI8s8OpdPIh0TVFXHC1D60+jrTOIjE+A
 8Qlh/ZBOhWgDMIts65NChgMg16LszStuqmFkz6qy7L8oTpD9GtWkjiZJ3TNsd6ObEj8ttFC5iet
 RxkYprntHoShNlHK453neo7Q51++ubu2SEZ7V4GQ6wr
X-Received: by 2002:a05:600c:4f81:b0:493:c55e:9fa1 with SMTP id
 5b1f17b1804b1-493df07d7cbmr49798505e9.39.1783418925940; 
 Tue, 07 Jul 2026 03:08:45 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 ([95.236.93.155]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0fbb410sm45612475e9.12.2026.07.07.03.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 03:08:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue,  7 Jul 2026 12:08:37 +0200
Message-ID: <20260707100837.3332387-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707100837.3332387-1-dario.binacchi@amarulasolutions.com>
References: <20260707100837.3332387-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1783418926; x=1784023726;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SZgGRtUTdxkAj5x5xKd0XcdvoqRNDi95aNVMwJA5Ots=;
 b=XEjcaaNZdiGNQS1gq4h4Q5x2XQAbiHaM5R7uIeOHYXBKXEI/1+Fnju+2cL9aWVqwCh
 XNM2OLXRpbJF8b9Ie2cRG+RwfOBPmYTZNhdMYp1A9KH4eMG/wrQp88A7ADdaaxdEHjYl
 mlZpgtBYTb/SmOUCetSB4wul1VCbyfIP4ElfI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=XEjcaaNZ
Subject: [Buildroot] [PATCH 3/3] boot/uboot: bump to version 2026.07
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
https://lists.denx.de/pipermail/u-boot/2026-July/624082.html

Changelog:
https://github.com/u-boot/u-boot/compare/v2026.04...v2026.07

Select BR2_PACKAGE_HOST_GNUTLS_P11_KIT when U-Boot requires GnuTLS,
since U-Boot 2026.07 adds PKCS#11 support to tools/mkeficapsule.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/uboot/Config.in  | 7 ++++---
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 2d2c3f9d4154..69d4e97e7af9 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -41,7 +41,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2026.04"
+	bool "2026.07"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -85,7 +85,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2026.04"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2026.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
@@ -228,6 +228,7 @@ config BR2_TARGET_UBOOT_NEEDS_LZOP
 
 config BR2_TARGET_UBOOT_NEEDS_GNUTLS
 	bool "U-Boot needs gnutls"
+	select BR2_PACKAGE_HOST_GNUTLS_P11_KIT
 	help
 	  Select this option if your U-Boot board configuration
 	  requires gnutls to be available on the host. This is
@@ -368,7 +369,7 @@ config BR2_TARGET_UBOOT_USE_BINMAN
 	help
 	  Use binman tool for generation and signing of boot images.
 
-	  https://docs.u-boot.org/en/v2026.04/develop/package/binman.html
+	  https://docs.u-boot.org/en/v2026.07/develop/package/binman.html
 
 menu "U-Boot binary format"
 
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 691649825605..e992835582db 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
