Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF029EA3C23
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 11:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 719DA4109A;
	Thu,  9 Apr 2026 11:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LgYUPnTQNrUW; Thu,  9 Apr 2026 11:03:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3EA541095
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775732596;
	bh=NT9nD4FCuweQ+IsNkZMp2HtI4AZpiPrxw0yIJarrxx8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ra+0JdOdwO81RpI79AVp5Vo5XNT9eQT5ktBj3ntlGKAXVx22gQXP8Dl0ziAVU84DO
	 Wqq+5EIxGfah+U58jlLWT6LNmYE8AOdi/rTqAw1boVEH0O2evihtSd0X3HX+MeM0eq
	 die1GeoTc4uYQY0OF6IC/l4viNafyZa70JsXSNJBfw3rD1OpLLDJdGcAYytap6EuYe
	 worcnPm85van8AbN9iM3BA+dU6ZBXYFW0fST9LEWK/xtOjfe1IHOPehyOHsdzN54Tn
	 m6UC4zr3r22WOqH7k3jfALzmjUoKdT71jlJ/uHTxz7TvRPGmPFYfacMWTpSr0IZjCL
	 AD7+TSYlKUhwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3EA541095;
	Thu,  9 Apr 2026 11:03:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CF952237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 11:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C10BA829DC
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 11:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j_8Vu5fOGnjy for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 11:03:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E8458829BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8458829BB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8458829BB
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 11:03:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca66.dip0.t-ipconnect.de [79.214.202.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 74297A4C0A4D;
 Thu,  9 Apr 2026 13:03:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49956)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAnAE-000000003uF-1U2W;
 Thu, 09 Apr 2026 11:03:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  9 Apr 2026 13:03:09 +0200
Message-ID: <20260409110310.3641004-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775732590;
 bh=fKafc9RnwyKD+LNCTE4nI9Ub9DwyRZQ0nErz8tc02UE=;
 h=From:To:Cc:Subject:Date:From;
 b=C+nAK1fC9xMA3fQW5y2rFDUPXFuxrhbzRVB+nTt9d50oFjAv/QxeXZWALbSEKiPu1
 VY1QgprOqKMSs+5y4qZ6M4n2eSybd/ZVfr7Km5tunPhjXXNa/FG0R22uBgkmoOuuUm
 9vEQdBHJUecaY9H1xn7okSn5JNZMF/tPx0Xk42xZcNsNrEGPujGT/222gBCouEcn8L
 /FyqKjtz/iBe5TgmV7KeySUJAfQEw3Lwe9BpED2mqKpHEeUW1900YBth4BanEJ/iU0
 +Oseaz9iP676wL5ErBecnHhp1tkUqW+jLgs9Reuzn1mgAn87FvPXvhrXKHUwA6BCgs
 /7C2RwYW1YrMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=C+nAK1fC
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
