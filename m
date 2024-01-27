Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DD6C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 16:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C32BD418AA;
	Sat, 27 Jan 2024 16:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C32BD418AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wJ4eOepCp4nw; Sat, 27 Jan 2024 16:44:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E780841899;
	Sat, 27 Jan 2024 16:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E780841899
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2DB571BF23B
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 16:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DAFD405CD
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 16:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DAFD405CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ktUvJZav1u9d for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 16:43:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB5B6401B2
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 16:43:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB5B6401B2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D610D864DD; Sat, 27 Jan 2024 16:43:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 17:43:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4abff80b0fc0001e5804e43d32cbeb67d3d2009
X-Git-Newrev: 52f3793d46e4185951ce0e7254a35fba23959346
X-Patchwork-Hint: ignore
Message-Id: <20240127164358.D610D864DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hiredis: do not install nuget
 packaging file
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

commit: https://git.buildroot.net/buildroot/commit/?id=52f3793d46e4185951ce0e7254a35fba23959346
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The NuGet packaging description file is installed as:
    $(DEST_DIR)/build/native/hiredis.targets

This is a sprurious file that has nothing to do on a Linux system,
whether that be in host/, staging/, or target/.

Backport an upstream patch to get rid of it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...add-option-to-not-install-NuGet-packaging.patch | 51 ++++++++++++++++++++++
 package/hiredis/hiredis.mk                         |  4 +-
 2 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/package/hiredis/0001-CMakeList-add-option-to-not-install-NuGet-packaging.patch b/package/hiredis/0001-CMakeList-add-option-to-not-install-NuGet-packaging.patch
new file mode 100644
index 0000000000..dbe8bc0ae6
--- /dev/null
+++ b/package/hiredis/0001-CMakeList-add-option-to-not-install-NuGet-packaging.patch
@@ -0,0 +1,51 @@
+From ff7a064490e0aacf718a5263b25b2ddaad0d245e Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sat, 20 Jan 2024 13:53:39 +0100
+Subject: [PATCH] CMakeList: add option to not install NuGet packaging
+
+The NuGet hiredis.target packaging description file is of no use on
+systems that are not using NuGet, like Linux systems, and the spurious
+presence of that file is not "clean".
+
+Add a cmake option to allow users to disable installation of that file.
+As some people may have relied on that file to be installed, continue to
+install it by default.
+
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+Upstream: https://github.com/redis/hiredis/commit/ff7a064490e0aacf718a5263b25b2ddaad0d245e
+---
+ CMakeLists.txt | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b7d6ee8..0fcf29b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -6,6 +6,9 @@ OPTION(DISABLE_TESTS "If tests should be compiled or not" OFF)
+ OPTION(ENABLE_SSL_TESTS "Should we test SSL connections" OFF)
+ OPTION(ENABLE_EXAMPLES "Enable building hiredis examples" OFF)
+ OPTION(ENABLE_ASYNC_TESTS "Should we run all asynchronous API tests" OFF)
++# Historically, the NuGet file was always install; default
++# to ON for those who rely on that historical behaviour.
++OPTION(ENABLE_NUGET "Install NuGET packaging details" ON)
+
+ MACRO(getVersionBit name)
+   SET(VERSION_REGEX "^#define ${name} (.+)$")
+@@ -105,9 +108,11 @@ if (MSVC AND BUILD_SHARED_LIBS)
+         CONFIGURATIONS Debug RelWithDebInfo)
+ endif()
+
+-# For NuGet packages
+-INSTALL(FILES hiredis.targets
+-    DESTINATION build/native)
++if (ENABLE_NUGET)
++    # For NuGet packages
++    INSTALL(FILES hiredis.targets
++        DESTINATION build/native)
++endif()
+
+ INSTALL(FILES hiredis.h read.h sds.h async.h alloc.h sockcompat.h
+     DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/hiredis)
+--
+2.43.0
+
diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index a7a6d639e6..476b079336 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -12,8 +12,8 @@ HIREDIS_LICENSE_FILES = COPYING
 HIREDIS_CPE_ID_VENDOR = redislabs
 HIREDIS_INSTALL_STAGING = YES
 
-HIREDIS_CONF_OPTS = -DDISABLE_TESTS=ON
-HOST_HIREDIS_CONF_OPTS = -DDISABLE_TESTS=ON -DENABLE_SSL=OFF
+HIREDIS_CONF_OPTS = -DENABLE_NUGET=OFF -DDISABLE_TESTS=ON
+HOST_HIREDIS_CONF_OPTS = -DENABLE_NUGET=OFF -DDISABLE_TESTS=ON -DENABLE_SSL=OFF
 
 # Set CMAKE_BUILD_TYPE to Release or the libraries will be suffixed with "d"
 # resulting in build failures when linking.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
