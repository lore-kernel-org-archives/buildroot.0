Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09E3C25B74
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 03:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21A3160645;
	Fri, 31 May 2024 03:27:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1qM6FQCysu9b; Fri, 31 May 2024 03:27:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFC57610CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFC57610CF;
	Fri, 31 May 2024 03:27:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A630A1D4DA4
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 03:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A08DA610CF
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 03:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JlmRt8s8uKb9 for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 03:27:06 +0000 (UTC)
X-Greylist: delayed 428 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 31 May 2024 03:27:06 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E25460645
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E25460645
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.141;
 helo=esa3.hgst.iphmx.com; envelope-from=prvs=874f0c6f3=wilfred.mallawa@wdc.com;
 receiver=<UNKNOWN> 
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E25460645
 for <buildroot@buildroot.org>; Fri, 31 May 2024 03:27:06 +0000 (UTC)
X-CSE-ConnectionGUID: Ry4dUSYESqKHkFjpww4Kjg==
X-CSE-MsgGUID: FjxcCoJgSuKPrDuHRsMPrQ==
X-IronPort-AV: E=Sophos;i="6.08,203,1712592000"; d="scan'208";a="17444079"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 31 May 2024 11:19:58 +0800
IronPort-SDR: 66593437_LWEUxXMNpFaeJm7JRqVAtNjZ+qmV/uVOBgkiDoqzD044mfk
 4KeF67MVLXPQCXm/05dPA0JTWlcR7cYv7Tr/FbQ==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2024 19:21:43 -0700
WDCIronportException: Internal
Received: from unknown (HELO fedora.wdc.com) ([10.225.165.41])
 by uls-op-cesaip01.wdc.com with ESMTP; 30 May 2024 20:19:55 -0700
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 13:19:39 +1000
Message-ID: <20240531031938.19992-2-wilfred.mallawa@wdc.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1717126026; x=1748662026;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5uJhhJhqGPBnqKcohh4LzZ4iQKea39+hRbv7EAo3EkI=;
 b=eUzJgc0GEVlCYjsUXVFJLNM850onZZbIpZUIgpXOabUmKQjZ5I+kEFx1
 AZHmdwYdw62GD/SWgahWDfmdwHkFYBb52+PVw7GaBAVVucBu4VVTctwrB
 cgqHqwrQ0QNIGZvR6qkTWhSTcGtbIXTDfI8ghzQePJ58WhneEa0BfXrxh
 EXH8bXsnyArnRV5BJWM1IDBMFyqn6hDiFsCVyVhCTbgf+Ol2zCTG4zhuz
 15ps0NZTZ9z8W5hTBiyF5LIvbSBsPLvh0joNBNPGgcZVWHBAguIDNjJ2B
 ZnsklEOteljWfZTr0knNez79yWDe7x7g9aVqEDs7eBaaReKCeBLCSBuP2
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=eUzJgc0G
Subject: [Buildroot] [PATCH 1/1] package/libspdm: bump version to 3.3.0
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

