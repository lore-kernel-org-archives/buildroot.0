Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACC0C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 21:56:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1605260E78
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 21:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1605260E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEC4140600;
	Mon, 18 Oct 2021 21:56:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CZyIN2-uG-ma; Mon, 18 Oct 2021 21:56:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04F8D405E4;
	Mon, 18 Oct 2021 21:56:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 327ED1BF36A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 21:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 218C5405E3
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 21:56:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rmQPz_EM-TQK for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 21:56:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B72F9405E4
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 21:56:44 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r18so43900584wrg.6
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 14:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JaiFes1i6B0mR2LRX7/aO3TAWojfsNNHlIndJ341S3s=;
 b=kgG+GaBgfyDXlu4p8qizHzSjvjwYsZhQouWL68UYDFH9aTgHRac/SbbonQ2t6pdpk6
 4uNmZRMwrATZ27suze0xUhtoM8BEIUsomSwM8TKfJDw4j3VGbAIwxA2buQrVwb+7K5uE
 H1puimBcHrbyJP5+dnbtg7rTWa698HTqh1qFJXhF2PYWgxRLr/2cBA3iB+c2EReZTjU0
 iPpiZnH3IenU0q4mVHEoshOeaya2XTLeKGx9/I4ndCL6kbpmn4JnWC8XYIF/Y2xwQ0br
 rATA5vS/5K4GrMdwlMdF5Eerrb/57SzeyZ0fchRJLOoqy1WoxEjfaF+syCiUfxtWTk15
 zEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JaiFes1i6B0mR2LRX7/aO3TAWojfsNNHlIndJ341S3s=;
 b=3Deq0DjGE7Srau2piYjUxKdvqC+YFZc4eJ912xsvWNMPTReCwjxCiKZ4tpEqZtC0JZ
 1MHSKawSR9Eov5Ks8oub8yiSHnwHLofJZDVfqgvS1mOab2OrLRFwGj1wNZQpPWd+qRpN
 3tJeoUhWcfjXNjW5DcLHLt6uxCTMXOjrQmaf73+eM+Djzco9AhJNhBk/b3ucvK1V7P3n
 mPIEKMhJqIyhY1emzxQsVUet1MSMXzgIp/rg4tlyBqNyHlC6MkaqyF/7+0b6vqL54Ucg
 prHSgysLSC0w44aeCUUo7G0oBGWJihe0wY+1IHs/mVhrDuIDzoCT3hG49vFIdZI8Ozkb
 EIeA==
X-Gm-Message-State: AOAM532dMCHsPr7ft9gKw1z+256mfBKbCeHx2/TS/ggSTo7mLbwcgbQe
 tCzUqgp6g+dSOLH4n9cLWBHQ44R+3FY=
X-Google-Smtp-Source: ABdhPJy/7F6LkoVoJ+ik8cL76vM5tZMKS8+OobOAPx8VfIgbe0O1fTKwmPtNsZzPxDGBe6aSggJYAw==
X-Received: by 2002:adf:bb81:: with SMTP id q1mr39658888wrg.119.1634594202616; 
 Mon, 18 Oct 2021 14:56:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id r205sm559016wma.3.2021.10.18.14.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 14:56:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 23:55:27 +0200
Message-Id: <20211018215527.1515324-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/supertux: bump to version 0.6.2
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patches (already in version)
- Update hash of data/AUTHORS and add CC-BY-SA-4.0 license:
  https://github.com/SuperTux/supertux/commit/ca4ff139cac360ade7dbe78746b17c854243a5e6

https://github.com/SuperTux/supertux/blob/v0.6.2/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../supertux/0001-Fix-build-on-PowerPC.patch  | 81 -------------------
 .../0002-Fix-build-with-boost-1-73.patch      | 25 ------
 package/supertux/supertux.hash                |  4 +-
 package/supertux/supertux.mk                  |  4 +-
 4 files changed, 4 insertions(+), 110 deletions(-)
 delete mode 100644 package/supertux/0001-Fix-build-on-PowerPC.patch
 delete mode 100644 package/supertux/0002-Fix-build-with-boost-1-73.patch

