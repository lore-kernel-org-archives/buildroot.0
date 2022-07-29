Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35F3C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 05:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 507354052B;
	Fri, 29 Jul 2022 05:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 507354052B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cO30mUMM-o_G; Fri, 29 Jul 2022 05:22:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DB2E4033F;
	Fri, 29 Jul 2022 05:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DB2E4033F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 543D81BF34A
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 05:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CAF34033F
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 05:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CAF34033F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E5jI8XmlO4dy for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 05:22:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B58FE400C5
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B58FE400C5
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 05:22:01 +0000 (UTC)
Received: from 91-153-34-64.elisa-laajakaista.fi ([91.153.34.64] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1oHIRh-00AbDS-9c; Fri, 29 Jul 2022 07:21:57 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 32b6877e;
 Fri, 29 Jul 2022 05:21:45 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 08:21:45 +0300
Message-Id: <20220729052145.792037-1-aperez@igalia.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tK3WnjLVhZ88WahVn9K7ngz1sN+dpGdW+MeJBQs75G0=; b=jZHkS4QREmtJpdVFdpNLaxsAAi
 vNmPd0tQQkM/nWvWKwWG2LAy4BBkZKsYaslzJk4rGgEMQlXn7D6ORZjioZQ5q0lePSFCJfBLBER4v
 9OdriPKO6gp4XEQVcq0RelhJlAmVGCLf5AGo69f5hcmoU9g3BGxhZWdHgXSwv7iUzRskfH+7PdRzU
 YFjJHFarIlHDJsvCXlCVxPUubuyV7pVvKl7IWHyMvOharQwU2jB9meL1aM6Z6p8jSVtBEYw3ZhVzf
 +wvIBjrvZg7opDSbfjknrvln+f+WCxFj0qL6XTKTzlyGiaoFjOK7VSH7aSDA5ju75ZNWdNr1a8rnF
 iNUgurSQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=jZHkS4QR
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to version
 2.36.5
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bugfix release, including the patch that can be now removed, and
security patches for CVE-2022-32792, CVE-2022-32816, and CVE-2022-2294.

Release notes:

  https://wpewebkit.org/release/wpewebkit-2.36.5.html

Accompanying security advisory:

  https://wpewebkit.org/security/WSA-2022-0007.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...5034-WebKitTestRunner-shouldn-t-link.patch | 58 -------------------
 package/wpewebkit/wpewebkit.hash              |  9 +--
 package/wpewebkit/wpewebkit.mk                |  2 +-
 3 files changed, 6 insertions(+), 63 deletions(-)
 delete mode 100644 package/wpewebkit/0001-Revert-Merge-r295034-WebKitTestRunner-shouldn-t-link.patch

diff --git a/package/wpewebkit/0001-Revert-Merge-r295034-WebKitTestRunner-shouldn-t-link.patch b/package/wpewebkit/0001-Revert-Merge-r295034-WebKitTestRunner-shouldn-t-link.patch
deleted file mode 100644
index d1edd36660..0000000000
--- a/package/wpewebkit/0001-Revert-Merge-r295034-WebKitTestRunner-shouldn-t-link.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From a780527a1b79538f1e1f5144e9b522d0927a2312 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Wed, 13 Jul 2022 00:53:48 +0300
-Subject: [PATCH] Revert "Merge r295034 - WebKitTestRunner shouldn't link
- object files of JavaScriptCore and WebCore"
-
-This reverts commit 7916fda00b347ff263fbfe72c065032d1d9b523c.
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-[Upstream status: https://bugs.webkit.org/show_bug.cgi?id=241002]
-
----
- Source/JavaScriptCore/CMakeLists.txt     | 12 +++++++++---
- Tools/WebKitTestRunner/CMakeLists.txt    |  1 -
- Tools/WebKitTestRunner/PlatformGTK.cmake |  4 ++++
- Tools/WebKitTestRunner/PlatformWin.cmake |  4 ++++
- 4 files changed, 17 insertions(+), 4 deletions(-)
-
-diff --git a/Source/JavaScriptCore/CMakeLists.txt b/Source/JavaScriptCore/CMakeLists.txt
-index 95a1300ce1b3..238208eb1137 100644
---- a/Source/JavaScriptCore/CMakeLists.txt
-+++ b/Source/JavaScriptCore/CMakeLists.txt
-@@ -456,7 +456,7 @@ if (MSVC AND NOT ENABLE_C_LOOP)
-         COMMAND ${MASM_EXECUTABLE} ${LLINT_MASM_FLAGS} ${JavaScriptCore_DERIVED_SOURCES_DIR}/LowLevelInterpreterWin.obj ${JavaScriptCore_DERIVED_SOURCES_DIR}/LowLevelInterpreterWin.asm
-         VERBATIM)
-     list(APPEND JavaScriptCore_SOURCES ${JavaScriptCore_DERIVED_SOURCES_DIR}/LowLevelInterpreterWin.obj)
--    add_library(LowLevelInterpreterLib STATIC llint/LowLevelInterpreter.cpp)
-+    add_library(LowLevelInterpreterLib OBJECT llint/LowLevelInterpreter.cpp)
- else ()
-     # As there's poor toolchain support for using `.file` directives in
-     # inline asm (i.e. there's no way to avoid clashes with the `.file`
-@@ -465,7 +465,7 @@ else ()
-     # an object file. We only need to do this for LowLevelInterpreter.cpp
-     # and cmake doesn't allow us to introduce a compiler wrapper for a
-     # single source file, so we need to create a separate target for it.
--    add_library(LowLevelInterpreterLib STATIC llint/LowLevelInterpreter.cpp
-+    add_library(LowLevelInterpreterLib OBJECT llint/LowLevelInterpreter.cpp
-         ${JavaScriptCore_DERIVED_SOURCES_DIR}/${LLIntOutput})
- endif ()
- 
-@@ -1496,7 +1496,13 @@ if (CMAKE_COMPILER_IS_GNUCXX AND GCC_OFFLINEASM_SOURCE_MAP)
-         COMPILE_OPTIONS "-fno-lto")
- endif ()
- 
--list(APPEND JavaScriptCore_PRIVATE_LIBRARIES LowLevelInterpreterLib)
-+# When building JavaScriptCore as an object library, we need to make sure the
-+# lowlevelinterpreter lib objects get propogated.
-+if (${JavaScriptCore_LIBRARY_TYPE} STREQUAL "OBJECT")
-+    list(APPEND JavaScriptCore_PRIVATE_LIBRARIES $<TARGET_OBJECTS:LowLevelInterpreterLib>)
-+else ()
-+    list(APPEND JavaScriptCore_SOURCES $<TARGET_OBJECTS:LowLevelInterpreterLib>)
-+endif ()
- 
- WEBKIT_COMPUTE_SOURCES(JavaScriptCore)
- list(APPEND JavaScriptCore_SOURCES
--- 
-2.37.1
-
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 2a8205d40c..827df1e89a 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,8 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.36.4.tar.xz.sums
-md5  ba8e5f5444fd50f53906a7376b25bb26  wpewebkit-2.36.4.tar.xz
-sha1  91259642da6fe55446c3352eeeafdaa188fc14bd  wpewebkit-2.36.4.tar.xz
-sha256  307a3bedf5d4299a861f773f631c39a44c3e6276c3af37f7cbefaed2c8d7c021  wpewebkit-2.36.4.tar.xz
+
+# From https://wpewebkit.org/releases/wpewebkit-2.36.5.tar.xz.sums
+md5  99b9b0c3c8757edf03ddf550bea448e2  wpewebkit-2.36.5.tar.xz
+sha1  d7deb766d1ff48b7f9d685fcd67ccc23e2962288  wpewebkit-2.36.5.tar.xz
+sha256  f2461d533cd3820ea1855e2c8b0b0624b39add1389dc3ac09c2f27891a7a8caa  wpewebkit-2.36.5.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index cf58a4c14d..0deb36f28f 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.36.4
+WPEWEBKIT_VERSION = 2.36.5
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