Add pending upstream patch that fixes the incorrect parsing of
certificates with `id-DMTF-hardware-identity OID` tags.

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 ...eLists-remove-fixed-options-for-NONE.patch | 52 -----------------
 ...spdm_responder-Fixup-set-cert-checks.patch | 56 +++++++++++++++++++
 package/libspdm/libspdm.hash                  |  2 +-
 package/libspdm/libspdm.mk                    |  6 +-
 4 files changed, 61 insertions(+), 55 deletions(-)
 delete mode 100644 package/libspdm/0001-CMakeLists-remove-fixed-options-for-NONE.patch
 create mode 100644 package/libspdm/0001-library-spdm_responder-Fixup-set-cert-checks.patch

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
diff --git a/package/libspdm/0001-library-spdm_responder-Fixup-set-cert-checks.patch b/package/libspdm/0001-library-spdm_responder-Fixup-set-cert-checks.patch
new file mode 100644
index 0000000000..1708568500
--- /dev/null
+++ b/package/libspdm/0001-library-spdm_responder-Fixup-set-cert-checks.patch
@@ -0,0 +1,56 @@
+From e41eea4f4119d1efb9a633092b32e6717a1c246c Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Thu, 23 May 2024 15:33:26 +1000
+Subject: [PATCH] library/spdm_responder: Fixup set cert checks
+
+When we run checks against the certificate that the requester set we
+have the following function calls
+ - libspdm_set_cert_verify_certchain()
+  - libspdm_x509_set_cert_certificate_check()
+  ...
+   - libspdm_verify_leaf_cert_spdm_extension()
+
+At which point libspdm_verify_leaf_cert_spdm_extension() checks to make
+sure the id-DMTF-hardware-identity OID is not set if it's an AliasCert
+model.
+
+This ends up being incorrect though. If using an AliasCert the
+SET_CERTIFICATE CertChain (table 93 - section 770) will "contain a partial
+certificate chain from the root CA to the Device Certificate CA". This
+means that the leaf certificate of that chain should set the the
+id-DMTF-hardware-identity OID as it isn't an alias certificate.
+
+At this point the check in libspdm_verify_leaf_cert_spdm_extension() is
+incorrect.
+
+The documentation of libspdm_x509_set_cert_certificate_check() states
+that:
+    is_requester_cert     Is the function verifying requester or responder cert.
+
+Although we are a responder, we are verifying a certificate set by the
+requester, so change the is_requester_cert to true to avoid the
+incorrect id-DMTF-hardware-identity OID check and match the
+documentation.
+
+Upstream: https://github.com/DMTF/libspdm/pull/2708
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+---
+ library/spdm_responder_lib/libspdm_rsp_set_certificate.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/library/spdm_responder_lib/libspdm_rsp_set_certificate.c b/library/spdm_responder_lib/libspdm_rsp_set_certificate.c
+index 8c2d36fca8..bed87d9e9a 100644
+--- a/library/spdm_responder_lib/libspdm_rsp_set_certificate.c
++++ b/library/spdm_responder_lib/libspdm_rsp_set_certificate.c
+@@ -42,7 +42,7 @@ static bool libspdm_set_cert_verify_certchain(const uint8_t *cert_chain, size_t
+     /*verify leaf cert*/
+     if (!libspdm_x509_set_cert_certificate_check(leaf_cert_buffer, leaf_cert_buffer_size,
+                                                  base_asym_algo, base_hash_algo,
+-                                                 false, is_device_cert_model)) {
++                                                 true, is_device_cert_model)) {
+         return false;
+     }
+ 
+-- 
+2.45.1
+
diff --git a/package/libspdm/libspdm.hash b/package/libspdm/libspdm.hash
index 32415bcfce..7067f010e2 100644
--- a/package/libspdm/libspdm.hash
+++ b/package/libspdm/libspdm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0ee460c0ce5c4d126ca65f9c4bdabd5725b87cec7160b2d06721169df58f3a95  libspdm-3.2.0.tar.gz
+sha256  178c7bd785b3ac71b886b8360dab926d42e4d5edc55009bcd341295f25f56c91  libspdm-3.3.0.tar.gz
 sha256  7dc072bff163df39209bbb63e0916f4667c2a84cf3c36ccc84ec7425bc3e4779  LICENSE.md
diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
index 2ec35be0ac..341a98ebf5 100644
--- a/package/libspdm/libspdm.mk
+++ b/package/libspdm/libspdm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSPDM_VERSION = 3.2.0
+LIBSPDM_VERSION = 3.3.0
 LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
 LIBSPDM_LICENSE = BSD-3-Clause
 LIBSPDM_LICENSE_FILES = LICENSE.md
@@ -27,7 +27,9 @@ LIBSPDM_CONF_OPTS = \
 	-DCOMPILED_LIBSSL_PATH=/usr/lib/ \
 	-DDISABLE_TESTS=1 \
 	-DDISABLE_EDDSA=1 \
-	-DLINK_FLAGS=$(STAGING_DIR)
+	-DDISABLE_LTO=1 \
+	-DLINK_FLAGS=$(STAGING_DIR) \
+	-DCMAKE_C_FLAGS="-DLIBSPDM_ENABLE_CAPABILITY_EVENT_CAP=0" ..
 
 define LIBSPDM_INSTALL_STAGING_CMDS
 	mkdir -p $(STAGING_DIR)/usr/lib
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
