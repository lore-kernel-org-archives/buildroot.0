Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A79C76196
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 18:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2BAC40112;
	Tue, 11 Apr 2023 18:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2BAC40112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CfT3-tjpWqzd; Tue, 11 Apr 2023 18:31:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A573A4016B;
	Tue, 11 Apr 2023 18:31:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A573A4016B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C92B91C2E56
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 18:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2C3881C46
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 18:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2C3881C46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TmBPdoebY4Ru for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 18:31:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00E4781BD6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00E4781BD6
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 18:31:51 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id e2so8464528wrc.10
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 11:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681237910;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TveNCl/u47Hkwb0VIK7Xw0kiSr/JuB+x2BkGDhdr7As=;
 b=Bn3mUPeEJ687CLC2G+CNI4XXityQZ+httbrQ22blUieihCv6H+tt0+lLp/Z8VPZooE
 mjNwoH3pcCSF9CoHAVMNOcO7Og4N7SDRVCHVU2HM+nYwvwXx76n6Ly76MEQ27C9g8Nrd
 KWqy6oOTxt50GjotqXRXrZV2wF86qwxsmpdmbIWjA+zGM/AXdMB6S9dcCxHooh0kXukz
 FHvZRvMzFRG8sCAtTFBmuKVyXtJaPYaBYlLkAld8dtz9sl0sDyxs+cc9hFg5UWJzsgf3
 x91uvCbr31TT7xSbuoce1jSPHBFpF1UYCHcsTpKrMUNkD5BTYqDJrsNT6wr4szdmv/Ow
 o6lw==
X-Gm-Message-State: AAQBX9c/OLmyHBA/YA3yduGup1/ugebnWzS3RE2CGqcvAFXYahUd26gE
 ufUVEnanqp1sFQtZaPdvTL9iMQW6Dq8=
X-Google-Smtp-Source: AKy350ZkH7WUOrsOMT9W58t/8kJ23GZD5kVxjGGQwQFEPKMyOg0CxY5o9E7IoS96Z7GhD7aTGfXpQg==
X-Received: by 2002:adf:fb50:0:b0:2e4:cbbe:cfc2 with SMTP id
 c16-20020adffb50000000b002e4cbbecfc2mr9527106wrs.25.1681237909582; 
 Tue, 11 Apr 2023 11:31:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f4-20020adff8c4000000b002cff06039d7sm15181281wrq.39.2023.04.11.11.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 11:31:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Apr 2023 20:31:45 +0200
Message-Id: <20230411183145.6751-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681237910;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TveNCl/u47Hkwb0VIK7Xw0kiSr/JuB+x2BkGDhdr7As=;
 b=QqLskjcPtCWrsR2LsqgatVUpOXSEdGa5Yj6kjyalUSz/OJuA2uzmEIr3ymZzZPq4N1
 f6FORkCjT5a51FJFJotIj6akofdcmUO9v9xtEF0Ko/S3EhI2jkr2kTCthm3rwE4ZgpNg
 g1fMAR0/WNJRhKYyFmSae4Btt/ojbAoT6Pzry/zEnQ0b099/1BtGjcglHAm6tW5M2gcB
 GPMOEuAkbY8J3iLStfQqgGNgm753aUi3Ns4a1C+vqWZfcizw1DZQZEUP9h27TPN04oi7
 1rE5rb0XZZtwAVWvMaU9NSWfVlRDqhM+d1yyZC1LY7LZDlZCwIU4Rz49vsizlIaPe7km
 dEJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QqLskjcP
