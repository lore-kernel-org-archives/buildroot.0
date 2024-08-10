Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055CDC3DA7F
	for <buildroot@archiver.kernel.org>; Sat, 10 Aug 2024 17:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A96F560729;
	Sat, 10 Aug 2024 17:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6iPwCj9wg_qh; Sat, 10 Aug 2024 17:38:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F4B460725
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F4B460725;
	Sat, 10 Aug 2024 17:38:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DF601BF831
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 17:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67EF3813AE
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 17:38:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IBE-6mfYTACo for <buildroot@lists.busybox.net>;
 Sat, 10 Aug 2024 17:38:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C428B81306
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C428B81306
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C428B81306
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 17:38:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5ed.dip0.t-ipconnect.de [84.161.181.237])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D96B3A4C145F
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 19:38:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46182)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1scq30-000000004HC-2Hpw
 for buildroot@buildroot.org; Sat, 10 Aug 2024 17:38:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 10 Aug 2024 19:38:34 +0200
Message-Id: <20240810173834.613800-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1723311514;
 bh=y1sc5Y6sK2039MdIDTCE8N5SG9dm8tYdR4Uo30nywrM=;
 h=From:To:Subject:Date:From;
 b=uOerN1lRKd6MQfjhFPvU/gGZij6mWe6wT4nouY76SafapHbosv9hj/rRSxE3ziRa+
 /M7IFCAh16G+pfNBUW6/+k4Uf+XHbIsfwknXyZGh78iJBNtMdPuM3M7yIAjndgm7PU
 Yg1ji5U80Qt5JlXxHdj3kTCYRYIBmVEtMO7XYpN/KWAegycIu2IT4do6RlRhINs944
 06oGFz5yCIxjRBm1BOdc1ujn3JXxkTTSl19ge0aJ85vbwSAtjQjoZQv0eGaAlkS2C7
 UfmYJ7mlHAgxNY7At9M5wlOsxvRahGpV4mDHsUOsr+AN7FLhBcYXsYqhTJSOa8ekhy
 /G0AQNIl4FtsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=uOerN1lR
Subject: [Buildroot] [PATCH 1/1] package/iperf3: security bump to version
 3.17.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch which is included in this release, autoreconf is not needed
anymore.

Updated license hash due to copyright year bump:
https://github.com/esnet/iperf/commit/7b947051d5192388dfa8a18989692e7af4226c62

Fixes CVE-2024-26306.

Release notes:
https://github.com/esnet/iperf/releases/tag/3.17.1
https://github.com/esnet/iperf/releases/tag/3.17

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...1-Check-and-link-libatomic-if-needed.patch | 42 -------------------
 package/iperf3/iperf3.hash                    |  6 +--
 package/iperf3/iperf3.mk                      |  5 +--
 3 files changed, 4 insertions(+), 49 deletions(-)
 delete mode 100644 package/iperf3/0001-Check-and-link-libatomic-if-needed.patch

diff --git a/package/iperf3/0001-Check-and-link-libatomic-if-needed.patch b/package/iperf3/0001-Check-and-link-libatomic-if-needed.patch
deleted file mode 100644
index ddb50c4694..0000000000
--- a/package/iperf3/0001-Check-and-link-libatomic-if-needed.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From bbf710e77e4a0438a2d995fd69b472e5ff054c69 Mon Sep 17 00:00:00 2001
-From: Jan Palus <jpalus@fastmail.com>
-Date: Sun, 3 Dec 2023 12:14:05 +0100
-Subject: [PATCH] Check and link libatomic if needed
-
-Some architectures without native support for 64-bit atomics need
-linking with libatomic.
-
-Signed-off-by: Julien Olivain <ju.o@free.fr>
-Upstream: https://github.com/esnet/iperf/commit/1511e9f85b548891ea53d4e378903344df1fd31e
----
- configure.ac | 14 +++++++++++++-
- 1 file changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 2594b39..ad7eaf1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -92,7 +92,19 @@ CXX="$PTHREAD_CXX"
- ])
- 
- # Atomics
--AC_CHECK_HEADERS([stdatomic.h])
-+AC_CHECK_HEADERS([stdatomic.h],
-+    [AC_MSG_CHECKING([whether libatomic is required])
-+    AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <stdatomic.h>]], [[atomic_uint_fast64_t i; i++;]])],
-+        [AC_MSG_RESULT([no])],
-+        [save_LIBS="$LIBS"
-+        LIBS="$LIBS -latomic"
-+        AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <stdatomic.h>]], [[atomic_uint_fast64_t i; i++;]])],
-+            [AC_MSG_RESULT([yes])],
-+            [AC_MSG_ERROR([failed to find working configuration with atomics])]
-+        )]
-+    )],
-+    []
-+)
- 
- # Check for poll.h (it's in POSIX so everyone should have it?)
- AC_CHECK_HEADERS([poll.h])
--- 
-2.44.0
-
diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index a8634c4a7e..ee0149daed 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.16.tar.gz.sha256
-sha256  cc740c6bbea104398cc3e466befc515a25896ec85e44a662d5f4a767b9cf713e  iperf-3.16.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.17.1.tar.gz.sha256
+sha256  84404ca8431b595e86c473d8f23d8bb102810001f15feaf610effd3b318788aa  iperf-3.17.1.tar.gz
 # Locally computed
-sha256  35aa7c4618b9884d6faa9b43a4e70291b35ea9f89329d5d33becd852e85221b0  LICENSE
+sha256  3dc3e2076dd9cdea2b66d8fe213997ff25fb6171594f055b59fe25321b438f6f  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 3ab68bd13b..1d2b57208a 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.16
+IPERF3_VERSION = 3.17.1
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
 IPERF3_LICENSE_FILES = LICENSE
 IPERF3_CPE_ID_VENDOR = es
 
-# 0001-Check-and-link-libatomic-if-needed.patch
-IPERF3_AUTORECONF = YES
-
 IPERF3_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
