Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4B4D1BDE7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC30361B0E;
	Wed,  3 Dec 2025 22:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMawlsrwoT5E; Wed,  3 Dec 2025 22:04:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B772561B17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799486;
	bh=aHjWOb/MonrCTtWwKHGRpjPDzqNi0qK8ZEDB8dqyK6c=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NBWV+oTtcMUgJ0eYy6np4SGluYSubqO3LWH0mnS1iP+QItkr7DZTmHUvlRL5LUVLm
	 KBOBOiUD4lFqdsPA/MGuqt43wFU7wmo0IUYZO/iLlb+zuwqQBsxAV1btwcWmkqNVaa
	 7FWa9pnkfbhbkWtliZYbNkVZG4BvKhH+Ln4pVYAEWWJAl7BAn9xEkbC8TBXTOizxWV
	 1Kkjy6sQQ+GhEysfjdAaL7KHhUKfZYQOAZZlEaaALJDc2FYPg19lKmK8XpCIwyF/JD
	 G+MC/Zb+CKeiR285jQRSyCgz4sEdwCAlhXkD6kbtjq6/BhMTxtWNThkgQI2ldkB/di
	 rxQlaphFcLlPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B772561B17;
	Wed,  3 Dec 2025 22:04:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A7D23D3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99AFE617A4
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FCiqbaWpL1Bs for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:04:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7CD1261B0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CD1261B0E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CD1261B0E
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:04:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 12520A4C79D4;
 Wed,  3 Dec 2025 22:59:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56204)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQuqh-000000002OS-40LZ;
 Wed, 03 Dec 2025 21:57:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Dec 2025 22:57:18 +0100
Message-ID: <20251203215723.2323032-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203215723.2323032-1-bernd@kuhls.net>
References: <20251203215723.2323032-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799147;
 bh=S5+f8hRCzJAmnjB90iqksM9chkHlyfpVWSA5L7tIk34=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=J26FsiRm80HM/UOY81mZF5lUGCvbF75ry0dWe+tnUNyZVE7y8iE8oZ/xIEiuwUrVS
 gCG0fdVZyP+Xlpmh+eUS7wfN5sfTNFAG/LQ4ZUud2+MrakQSEECFKVpb7R+ixBYLHg
 nK+iJEsBw2KTfPu/Rt6Z3piVpEDf7CFycdVgwDeINNEVCrjweS/t10GuCrQTj+SqHd
 SyGPCALfYL5N/oMvJOqybcuqye+xfERU87CzyfMa66vrvXNM8XY4n0zHsphQ3nojsH
 4vdjn5i6RXg2alPy/6SK5IL9bXqtj72RZbaL6TGisHlNzn+XySBw/ofWyEbI/E19lT
 0WZJU/+WUjhnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=J26FsiRm
Subject: [Buildroot] [PATCH/next 11/16] package/libcorrect: bump version,
 fix cmake 4 compatibility
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, RJ Ascani <rj.ascani@gmail.com>,
 Daniel Nicoletti <dantti12@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch 0001 which is included in this release.

Added new patch 0001 which fixes build with cmake 4.

Added Upstream: tag to patch 0002.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 ...ists.txt-conditionally-use-Wpedantic.patch | 42 -------------------
 ...make_minimum_required-to-Version-3.5.patch | 24 +++++++++++
 ...-conditionally-use-fsanitize-address.patch |  2 +
 package/libcorrect/libcorrect.hash            |  2 +-
 package/libcorrect/libcorrect.mk              |  2 +-
 6 files changed, 28 insertions(+), 45 deletions(-)
 delete mode 100644 package/libcorrect/0001-CMakeLists.txt-conditionally-use-Wpedantic.patch
 create mode 100644 package/libcorrect/0001-bumped-cmake_minimum_required-to-Version-3.5.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 1721d8f4d8..b7d66c3be2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -526,7 +526,6 @@ package/libb64/0002-Initialize-C++-objects.patch lib_patch.Upstream
 package/libcdaudio/0001-libcdaudio-enable-autoreconf.patch lib_patch.Upstream
 package/libcgicc/0001-disable-documentation-option.patch lib_patch.Sob lib_patch.Upstream
 package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch lib_patch.Upstream
-package/libcorrect/0002-CMakeLists.txt-conditionally-use-fsanitize-address.patch lib_patch.Upstream
 package/libcuefile/0001-fix-static-link.patch lib_patch.Upstream
 package/libdaemon/0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch lib_patch.Upstream
 package/libdnet/0001-python-makefile.patch lib_patch.Upstream
