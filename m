Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F991C3DA64
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 01:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A607C605BE;
	Mon,  5 Aug 2024 01:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NjGAJ5lhRwoD; Mon,  5 Aug 2024 01:59:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84427606E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84427606E3;
	Mon,  5 Aug 2024 01:59:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7CEB81BF2EB
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 01:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67C8D80FC1
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 01:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id smSw0ICHGpnT for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 01:58:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=9409ec7cf=wilfred.mallawa@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ADD8480B40
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADD8480B40
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADD8480B40
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 01:58:59 +0000 (UTC)
X-CSE-ConnectionGUID: eBiRntAIR9eRPBMcmarY9g==
X-CSE-MsgGUID: UzZ0KUFKRgGLfX8l8MzoKw==
X-IronPort-AV: E=Sophos;i="6.09,263,1716220800"; d="scan'208";a="24147857"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 05 Aug 2024 09:58:57 +0800
IronPort-SDR: 66b023ea_ILuu5NO2G9SSgOkbaK1RXTHS4FQHSNr+bT1VKjRuj0ZEJJK
 YF2prX0BtFID9VfHr1AQigaF/pFB/7K3uspZdsQ==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Aug 2024 17:59:22 -0700
WDCIronportException: Internal
Received: from unknown (HELO fedora.wdc.com) ([10.225.165.118])
 by uls-op-cesaip02.wdc.com with ESMTP; 04 Aug 2024 18:58:56 -0700
To: buildroot@buildroot.org
Date: Mon,  5 Aug 2024 11:57:12 +1000
Message-ID: <20240805015711.112117-2-wilfred.mallawa@wdc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1722823139; x=1754359139;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dm0TygED2EM2igQTFLm4leFu1A8Clf/6M4YWAWBLNz8=;
 b=Kk4qQLXCccy4ulU9Yx21GWSxxb5SiHKPxpaRqoQfVcV4TttIQR3ETrh2
 ZIZC3QqWufuXY/NZXO7AoF1Ze3/C3XF4YmQfKcTJJHis68I8zayeGok9B
 +dLd5T5z8TZdpAxjpjUxt4zj3WpfNw/uTVn6Xg4/qeZLsTW4PdSfdMbfW
 N3kYoZztdMQSCFC9vlUWXeCooMx3k7+mMawUQkrfFVPHRRKMuXC56OXwz
 bjX/4TgOW2KD7uVzC5/4PKqXN1xQe3rlfDtAGo9+7Lf445lOMf8ysTLDR
 jL1jeryqCHWsYD3tkVAADPRoFtIk310A4TZCLKeynwfWcYpP9b+1ZaD42
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=Kk4qQLXC
Subject: [Buildroot] [PATCH v4 1/1] package/libspdm: bump version to 3.4.0
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
 Alistair Francis <alistair@alistair23.me>,
 Alistair Francis <alistair.francis@wdc.com>
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes V3->V4
	- Fixed up how we pass CFLAGs as suggested by Thomas Patazzoni.
	- Removed the unused ".." CMAKE directory argument.

 ...eLists-remove-fixed-options-for-NONE.patch | 52 -------------------
 package/libspdm/libspdm.hash                  |  2 +-
 package/libspdm/libspdm.mk                    | 10 +++-
 3 files changed, 9 insertions(+), 55 deletions(-)
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
index 2ec35be0ac..e86a79ed67 100644
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
@@ -17,6 +17,11 @@ LIBSPDM_DEPENDENCIES = openssl
 
 LIBSPDM_TARGET_CPU_FAMILY = $(call qstrip,$(BR2_PACKAGE_LIBSPDM_CPU_FAMILY))
 
+LIBSPDM_CFLAGS = \
+	$(TARGET_CFLAGS) \
+	-DLIBSPDM_ENABLE_CAPABILITY_EVENT_CAP=0 \
+	-DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=0
+
 LIBSPDM_CONF_OPTS = \
 	-DARCH=$(LIBSPDM_TARGET_CPU_FAMILY) \
 	-DTOOLCHAIN=NONE \
@@ -27,7 +32,8 @@ LIBSPDM_CONF_OPTS = \
 	-DCOMPILED_LIBSSL_PATH=/usr/lib/ \
 	-DDISABLE_TESTS=1 \
 	-DDISABLE_EDDSA=1 \
-	-DLINK_FLAGS=$(STAGING_DIR)
+	-DLINK_FLAGS=$(STAGING_DIR) \
+	-DCMAKE_C_FLAGS="$(LIBSPDM_CFLAGS)"
 
 define LIBSPDM_INSTALL_STAGING_CMDS
 	mkdir -p $(STAGING_DIR)/usr/lib
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
