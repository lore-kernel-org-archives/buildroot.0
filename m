Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716FBE7D0AF
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 22:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEFCC400FB;
	Thu, 21 Sep 2023 22:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEFCC400FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m14EMK9U-0MB; Thu, 21 Sep 2023 22:23:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 035B14187E;
	Thu, 21 Sep 2023 22:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 035B14187E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 81B2C1BF3CA
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 22:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A59141889
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 22:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A59141889
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U23pdTxJWkHL for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 22:23:04 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11B95400FB
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 22:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11B95400FB
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-690d2e13074so1366669b3a.1
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 15:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695334983; x=1695939783;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AZ0mPbvrB4Hq7F2cacFvBtG+nPCzcNzkZcrd6kSNKK0=;
 b=u7tz69PkogZiZU/ZtFqq9EtF8v/cC8RNsQLvN0+YeyIqgW9+8PeshI0rpuWdHyhP7p
 S7UfJytfNiIdomM62MuE2a9yHw55CNlL1er3ObTROCiGm/vQxVppR/wTEUkH2e8hRpsF
 Ds0srALMkp4pKWAulqSLLmnwfXBCxFpKCm8SQpFTC2v+7pGHOZPX3tu6+ETSASYlc8Hf
 RqfXhtxyhPASsDDcXdftGCEeLOoebVV60BurwStoEQtKxW33HNBG5SsWkS7niTipUhkn
 zPJWpRlhCIkW2lvjO5BZpl5i1HNrgxqZs6x0Ir+R0nRBxR1mh3NTIdgpZs6H1e6CrIa7
 Sqsw==
X-Gm-Message-State: AOJu0YyKPiUyjJ9cmfIEb8ctwQOkkYzJk17eZQMeHnH4vS4N1eB1SqTw
 miMbtW1lBbDt4NlzG8PNQYRFTVR1Ndw=
X-Google-Smtp-Source: AGHT+IFAWZGMGGgmR8DcWpwluefqESnt3KxPks/xvXMOu4PBDYk/KrJtcUPCS8Nyu3oGCISuUPTFYg==
X-Received: by 2002:a05:6a20:7fa1:b0:140:324c:124c with SMTP id
 d33-20020a056a207fa100b00140324c124cmr8828453pzj.62.1695334983038; 
 Thu, 21 Sep 2023 15:23:03 -0700 (PDT)
Received: from Adam-laptop.lan ([172.56.200.138])
 by smtp.gmail.com with ESMTPSA id
 jc10-20020a17090325ca00b001b9be3b94d3sm2051566plb.140.2023.09.21.15.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 15:23:02 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 16:22:58 -0600
Message-Id: <20230921222258.402793-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695334983; x=1695939783; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AZ0mPbvrB4Hq7F2cacFvBtG+nPCzcNzkZcrd6kSNKK0=;
 b=YdgNW4QPT55sqCnz1ErNpp5w7UGhhcavnOT7uzWB67ya8UknhTDlxGbbR2X7NhNwEd
 2J6XOsgpayxK+KOd4qpsrXS6rT4vnpe30NDyYR570DJbpxCwLL60/EvwZsrWCMcVqnOk
 rWSGbclVxkU/KbR5uRqfXRpSqRb2rs2Z6icoK5nDscfOH9gHV7h1koLPVqO+w27P+sOc
 PhdmbSLicJWlAbCCWiSGl+4eLz4nhFYzy7m0Naq9pPMUrOmMIgkJRf91LUK5CInalADp
 GGhA88oWBb6rO/Zi4BuhNZNKo9bzmc5SPdpgj+xTT8ZlRyp5JJhB7BUw8iG7MVpxcuNC
 Yrvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YdgNW4QP
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 18.18.0
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
Cc: Adam Duskett <aduskett@gmail.com>, Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  - Refactor 0001-add-qemu-wrapper-support.patch for 18.18.0

  - NodeJS now requires GCC 8.3 due to the introduction of the charconv
    header. However, as there is no BR2_TOOLCHAIN_GCC_AT_LEAST_8_3, we
    round up to BR2_TOOLCHAIN_GCC_AT_LEAST_9.

  - Update support/testing/tests/package/test_nodejs.py to use
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN, otherwise the test fails as the
    gcc version selected will be 7.

  - Update the hash file for LICENSE.txt due to numerous changes, such
    as the addition of new libraries and updated dates. No new license
    types are added.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 .../0001-add-qemu-wrapper-support.patch       | 25 ++++++++++---------
 ...ules-cjs-loader.js-adjust-default-pa.patch |  2 +-
 package/nodejs/Config.in                      |  8 +++---
 package/nodejs/nodejs.hash                    |  6 ++---
 package/nodejs/nodejs.mk                      |  2 +-
 support/testing/tests/package/test_nodejs.py  |  2 ++
 6 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/package/nodejs/0001-add-qemu-wrapper-support.patch b/package/nodejs/0001-add-qemu-wrapper-support.patch
index 184f3d19b7..c61a20350b 100644
--- a/package/nodejs/0001-add-qemu-wrapper-support.patch
+++ b/package/nodejs/0001-add-qemu-wrapper-support.patch
@@ -16,6 +16,7 @@ the qemu-wrapper on target builds, and remove @MAYBE_WRAPPER@ entirely on
 host-builds.
 
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
+Refresh for 18.18.0
 ---
  node.gyp                 |  4 ++--
  tools/v8_gypfiles/v8.gyp | 10 +++++-----
