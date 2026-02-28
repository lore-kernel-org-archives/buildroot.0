Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3ACCFEE4F7
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 19:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCFDF60F75;
	Sat, 28 Feb 2026 19:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DAMEmWnzkIRj; Sat, 28 Feb 2026 19:39:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F30560F63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772307586;
	bh=NT9nD4FCuweQ+IsNkZMp2HtI4AZpiPrxw0yIJarrxx8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UYsY7y5PHJLVITGeUh5Py6S1vNuKSVx1gs1lklMJ8T1tzR5uZPn+Zyt2a7vc6qF0n
	 UlZkcdckQMy45zMxhOF8Jr3iF2MuSyOovFbVX5PPt2CQDsKaBp6i1TZqzm5/MOVxtw
	 piqPJTz7JMNHAo1vqwgJ/QV+XEXvdICL3B7Tsw+Aw34Q70rzTm431MWP6Eq7oUn32Q
	 sDzFG7mVAfmRa/+logmH4z17DFzvkKT6Vr5kdwq9ik0ZmZSN39ndDlFbgNUIqh6vyW
	 RGDT/FhTzKa4Kl0tBgf80bZE+kFlhhsAtfngLCPs5M4hzb5/Vo5o/2UBHyrKkWNpj8
	 kqT9nnsAAgjsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F30560F63;
	Sat, 28 Feb 2026 19:39:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A953818D
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 19:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AC6160F63
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 19:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dWyYi29X1bFQ for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 19:39:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 784E360B70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 784E360B70
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 784E360B70
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 19:39:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 27516A4C2F2B;
 Sat, 28 Feb 2026 20:39:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56504)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vwQA9-000000002U1-0EoE;
 Sat, 28 Feb 2026 19:39:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Feb 2026 20:39:39 +0100
Message-ID: <20260228193940.3809679-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772307581;
 bh=fKafc9RnwyKD+LNCTE4nI9Ub9DwyRZQ0nErz8tc02UE=;
 h=From:To:Cc:Subject:Date:From;
 b=jS4R+u4/Qj7DWls4jTbfbSo1b1lpdM0DA/XhtTbc9dDF9rLeqc44pQPpn3GAe2DQ5
 pQyZprSl4CbNN18pf9M5StOYXwqZB2dScvEGh7LcoFGIGcdbyN8xLvA5G/GhLEMw9C
 brrr6rhpvth7yLq0GZadN6TEOBNiFKVXI8mcNG7+siThtdbzksRL+CaaH9F3+T9Qqy
 PWfVnc6f2jXwe6H7CZUu5u/GeiiP22XE3b1RuhUBebQG86zwUgPUwDA5fakwqst552
 5xOq0OlgVGfNGw8inEu+kfjzgLqfEFs3z7w+uJKvQuFL2VpC/NL/MyP5L980/f+SZn
 wK9PY4vC1evXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=jS4R+u4/
Subject: [Buildroot] [PATCH/next 1/2] package/snappy: enable rtti
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
