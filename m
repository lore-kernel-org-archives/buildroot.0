Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7EBC433F5
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 12:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AC7683148;
	Wed,  1 Jun 2022 12:29:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TlpEn7AC_C8Q; Wed,  1 Jun 2022 12:29:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AC7483131;
	Wed,  1 Jun 2022 12:29:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5862D1BF591
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 12:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 477F183131
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 12:29:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YZjhT7E7PXvS for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 12:29:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8048B81959
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 12:29:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CC33486879; Wed,  1 Jun 2022 12:18:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Jun 2022 14:28:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb5e2d2d43c5c0f71ae8243081625261de2cd134
X-Git-Newrev: 31a74276624af05e08ce03ba309310cc6dc4de5f
X-Patchwork-Hint: ignore
Message-Id: <20220601121806.CC33486879@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zlib-ng: fix version in zlib.pc
 when building statically
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

commit: https://git.buildroot.net/buildroot/commit/?id=31a74276624af05e08ce03ba309310cc6dc4de5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure with transmission:

checking for ZLIB... configure: error: Package requirements (zlib >= 1.2.3) were not met:

Package dependency requirement 'zlib >= 1.2.3' could not be satisfied.
Package 'zlib' has version '', required version is '>= 1.2.3'

Fixes:
 - http://autobuild.buildroot.org/results/b3b882482f517726e5c780ba4c37818bd379df82

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...txt-fix-version-in-zlib.pc-when-building-.patch | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/package/zlib-ng/0002-CMakeLists.txt-fix-version-in-zlib.pc-when-building-.patch b/package/zlib-ng/0002-CMakeLists.txt-fix-version-in-zlib.pc-when-building-.patch
new file mode 100644
index 0000000000..749c45ddca
--- /dev/null
+++ b/package/zlib-ng/0002-CMakeLists.txt-fix-version-in-zlib.pc-when-building-.patch
@@ -0,0 +1,53 @@
+From 9fcc446306f27eb253545540ce28403874b899fa Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 27 May 2022 23:25:21 +0200
+Subject: [PATCH] CMakeLists.txt: fix version in zlib.pc when building
+ statically
+
+When building statically (i.e. with BUILD_SHARED_LIBS=OFF),
+ZLIB_FULL_VERSION is not set resulting in an empty version in zlib.pc
+and the following build failure with transmission:
+
+checking for ZLIB... configure: error: Package requirements (zlib >= 1.2.3) were not met:
+
+Package dependency requirement 'zlib >= 1.2.3' could not be satisfied.
+Package 'zlib' has version '', required version is '>= 1.2.3'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/b3b882482f517726e5c780ba4c37818bd379df82
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/zlib-ng/zlib-ng/pull/1278]
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a62a95e..6a26d59 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -150,8 +150,10 @@ if(ZLIB_COMPAT)
+     add_definitions(-DZLIB_COMPAT)
+     set(WITH_GZFILEOP ON)
+     set(SUFFIX "")
++    set(ZLIB_FULL_VERSION ${ZLIB_HEADER_VERSION}.zlib-ng)
+ else()
+     set(SUFFIX "-ng")
++    set(ZLIB_FULL_VERSION ${ZLIBNG_HEADER_VERSION})
+ endif()
+ 
+ if(WITH_GZFILEOP)
+@@ -1068,10 +1070,8 @@ if(NOT DEFINED BUILD_SHARED_LIBS OR BUILD_SHARED_LIBS)
+     set_target_properties(zlib PROPERTIES DEFINE_SYMBOL ZLIB_DLL)
+ 
+     if(ZLIB_COMPAT)
+-        set(ZLIB_FULL_VERSION ${ZLIB_HEADER_VERSION}.zlib-ng)
+         set_target_properties(zlib PROPERTIES SOVERSION 1)
+     else()
+-        set(ZLIB_FULL_VERSION ${ZLIBNG_HEADER_VERSION})
+         set_target_properties(zlib PROPERTIES SOVERSION 2)
+     endif()
+ 
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
