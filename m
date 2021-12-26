Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093C5C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 15:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 863C160D7F;
	Sun, 26 Dec 2021 15:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OGW3mWVDnoVH; Sun, 26 Dec 2021 15:00:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D570B60C15;
	Sun, 26 Dec 2021 15:00:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D0F71BF2F4
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 15:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 779E081457
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 15:00:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a9RV2V73VX_7 for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 15:00:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CA0781455
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 15:00:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5206782641; Sun, 26 Dec 2021 14:54:32 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 16:00:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ddf6c6924aab6a287e98c774645fa6158e953f0
X-Git-Newrev: 7ee6c37939f7413a953f6d2575d5757f682b23c0
X-Patchwork-Hint: ignore
Message-Id: <20211226145432.5206782641@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl_433: fix build with gcc 4.8
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7ee6c37939f7413a953f6d2575d5757f682b23c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 4.8 raised since bump to
version 21.12 in commit 84b29ef40baf408b8b22085b336967aca83212db:

arm-none-linux-gnueabi-gcc: error: unrecognized command line option '-Wimplicit-fallthrough'

Fixes:
 - http://autobuild.buildroot.org/results/bea144f267215cd2dc27f235d6e3fb0adedb33ea

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...001-minor-Fix-a-compiler-flag-needs-GCC-7.patch | 27 +++++++++++++++++
 ...parse.c-fix-build-without-__has_attribute.patch | 34 ++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/package/rtl_433/0001-minor-Fix-a-compiler-flag-needs-GCC-7.patch b/package/rtl_433/0001-minor-Fix-a-compiler-flag-needs-GCC-7.patch
new file mode 100644
index 0000000000..dd3debf7ee
--- /dev/null
+++ b/package/rtl_433/0001-minor-Fix-a-compiler-flag-needs-GCC-7.patch
@@ -0,0 +1,27 @@
+From 2010e8f949ab7b4555b99dbf184e149a3f33df46 Mon Sep 17 00:00:00 2001
+From: "Christian W. Zuckschwerdt" <christian@zuckschwerdt.org>
+Date: Fri, 24 Dec 2021 11:03:06 +0100
+Subject: [PATCH] minor: Fix a compiler flag needs GCC 7
+
+[Retrieved from:
+https://github.com/merbanan/rtl_433/commit/2010e8f949ab7b4555b99dbf184e149a3f33df46]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a3f11ac99..bfa6595ca 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -74,7 +74,9 @@ if(("${CMAKE_C_COMPILER_ID}" STREQUAL "GNU" OR "${CMAKE_C_COMPILER_ID}" MATCHES
+     ADD_DEFINITIONS(-pedantic)
+     ADD_DEFINITIONS(-Wshadow)
+     ADD_DEFINITIONS(-Wmissing-prototypes)
+-    ADD_DEFINITIONS(-Wimplicit-fallthrough)
++    if("${CMAKE_C_COMPILER_ID}" MATCHES "Clang" OR NOT "7.0.0" VERSION_GREATER CMAKE_C_COMPILER_VERSION)
++        ADD_DEFINITIONS(-Wimplicit-fallthrough)
++    endif()
+     #ADD_DEFINITIONS(-Wfloat-equal)
+     #ADD_DEFINITIONS(-Wbad-function-cast)
+     #ADD_DEFINITIONS(-Wdocumentation)
diff --git a/package/rtl_433/0002-src-optparse.c-fix-build-without-__has_attribute.patch b/package/rtl_433/0002-src-optparse.c-fix-build-without-__has_attribute.patch
new file mode 100644
index 0000000000..683754845f
--- /dev/null
+++ b/package/rtl_433/0002-src-optparse.c-fix-build-without-__has_attribute.patch
@@ -0,0 +1,34 @@
+From 1b74826f155406f86846d5c97b3534aab87cf6da Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 26 Dec 2021 15:21:39 +0100
+Subject: [PATCH] src/optparse.c: fix build without __has_attribute
+
+Fix build failure without __has_attribute (e.g. gcc 4.8) which is raised
+since
+https://github.com/merbanan/rtl_433/commit/6c8af75c757712bd58b169317795484a72e9a16c
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/merbanan/rtl_433/pull/1918]
+---
+ src/optparse.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/optparse.c b/src/optparse.c
+index aa3d0b53..b5e2d37e 100644
+--- a/src/optparse.c
++++ b/src/optparse.c
+@@ -232,9 +232,11 @@ int atoi_time(char const *str, char const *error_hint)
+             }
+             // intentional fallthrough
+ #if defined(__GNUC__) || defined(__clang__)
++#if defined __has_attribute
+ #if __has_attribute(fallthrough)
+             __attribute__((fallthrough));
+ #endif
++#endif
+ #endif
+         case ':':
+             ++colons;
+-- 
+2.33.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