diff --git a/package/supertux/0001-Fix-build-on-PowerPC.patch b/package/supertux/0001-Fix-build-on-PowerPC.patch
deleted file mode 100644
index e40abac6b0..0000000000
--- a/package/supertux/0001-Fix-build-on-PowerPC.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From cfcd478fe69ca1b3923f388a349a4f67ac2c03aa Mon Sep 17 00:00:00 2001
-From: Shawn Anastasio <shawn@anastas.io>
-Date: Sun, 3 Feb 2019 13:22:57 -0600
-Subject: [PATCH] Fix build on PowerPC
-
-On PowerPC-based architectures, SDL includes the altivec.h header
-for SIMD intrinsics. Unfortunately, altivec.h defines some types which
-conflict with C++ types like bool and std::vector. This commit adds
-a wrapper for altivec.h which resolves these conflicts and allows
-supertux to build and run.
-
-Tested on a ppc64le workstation.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/SuperTux/supertux/pull/1056/commits/cfcd478fe69ca1b3923f388a349a4f67ac2c03aa]
----
- CMakeLists.txt    | 15 ++++++++++++++-
- src/ppc/altivec.h |  6 ++++++
- 2 files changed, 20 insertions(+), 1 deletion(-)
- create mode 100644 src/ppc/altivec.h
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 70b9673b50..b9b6ea3ea6 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -376,6 +376,11 @@ endif()
- 
- include(ConfigureChecks)
- 
-+# Include altivec wrapper on ppc
-+if(CMAKE_SYSTEM_PROCESSOR MATCHES "^ppc.*")
-+  include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/ppc)
-+endif()
-+
- 
- ## Also build external/squirrel
- 
-@@ -420,6 +425,13 @@ if(NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/external/tinygettext/CMakeLists.txt)
-   message(FATAL_ERROR "tinygettext submodule is not checked out or ${CMAKE_CURRENT_SOURCE_DIR}/external/tinygettext/CMakeLists.txt is missing")
- endif()
- 
-+# Include altivec wrapper on ppc
-+if(CMAKE_SYSTEM_PROCESSOR MATCHES "^ppc.*")
-+  set(TINYGETTEXT_CXX_FLAGS "-isystem ${CMAKE_CURRENT_SOURCE_DIR}/src/ppc ${CMAKE_CXX_FLAGS}")
-+else()
-+  set(TINYGETTEXT_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
-+endif()
-+
- set(TINYGETTEXT_PREFIX ${CMAKE_BINARY_DIR}/tinygettext/)
- ExternalProject_Add(tinygettext
-   SOURCE_DIR "${CMAKE_SOURCE_DIR}/external/tinygettext/"
-@@ -428,7 +440,7 @@ ExternalProject_Add(tinygettext
-   -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
-   -DCMAKE_C_FLAGS=${CMAKE_C_FLAGS}
-   -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
--  -DCMAKE_CXX_FLAGS=${CMAKE_CXX_FLAGS}
-+  -DCMAKE_CXX_FLAGS=${TINYGETTEXT_CXX_FLAGS}
-   -DBUILD_SHARED_LIBS=OFF
-   -DHAVE_SDL=ON
-   -DVCPKG_BUILD=${VCPKG_BUILD}
-@@ -443,6 +455,7 @@ set_target_properties(tinygettext_lib PROPERTIES IMPORTED_LOCATION "${TINYGETTEX
- 
- include_directories(SYSTEM ${TINYGETTEXT_PREFIX}/include)
- 
-+
- ## external/SDL_ttf with patches
- find_package(Freetype REQUIRED)
- find_package(RAQM)
-diff --git a/src/ppc/altivec.h b/src/ppc/altivec.h
-new file mode 100644
-index 0000000000..7ede8246ed
---- /dev/null
-+++ b/src/ppc/altivec.h
-@@ -0,0 +1,6 @@
-+#include_next <altivec.h>
-+
-+// The altivec headers redefine vector and bool which conflict
-+// with C++'s bool type and std::vector. Undefine them here.
-+#undef vector
-+#undef bool
diff --git a/package/supertux/0002-Fix-build-with-boost-1-73.patch b/package/supertux/0002-Fix-build-with-boost-1-73.patch
deleted file mode 100644
index 000e5abcab..0000000000
--- a/package/supertux/0002-Fix-build-with-boost-1-73.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 4221d54385b69d6c40eff2c67bc6bad7ed165a44 Mon Sep 17 00:00:00 2001
-From: Lars Wendler <polynomial-c@gentoo.org>
-Date: Sat, 9 May 2020 03:04:02 +0200
-Subject: [PATCH] Fix build with boost-1.73
-
-[Retrieved from:
-https://github.com/SuperTux/supertux/commit/4221d54385b69d6c40eff2c67bc6bad7ed165a44]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/editor/object_settings.hpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/editor/object_settings.hpp b/src/editor/object_settings.hpp
-index bc9049a94e..15b77b1e46 100644
---- a/src/editor/object_settings.hpp
-+++ b/src/editor/object_settings.hpp
-@@ -22,6 +22,8 @@
- 
- #include "editor/object_option.hpp"
- 
-+#include <algorithm>
-+
- class Color;
- enum class Direction;
- enum class WalkMode;
diff --git a/package/supertux/supertux.hash b/package/supertux/supertux.hash
index 2b3ca799d7..a6a515f912 100644
--- a/package/supertux/supertux.hash
+++ b/package/supertux/supertux.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  c4c3e5fa6f90e87b8c5ad6b22a179e9a9839bf997e7f219e22bbcd1c97223ac0  SuperTux-v0.6.0-Source.tar.gz
+sha256  26a9e56ea2d284148849f3239177d777dda5b675a10ab2d76ee65854c91ff598  SuperTux-v0.6.2-Source.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.txt
-sha256  35c61f69239ff2f55fe0fa5dee5bad6bff311a07c47fa049552e0973a47c07bb  data/AUTHORS
+sha256  09645215102c1013a1ef8c16a30bacdb9a78924ca064372290405fabd3e7074d  data/AUTHORS
diff --git a/package/supertux/supertux.mk b/package/supertux/supertux.mk
index e4a4630918..3587aefe3a 100644
--- a/package/supertux/supertux.mk
+++ b/package/supertux/supertux.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-SUPERTUX_VERSION = 0.6.0
+SUPERTUX_VERSION = 0.6.2
 SUPERTUX_SITE = https://github.com/SuperTux/supertux/releases/download/v$(SUPERTUX_VERSION)
 SUPERTUX_SOURCE = SuperTux-v$(SUPERTUX_VERSION)-Source.tar.gz
 
 # Supertux itself is GPL-3.0+, but it bundles a few libraries with different
 # licenses (sexp-cpp, squirrel, tinygettext) which are linked statically.
-SUPERTUX_LICENSE = GPL-3.0+ (code), CC-BY-SA-2.0, CC-BY-SA-3.0, GPL-2.0+ (images music sounds)
+SUPERTUX_LICENSE = GPL-3.0+ (code), CC-BY-SA-2.0, CC-BY-SA-3.0, CC-BY-SA-4.0, GPL-2.0+ (images music sounds)
 SUPERTUX_LICENSE_FILES = LICENSE.txt data/AUTHORS
 
 # Use bundled squirrel, tinygettext sexp-cpp packages which are hardcoded in
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
