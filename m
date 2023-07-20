Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B71EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 20:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1FE26125F;
	Thu, 20 Jul 2023 20:26:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1FE26125F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ETbP9cMHZoUi; Thu, 20 Jul 2023 20:26:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F163F6125D;
	Thu, 20 Jul 2023 20:26:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F163F6125D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F4001BF59D
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 20:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 089E06125D
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 20:26:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 089E06125D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x5f0vDgpLaeG for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 20:26:37 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22FAF61257
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 20:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22FAF61257
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9770EA4C042C;
 Thu, 20 Jul 2023 22:26:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36562)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qMaEK-0001nO-2G;
 Thu, 20 Jul 2023 22:26:32 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 22:26:32 +0200
Message-Id: <20230720202632.2567755-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689884793;
 bh=2pC17UNF3WyfAqSKItagXsCL9RL26xyq9NQOrxgqVCY=;
 h=From:To:Cc:Subject:Date:From;
 b=BiG9+FnoPzHhaxScYYRiUuG7lQL+DOGYPyQbVg/30XNi/E1Pv4Zc4u3L7RiOEwLbE
 JcrfF8WUtZnnvBhgJ7+TT6YqFP4Y1fYHku0sONFOouPpVDHTHX5dG6jDLsXjz+2APT
 dYwttUcpiIofVEMeATiyXvaLnX3fZjlQ+8+xlH/XsQX2/6rKGgxlLm0KWzHuQ0Dh3n
 jWp+kiv5SxzmSCkj/gAFjzJyxfdb1V+FFvRvajKY3q20q0cn7PRM6sR+kiTLi52JUJ
 tN1dlI9BzX9+bYtrU/L2g0kfx/B8CKKiSCOiTfGimkNGezi0O7oAZyAJVS12r8YAmB
 fwVts9WebKDNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=BiG9+Fno
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: fix build with openssl3
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

Fixes:
http://autobuild.buildroot.net/results/c09/c09c77e399e9ee410995a91a22306897eca667d1/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...eLists.txt-remove-Werror-from-CFLAGS.patch | 38 +++++++++++++++++++
 ...eLists.txt-remove-Werror-from-CFLAGS.patch | 38 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 package/libuhttpd/0002-CMakeLists.txt-remove-Werror-from-CFLAGS.patch
 create mode 100644 package/libuhttpd/0003-CMakeLists.txt-remove-Werror-from-CFLAGS.patch

diff --git a/package/libuhttpd/0002-CMakeLists.txt-remove-Werror-from-CFLAGS.patch b/package/libuhttpd/0002-CMakeLists.txt-remove-Werror-from-CFLAGS.patch
new file mode 100644
index 0000000000..01f66f42d9
--- /dev/null
+++ b/package/libuhttpd/0002-CMakeLists.txt-remove-Werror-from-CFLAGS.patch
@@ -0,0 +1,38 @@
+From a7d47180777366b9ee374ee1fe0f1a155a02160b Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Thu, 20 Jul 2023 22:14:16 +0200
+Subject: [PATCH] CMakeLists.txt: remove -Werror from CFLAGS
+
+Build is broken with OpenSSL 3.0, see buildroot autobuilder logs:
+http://autobuild.buildroot.net/results/c09/c09c77e399e9ee410995a91a22306897eca667d1/build-end.log
+
+/home/autobuild/autobuild/instance-2/output-1/build/libuhttpd-3.14.1/src/ssl/openssl.c:
+ In function 'ssl_last_error_string':
+/home/autobuild/autobuild/instance-2/output-1/build/libuhttpd-3.14.1/src/ssl/openssl.c:143:9:
+ error: 'ERR_peek_error_line_data' is deprecated: Since OpenSSL 3.0 [-Werror=deprecated-declarations]
+
+cc1: all warnings being treated as errors
+
+Upstream: https://github.com/zhaojh329/libuhttpd/pull/22
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6fb9651..64f506c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -7,7 +7,7 @@ include(CheckLibraryExists)
+ list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules/")
+ 
+ add_definitions(-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64)
+-add_compile_options(-O -Wall -Werror --std=gnu99)
++add_compile_options(-O -Wall --std=gnu99)
+ 
+ option(BUILD_STATIC "Build static library" OFF)
+ 
+-- 
+2.39.2
+
diff --git a/package/libuhttpd/0003-CMakeLists.txt-remove-Werror-from-CFLAGS.patch b/package/libuhttpd/0003-CMakeLists.txt-remove-Werror-from-CFLAGS.patch
new file mode 100644
index 0000000000..8e370e0a80
--- /dev/null
+++ b/package/libuhttpd/0003-CMakeLists.txt-remove-Werror-from-CFLAGS.patch
@@ -0,0 +1,38 @@
+From b22667f1054ea85c4dc3bdca5b7c84aeb0a801bc Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Thu, 20 Jul 2023 22:22:05 +0200
+Subject: [PATCH] CMakeLists.txt: remove -Werror from CFLAGS
+
+Build is broken with OpenSSL 3.0, see buildroot autobuilder logs:
+http://autobuild.buildroot.net/results/c09/c09c77e399e9ee410995a91a22306897eca667d1/build-end.log
+
+/home/autobuild/autobuild/instance-2/output-1/build/libuhttpd-3.14.1/src/ssl/openssl.c:
+ In function 'ssl_last_error_string':
+/home/autobuild/autobuild/instance-2/output-1/build/libuhttpd-3.14.1/src/ssl/openssl.c:143:9:
+ error: 'ERR_peek_error_line_data' is deprecated: Since OpenSSL 3.0 [-Werror=deprecated-declarations]
+
+cc1: all warnings being treated as errors
+
+Upstream: https://github.com/zhaojh329/ssl/pull/6
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 36488c7..98585b5 100644
+--- a/src/ssl/CMakeLists.txt
++++ b/src/ssl/CMakeLists.txt
+@@ -78,7 +78,7 @@ if(SSL_SUPPORT)
+ 
+     add_library(xssl STATIC ${SSL_SRC})
+     target_compile_definitions(xssl PRIVATE ${SSL_DEFINE})
+-    target_compile_options(xssl PRIVATE -O -Wall -Werror --std=gnu99 -fPIC)
++    target_compile_options(xssl PRIVATE -O -Wall --std=gnu99 -fPIC)
+     target_include_directories(xssl PRIVATE ${SSL_INC})
+     target_link_libraries(xssl PRIVATE ${SSL_LIBS})
+ 
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