@@ -25,16 +26,7 @@ diff --git a/node.gyp b/node.gyp
 index 97cdbb531d..db5cf51ce6 100644
 --- a/node.gyp
 +++ b/node.gyp
-@@ -319,7 +319,7 @@
-               'action_name': 'run_mkcodecache',
-               'process_outputs_as_sources': 1,
-               'inputs': [
--                '<(mkcodecache_exec)',
-+                @MAYBE_WRAPPER@ '<(mkcodecache_exec)',
-               ],
-               'outputs': [
-                 '<(SHARED_INTERMEDIATE_DIR)/node_code_cache.cc',
-@@ -346,7 +346,7 @@
+@@ -322,7 +322,7 @@
                    'action_name': 'node_mksnapshot',
                    'process_outputs_as_sources': 1,
                    'inputs': [
@@ -43,6 +35,15 @@ index 97cdbb531d..db5cf51ce6 100644
                      '<(node_snapshot_main)',
                    ],
                    'outputs': [
+@@ -342,7 +342,7 @@
+                   'action_name': 'node_mksnapshot',
+                   'process_outputs_as_sources': 1,
+                   'inputs': [
+-                    '<(node_mksnapshot_exec)',
++                    @MAYBE_WRAPPER@ '<(node_mksnapshot_exec)',
+                   ],
+                   'outputs': [
+                     '<(SHARED_INTERMEDIATE_DIR)/node_snapshot.cc',
 diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
 index 73099a03e4..88ca91efb4 100644
 --- a/tools/v8_gypfiles/v8.gyp
@@ -74,7 +75,7 @@ index 73099a03e4..88ca91efb4 100644
            ],
            'outputs': [
              '<(generate_bytecode_builtins_list_output)',
-@@ -395,7 +395,7 @@
+@@ -400,7 +400,7 @@
              ],
            },
            'inputs': [
@@ -83,7 +84,7 @@ index 73099a03e4..88ca91efb4 100644
            ],
            'outputs': [
              '<(INTERMEDIATE_DIR)/snapshot.cc',
-@@ -1505,7 +1505,7 @@
+@@ -1569,7 +1569,7 @@
          {
            'action_name': 'run_gen-regexp-special-case_action',
            'inputs': [
diff --git a/package/nodejs/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch b/package/nodejs/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
index 5b93998e5e..f1cdad3d9c 100644
--- a/package/nodejs/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
+++ b/package/nodejs/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
@@ -21,7 +21,7 @@ diff --git a/lib/internal/modules/cjs/loader.js b/lib/internal/modules/cjs/loade
 index f1971c40a4..5fe3884156 100644
 --- a/lib/internal/modules/cjs/loader.js
 +++ b/lib/internal/modules/cjs/loader.js
-@@ -1261,7 +1261,8 @@ Module._initPaths = function() {
+@@ -1391,7 +1391,8 @@ Module._initPaths = function() {
      path.resolve(process.execPath, '..') :
      path.resolve(process.execPath, '..', '..');
  
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 1489306be0..2ea9f422ab 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -7,19 +7,19 @@ config BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 
-comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 7, wchar, host gcc >= 8"
+comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 9, wchar, host gcc >= 9"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_HOST_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR
+		!BR2_HOST_GCC_AT_LEAST_9 || !BR2_TOOLCHAIN_GCC_AT_LEAST_9 || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_NODEJS
 	bool "nodejs"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_8 # qemu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	depends on BR2_HOST_GCC_AT_LEAST_9 # qemu
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	depends on BR2_USE_WCHAR
 	# uses fork()
 	depends on BR2_USE_MMU
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 6ab4c53e79..41d8655961 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v16.20.0/SHASUMS256.txt
-sha256  e0990f992234e40a51fe11f92c3816c93a77e1b081145d3dd762cd1026345349  node-v16.20.0.tar.xz
+# From https://nodejs.org/dist/v18.18.0/SHASUMS256.txt
+sha256  e4d4dbac3634d99f892f00db47da78f98493c339582e8a95fb2dd59f5cfe0f90  node-v18.18.0.tar.xz
 
 # Hash for license file
-sha256  ba325815d3df8819bebaf37cad67d6e1f82271e1e4a1189b53abd28e261977d6  LICENSE
+sha256  a6871483905199033882d66453649675f0e88ffaa07f9f8acb257ce7504bc758  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index fe629ada21..13b3d1eee1 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 16.20.0
+NODEJS_VERSION = 18.18.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = \
diff --git a/support/testing/tests/package/test_nodejs.py b/support/testing/tests/package/test_nodejs.py
index 9463c76b72..9acc330e4d 100644
--- a/support/testing/tests/package/test_nodejs.py
+++ b/support/testing/tests/package/test_nodejs.py
@@ -10,6 +10,7 @@ class TestNodeJSBasic(infra.basetest.BRTest):
         BR2_cortex_a9=y
         BR2_ARM_ENABLE_VFP=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_PACKAGE_NODEJS=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
@@ -34,6 +35,7 @@ class TestNodeJSModule(infra.basetest.BRTest):
         BR2_cortex_a9=y
         BR2_ARM_ENABLE_VFP=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_PACKAGE_NODEJS=y
         BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="lodash"
         BR2_TARGET_ROOTFS_CPIO=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
