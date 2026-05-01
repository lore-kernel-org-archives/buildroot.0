Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4BFCCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 15:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51B1542712;
	Fri,  1 May 2026 15:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6CWn08LBRRf; Fri,  1 May 2026 15:30:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 076A342690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777649457;
	bh=NT9nD4FCuweQ+IsNkZMp2HtI4AZpiPrxw0yIJarrxx8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Xf39PZ0A13rfos8tKBRvFQmdTalk9VZC2uYfLvpMVFakb+VXT+5QgGlCks1eM6oQB
	 Ixb+ohop93To0kXOMA/5+P3sEQx/S1bFWTbTe5oalNmhVv5WhkYBnPoqNB6KL7hKlH
	 Q+H5fisU42MJc6HBHBkY3uIg7oBNVxDf7MblVruzkKAgQVcSlNd7YbytHNg5/bpxkx
	 I8sN/yyBwNM74ULHk/b8/I+aYidfKC8rXVx0zUgQmxLMYz3VJS4yJt2Tppp8jOsyAq
	 OEoexQPoChU26iWkG134cXi1FrblExwuCubWDkl1y+2RaqOnX+lkgyRKFhO7yJnysD
	 p6NTeB1sMuDyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 076A342690;
	Fri,  1 May 2026 15:30:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 93A28127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 15:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9165C40276
 for <buildroot@buildroot.org>; Fri,  1 May 2026 15:30:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PeI9YDPhvDjM for <buildroot@buildroot.org>;
 Fri,  1 May 2026 15:30:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 88F6441042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88F6441042
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 88F6441042
 for <buildroot@buildroot.org>; Fri,  1 May 2026 15:30:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 541BDA4C0250;
 Fri,  1 May 2026 17:28:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42324)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIpmb-00000000172-26ET;
 Fri, 01 May 2026 15:28:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 17:27:49 +0200
Message-ID: <20260501152758.2610763-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501152758.2610763-1-bernd@kuhls.net>
References: <20260501152758.2610763-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777649283;
 bh=fKafc9RnwyKD+LNCTE4nI9Ub9DwyRZQ0nErz8tc02UE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=G/EcA0bIkv4ahOs4XHYP36Ac3ljFnlx50G3GIZFJFIJq2jGJtzTa3jEjrC0MGjNt8
 XwLMd6ILGBKUCjVsTgW6ZQYqIVuEjKRBCVM9UNyRHH+wfbo/CDa3Lq3/l8ikCj56l1
 vfa1PDHbuvWIx8Ka+bISI+TQlp9nkk55iNQM7axixnlsHNgiGYY3xcHAXFKveMLZJM
 LWmK/pzv3yjXjQTbN8sZs/h1wBDrr2Y/qgL4kK+uNTNnxejUFyAkbLZrNrVvgVntHC
 gA/gaOh4p2wC/yhE2tf5KOw8pyltTw6wKwly3cOCbVzteuENWYUTDGXxSzFlj1zkAB
 aNplJZLA7ZFUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=G/EcA0bI
Subject: [Buildroot] [PATCH v4 13/21] package/snappy: enable rtti
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
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
