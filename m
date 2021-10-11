Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 648BFC433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:02:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BC2960F3A
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2BC2960F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAE1A608EA;
	Mon, 11 Oct 2021 21:02:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u0s_KMDVH8bm; Mon, 11 Oct 2021 21:02:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1BC6608F5;
	Mon, 11 Oct 2021 21:02:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D010F1BF279
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDCAE817EB
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:02:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MrwZZHrLKplp for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 21:02:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7E5C817B5
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 21:02:46 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 o10-20020a4aa80a000000b002b701f8ae85so1113223oom.4
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 14:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dQ72YmCmCLNR/+92WcoDjUmFXU1ZZpZtkgAlXP9sJPs=;
 b=NCUuf2eMnSAoID0QL2Zsxc8DDwKrrZzD3nDAA7UuRE0XEx8UMfPVI3c5eqZMHsdsuI
 7IhFiffRdVmIUaxeyScf6VTilv5E6DlsUxTs4j2GOyuvex/kITWUenHN5/9wZLSU2RN/
 Hb+V7qSwOqoGpuvbqKHdAjjdtMCakjqoKiPbnlg1wxIX61c2Jx58R4PJol/0t4pfSWkv
 R3dS1yAdsCOlTzw7k0s2aflBw1Wg7JXEE/5XCd0Kz2Zj01oi3ow6sdUeOi6FJQ9Iybrv
 1rBCsx9v1eUBlMxExvd4ARgjsd0VOHaRt2i+yDHo6h9JYyxN6ZTifSz97nqgn3LHh3z0
 OraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dQ72YmCmCLNR/+92WcoDjUmFXU1ZZpZtkgAlXP9sJPs=;
 b=krZW+1APE2+4sqwv+0dxO2IyQgYJ6fzfcsFrMiT9/Kw1mpas6QS0J3JoOCtg23rtJb
 VpOayWK6YaV2908FT2JHNF4ZGTZzOHEQ9eOfzQpyjASMI6JDI2cbKpSX1ZIK1BN4m+Rb
 HJ+Rw7qhVksT4+B6Xy6Enfg+NfyUgjVTwqnw1onbcHug45dpuN6Hd8B077iYZ5rRooLr
 NBr3DYtn3AKY37HLlbcIhcLgKvWWmeNHB14p/SshWYFDLllszPWjynMst7nmyLHT6VjB
 bBYPf6Qhq0F1Jf/hGzkdmecjUw66j7vCs0Nja8jTiJB+KSw4Fa2c2+/TgGos7x68pqLG
 nY3Q==
X-Gm-Message-State: AOAM530XsSMFaESebfAU34ZDYTkwDZqmLQmTZdV/6/aZbRZOrKyYNEUI
 8uAKjENUTZeh8Wto35a+dTL8celoV7Depk0A
X-Google-Smtp-Source: ABdhPJxDUeT4eB7lkmWlvOixlg3Rt7ChY3jiTvEQ0/OOu47dfWByhsuwgH5kITe7tpCPgU2GrlbQ3g==
X-Received: by 2002:a4a:e8c5:: with SMTP id h5mr20611649ooe.71.1633986164953; 
 Mon, 11 Oct 2021 14:02:44 -0700 (PDT)
Received: from localhost ([189.174.209.191])
 by smtp.gmail.com with UTF8SMTPSA id c9sm1358086otn.77.2021.10.11.14.02.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 14:02:44 -0700 (PDT)
From: Gleb Mazovetskiy <glex.spb@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Oct 2021 22:02:41 +0100
Message-Id: <20211011210241.396390-1-glex.spb@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211011210045.395407-1-glex.spb@gmail.com>
References: <20211011210045.395407-1-glex.spb@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/1] package: add smpq and stormlib
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
Cc: Gleb Mazovetskiy <glex.spb@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SMPQ is a utility for working with Blizzard MPQ archives and StormLib is
the library for doing this that it depends on.

SMPQ/StormLib is a runtime and/or build-time dependency of several
source ports / reimplementations of Blizzard games, such as DevilutionX.

These packages are already available in other distros, such as Debian.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>

---
Changes v2 -> v3:

  - Added missing patch files.

