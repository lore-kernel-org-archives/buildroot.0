Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332ECEB64DC
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 15:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8300B61408;
	Fri, 21 Jul 2023 15:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8300B61408
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ieZ30yfgHyw; Fri, 21 Jul 2023 15:17:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79640613FD;
	Fri, 21 Jul 2023 15:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79640613FD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 678051BF23C
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 15:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35E1641FA6
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 15:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35E1641FA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l0pRIc6aOObI for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 15:17:04 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1887641F8C
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 15:17:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1887641F8C
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A9ABEA4C032D;
 Fri, 21 Jul 2023 17:16:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35592)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qMrsH-0008DP-15;
 Fri, 21 Jul 2023 17:16:57 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 21 Jul 2023 17:16:57 +0200
Message-Id: <20230721151657.3457086-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689952617;
 bh=iZXYTK1KWV+S5wnRaCN7/eb4d9WySVsKGosso6zVKDk=;
 h=From:To:Cc:Subject:Date:From;
 b=iK+lhnX7v/KKQkIb8fVsHULtvKcg2o2lbk6DYhMI1lPOpZeqgFxBM4yrNROOniISo
 BOkr2d2q9Se+YqKEBLkkvpg8zurcRXmkRJL1dtbz0H2N46s0DJ3Vc2KwLEiwpycBwi
 gWtdEo2zMcsY6maleic0VjsnYS9ZT6+IdEbKoyxPJ6SyIHQEHn4d/ouG2/gewD5uKe
 fbA/0NbQzfFk1UkF9y3MvS9byWylFkQj+W4LaR/X9WxpHgnpAUaPK3K/pK9/nCfm5c
 JZ2UmSvErS88JGBLjoonpNEngf2bJIyH1tddA1fyA8/R2Ycm5qzJwcdmQHdOulzeD9
 SvMDRaGSjmG/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=iK+lhnX7
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: add upstream patch to
 fix openssl3 build
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed unneeded patches and replace them with an upstream commit.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Sorry, saw the upstream fix too late.

 ...eLists.txt-remove-Werror-from-CFLAGS.patch | 38 -------------------
 .../0002-compatibility-for-openssl-3.0.patch  | 31 +++++++++++++++
 ...eLists.txt-remove-Werror-from-CFLAGS.patch | 38 -------------------
 3 files changed, 31 insertions(+), 76 deletions(-)
 delete mode 100644 package/libuhttpd/0002-CMakeLists.txt-remove-Werror-from-CFLAGS.patch
 create mode 100644 package/libuhttpd/0002-compatibility-for-openssl-3.0.patch
 delete mode 100644 package/libuhttpd/0003-CMakeLists.txt-remove-Werror-from-CFLAGS.patch

