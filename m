Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FA2FA3728
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 16:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9D7E60891;
	Fri,  2 Jan 2026 16:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-40P1rL6PZb; Fri,  2 Jan 2026 16:18:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0CC260895
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767370697;
	bh=NT9nD4FCuweQ+IsNkZMp2HtI4AZpiPrxw0yIJarrxx8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IRtv99IrB976leuSN/zvOsfo5Rn04IoC8ciKY8uyFC+F5ZB4i4fGC9OBilvl6Kvz+
	 z3IviYhebxQm5Dqs1pTT0/QifvfzZ3mmEVBycjc3GxLQdXuYEJheq+yHqmjqT5bYPi
	 Ch4aO9bMCE42THDIbBUy65uXuU4zVAOx6HdTezk6b5uz78FAitqnTTjcprJnmqLZjg
	 byZwAJ2kL6vaPSvYdPhm1FLTEFtwLpows3eMh/s4bOH3vBnvJYcG3u83k9xr8XwyQz
	 LsSWh+KF+u6lyTw5fiZqoTtavwNLDmq/juZ9J+YxQoxWy2joWlGpc41SkJwQ8Xe6U6
	 nPsAKJG5nbVjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0CC260895;
	Fri,  2 Jan 2026 16:18:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 27017351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 16:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DA2660891
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 16:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nT15wXfDDwIF for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 16:18:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B70C60895
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B70C60895
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B70C60895
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 16:18:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 673CFA4C21E1;
 Fri,  2 Jan 2026 17:18:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37990)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbhqt-000000005F5-08ju;
 Fri, 02 Jan 2026 16:18:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  2 Jan 2026 17:18:09 +0100
Message-ID: <20260102161811.1185193-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767370691;
 bh=fKafc9RnwyKD+LNCTE4nI9Ub9DwyRZQ0nErz8tc02UE=;
 h=From:To:Cc:Subject:Date:From;
 b=mRMhTtTlGAvFbEWCPG9UsMgKQigUNYq6srMi3cFH1X81Ad9kH0TW07FPGdRryeU1v
 wABTXUnqK4aRBGcsbTqgUSbM4BpZYpFbuVyzRWE6zgQqYT3cr1KN3AdZ49O0TK1nPm
 /0R0SG1g2YxpMmVnewV/2CgdAU6yPyVQXel3yWkwepF8yBVOldBY8i2MWe/fpocQvW
 A9vp+nFf/VzCekq8mf0L+Fjh8I3nICRodZ2lArsYRZ/vMzZET5cVUjuYqjBdFPL0cZ
 hDgpIVVT4YzbJhU41hi57hlJu6WYe+jtRTP33VTk46df9+HTvSwySUeutCyROZ9vUF
 jeoH2hciq7jLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=mRMhTtTl
Subject: [Buildroot] [PATCH 1/2] package/snappy: enable rtti
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added patch to enable rtti, needed for upcoming bump of rocksdb to fix
link error:

output/per-package/rocksdb/host/bin/../lib/gcc/x86_64-buildroot-linux-
gnu/15.2.0/../../../../x86_64-buildroot-linux-gnu/bin/ld:
 librocksdb.so.10.7.5: undefined reference to `typeinfo for snappy::Sink'

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0002-add-option-to-enable-rtti.patch      | 52 +++++++++++++++++++
 package/snappy/snappy.mk                      |  5 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 package/snappy/0002-add-option-to-enable-rtti.patch

diff --git a/package/snappy/0002-add-option-to-enable-rtti.patch b/package/snappy/0002-add-option-to-enable-rtti.patch
new file mode 100644
index 0000000000..e82328b0ff
--- /dev/null
+++ b/package/snappy/0002-add-option-to-enable-rtti.patch
@@ -0,0 +1,52 @@
+From 376f14b5933e91d08ade6a503fdd657a6e01a149 Mon Sep 17 00:00:00 2001
+From: Max <tchristy001@outlook.com>
+Date: Wed, 24 Nov 2021 12:16:23 -0600
+Subject: [PATCH] add option to enable rtti, set default to current behavior
+
+Upstream: https://github.com/google/snappy/pull/147 (rejected)
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[rebased for 1.2.2]
+---
+ CMakeLists.txt | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6eef485..aefd35b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -53,8 +53,10 @@ if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
+   add_definitions(-D_HAS_EXCEPTIONS=0)
+ 
+   # Disable RTTI.
+-  string(REGEX REPLACE "/GR" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
+-  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /GR-")
++  if(NOT SNAPPY_ENABLE_RTTI)
++    string(REGEX REPLACE "/GR" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /GR-")
++  endif(SNAPPY_ENABLE_RTTI)
+ else(MSVC)
+   # Use -Wall for clang and gcc.
+   if(NOT CMAKE_CXX_FLAGS MATCHES "-Wall")
+@@ -78,8 +80,10 @@ else(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
+   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-exceptions")
+ 
+   # Disable RTTI.
+-  string(REGEX REPLACE "-frtti" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
+-  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")
++  if(NOT SNAPPY_ENABLE_RTTI)
++    string(REGEX REPLACE "-frtti" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")
++  endif(SNAPPY_ENABLE_RTTI)
+ endif(MSVC)
+ 
+ # BUILD_SHARED_LIBS is a standard CMake variable, but we declare it here to make
+@@ -98,6 +102,8 @@ option(SNAPPY_REQUIRE_AVX2 "Target processors with AVX2 support." OFF)
+ 
+ option(SNAPPY_INSTALL "Install Snappy's header and library" ON)
+ 
++option(SNAPPY_ENABLE_RTTI "Enable RTTI for Snappy's library" OFF)
++
+ include(TestBigEndian)
+ test_big_endian(SNAPPY_IS_BIG_ENDIAN)
+ 
diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index 57c688b673..cd61bbb078 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -10,6 +10,9 @@ SNAPPY_LICENSE = BSD-3-Clause
 SNAPPY_LICENSE_FILES = COPYING
 SNAPPY_CPE_ID_VENDOR = google
 SNAPPY_INSTALL_STAGING = YES
-SNAPPY_CONF_OPTS = -DSNAPPY_BUILD_BENCHMARKS=OFF -DSNAPPY_BUILD_TESTS=OFF
+SNAPPY_CONF_OPTS = \
+	-DSNAPPY_BUILD_BENCHMARKS=OFF \
+	-DSNAPPY_BUILD_TESTS=OFF \
+	-DSNAPPY_ENABLE_RTTI=ON
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
