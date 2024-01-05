Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28953C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2AC143724;
	Fri,  5 Jan 2024 13:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2AC143724
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3RYYKliYYRLb; Fri,  5 Jan 2024 13:01:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94EDF43716;
	Fri,  5 Jan 2024 13:01:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94EDF43716
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B4831BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F8D383E73
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F8D383E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AccJRog60bo8 for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:01:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81B4983E25
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81B4983E25
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F77883F00; Fri,  5 Jan 2024 13:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 14:00:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 704e6c5efbdf2c17e3b2fb7d438358584908acbb
X-Git-Newrev: e946401406e5cb25e995dc24cd8c9b677aaab76c
X-Patchwork-Hint: ignore
Message-Id: <20240105130113.6F77883F00@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libwebsockets: fix wolfssl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=e946401406e5cb25e995dc24cd8c9b677aaab76c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following wolfssl build failure raised since commit
d6319d97a7864314088dcc6d1199f35029cfcecb:

-- Checking for one of the modules 'wolfssl'
CMake Error at lib/tls/CMakeLists.txt:79 (message):
  You must set LWS_WOLFSSL_LIBRARIES and LWS_WOLFSSL_INCLUDE_DIRS when
  LWS_WITH_WOLFSSL is turned on.

Fixes:
 - http://autobuild.buildroot.org/results/fe062b9f0b330e71309334d7605d64ea73761b59

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-CMakeLists.txt-fix-build-with-pkg-config.patch | 47 ++++++++++++++++++++++
 package/libwebsockets/libwebsockets.mk             |  2 +-
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/package/libwebsockets/0002-lib-tls-CMakeLists.txt-fix-build-with-pkg-config.patch b/package/libwebsockets/0002-lib-tls-CMakeLists.txt-fix-build-with-pkg-config.patch
new file mode 100644
index 0000000000..94d643e132
--- /dev/null
+++ b/package/libwebsockets/0002-lib-tls-CMakeLists.txt-fix-build-with-pkg-config.patch
@@ -0,0 +1,47 @@
+From 786ec9231e402cd4e7621483be6f1837de724e3c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 26 Dec 2023 22:38:18 +0100
+Subject: [PATCH] lib/tls/CMakeLists.txt: fix build with pkg-config
+
+Fix the following wolfssl build failure raised since
+https://github.com/warmcat/libwebsockets/commit/079726c4b252e795b208209752077c1ae4504b5b:
+
+-- Checking for one of the modules 'wolfssl'
+CMake Error at lib/tls/CMakeLists.txt:79 (message):
+  You must set LWS_WOLFSSL_LIBRARIES and LWS_WOLFSSL_INCLUDE_DIRS when
+  LWS_WITH_WOLFSSL is turned on.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/fe062b9f0b330e71309334d7605d64ea73761b59
+
+Upstream: https://github.com/warmcat/libwebsockets/commit/f18fc2316f9743624ced9ba934595f7b9ba8cd05
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/tls/CMakeLists.txt | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/lib/tls/CMakeLists.txt b/lib/tls/CMakeLists.txt
+index 80b46203..230b0d29 100644
+--- a/lib/tls/CMakeLists.txt
++++ b/lib/tls/CMakeLists.txt
+@@ -72,12 +72,16 @@ if (LWS_WITH_SSL AND LWS_WITH_WOLFSSL)
+ 		include (FindPkgConfig)
+ 		PKG_SEARCH_MODULE(LWS_WOLFSSL wolfssl)
+ 
+-		if (NOT WOLFSSL_FOUND)
++		if (NOT LWS_WOLFSSL_FOUND)
+ 			if (LWS_WITH_CYASSL)
+ 				message(FATAL_ERROR "You must set LWS_CYASSL_LIBRARIES and LWS_CYASSL_INCLUDE_DIRS when LWS_WITH_CYASSL is turned on.")
+ 			else()
+ 				message(FATAL_ERROR "You must set LWS_WOLFSSL_LIBRARIES and LWS_WOLFSSL_INCLUDE_DIRS when LWS_WITH_WOLFSSL is turned on.")
+ 			endif()
++		else()
++			set(WOLFSSL_LIBRARIES ${LWS_WOLFSSL_LIBRARIES})
++			set(WOLFSSL_INCLUDE_DIRS ${LWS_WOLFSSL_INCLUDE_DIRS})
++			set(WOLFSSL_FOUND 1)
+ 		endif()
+ 	else()
+ 		set(WOLFSSL_LIBRARIES ${LWS_WOLFSSL_LIBRARIES})
+-- 
+2.43.0
+
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 86756ca612..daf481b3bc 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -42,7 +42,7 @@ LIBWEBSOCKETS_CONF_OPTS += \
 	-DLWS_WITH_SSL=ON \
 	-DLWS_WITH_MBEDTLS=ON \
 	-DLWS_WITH_WOLFSSL=OFF
-else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
+else ifeq ($(BR2_PACKAGE_WOLFSSL_ALL),y)
 LIBWEBSOCKETS_DEPENDENCIES += host-pkgconf wolfssl
 LIBWEBSOCKETS_CONF_OPTS += \
 	-DLWS_WITH_SSL=ON \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
