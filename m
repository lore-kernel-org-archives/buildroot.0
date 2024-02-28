Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940ABC47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 16:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FC4960EC4;
	Wed, 28 Feb 2024 16:45:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rpzOpCf7BAaP; Wed, 28 Feb 2024 16:45:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06BFC60F17
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06BFC60F17;
	Wed, 28 Feb 2024 16:45:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A39A71BF2B3
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80FA480E67
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:44:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pnKuaj1HEt44 for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 16:44:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99A0C80C80
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99A0C80C80
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 16:44:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87C4987BFD; Wed, 28 Feb 2024 16:44:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 17:25:13 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: bd202dde79987898f3deb7cd6fbdff1217659dda
X-Git-Newrev: 1e7fb7c7a68781bb38dd09acf39eb25476e1d97a
X-Patchwork-Hint: ignore
Message-Id: <20240228164457.87C4987BFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/hiredis: do not
 install nuget packaging file
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e7fb7c7a68781bb38dd09acf39eb25476e1d97a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

The NuGet packaging description file is installed as:
    $(DEST_DIR)/build/native/hiredis.targets

This is a sprurious file that has nothing to do on a Linux system,
whether that be in host/, staging/, or target/.

Backport an upstream patch to get rid of it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
(cherry picked from commit 52f3793d46e4185951ce0e7254a35fba23959346)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
