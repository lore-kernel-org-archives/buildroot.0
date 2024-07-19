Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7647CC3DA59
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 06:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03B1A60E8D;
	Fri, 19 Jul 2024 06:52:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sM6QGSFdaV3C; Fri, 19 Jul 2024 06:52:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCB7260A47
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCB7260A47;
	Fri, 19 Jul 2024 06:52:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E76231BF362
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 06:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3752406C1
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 06:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSFDux8tNDvY for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 06:52:36 +0000 (UTC)
X-Greylist: delayed 428 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 19 Jul 2024 06:52:36 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 30A1840693
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30A1840693
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com; envelope-from=prvs=923d17285=wilfred.mallawa@wdc.com;
 receiver=<UNKNOWN> 
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30A1840693
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 06:52:36 +0000 (UTC)
X-CSE-ConnectionGUID: nBPsFq/eSOmOcQe5b7LEqQ==
X-CSE-MsgGUID: 7qU27v3oRRysC7N51nATDw==
X-IronPort-AV: E=Sophos;i="6.09,220,1716220800"; d="scan'208";a="22483286"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Jul 2024 14:45:26 +0800
IronPort-SDR: 6699fef8_Lnh3pZ5pPWx8LSbaLC+NZov0Zvd9ZyV2ID07Vrh9VN3MYxu
 YtgNFHoK8UaA5P5DRIBZZOLCumb5h0pzWrLl7zA==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2024 22:51:52 -0700
WDCIronportException: Internal
Received: from unknown (HELO fedora.wdc.com) ([10.225.165.83])
 by uls-op-cesaip01.wdc.com with ESMTP; 18 Jul 2024 23:45:25 -0700
To: buildroot@buildroot.org
Date: Fri, 19 Jul 2024 16:44:03 +1000
Message-ID: <20240719064402.3105153-2-wilfred.mallawa@wdc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1721371956; x=1752907956;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IYKnj/AweLf3igIXaY+y46CR9FnOX/oucp/6WTJxnf8=;
 b=UpeVfhkkph7vp7NXcTJEI7tLdmODu9JovXns1tXSq+gZX/r9hcwfU31Q
 qJtVIITNfGrH8CsJz3Pn3v37GUrD8a+k4ZqVCVarK23JTjGajjP8XFH7x
 aAZEj2NWudXDFNpFZDAg0FooWka01dLopwJG6P7EHHCqdfYpChbfI1AVR
 Xv5qnyo7/slB5xLDxjxrKxR6L7Xj94UupF04/AlhhvAiYqZtju4vKoyMx
 Zm3BBvHlbVwlvIIFw/NAzLqNITPZ0rYebUMvtIZHoVT4RZ6jMJ7ZSmv/9
 ik5diTOq9Bn5fcseXUXVuR+Xd0W4w5ncTaed6Lh+VliYAaObYnaqqGnzx
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=UpeVfhkk
Subject: [Buildroot] [PATCH v3 1/1] package/libspdm: bump version to 3.4.0
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
From: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
Reply-To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Wilfred Mallawa via buildroot <buildroot@buildroot.org>

`libspdm 3.3.0` and later support the SPDM event capability, however
this patch disables support for EVENT_CAP as it is optional,
and requires additional functionality implemented at link time.

`libspdm 3.4.0` also introduces SPDM1.3 measurement extention log (MEL).
Leave this off by default for the same reason as above.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
Changes in V3:
	- Updated to libspdm 3.4.0, this release includes the patch
	  that was being backported in V2.

 ...eLists-remove-fixed-options-for-NONE.patch | 52 -------------------
 package/libspdm/libspdm.hash                  |  2 +-
 package/libspdm/libspdm.mk                    |  6 ++-
 3 files changed, 5 insertions(+), 55 deletions(-)
 delete mode 100644 package/libspdm/0001-CMakeLists-remove-fixed-options-for-NONE.patch

