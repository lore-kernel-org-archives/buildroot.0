Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360AFD3B7C2
	for <buildroot@archiver.kernel.org>; Mon, 25 Nov 2024 00:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5776961546;
	Mon, 25 Nov 2024 00:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZmeZE15JbvfB; Mon, 25 Nov 2024 00:02:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D8BD60BD4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D8BD60BD4;
	Mon, 25 Nov 2024 00:02:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FE114961
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 00:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D840403AF
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 00:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WhR3u9fp7Nuf for <buildroot@buildroot.org>;
 Mon, 25 Nov 2024 00:02:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=abelino.romo@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 69F8C40347
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69F8C40347
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69F8C40347
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 00:02:34 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-724f0f6300aso1788893b3a.2
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 16:02:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732492953; x=1733097753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=868C1r8RFzkhxuNj7Qk5HVwQUBkYAr2kSszojBsmzss=;
 b=oHFOOal+yfDBt0Yvx0+DqXLbEbimH15hZWLeeBCixENty+ndYQhzILJbUJIzF7vark
 tuE6+XwmW7GbYX2tHBM9ACswAXQcI3F7B3G9j7ONmL/DHRG2dyfPrBRjPDX39MVqDFRQ
 +EgZW0TAJL/66FGisuopsxPfMe7MRpho1WRRy+xuYlTyQ19Z6ZS2wAbG5W5i3odfc3Py
 NfG2RBD9bM6G6xUPVL/UWK8svbeCsBe8IezrpL72iDyq2/gzolavHsemUJY8uZb8RLw1
 Axk9GJnFRFvPsxZAYsuVsEBBeuqEecab4oGWgVEhZMxcOBBL4y/Q3NPeFmZMSDjO/itR
 kxxg==
X-Gm-Message-State: AOJu0Yw5KzHIBR9NaI9b+ASt1x+yRbazAjCJvLh7vZ8Q0etgr5ulfFap
 PIqZ9hy3ap42iEmsLYfLdCxnRj2kgv2WoIJ25gfGIGqwJtpLJ/Wy2t1PYg==
X-Gm-Gg: ASbGncsDQjWlpgq6BjeIyY4QuglMtLsJKuHO9rR7+lVj6uR0cY1XXhxB4yK28yAWsT8
 Rk7PgtHZCQeXTZBk4a4n+JUrqNTp/h2/BbPSuIpdEC6EbGp4STxPUJMnHABY97tDf45FLq8Uw7z
 +5QWCaBOzHxB4nqn439CrZ/OfdXCTcY3tUQIv4NbjD4AAwRjCblZKGxo3jD7lPeYHgCrxVDhtcj
 zWrNx54baVu8VDkoBI12MlLPC08EY8lEtlheIuwLtGEKD6X7T4BusXqKcDS8LaL0Rh8zn+HjeMn
 f4hUTdm5ST/W10Dute6SwgpoQ4PFFQ8=
X-Google-Smtp-Source: AGHT+IGBu4p8BJjiRVD1DiHCgvdBfrGHoElSTSSXaJ0zWk4sTcHoaszJUV16oWcrZdnDY3jwwFX92g==
X-Received: by 2002:a17:902:d48a:b0:20c:79bf:6793 with SMTP id
 d9443c01a7336-2129f66ee66mr159099965ad.3.1732492953331; 
 Sun, 24 Nov 2024 16:02:33 -0800 (PST)
