Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73964EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 204B7612A3;
	Thu, 20 Jul 2023 21:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 204B7612A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QEK-wBxW7bDc; Thu, 20 Jul 2023 21:19:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19F52612A7;
	Thu, 20 Jul 2023 21:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19F52612A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA7C01BF4D8
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9358741BF2
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9358741BF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q4cJlRTpefgq for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:19:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6443D4192C
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6443D4192C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50725874B9; Thu, 20 Jul 2023 21:19:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 23:18:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3cd014c71687cc51542b1bec94d167f8c16d1d8f
X-Git-Newrev: 687f41227a08c54f49cd13896028761363645b1a
X-Patchwork-Hint: ignore
Message-Id: <20230720211904.50725874B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libuhttpd: fix build with openssl3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=687f41227a08c54f49cd13896028761363645b1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/c09/c09c77e399e9ee410995a91a22306897eca667d1/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-CMakeLists.txt-remove-Werror-from-CFLAGS.patch | 38 ++++++++++++++++++++++
 ...-CMakeLists.txt-remove-Werror-from-CFLAGS.patch | 38 ++++++++++++++++++++++
 2 files changed, 76 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
