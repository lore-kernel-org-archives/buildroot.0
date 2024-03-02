Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4974DC5478C
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 09:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C989760737;
	Sat,  2 Mar 2024 09:19:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z5E2kdNIDLWI; Sat,  2 Mar 2024 09:19:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B34DF60819
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B34DF60819;
	Sat,  2 Mar 2024 09:19:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 736A01BF30E
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 09:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D774407AD
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 09:19:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rBcG8FGgscWN for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 09:19:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D70A840732
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D70A840732
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D70A840732
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 09:19:33 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33e151a1434so823312f8f.2
 for <buildroot@buildroot.org>; Sat, 02 Mar 2024 01:19:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709371171; x=1709975971;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aC7dBegaQ7aPXcyem9DHMbCM59Rw1X3vgnXMijkkSIA=;
 b=sbAyUfPKKegAcxdw97+onwHf50XTc0zKixdUVN6DeSReJ8QSwgVNV1GIlOmpNl336J
 +kz/DR88oBR0DQxDWrq0ROnbTTAQsQMaHBD4Skmt5dSLnzbLSw0qSEWsvYp385jghm2R
 TLMkAhCLPHx2/qnp1e/US47W9NBUGMG6XV8DsXNCe5LXTlyKU3HDUkD/+mMpHXYEItyp
 mijJwMVE3lrjHSfiE+zdJjIUxowW+GDUo34U420BsyrtsjR8i0ER3ZxsCFEMbOk+fw6l
 ZU7ZrX08YNbzw5dBDBSZbCZTXD/Nj/NG1Fb91gmso/ezKG7nHGf7QMZdjyOiKukH5SLe
 mYWA==
X-Gm-Message-State: AOJu0YwNwe4bmaEnbiLFq1rycRvNMia/XHAf+LxqiRtuOab4SdiaTaf4
 P6pvNogP3HGxbjughYHWqCDP5U2cFqcclG6Q8xmdububdvb9Y0R3XFehM8eK
X-Google-Smtp-Source: AGHT+IHyTom7PTDFzRNNpnIh8bTBpZhOpWJjT7ND+Zn34UCG9iXX+ZHRDNKRdNKUy3qhmq4Iti2orw==
X-Received: by 2002:adf:cd8e:0:b0:33d:174b:6a3c with SMTP id
 q14-20020adfcd8e000000b0033d174b6a3cmr2654656wrj.59.1709371171316; 
 Sat, 02 Mar 2024 01:19:31 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ba27-20020a0560001c1b00b0033e284b2f1asm1474122wrb.38.2024.03.02.01.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Mar 2024 01:19:30 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Mar 2024 10:19:27 +0100
Message-ID: <20240302091927.18906-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709371171; x=1709975971; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aC7dBegaQ7aPXcyem9DHMbCM59Rw1X3vgnXMijkkSIA=;
 b=dPksZpDMkeVfgE0INOX8pT8tY63BEVEuMOmQ9NS+zW+1UcSHofSxWZubQHXocgaUKl
 PTTtAzKqEz0wFk0GVkoPw7zDbEqBhiJdK+57axLjGYhJKK2QDLJdIx7VcTKJzbIvODhu
 s45CFs+HCxYyQlCzpSQus0gA70ZPQ1KfXd+yCAZtzc9txQuVq4mOvpR6szaX95iOr1cK
 7rBItHSIOYM2nTR2WJ1gKT6bct612faDsSuFCImVgKHrPWEBiBqNZOxdzubSRgtRvFFY
 Hx2chnDvVutR/ZyT87Y3oSGj0djyWCTo5SAovBfA4EM/bkf3KLnfv/w/my+AH9MKZuqZ
 Ehcg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dPksZpDM
Subject: [Buildroot] [PATCH 1/1] package/parted: needs gcc >= 5
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
 package/libblockdev/Config.in     | 15 +++++++++------
 package/parted/Config.in          |  6 ++++--
 package/python-pyparted/Config.in |  6 ++++--
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index b1d088bf35..017b84b57d 100644
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
+	depends on !BR2_ENABLE_LOCALE| | !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
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