Received: from localhost.localdomain (47-144-216-38.lsan.ca.frontiernet.net.
 [47.144.216.38]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2129dba2eb4sm52072915ad.75.2024.11.24.16.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Nov 2024 16:02:32 -0800 (PST)
From: abelino <abelino.romo@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 abelino <abelino.romo@gmail.com>
Date: Sun, 24 Nov 2024 16:02:17 -0800
Message-ID: <20241125000233.2772592-2-abelino.romo@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125000233.2772592-1-abelino.romo@gmail.com>
References: <20241125000233.2772592-1-abelino.romo@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732492953; x=1733097753; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=868C1r8RFzkhxuNj7Qk5HVwQUBkYAr2kSszojBsmzss=;
 b=ASxC/KndojcAvYwiqxoQqi5fRkVin9s1swn7sL1xjYgpXPHZJSwYKU+zhKf2Bc3hM7
 JSe68ptj96Hbu5WO7Nw13AREmGadSDaTQMRuuJAhCNmyEIccczkdC1oaDyLuWvxi4gER
 GQ2X6dewIjyqMNmOtVOb0Vnpp5cJqZHgyZfAp1j69qRqgVvMKnX3PVOizI3x6J/RPsiE
 jiwLwuq2dRGSUuX3Vp0WlO+hQGTAkmSumTfAfWTQNDMG8sN7LQMNUmxZHjPFxCvX5+UO
 sxJTW1oo4liPUBXoxijYCVZPiqlKcXgnBn0HJ/kUB55Dh+Tw0WKOYr9T0WaUulpAYgQM
 33Dw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ASxC/Knd
Subject: [Buildroot] [PATCH 1/2] package/tpm2-tss: bump version to 4.1.3
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

On v3.2.2, testing with an Infineon SLB9673 resulted in the following
error when attempting to read from a previously written NV index.
Upgrading to the latest release, v4.1.3, resolves the issue:

```shell
~# tpm2_nvread 0x1900001
WARN: Reading full size of the NV index
ERROR:esys:../tpm2-tss-3.2.2/src/tss2-esys/esys_iutil.c:1096:esys_GetResourceObject() Error: Esys handle does not exist (70018).
ERROR: Esys_SequenceComplete(0x70018) - esapi:The ESYS_TR resource object is bad
ERROR: Failed to get shandle
ERROR: Failed to read NVRAM area at index 0x1900001
ERROR: Unable to run tpm2_nvread
```

Between v3.2.2 and v4.1.3, the most notable update is v4.1.0 [1], which
includes a fix for CVE-2024-29040, along with 40+ bug fixes and 10+ new
features. Bumping to v4.1.3 adds access to these improvements and
addresses the NV index read issue.

[1] https://github.com/tpm2-software/tpm2-tss/releases/tag/4.1.0

Signed-off-by: abelino <abelino.romo@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...01-Temporary-fix-for-build-without-C.patch | 44 -------------------
 package/tpm2-tss/Config.in                    |  2 +
 package/tpm2-tss/tpm2-tss.hash                |  2 +-
 package/tpm2-tss/tpm2-tss.mk                  |  9 ++--
 5 files changed, 6 insertions(+), 52 deletions(-)
 delete mode 100644 package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index b793026881..906a733b7b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1237,7 +1237,6 @@ package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch lib_pat
 package/tinydtls/0001-sha2-sha2.c-fix-build-on-big-endian.patch lib_patch.Upstream
 package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch lib_patch.Upstream
 package/tpm2-abrmd/S80tpm2-abrmd Shellcheck lib_sysv.Indent lib_sysv.Variables
-package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch lib_patch.Upstream
 package/transmission/S92transmission Shellcheck lib_sysv.ConsecutiveEmptyLines lib_sysv.Indent lib_sysv.Variables
 package/triggerhappy/S10triggerhappy Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/trinity/0001-Fix-build-with-GCC-10.patch lib_patch.Upstream
diff --git a/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch b/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch
deleted file mode 100644
index 812c753ffb..0000000000
--- a/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 7dc753ad27a8cd14c9b00be94ca89b847cf05ce9 Mon Sep 17 00:00:00 2001
-From: Carlos Santos <unixmania@gmail.com>
-Date: Mon, 23 Dec 2019 08:02:19 -0300
-Subject: [PATCH] Temporary fix for build without C++
-
-C++ is required only for the fuzzing tests but AC_PROG_CXX is included
-by configure.ac even when fuzzing is not enabled (which we don't do on
-Buildroot).
-
-The patch applied upstream had issues and was reverted[1]. Use a local
-patch to solve the problem temporaryly.
-
-Fixes:
-    http://autobuild.buildroot.net/results/13f5e37b47b255da4158bec34e5459136f7e60d4
-    http://autobuild.buildroot.net/results/1c26db2509c79e00c0de1165945277eaa57b149f
-    http://autobuild.buildroot.net/results/b7b6b7b7aca79e847b442cbd2305427d91fe5d70
-    http://autobuild.buildroot.net/results/1cd5a82a0e799aa5027e2e2c03b246332cc3a15d
-    http://autobuild.buildroot.net/results/d7ec878907f714377c83e9a496e97cbf9382d787
-    http://autobuild.buildroot.net/results/1c7f0c1b3ce4871cd87bd6059b1f0a6dc4e74a9c
-    http://autobuild.buildroot.net/results/196b81d580325607c8da90beeb79e1f6b8ab8b47
-    http://autobuild.buildroot.net/results/f90f7b4ac710b56686635f8ae27059c11b963e47
-
-1. https://github.com/tpm2-software/tpm2-tss/commit/60c26e4c4faba6ba12469485653e17092b510840
-
-Signed-off-by: Carlos Santos <unixmania@gmail.com>
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index ff59dd7c..3e4028fb 100755
---- a/configure.ac
-+++ b/configure.ac
-@@ -26,7 +26,6 @@ AX_IS_RELEASE(dash-version)
- AX_CHECK_ENABLE_DEBUG([info])
- 
- AC_PROG_CC
--AC_PROG_CXX
- AC_PROG_LN_S
- AC_USE_SYSTEM_EXTENSIONS
- LT_INIT()
--- 
-2.26.2
-
diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
index 857987ae36..d87c1e0d8d 100644
--- a/package/tpm2-tss/Config.in
+++ b/package/tpm2-tss/Config.in
@@ -39,6 +39,8 @@ config BR2_PACKAGE_TPM2_TSS_FAPI
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  This option allows to enable Feature API (FAPI).  Feature
 	  API (FAPI) as described in the "TSS 2.0 Feature API
diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
index c9fa4e6ae0..891c1285b0 100644
--- a/package/tpm2-tss/tpm2-tss.hash
+++ b/package/tpm2-tss/tpm2-tss.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ba9e52117f254f357ff502e7d60fce652b3bfb26327d236bbf5ab634235e40f1  tpm2-tss-3.2.2.tar.gz
+sha256  37f1580200ab78305d1fc872d89241aaee0c93cbe85bc559bf332737a60d3be8  tpm2-tss-4.1.3.tar.gz
 sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index b76d16e71e..c8a7df7724 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TSS_VERSION = 3.2.2
+TPM2_TSS_VERSION = 4.1.3
 TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
 TPM2_TSS_LICENSE = BSD-2-Clause
 TPM2_TSS_LICENSE_FILES = LICENSE
@@ -13,9 +13,6 @@ TPM2_TSS_CPE_ID_PRODUCT = tpm2_software_stack
 TPM2_TSS_INSTALL_STAGING = YES
 TPM2_TSS_DEPENDENCIES = openssl host-pkgconf
 
-# 0001-configure-Only-use-CXX-when-fuzzing.patch
-TPM2_TSS_AUTORECONF = YES
-
 # systemd-sysusers and systemd-tmpfiles are only used at install time
 # to trigger the creation of users adn tmpfiles, which we do not care
 # about at build time. groupadd, useradd, and setfacl are used in the
@@ -36,10 +33,10 @@ TPM2_TSS_CONF_OPTS = \
 TPM2_TSS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
 
 ifeq ($(BR2_PACKAGE_TPM2_TSS_FAPI),y)
-TPM2_TSS_DEPENDENCIES += json-c libcurl
+TPM2_TSS_DEPENDENCIES += json-c libcurl util-linux
 TPM2_TSS_CONF_OPTS += --enable-fapi
 else
-TPM2_TSS_CONF_OPTS += --disable-fapi
+TPM2_TSS_CONF_OPTS += --disable-fapi --disable-policy
 endif
 
 define TPM2_TSS_USERS
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