diff --git a/package/libcorrect/0001-CMakeLists.txt-conditionally-use-Wpedantic.patch b/package/libcorrect/0001-CMakeLists.txt-conditionally-use-Wpedantic.patch
deleted file mode 100644
index 77e29ad833..0000000000
--- a/package/libcorrect/0001-CMakeLists.txt-conditionally-use-Wpedantic.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 8fc28b4c4c01581b25220fdbc1eeda196e399256 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Wed, 10 Oct 2018 09:28:00 +0200
-Subject: [PATCH] CMakeLists.txt: conditionally use -Wpedantic
-
--Wpedantic is only provided by gcc >= 4.8. Since showing pedantic
-warnings is not really mandatory, let's only use this option when the
-compiler supports it.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://github.com/quiet/libcorrect/pull/25
----
- CMakeLists.txt | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 193f311..e570198 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -3,13 +3,18 @@ project(Correct C)
- include(CheckLibraryExists)
- include(CheckIncludeFiles)
- include(CheckCSourceCompiles)
-+include(CheckCCompilerFlag)
- 
- if(MSVC)
- set(LIBM "")
- set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /W4")
- else(MSVC)
- set(LIBM "m")
--set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC -std=c99 -Wpedantic -Wall")
-+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC -std=c99 -Wall")
-+check_c_compiler_flag(-Wpedantic COMPILER_SUPPORTS_WPEDANTIC)
-+if(COMPILER_SUPPORTS_WPEDANTIC)
-+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wpedantic")
-+endif()
- if(CMAKE_BUILD_TYPE STREQUAL "Debug")
-     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g3 -O0 -fsanitize=address")
-     set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-no_pie,")
--- 
-2.14.4
-
diff --git a/package/libcorrect/0001-bumped-cmake_minimum_required-to-Version-3.5.patch b/package/libcorrect/0001-bumped-cmake_minimum_required-to-Version-3.5.patch
new file mode 100644
index 0000000000..95e76ee43f
--- /dev/null
+++ b/package/libcorrect/0001-bumped-cmake_minimum_required-to-Version-3.5.patch
@@ -0,0 +1,24 @@
+From 8e779493cd1597b8a9c50ff48f97d4e5d10f96d6 Mon Sep 17 00:00:00 2001
+From: Tobias Wellnitz <tobias@dh1tw.de>
+Date: Sat, 27 Sep 2025 23:51:48 +0200
+Subject: [PATCH] bumped cmake_minimum_required to Version 3.5
+
+Modern Cmake versions require cmake_mininum_required to be at least Version 3.5
+
+Upstream: https://github.com/quiet/libcorrect/pull/50
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2e8e07e..67ea044 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ project(Correct C)
+ include(CheckLibraryExists)
+ include(CheckIncludeFiles)
diff --git a/package/libcorrect/0002-CMakeLists.txt-conditionally-use-fsanitize-address.patch b/package/libcorrect/0002-CMakeLists.txt-conditionally-use-fsanitize-address.patch
index 82e4f13e66..dc0c18e063 100644
--- a/package/libcorrect/0002-CMakeLists.txt-conditionally-use-fsanitize-address.patch
+++ b/package/libcorrect/0002-CMakeLists.txt-conditionally-use-fsanitize-address.patch
@@ -8,6 +8,8 @@ Check that compiler supports -fsanitize=address before using it
 Fixes:
  - http://autobuild.buildroot.net/results/221d6a418e75b39fe645c3a56cee676518d2cff6
 
+Upstream: https://github.com/quiet/libcorrect/pull/26
+
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  CMakeLists.txt | 6 +++++-
diff --git a/package/libcorrect/libcorrect.hash b/package/libcorrect/libcorrect.hash
index 4c6289fb82..0385abeb8c 100644
--- a/package/libcorrect/libcorrect.hash
+++ b/package/libcorrect/libcorrect.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  79861750540fb3a1cc501ee217cb4d1febc4855f3fb82e5eb60906eec5379890  libcorrect-ce6c17f1f988765ae3695315d7cce1f2a2e6cf0d.tar.gz
+sha256  5a4305aabe6c7d5b58f6677c41c54ad5e8d9003f7a5998f7344d93534e4c5760  libcorrect-f5a28c74fba7a99736fe49d3a5243eca29517ae9.tar.gz
 sha256  135138cd4304aa637836758dc5edfb5f21b7d09ecc637d25288d206b151a5768  LICENSE
diff --git a/package/libcorrect/libcorrect.mk b/package/libcorrect/libcorrect.mk
index 0a84aa5c26..9f2beb1d4a 100644
--- a/package/libcorrect/libcorrect.mk
+++ b/package/libcorrect/libcorrect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCORRECT_VERSION = ce6c17f1f988765ae3695315d7cce1f2a2e6cf0d
+LIBCORRECT_VERSION = f5a28c74fba7a99736fe49d3a5243eca29517ae9
 LIBCORRECT_SITE = $(call github,quiet,libcorrect,$(LIBCORRECT_VERSION))
 LIBCORRECT_LICENSE = BSD-3-Clause
 LIBCORRECT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