diff --git a/package/libspdm/0001-CMakeLists-remove-fixed-options-for-NONE.patch b/package/libspdm/0001-CMakeLists-remove-fixed-options-for-NONE.patch
deleted file mode 100644
index 0de0ad0079..0000000000
--- a/package/libspdm/0001-CMakeLists-remove-fixed-options-for-NONE.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From d4d6b138d727e484fa9d0fef476ca181681d0695 Mon Sep 17 00:00:00 2001
-From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
-Date: Mon, 19 Feb 2024 09:56:14 +1000
-Subject: [PATCH] CMakeLists: remove fixed options for NONE
-
-The use of the NONE toolchain option is such that we can provide at the
-build project level (buildroot etc...). However, the changes introduced
-in 811f2b596def04b3a36368cf2098546d7907767f set certain compiler/linker
-option that does not comply with the definition of the options as
-specified in [1]. This change removes those options.
-
-[1] https://github.com/DMTF/libspdm/blob/main/doc/build.md#linux-builds-inside-build-environments
-
-Upstream: https://github.com/DMTF/libspdm/commit/d4d6b138d727e484fa9d0fef476ca181681d0695
-Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
----
- CMakeLists.txt | 19 -------------------
- 1 file changed, 19 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9c300cc817..f6cf17d269 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -618,25 +618,6 @@ if(CMAKE_SYSTEM_NAME MATCHES "Linux")
-         SET(CMAKE_EXE_LINKER_FLAGS "")
- 
-         SET(CMAKE_C_LINK_EXECUTABLE "")
--
--    elseif(TOOLCHAIN STREQUAL "NONE")
--        ADD_COMPILE_OPTIONS(-fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -ffunction-sections -fdata-sections -fno-common -Wno-address -fpie -fno-asynchronous-unwind-tables -flto -DUSING_LTO  -Wno-maybe-uninitialized -Wno-uninitialized  -Wno-builtin-declaration-mismatch -Wno-nonnull-compare -Werror-implicit-function-declaration)
--        if(CMAKE_BUILD_TYPE STREQUAL "Debug")
--            ADD_COMPILE_OPTIONS(-g)
--        endif()
--        if(GCOV STREQUAL "ON")
--        ADD_COMPILE_OPTIONS(--coverage -fprofile-arcs -ftest-coverage)
--        endif()
--        SET(OPENSSL_FLAGS -include base.h -Wno-error=maybe-uninitialized -Wno-error=format -Wno-format -Wno-error=unused-but-set-variable -Wno-cast-qual -Wno-error=implicit-function-declaration)
--        SET(CMOCKA_FLAGS -std=gnu99 -Wpedantic -Wall -Wshadow -Wmissing-prototypes -Wcast-align -Werror=address -Wstrict-prototypes -Werror=strict-prototypes -Wwrite-strings -Werror=write-strings -Werror-implicit-function-declaration -Wpointer-arith -Werror=pointer-arith -Wdeclaration-after-statement -Werror=declaration-after-statement -Wreturn-type -Werror=return-type -Wuninitialized -Werror=uninitialized -Werror=strict-overflow -Wstrict-overflow=2 -Wno-format-zero-length -Wmissing-field-initializers -Wformat-security -Werror=format-security -fno-common -Wformat -fno-common -fstack-protector-strong -Wno-cast-qual)
--
--        SET(CMAKE_LINKER ${CMAKE_C_COMPILER})
--        SET(CMAKE_EXE_LINKER_FLAGS "-flto -Wno-error -no-pie" )
--        if(GCOV STREQUAL "ON")
--        SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}  --coverage -lgcov -fprofile-arcs -ftest-coverage")
--        endif()
--        SET(CMAKE_C_LINK_EXECUTABLE "<CMAKE_LINKER> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET> -Wl,--start-group <LINK_LIBRARIES> -Wl,--end-group")
--
-     endif()
- 
-     if(NOT TOOLCHAIN STREQUAL "NIOS2_GCC")
--- 
-2.43.2
-
diff --git a/package/libspdm/libspdm.hash b/package/libspdm/libspdm.hash
index 32415bcfce..1fe34fded1 100644
--- a/package/libspdm/libspdm.hash
+++ b/package/libspdm/libspdm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0ee460c0ce5c4d126ca65f9c4bdabd5725b87cec7160b2d06721169df58f3a95  libspdm-3.2.0.tar.gz
+sha256  44f967aeb0c481676affe59069615252854bc0c072368ce4b26b6809a54daff5  libspdm-3.4.0.tar.gz
 sha256  7dc072bff163df39209bbb63e0916f4667c2a84cf3c36ccc84ec7425bc3e4779  LICENSE.md
diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
index 2ec35be0ac..1c7f12227e 100644
--- a/package/libspdm/libspdm.mk
+++ b/package/libspdm/libspdm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSPDM_VERSION = 3.2.0
+LIBSPDM_VERSION = 3.4.0
 LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
 LIBSPDM_LICENSE = BSD-3-Clause
 LIBSPDM_LICENSE_FILES = LICENSE.md
@@ -27,7 +27,9 @@ LIBSPDM_CONF_OPTS = \
 	-DCOMPILED_LIBSSL_PATH=/usr/lib/ \
 	-DDISABLE_TESTS=1 \
 	-DDISABLE_EDDSA=1 \
-	-DLINK_FLAGS=$(STAGING_DIR)
+	-DLINK_FLAGS=$(STAGING_DIR) \
+	-DCMAKE_C_FLAGS="-DLIBSPDM_ENABLE_CAPABILITY_EVENT_CAP=0 \
+		-DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=0" ..
 
 define LIBSPDM_INSTALL_STAGING_CMDS
 	mkdir -p $(STAGING_DIR)/usr/lib
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
