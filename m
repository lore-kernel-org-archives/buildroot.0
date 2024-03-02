Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96C5C5478C
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 09:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 307F260897;
	Sat,  2 Mar 2024 09:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KMw7XxKJPHE1; Sat,  2 Mar 2024 09:27:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DF126089F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DF126089F;
	Sat,  2 Mar 2024 09:27:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 880DE1BF30E
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 09:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81B9860897
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 09:27:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ttiPg2EopEWf for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 09:27:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3711A60844
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3711A60844
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3711A60844
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 09:27:39 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33e2774bdc5so392285f8f.2
 for <buildroot@buildroot.org>; Sat, 02 Mar 2024 01:27:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709371656; x=1709976456;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=swz9NihnEvjSCgHcuftikCyVd1IUSZSLfQdjvAVaawI=;
 b=P+/KYkfp3EIpy0Yet4TOuqrWDaTN21WFtW6c2iakKkt+GEhtJcz5TNT1PudyRMsecD
 H4IOoIn6OE6ZfUUfo6o6Fb5P1UWqNHy3XqaDNjHfOmTBxGRb+KOwV84CMt7mr070TJvw
 WVirMVRABf18v1w+NrgVSNbMgFpapBQxAR257LtILe3cxEVuxFz4H4i6n9Oh4uR3hmPN
 tC6YQIqfW7qBb4JyoyAWkRuJOrUGaEPa4dpJ3V/kMm84KCORxjxmKnCnQCxcSZTQjYrU
 r+fwS6E9ZpqdQ+8v1GCO+frXwIi9LtSkUMVMQefV9RcHUn/NX8gf45D5ChTaFZpPrZJT
 Bklg==
X-Gm-Message-State: AOJu0YwXnihMKTApy4aLUgDbcZ/Dp5GFMjFw7gQnD7o6uX/hds6eQXPD
 mBDCMni+vObMAA7rmqL9kJdqaDIILdiR0BGWVb2v36EUWxbkSf8/RVOC1RjM
X-Google-Smtp-Source: AGHT+IGwTXpcBcVIxtm2QZ7nIaZMg8XEnpduSdvVAOyo3ygH948Z/h5yaSFXOSUqsThPVLcGBNXfsw==
X-Received: by 2002:adf:e2d1:0:b0:33e:392:8b94 with SMTP id
 d17-20020adfe2d1000000b0033e03928b94mr3220600wrj.49.1709371655977; 
 Sat, 02 Mar 2024 01:27:35 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ch10-20020a5d5d0a000000b0033e26c81b11sm1744526wrb.92.2024.03.02.01.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Mar 2024 01:27:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Mar 2024 10:27:32 +0100
Message-ID: <20240302092733.24288-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709371656; x=1709976456; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=swz9NihnEvjSCgHcuftikCyVd1IUSZSLfQdjvAVaawI=;
 b=VODEiIUTfr81OYuVGolAdoOTHQFAHEMb5grivG1tYN47dAFpvtjPihkBz02iH/n1x8
 ZeorCUEGkyk7sWoysDuDkmKSlYyXfonUIqalKR0XLNOPnTnUq0pNl+2aDxw9r1yGApjl
 Wp1Ouxj1GxXELcpEp9MaLVJ82+vwgrXlR2hR0BqJyffTbKGxMQvnf2Uv1Yyd9ACjCvpy
 gt7dfUZGi0TXoH7Pl6aba2MoKvR/PLLehV5a1SgzX1zLOjmf99XkpXFgTNCwcml7S1LL
 IhZZz9RIjIZA/0BZDoqeURO3bDil1xQbsl1DrGYwVViXE3fm4bNw4e7E8v3vrNsH5nix
 fePA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VODEiIUT
Subject: [Buildroot] [PATCH v2,1/1] package/parted: needs gcc >= 5
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 3.5 in
commit 57817fe05a4250a260a08201812c6652b306a0e5 and
https://git.savannah.gnu.org/cgit/parted.git/commit/?id=15c49ec04f7eaff014d2e1eddd0aecf4150db63d:

gpt.c:181:5: error: initializer element is not constant
     { PED_PARTITION_APPLE_TV_RECOVERY,  PARTITION_APPLE_TV_RECOVERY_GUID },
     ^
