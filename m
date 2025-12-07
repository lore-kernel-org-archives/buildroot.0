Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51259D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C784606D9;
	Sun,  7 Dec 2025 14:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d4l97ppC0lxv; Sun,  7 Dec 2025 14:43:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C85D60750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118617;
	bh=ATLLasaVWhtVgGCsJs3LUCqTC15+Lxmd2dwDRxe2j6M=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lc2YyPkavMiHnqKVDBe7CDW7yMT7HTffVhvd8+H7pvW+TzeSkjRdAPWx0JJy7Wlau
	 Xctw9YCEyeNw29MWhhxh2jvq/MydahdPJfI1RLb2PGlLcgaektDFLtpU71l12I/SrQ
	 tCLU+qBLGGVhSS2j1vGgmFzHxRV7EqarNJaXK2z2guq7NMoG/rSjh1+3LcxJ0MCLIE
	 KLhL7dJVLadfRktj7u7oMEY8Bc2oPB+ovALVOW3dTMyDfRaVaq8WTSrB8MDh5QaJRU
	 gxyogMVdrEFa17Ctwa04gsexkAR0IA0R85EXHmw0BKcdETY46LmkoQ+cPg33AUukcb
	 oUJfd1OB78UBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C85D60750;
	Sun,  7 Dec 2025 14:43:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E287D2CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4607821E1
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZ0jDXnUbaY8 for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:43:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 821CD821C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 821CD821C5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 821CD821C5
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:43:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 643FBA4C097A;
 Sun,  7 Dec 2025 15:42:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyF-00000000416-41fn;
 Sun, 07 Dec 2025 14:42:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:15 +0100
Message-ID: <20251207144243.3696572-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118573;
 bh=7rnHLMs4NYKgC0Cq53FZW0Y3J7jez6hOqW+g0z65yWA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=d2dErTbwNmodCkb/NSwF80HlbjEgP7RRKXowAfWTSRoG5FrpZmpIJG/NyBqEN5Z2S
 KIvIbMc6mn9mUEzQTHNer1BbIFgWVUWApiwbwoMfwuDTIFjyBrzyE2p7QFhsh6hFnL
 TX71WfNtbJ45fIFHU90SrjQmOFmfGTeY532UQXh8IuWCOCX8mPkYGxswtC1p80zhhD
 MLHSQtboqC+O06HUaJQGQ7CMYY/zU4u9gcfLVH/k/t4zwyiLGyDXDGh2dWLeH8Du0D
 G9dQIaqBSVRmBn3w4+YmpBsAYe5lUDpTImy9spLVNUlKkFboRQuH6gxg1ev9sbL9zo
 f+qcbrTrqDqwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=d2dErTbw
Subject: [Buildroot] [PATCH/next 06/33] package/oatpp: bump version to 1.3.1
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
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch which is included in this release.

Backported bump to fix cmake 4 compatibility.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/oatpp/0001-cmake4.patch               | 22 +++++++++++
 ...base-Environment.hpp-include-cstdarg.patch | 39 -------------------
 package/oatpp/oatpp.hash                      |  2 +-
 package/oatpp/oatpp.mk                        |  2 +-
 4 files changed, 24 insertions(+), 41 deletions(-)
 create mode 100644 package/oatpp/0001-cmake4.patch
 delete mode 100644 package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch

diff --git a/package/oatpp/0001-cmake4.patch b/package/oatpp/0001-cmake4.patch
new file mode 100644
index 0000000000..5dffdff802
--- /dev/null
+++ b/package/oatpp/0001-cmake4.patch
@@ -0,0 +1,22 @@
+From 06232810f7c23cc8a91864a504df412255a370b6 Mon Sep 17 00:00:00 2001
+From: Leonid Stryzhevskyi <lganzzzo@gmail.com>
+Date: Tue, 23 Apr 2024 01:20:20 +0300
+Subject: [PATCH] refactor json namespaces
+
+Upstream: https://github.com/oatpp/oatpp/commit/06232810f7c23cc8a91864a504df412255a370b6
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported only the cmake bump]
+---
+ CMakeLists.txt                                |  2 +-
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9d41c8b2e..14ab71acf 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.1 FATAL_ERROR)
++cmake_minimum_required(VERSION 3.25 FATAL_ERROR)
+ 
+ file(STRINGS "${CMAKE_CURRENT_LIST_DIR}/src/oatpp/core/base/Environment.hpp" OATPP_VERSION_MACRO REGEX "#define OATPP_VERSION \"[0-9]+.[0-9]+.[0-9]+\"$")
+ string(REGEX REPLACE "#define OATPP_VERSION \"([0-9]+.[0-9]+.[0-9]+)\"$" "\\1" oatpp_VERSION "${OATPP_VERSION_MACRO}")
diff --git a/package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch b/package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch
deleted file mode 100644
index 33fa04a2f2..0000000000
--- a/package/oatpp/0001-src-oatpp-core-base-Environment.hpp-include-cstdarg.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 6ac376cec5c9573abf3ee3b82e71bd2b7e410dad Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 23 Nov 2023 22:45:56 +0100
-Subject: [PATCH] src/oatpp/core/base/Environment.hpp: include cstdarg
-
-Include cstdarg to fix the following build failure with uclibc-ng:
-
-In file included from /home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/algorithm/CRC.hpp:28,
-                 from /home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/algorithm/CRC.cpp:25:
-/home/autobuild/autobuild/instance-4/output-1/build/oatpp-1.3.0/src/oatpp/core/base/Environment.hpp:359:93: error: 'va_list' has not been declared
-  359 |   static void vlogFormatted(v_uint32 priority, const std::string& tag, const char* message, va_list args);
-      |                                                                                             ^~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/bcdf7548ff752f936defd111d13c63245ea70cbe
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/oatpp/oatpp/commit/1d11558e2cbbabc0db02a233bf00d651ce5ea758
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- src/oatpp/core/base/Environment.hpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/oatpp/core/base/Environment.hpp b/src/oatpp/core/base/Environment.hpp
-index 984afdf2a7f5..2eb18be3e196 100644
---- a/src/oatpp/core/base/Environment.hpp
-+++ b/src/oatpp/core/base/Environment.hpp
-@@ -28,6 +28,7 @@
- 
- #include "./Config.hpp"
- 
-+#include <cstdarg>
- #include <cstdio>
- #include <atomic>
- #include <mutex>
--- 
-2.43.0
-
diff --git a/package/oatpp/oatpp.hash b/package/oatpp/oatpp.hash
index e6b35d8d51..4afb27f012 100644
--- a/package/oatpp/oatpp.hash
+++ b/package/oatpp/oatpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e1f80fa8fd7a74da6737e7fee1a4db68b4d7085a3f40e7d550752d6ff5714583  oatpp-1.3.0.tar.gz
+sha256  9dd31f005ab0b3e8895a478d750d7dbce99e42750a147a3c42a9daecbddedd64  oatpp-1.3.1.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/oatpp/oatpp.mk b/package/oatpp/oatpp.mk
index d3f6e1a9c2..e1ca3fb16c 100644
--- a/package/oatpp/oatpp.mk
+++ b/package/oatpp/oatpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OATPP_VERSION = 1.3.0
+OATPP_VERSION = 1.3.1
 OATPP_SITE = $(call github,oatpp,oatpp,$(OATPP_VERSION))
 OATPP_LICENSE = Apache-2.0
 OATPP_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