Changes v1 -> v2 (Sugested by Yann E. MORIN):

  - Converted sed substitutions to patch files.
  - Re-ordered mk variables per the suggested ordered.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 package/Config.in                             |  2 +
 .../smpq/0001-CMake-Set-language-to-C.patch   | 29 +++++++++++++++
 .../0002-CMake-Disable-version-check.patch    | 32 ++++++++++++++++
 ...0003-CMake-Disable-manual-generation.patch | 37 +++++++++++++++++++
 package/smpq/Config.in                        | 11 ++++++
 package/smpq/smpq.hash                        |  3 ++
 package/smpq/smpq.mk                          | 19 ++++++++++
 package/stormlib/Config.in                    |  8 ++++
 package/stormlib/stormlib.hash                |  3 ++
 package/stormlib/stormlib.mk                  | 16 ++++++++
 10 files changed, 160 insertions(+)
 create mode 100644 package/smpq/0001-CMake-Set-language-to-C.patch
 create mode 100644 package/smpq/0002-CMake-Disable-version-check.patch
 create mode 100644 package/smpq/0003-CMake-Disable-manual-generation.patch
 create mode 100644 package/smpq/Config.in
 create mode 100644 package/smpq/smpq.hash
 create mode 100644 package/smpq/smpq.mk
 create mode 100644 package/stormlib/Config.in
 create mode 100644 package/stormlib/stormlib.hash
 create mode 100644 package/stormlib/stormlib.mk

diff --git a/package/Config.in b/package/Config.in
index 9fed0ab4cb..890a6be135 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -74,6 +74,7 @@ menu "Compressors and decompressors"
 	source "package/p7zip/Config.in"
 	source "package/pigz/Config.in"
 	source "package/pixz/Config.in"
+	source "package/smpq/Config.in"
 	source "package/unrar/Config.in"
 	source "package/unzip/Config.in"
 	source "package/xz/Config.in"
@@ -1360,6 +1361,7 @@ menu "Compression and decompression"
 	source "package/lzo/Config.in"
 	source "package/minizip/Config.in"
 	source "package/snappy/Config.in"
+	source "package/stormlib/Config.in"
 	source "package/szip/Config.in"
 	source "package/zlib/Config.in"
 	source "package/zziplib/Config.in"