gpt.c:181:5: error: (near initialization for 'flag_uuid_mapping[0].type_uuid')

Fixes: 57817fe05a4250a260a08201812c6652b306a0e5
 - http://autobuild.buildroot.org/results/1f0af75ec55da9052fbfb195a0699f84619eac81
 - http://autobuild.buildroot.org/results/438b5f40e8b393801f36c691d239e298998cb9d2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix typo "| |" -> "||"

 package/libblockdev/Config.in     | 15 +++++++++------
 package/parted/Config.in          |  6 ++++--
 package/python-pyparted/Config.in |  6 ++++--
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index b1d088bf35..81b4819280 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -32,12 +32,13 @@ config BR2_PACKAGE_LIBBLOCKDEV_CRYPTO
 config BR2_PACKAGE_LIBBLOCKDEV_FS
 	bool "filesystem"
 	depends on BR2_ENABLE_LOCALE # parted
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # parted
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_PARTED
 	select BR2_PACKAGE_E2FSPROGS
 
-comment "filesystem plugin needs a toolchain w/ locale"
-	depends on !BR2_ENABLE_LOCALE
+comment "filesystem plugin needs a toolchain w/ locale, gcc >= 5"
+	depends on !BR2_ENABLE_LOCALE || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 config BR2_PACKAGE_LIBBLOCKDEV_LOOP
 	bool "loop"
@@ -45,11 +46,12 @@ config BR2_PACKAGE_LIBBLOCKDEV_LOOP
 config BR2_PACKAGE_LIBBLOCKDEV_LVM2
 	bool "lvm2"
 	depends on BR2_ENABLE_LOCALE # parted
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # parted
 	select BR2_PACKAGE_PARTED
 	select BR2_PACKAGE_LVM2
 
-comment "lvm2 support needs a toolchain w/ locale"
-	depends on !BR2_ENABLE_LOCALE
+comment "lvm2 support needs a toolchain w/ locale, gcc >= 5"
+	depends on !BR2_ENABLE_LOCALE || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 config BR2_PACKAGE_LIBBLOCKDEV_MDRAID
 	bool "mdraid"
@@ -64,11 +66,12 @@ config BR2_PACKAGE_LIBBLOCKDEV_NVME
 config BR2_PACKAGE_LIBBLOCKDEV_PART
 	bool "part"
 	depends on BR2_ENABLE_LOCALE # parted
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # parted
 	select BR2_PACKAGE_PARTED
 	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
 
-comment "part plugin needs a toolchain w/ locale"
-	depends on !BR2_ENABLE_LOCALE
+comment "part plugin needs a toolchain w/ locale, gcc >= 5"
+	depends on !BR2_ENABLE_LOCALE || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 config BR2_PACKAGE_LIBBLOCKDEV_SWAP
 	bool "swap"
diff --git a/package/parted/Config.in b/package/parted/Config.in
index f48b365a2d..ea6c3db2bf 100644
--- a/package/parted/Config.in
+++ b/package/parted/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PARTED
 	bool "parted"
 	depends on BR2_ENABLE_LOCALE
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
@@ -9,5 +10,6 @@ config BR2_PACKAGE_PARTED
 
 	  http://www.gnu.org/software/parted/
 
-comment "parted needs a toolchain w/ locale, wchar"
-	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR
+comment "parted needs a toolchain w/ locale, wchar, gcc >=5"
+	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/python-pyparted/Config.in b/package/python-pyparted/Config.in
index 60f54a5484..430bf204a1 100644
--- a/package/python-pyparted/Config.in
+++ b/package/python-pyparted/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYPARTED
 	bool "python-pyparted"
 	depends on BR2_ENABLE_LOCALE # parted
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # parted
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_PARTED
 	help
@@ -8,5 +9,6 @@ config BR2_PACKAGE_PYTHON_PYPARTED
 
 	  https://github.com/rhinstaller/pyparted
 
-comment "pyparted needs a toolchain w/ locale, wchar"
-	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR
+comment "pyparted needs a toolchain w/ locale, wchar, gcc >= 5"
+	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
