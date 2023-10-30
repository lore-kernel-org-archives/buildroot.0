Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B8EC4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 10:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B010182188;
	Mon, 30 Oct 2023 10:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B010182188
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bb_8tmj_zOdP; Mon, 30 Oct 2023 10:24:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF37081FF2;
	Mon, 30 Oct 2023 10:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF37081FF2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE03C1BF38B
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A42BF70A94
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A42BF70A94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aOyz0ngMFALd for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 10:24:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 581976FC34
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 10:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 581976FC34
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39U7G0Jx009228; Mon, 30 Oct 2023 10:30:06 +0100
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u0ttvf0qg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Oct 2023 10:30:06 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E8BBF10005C;
 Mon, 30 Oct 2023 10:30:05 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E0EC921A90F;
 Mon, 30 Oct 2023 10:30:05 +0100 (CET)
Received: from localhost (10.201.20.20) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 30 Oct
 2023 10:30:05 +0100
From: Etienne Carriere <etienne.carriere@foss.st.com>
To: <buildroot@buildroot.org>
Date: Mon, 30 Oct 2023 10:30:00 +0100
Message-ID: <20231030093002.1047149-3-etienne.carriere@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231030093002.1047149-1-etienne.carriere@foss.st.com>
References: <20231030093002.1047149-1-etienne.carriere@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.20]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_08,2023-10-27_01,2023-05-22_02
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=EvXqNE1lDGCleTVtQBBthF4qhlBcFHKffi7MCLGe2sI=; b=za
 eUKbPOkjVkm4gt2v5M/6iAgujhU9otxkjO6CKOBcRpmPy02Mh/Np8G/mT4hKIWj7
 XEqPas/wWkSqfO6OMyA4Sjn1DSrFPnzQ4QZndtNfMckbONAQJY/HNxUaG3OyjB94
 ox97Lxz0F6xJ9YEq7qHCsdnNg8dwjfWYMXa/er9d3WcN6kr68EWPXBvloCXQaHSB
 MilevhRXyTK/5oQQktHWZJGzrJoCYChXtJY/j5U9eu+ZtWiWqt2UBGJv9bh7oHpi
 4GB2izNRPXHmvB5hvrno5DPKwrBYmP9Cn4U6FZvYtz0DVArlxeNczSP04p60p85C
 NZAJdT7pPyMdowNivnNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.a=rsa-sha256 header.s=selector1 header.b=zaeUKbPO
Subject: [Buildroot] [PATCH 3/5] package/optee-test: bump to version 4.0.0
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumps OP-TEE test package version to OP-TEE release 4.0.0.
Removes the local patch on OpenSSL support that has been integrated
into mainline repository before release tag 4.0.0.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
---
 ...-xtest-add-DOPENSSL_API_COMPAT-10100.patch | 57 -------------------
 package/optee-test/optee-test.hash            |  4 +-
 package/optee-test/optee-test.mk              |  2 +-
 3 files changed, 3 insertions(+), 60 deletions(-)
 delete mode 100644 package/optee-test/0001-xtest-add-DOPENSSL_API_COMPAT-10100.patch

diff --git a/package/optee-test/0001-xtest-add-DOPENSSL_API_COMPAT-10100.patch b/package/optee-test/0001-xtest-add-DOPENSSL_API_COMPAT-10100.patch
deleted file mode 100644
index b876c3385f..0000000000
--- a/package/optee-test/0001-xtest-add-DOPENSSL_API_COMPAT-10100.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From a0db2b60b9f5c14e9f69c0e06e1a8d35f9fb1b5a Mon Sep 17 00:00:00 2001
-From: Jerome Forissier <jerome.forissier@linaro.org>
-Date: Tue, 25 Jul 2023 14:39:25 +0200
-Subject: [PATCH] xtest: add -DOPENSSL_API_COMPAT=10100
-
-regression_1000.c uses OpenSSL functions that have been deprecated
-after version 1.1. In particular, building with version 3.0 causes the
-following error (and other similar ones not pasted here):
-
- optee_test/host/xtest/regression_1000.c: In function 'check_signature':
- optee_test/host/xtest/regression_1000.c:2735:9: error: 'SHA256_Init' is deprecated: Since OpenSSL 3.0 [-Werror=deprecated-declarations]
-  2735 |         SHA256_Init(&ctx);
-       |         ^~~~~~~~~~~
-
-Add -DOPENSSL_API_COMPAT=10100 to the build flags to avoid this and be
-flexible with regards to which version of OpenSSL build environment has
-to provide.
-
-Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
-Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
-(cherry picked from commit cf111604c4c32a76be90f29aab25fa9b882c8715)
-Upstream: https://github.com/OP-TEE/optee_test/commit/cf111604c4c32a76be90f29aab25fa9b882c8715
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- host/xtest/CMakeLists.txt | 2 +-
- host/xtest/Makefile       | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/host/xtest/CMakeLists.txt b/host/xtest/CMakeLists.txt
-index 776787b..ae0f4e0 100644
---- a/host/xtest/CMakeLists.txt
-+++ b/host/xtest/CMakeLists.txt
-@@ -12,7 +12,7 @@ endif()
- 
- find_package(OpenSSL)
- if(OPENSSL_FOUND)
--	add_compile_options(-DOPENSSL_FOUND=1)
-+	add_compile_options(-DOPENSSL_FOUND=1 -DOPENSSL_API_COMPAT=10100)
- 	set (OPENSSL_PRIVATE_LINK OpenSSL::Crypto)
- endif()
- 
-diff --git a/host/xtest/Makefile b/host/xtest/Makefile
-index 8505629..2497850 100644
---- a/host/xtest/Makefile
-+++ b/host/xtest/Makefile
-@@ -39,7 +39,7 @@ endef
- # - User/group login tests 1027 and 1028
- WITH_OPENSSL ?= y
- ifeq ($(WITH_OPENSSL),y)
--CFLAGS += -DOPENSSL_FOUND=1
-+CFLAGS += -DOPENSSL_FOUND=1 -DOPENSSL_API_COMPAT=10100
- ifneq ($(OPTEE_OPENSSL_EXPORT),)
- LDFLAGS += -lcrypto
- CFLAGS += -I$(OPTEE_OPENSSL_EXPORT)
--- 
-2.41.0
-
diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index 08b3331374..9744ab6d92 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_test/archive/3.21.0/optee-test-3.21.0.tar.gz
-sha256  44c7dc3df48e9d73f12bbbef1cc2a4e22d859ab8a5e67a07923267f924175d65  optee-test-3.21.0.tar.gz
+# From https://github.com/OP-TEE/optee_test/archive/4.0.0/optee-test-4.0.0.tar.gz
+sha256  dc37b90c98db54068e61b31e20378878e2cfdf3c71f90c8a635786164651c62f  optee-test-4.0.0.tar.gz
 # Locally computed
 sha256  6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index d306ef8269..44d3015ae1 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_TEST_VERSION = 3.21.0
+OPTEE_TEST_VERSION = 4.0.0
 OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
 OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
 OPTEE_TEST_LICENSE_FILES = LICENSE.md
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