diff --git a/package/smpq/0001-CMake-Set-language-to-C.patch b/package/smpq/0001-CMake-Set-language-to-C.patch
new file mode 100644
index 0000000000..30624cc590
--- /dev/null
+++ b/package/smpq/0001-CMake-Set-language-to-C.patch
@@ -0,0 +1,29 @@
+From 70e43a4323f43d58a1b6c21bf251e7e8fe4cb345 Mon Sep 17 00:00:00 2001
+From: Gleb Mazovetskiy <glex.spb@gmail.com>
+Date: Mon, 11 Oct 2021 21:48:00 +0100
+Subject: [PATCH 1/3] CMake: Set language to C++
+
+Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
+---
+ CMakeLists.txt | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 291bf7f..71fb61f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -18,6 +18,11 @@
+ #
+ 
+ project(SMPQ)
++
++# StormLib is C++ and must be linked with a C++ linker (e.g. via g++ instead of gcc).
++file(GLOB_RECURSE CFILES "${CMAKE_SOURCE_DIR}/*.c")
++SET_SOURCE_FILES_PROPERTIES(${CFILES} PROPERTIES LANGUAGE CXX)
++
+ set(VERSION 1.6)
+ cmake_minimum_required(VERSION 2.6)
+ 
+-- 
+2.30.2
+
diff --git a/package/smpq/0002-CMake-Disable-version-check.patch b/package/smpq/0002-CMake-Disable-version-check.patch
new file mode 100644
index 0000000000..6333595849
--- /dev/null
+++ b/package/smpq/0002-CMake-Disable-version-check.patch
@@ -0,0 +1,32 @@
+From bce50c41d461dc53d304cd41efc561bc9fa01327 Mon Sep 17 00:00:00 2001
+From: Gleb Mazovetskiy <glex.spb@gmail.com>
+Date: Mon, 11 Oct 2021 21:48:32 +0100
+Subject: [PATCH 2/3] CMake: Disable version check
+
+Version check is currently broken. Disable it.
+
+Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
+---
+ CMakeLists.txt | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 71fb61f..2375b36 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -46,12 +46,6 @@ if(NOT STORMLIB_INCLUDE_DIR OR NOT STORMLIB_LIBRARY)
+ 		message(FATAL_ERROR "StormLib or storm library not found")
+ 	endif(NOT STORMLIB_LIBRARY)
+
+-	try_compile(CHECK ${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/check.c COMPILE_DEFINITIONS -I${STORMLIB_INCLUDE_DIR})
+-
+-	if(NOT CHECK)
+-		message(FATAL_ERROR "Found old StormLib version")
+-	endif(NOT CHECK)
+-
+ 	message(STATUS "Found StormLib header: ${STORMLIB_INCLUDE_DIR}/StormLib.h")
+ 	message(STATUS "Found StormLib library: ${STORMLIB_LIBRARY}")
+
+--
+2.30.2
+
diff --git a/package/smpq/0003-CMake-Disable-manual-generation.patch b/package/smpq/0003-CMake-Disable-manual-generation.patch
new file mode 100644
index 0000000000..c293237cc9
--- /dev/null
+++ b/package/smpq/0003-CMake-Disable-manual-generation.patch
@@ -0,0 +1,37 @@
+From 6102660ba5ad0e8217e617fc53a6fc3d1bb12966 Mon Sep 17 00:00:00 2001
+From: Gleb Mazovetskiy <glex.spb@gmail.com>
+Date: Mon, 11 Oct 2021 21:49:57 +0100
+Subject: [PATCH 3/3] CMake: Disable manual generation
+
+We do not need the manual in buildroot and there is currently no
+dedicated way to disable it.
+
+Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
+---
+ CMakeLists.txt | 10 ----------
+ 1 file changed, 10 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2375b36..3a8b7c2 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -101,16 +101,6 @@ if(WITH_CMD)
+ 
+ 	install(TARGETS smpq DESTINATION bin)
+ 
+-	if(NOT CMAKE_CROSSCOMPILING)
+-
+-		add_executable(mangen ${MANGEN_SRCS})
+-		add_custom_command(OUTPUT smpq.1 COMMAND mangen > smpq.1 DEPENDS mangen)
+-		add_custom_target(man ALL DEPENDS smpq.1)
+-
+-		install(FILES ${CMAKE_CURRENT_BINARY_DIR}/smpq.1 DESTINATION share/man/man1)
+-
+-	endif(NOT CMAKE_CROSSCOMPILING)
+-
+ 	if(WIN32 AND WITH_NSIS)
+ 
+ 		find_package(SelfPackers REQUIRED)
+-- 
+2.30.2
+
diff --git a/package/smpq/Config.in b/package/smpq/Config.in
new file mode 100644
index 0000000000..589f5cf834
--- /dev/null
+++ b/package/smpq/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_SMPQ
+	bool "smpq"
+	select BR2_PACKAGE_SMPQ
+	help
+	  StormLib MPQ archiving utility
+
+	  This utility manipulates Blizzard MPQ archives.
+	  It supports extracting, appending, renaming and deleting files
+	  in MPQ archives, and creating new MPQ archives.
+
+	  https://launchpad.net/smpq
diff --git a/package/smpq/smpq.hash b/package/smpq/smpq.hash
new file mode 100644
index 0000000000..f14eaef49b
--- /dev/null
+++ b/package/smpq/smpq.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  b5d2dc8a5de8629b71ee5d3612b6e84d88418b86c5cd39ba315e9eb0462f18cb  smpq_1.6.orig.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/smpq/smpq.mk b/package/smpq/smpq.mk
new file mode 100644
index 0000000000..34f87f7f45
--- /dev/null
+++ b/package/smpq/smpq.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# smpq
+#
+################################################################################
+
+SMPQ_VERSION = 1.6
+SMPQ_SOURCE = smpq_$(SMPQ_VERSION).orig.tar.gz
+SMPQ_SITE = https://launchpad.net/smpq/trunk/$(SMPQ_VERSION)/+download
+SMPQ_LICENSE = GPL-3.0+
+SMPQ_LICENSE_FILES = LICENSE
+SMPQ_DEPENDENCIES = stormlib
+HOST_SMPQ_DEPENDENCIES = host-stormlib
+SMPQ_CONF_OPTS += -DWITH_KDE=OFF
+HOST_SMPQ_CONF_OPTS += -DWITH_KDE=OFF
+SMPQ_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
diff --git a/package/stormlib/Config.in b/package/stormlib/Config.in
new file mode 100644
index 0000000000..b2e4df3c62
--- /dev/null
+++ b/package/stormlib/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_STORMLIB
+	bool "stormlib"
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_ZLIB
+	help
+	  StormLib is a library that reads and writes Blizzard MPQ archives.
+
+	  https://github.com/ladislav-zezula/StormLib
diff --git a/package/stormlib/stormlib.hash b/package/stormlib/stormlib.hash
new file mode 100644
index 0000000000..dc5370b03d
--- /dev/null
+++ b/package/stormlib/stormlib.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  53b8befda3855a922e57a27f78c36feba7e9a32804da4b6592a3670c4e9cec98  stormlib-5ab093b7a57b8779dff06a08fac19d46c40b3329.tar.gz
+sha256  50b128e6750ed9d887e7a5748a6021238bb2f3bf34a5dd2768c410d932069e35  LICENSE
diff --git a/package/stormlib/stormlib.mk b/package/stormlib/stormlib.mk
new file mode 100644
index 0000000000..f2f7522002
--- /dev/null
+++ b/package/stormlib/stormlib.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# stormlib
+#
+################################################################################
+
+STORMLIB_VERSION = 5ab093b7a57b8779dff06a08fac19d46c40b3329
+STORMLIB_SITE = $(call github,ladislav-zezula,StormLib,$(STORMLIB_VERSION))
+STORMLIB_LICENSE = MIT
+STORMLIB_LICENSE_FILES = LICENSE
+STORMLIB_DEPENDENCIES = zlib bzip2
+HOST_STORMLIB_DEPENDENCIES = host-zlib host-bzip2
+STORMLIB_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