Subject: [Buildroot] [PATCH v4,1/1] package/zeek: bump to version 5.2.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Handle build and install of gen-zam
- Disable new spicy option (work is still needed to cross-compile it)
- Disable unit tests (as they are now enabled by default)
- Update hash of COPYING (year updated with
  https://github.com/zeek/zeek/commit/273126a87b8f7134b81439ae31343c7b45d2a421)
- Update hash of COPYING.3rdparty (path updated, filessystem added and
  file renamed with
  https://github.com/zeek/zeek/commit/72cbc7cd13b7c1bda98658104431c3b530ff68d6
  https://github.com/zeek/zeek/commit/b77f5fa14cc1b64572b70f80366e1ba56f87503c
  https://github.com/zeek/zeek/commit/4f6f46a4043b092b40c01d91a57c5ff273ab433a)
- This bump will fix the following build failure with python >= 3.11:

In file included from /home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/3rdparty/pybind11/include/pybind11/attr.h:13,
                 from /home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/3rdparty/pybind11/include/pybind11/pybind11.h:45,
                 from /home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/3rdparty/pybind11/include/pybind11/functional.h:12,
                 from /home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/_broker.cpp:13:
/home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/3rdparty/pybind11/include/pybind11/cast.h: In function 'std::string pybind11::detail::error_string()':
/home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/3rdparty/pybind11/include/pybind11/cast.h:446:36: error: invalid use of incomplete type 'PyFrameObject' {aka 'struct _frame'}
  446 |                 "  " + handle(frame->f_code->co_filename).cast<std::string>() +
      |                                    ^~

https://github.com/zeek/zeek/blob/v5.2.0/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/43ca5fcc5b8618e6a7a65e77061f673a3c30bfc6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v3 -> v4:
 - Use upstream patch
Changes v2 -> v3:
 - Add a patch to fix install
Changes v1 -> v2:
 - Update commit message with information about python build failure

 ...ce-static-builds-for-the-bundled-CAF.patch | 55 +++++++++++++++++++
 package/zeek/zeek.hash                        |  6 +-
 package/zeek/zeek.mk                          | 13 +++--
 3 files changed, 67 insertions(+), 7 deletions(-)
 create mode 100644 package/zeek/0001-Force-static-builds-for-the-bundled-CAF.patch

diff --git a/package/zeek/0001-Force-static-builds-for-the-bundled-CAF.patch b/package/zeek/0001-Force-static-builds-for-the-bundled-CAF.patch
new file mode 100644
index 0000000000..5bca0d6ebe
--- /dev/null
+++ b/package/zeek/0001-Force-static-builds-for-the-bundled-CAF.patch
@@ -0,0 +1,55 @@
+From 8c56244338b7f23b016f9980680b000d61a91521 Mon Sep 17 00:00:00 2001
+From: Dominik Charousset <dominik.charousset@corelight.com>
+Date: Fri, 7 Apr 2023 10:40:32 +0200
+Subject: [PATCH] Force static builds for the bundled CAF
+
+[Retrieved from:
+https://github.com/zeek/broker/commit/8c56244338b7f23b016f9980680b000d61a91521]
+---
+ CMakeLists.txt | 20 +++++++++++---------
+ 1 file changed, 11 insertions(+), 9 deletions(-)
+
+diff --git a/auxil/broker/CMakeLists.txt b/auxil/broker/CMakeLists.txt
+index cb99d290..f7df1417 100644
+--- a/auxil/broker/CMakeLists.txt
++++ b/auxil/broker/CMakeLists.txt
+@@ -195,6 +195,14 @@ if (NOT OPENSSL_LIBRARIES)
+ endif()
+ set(LINK_LIBS ${LINK_LIBS} OpenSSL::SSL OpenSSL::Crypto)
+ 
++function(add_bundled_caf)
++  # Disable unnecessary features and make sure CAF builds static libraries.
++  set(CAF_ENABLE_EXAMPLES OFF)
++  set(CAF_ENABLE_TESTING OFF)
++  set(CAF_ENABLE_TOOLS OFF)
++  set(BUILD_SHARED_LIBS OFF)
++  add_subdirectory(caf EXCLUDE_FROM_ALL)
++endfunction()
+ 
+ # NOTE: building and linking against an external CAF version is NOT supported!
+ #       This variable is FOR DEVELOPMENT ONLY. The only officially supported CAF
+@@ -209,21 +217,15 @@ if (CAF_ROOT)
+   else()
+     find_package(CAF REQUIRED COMPONENTS openssl test io core net)
+   endif()
+-  list(APPEND LINK_LIBS CAF::core CAF::io CAF::net)
+   set(BROKER_USE_EXTERNAL_CAF ON)
+ else ()
+   message(STATUS "Using bundled CAF")
+-  set(CAF_ENABLE_EXAMPLES OFF CACHE INTERNAL "")
+-  set(CAF_ENABLE_TESTING OFF CACHE INTERNAL "")
+-  set(CAF_ENABLE_TOOLS OFF CACHE INTERNAL "")
+-  set(BUILD_SHARED_LIBS OFF CACHE INTERNAL "")
+-  add_subdirectory(caf EXCLUDE_FROM_ALL)
+-  list(APPEND OPTIONAL_SRC $<TARGET_OBJECTS:libcaf_core_obj>)
+-  list(APPEND OPTIONAL_SRC $<TARGET_OBJECTS:libcaf_io_obj>)
+-  list(APPEND OPTIONAL_SRC $<TARGET_OBJECTS:libcaf_net_obj>)
++  add_bundled_caf()
+   set(BROKER_USE_EXTERNAL_CAF OFF)
+ endif ()
+ 
++list(APPEND LINK_LIBS CAF::core CAF::io CAF::net)
++
+ # -- libroker -----------------------------------------------------------------
+ 
+ file(STRINGS "${CMAKE_CURRENT_SOURCE_DIR}/VERSION" BROKER_VERSION LIMIT_COUNT 1)
diff --git a/package/zeek/zeek.hash b/package/zeek/zeek.hash
index 05e57b5024..872ef8e14f 100644
--- a/package/zeek/zeek.hash
+++ b/package/zeek/zeek.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256  8c0afc999a8dd1c1f677a5cf818479b99c2d527e679e1ef99fb1b03f989c0373  zeek-4.1.1.tar.gz
+sha256  511047400dd4539177542c84a5e80d7e97ad73d2a9986ffcd6cd85b4cc711fbf  zeek-5.2.0.tar.gz
 
 # Hash for license files:
-sha256  b2817e2fb935805ec9fc0e90c6b971efd810d9aedfc646bc5fcb535221e0266a  COPYING
-sha256  1a451eca7b3826a7df62991ba90dd6d23ff03d28c2eefb7f8c4f8b1eac97a61b  COPYING.3rdparty
+sha256  14c5057bb1f83c50db29323a9d5bb0f33db9c4d8b9806c070f5b0ca84f52694a  COPYING
+sha256  5be6b90c7a563e6ee8238354f3487206e19d8f299689ff2adce7bdd1a6919ab1  COPYING-3rdparty
diff --git a/package/zeek/zeek.mk b/package/zeek/zeek.mk
index 584bfb0778..9c599fc22d 100644
--- a/package/zeek/zeek.mk
+++ b/package/zeek/zeek.mk
@@ -4,19 +4,19 @@
 #
 ################################################################################
 
-ZEEK_VERSION = 4.1.1
+ZEEK_VERSION = 5.2.0
 ZEEK_SITE = https://download.zeek.org
 ZEEK_LICENSE = \
 	BSD-3-Clause (zeek, C++ Actor Framework, ConvertUTF.c, CardinalityCounter.cc, pybind11), \
 	Public Domain (sqlite), \
-	MIT (doctest, libkqueue, RapidJSON, tsl-ordered-map, bro_inet_ntop.c), \
+	MIT (doctest, filesystem, libkqueue, RapidJSON, tsl-ordered-map, bro_inet_ntop.c), \
 	LGPL-3.0+ (Multifast Project), \
 	BSD-2-Clause (event.h), \
 	BSD-3-Clause (in_cksum.cc) \
 	BSD-4-Clause (Patricia.c, strsep.c, bsd-getopt-long.c), \
 	Apache-2.0 (highwayhash, folly), \
 	MPL-2.0 (mozilla-ca-list.zeek)
-ZEEK_LICENSE_FILES = COPYING COPYING.3rdparty
+ZEEK_LICENSE_FILES = COPYING COPYING-3rdparty
 ZEEK_CPE_ID_VENDOR = zeek
 ZEEK_SUPPORTS_IN_SOURCE_BUILD = NO
 ZEEK_DEPENDENCIES = \
@@ -45,6 +45,9 @@ ZEEK_CONF_OPTS = \
 	-DBINPAC_EXE_PATH=$(HOST_DIR)/bin/binpac \
 	-DBROKER_DISABLE_DOCS=ON \
 	-DBROKER_DISABLE_TESTS=ON \
+	-DDISABLE_SPICY=ON \
+	-DENABLE_ZEEK_UNIT_TESTS=OFF \
+	-DGEN_ZAM_EXE_PATH=$(HOST_DIR)/bin/gen-zam \
 	-DINSTALL_AUX_TOOLS=ON \
 	-DZEEK_ETC_INSTALL_DIR=/etc
 
@@ -79,13 +82,15 @@ ZEEK_DEPENDENCIES += musl-fts
 ZEEK_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-lfts
 endif
 
-HOST_ZEEK_MAKE_OPTS = binpac bifcl
+HOST_ZEEK_MAKE_OPTS = binpac bifcl gen-zam
 
 define HOST_ZEEK_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/bifcl/bifcl \
 		$(HOST_DIR)/bin/bifcl
 	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/binpac/src/binpac \
 		$(HOST_DIR)/bin/binpac
+	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/gen-zam/gen-zam \
+		$(HOST_DIR)/bin/gen-zam
 endef
 
 $(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
