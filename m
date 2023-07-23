Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC539C001DC
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 09:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF248409F4;
	Sun, 23 Jul 2023 09:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF248409F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PKCms_6rfnYQ; Sun, 23 Jul 2023 09:59:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7989409F8;
	Sun, 23 Jul 2023 09:59:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7989409F8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75DF41BF20B
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 09:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EFE360B2B
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 09:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EFE360B2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TANiSq0uVPN6 for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 09:59:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B38160B15
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 09:59:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B38160B15
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 599798262B; Sun, 23 Jul 2023 09:59:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 11:59:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0721f4e71a8100c8856ccbf5292c14c99d42ce36
X-Git-Newrev: 249efb46fcf35058505d23ae65ba395c5c51545e
X-Patchwork-Hint: ignore
Message-Id: <20230723095932.599798262B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: use the system
 provided LuaJIT
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

commit: https://git.buildroot.net/buildroot/commit/?id=249efb46fcf35058505d23ae65ba395c5c51545e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Luajit was not used at all when it was selected, instead fluent-bit
recompiled it without taking care of the complexities that were
handled in the luajit package. Fix this by linking dynamically to the
buildroot provided version.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...d-use-the-system-provided-LuaJIT-if-found.patch | 62 ++++++++++++++++++++++
 package/fluent-bit/fluent-bit.mk                   |  1 +
 2 files changed, 63 insertions(+)

diff --git a/package/fluent-bit/0001-build-use-the-system-provided-LuaJIT-if-found.patch b/package/fluent-bit/0001-build-use-the-system-provided-LuaJIT-if-found.patch
new file mode 100644
index 0000000000..9f6f4d0ebb
--- /dev/null
+++ b/package/fluent-bit/0001-build-use-the-system-provided-LuaJIT-if-found.patch
@@ -0,0 +1,62 @@
+From 4f8eb7bb5a39d83374806928b7a5b622136ef055 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Fri, 28 Apr 2023 10:25:16 +0200
+Subject: [PATCH] build: use the system provided LuaJIT if found
+
+e.g. buildroot has logic to build luajit,
+so if pkg_check_modules can find a suitable version,
+then use that one if -DFLB_PREFER_SYSTEM_LIBS=Yes.
+
+Upstream: https://github.com/fluent/fluent-bit/pull/7286
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ CMakeLists.txt     | 12 +++++++++++-
+ src/CMakeLists.txt |  2 +-
+ 2 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9af783c79..0601b7c18 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -123,6 +123,7 @@ option(FLB_TESTS_INTERNAL_FUZZ "Enable internal fuzz tests"    No)
+ option(FLB_TESTS_OSSFUZZ       "Enable OSS-Fuzz build"         No)
+ option(FLB_MTRACE              "Enable mtrace support"         No)
+ option(FLB_POSIX_TLS           "Force POSIX thread storage"    No)
++option(FLB_PREFER_SYSTEM_LIBS  "Prefer system installed libraries" No)
+ option(FLB_INOTIFY             "Enable inotify support"       Yes)
+ option(FLB_SQLDB               "Enable SQL embedded DB"       Yes)
+ option(FLB_HTTP_SERVER         "Enable HTTP Server"           Yes)
+@@ -1003,7 +1004,16 @@ endif()
+ # LuaJIT (Scripting Support)
+ # ==========================
+ if(FLB_LUAJIT)
+-  include(cmake/luajit.cmake)
++  if(FLB_PREFER_SYSTEM_LIBS)
++    find_package(PkgConfig)
++    pkg_check_modules(LUAJIT luajit>=2.1.0)
++  endif()
++  if(LUAJIT_FOUND)
++    include_directories(${LUAJIT_INCLUDE_DIRS})
++  else()
++    include(cmake/luajit.cmake)
++    set(LUAJIT_LIBRARIES "libluajit")
++  endif()
+   FLB_DEFINITION(FLB_HAVE_LUAJIT)
+ endif()
+ 
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 06a206dd4..8b66ddd22 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -220,7 +220,7 @@ endif()
+ if(FLB_LUAJIT)
+   set(extra_libs
+     ${extra_libs}
+-    "libluajit")
++    ${LUAJIT_LIBRARIES})
+ endif()
+ 
+ if(FLB_SQLDB)
+-- 
+2.34.1
+
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 6cfa601614..b26ec2b0b6 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -20,6 +20,7 @@ FLUENT_BIT_CONF_OPTS += \
 	-DFLB_RELEASE=Yes \
 	-DFLB_EXAMPLES=No \
 	-DFLB_CHUNK_TRACE=No \
+	-DFLB_PREFER_SYSTEM_LIBS=Yes \
 	-DFLB_BACKTRACE=No
 
 ifeq ($(BR2_PACKAGE_FLUENT_BIT_WASM),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