diff --git a/package/libuhttpd/0002-CMakeLists.txt-remove-Werror-from-CFLAGS.patch b/package/libuhttpd/0002-CMakeLists.txt-remove-Werror-from-CFLAGS.patch
deleted file mode 100644
index 01f66f42d9..0000000000
--- a/package/libuhttpd/0002-CMakeLists.txt-remove-Werror-from-CFLAGS.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From a7d47180777366b9ee374ee1fe0f1a155a02160b Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Thu, 20 Jul 2023 22:14:16 +0200
-Subject: [PATCH] CMakeLists.txt: remove -Werror from CFLAGS
-
-Build is broken with OpenSSL 3.0, see buildroot autobuilder logs:
-http://autobuild.buildroot.net/results/c09/c09c77e399e9ee410995a91a22306897eca667d1/build-end.log
-
-/home/autobuild/autobuild/instance-2/output-1/build/libuhttpd-3.14.1/src/ssl/openssl.c:
- In function 'ssl_last_error_string':
-/home/autobuild/autobuild/instance-2/output-1/build/libuhttpd-3.14.1/src/ssl/openssl.c:143:9:
- error: 'ERR_peek_error_line_data' is deprecated: Since OpenSSL 3.0 [-Werror=deprecated-declarations]
-
-cc1: all warnings being treated as errors
-
-Upstream: https://github.com/zhaojh329/libuhttpd/pull/22
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6fb9651..64f506c 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -7,7 +7,7 @@ include(CheckLibraryExists)
- list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules/")
- 
- add_definitions(-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64)
--add_compile_options(-O -Wall -Werror --std=gnu99)
-+add_compile_options(-O -Wall --std=gnu99)
- 
- option(BUILD_STATIC "Build static library" OFF)
- 
--- 
-2.39.2
-
diff --git a/package/libuhttpd/0002-compatibility-for-openssl-3.0.patch b/package/libuhttpd/0002-compatibility-for-openssl-3.0.patch
new file mode 100644
index 0000000000..484d472bad
--- /dev/null
+++ b/package/libuhttpd/0002-compatibility-for-openssl-3.0.patch
@@ -0,0 +1,31 @@
+From d93e6426ec1d8c019bd302e4599f3b91ba95fb3b Mon Sep 17 00:00:00 2001
+From: Jianhui Zhao <zhaojh329@gmail.com>
+Date: Fri, 29 Apr 2022 23:47:31 +0800
+Subject: [PATCH] compatibility for openssl >= 3.0
+
+Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
+
+Upstream: https://github.com/zhaojh329/ssl/commit/d93e6426ec1d8c019bd302e4599f3b91ba95fb3b
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ openssl.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/openssl.c b/openssl.c
+index 278bab5..2169db1 100644
+--- a/src/ssl/openssl.c
++++ b/src/ssl/openssl.c
+@@ -139,8 +139,11 @@ const char *ssl_last_error_string(char *buf, int len)
+ 
+     if (ssl_err_code == SSL_ERROR_SSL) {
+         int used;
+-
++#if OPENSSL_VERSION_MAJOR < 3
+         ssl_err_code = ERR_peek_error_line_data(&file, &line, &data, &flags);
++#else
++        ssl_err_code = ERR_peek_error_all(&file, &line, NULL, &data, &flags);
++#endif
+         ERR_error_string_n(ssl_err_code, buf, len);
+ 
+         used = strlen(buf);
diff --git a/package/libuhttpd/0003-CMakeLists.txt-remove-Werror-from-CFLAGS.patch b/package/libuhttpd/0003-CMakeLists.txt-remove-Werror-from-CFLAGS.patch
deleted file mode 100644
index 8e370e0a80..0000000000
--- a/package/libuhttpd/0003-CMakeLists.txt-remove-Werror-from-CFLAGS.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From b22667f1054ea85c4dc3bdca5b7c84aeb0a801bc Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Thu, 20 Jul 2023 22:22:05 +0200
-Subject: [PATCH] CMakeLists.txt: remove -Werror from CFLAGS
-
-Build is broken with OpenSSL 3.0, see buildroot autobuilder logs:
-http://autobuild.buildroot.net/results/c09/c09c77e399e9ee410995a91a22306897eca667d1/build-end.log
-
-/home/autobuild/autobuild/instance-2/output-1/build/libuhttpd-3.14.1/src/ssl/openssl.c:
- In function 'ssl_last_error_string':
-/home/autobuild/autobuild/instance-2/output-1/build/libuhttpd-3.14.1/src/ssl/openssl.c:143:9:
- error: 'ERR_peek_error_line_data' is deprecated: Since OpenSSL 3.0 [-Werror=deprecated-declarations]
-
-cc1: all warnings being treated as errors
-
-Upstream: https://github.com/zhaojh329/ssl/pull/6
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 36488c7..98585b5 100644
---- a/src/ssl/CMakeLists.txt
-+++ b/src/ssl/CMakeLists.txt
-@@ -78,7 +78,7 @@ if(SSL_SUPPORT)
- 
-     add_library(xssl STATIC ${SSL_SRC})
-     target_compile_definitions(xssl PRIVATE ${SSL_DEFINE})
--    target_compile_options(xssl PRIVATE -O -Wall -Werror --std=gnu99 -fPIC)
-+    target_compile_options(xssl PRIVATE -O -Wall --std=gnu99 -fPIC)
-     target_include_directories(xssl PRIVATE ${SSL_INC})
-     target_link_libraries(xssl PRIVATE ${SSL_LIBS})
- 
--- 
-2.39.2
-
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
