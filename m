Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D29C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1800E4012E;
	Mon,  7 Mar 2022 21:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MTU7x2mvXgVm; Mon,  7 Mar 2022 21:25:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 772694049B;
	Mon,  7 Mar 2022 21:25:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E0691BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7CA04012E
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eg4xE_Klyi3K for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:24:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C68E0403F8
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:24:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0DA8982DF0; Mon,  7 Mar 2022 21:15:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 22:21:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84e7062cba31f64fbca98b042d3ac1da1866418e
X-Git-Newrev: 9c05b5e1007681f8a1d15a6194f84051e7569d04
X-Patchwork-Hint: ignore
Message-Id: <20220307211546.0DA8982DF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pulseview: fix build with glibmm
 2.68
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c05b5e1007681f8a1d15a6194f84051e7569d04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/ebb73892fd7471de4f0c109554dfdc65b93d3dcf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pulseview/0003-Support-glibmm-2.68.patch | 89 ++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/package/pulseview/0003-Support-glibmm-2.68.patch b/package/pulseview/0003-Support-glibmm-2.68.patch
new file mode 100644
index 0000000000..00e4e696d9
--- /dev/null
+++ b/package/pulseview/0003-Support-glibmm-2.68.patch
@@ -0,0 +1,89 @@
+From a97d5a060a534a3c658578e7f14ab43556db93ca Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 30 Dec 2021 16:19:46 +0100
+Subject: [PATCH] Support glibmm 2.68
+
+Support glibmm 2.68 which has been released one year ago and is the
+first stable release in the glibmm-2.68 ABI series:
+https://gitlab.gnome.org/GNOME/glibmm/-/blob/2.68.2/NEWS
+
+C++17 support is mandatory with glibmm 2.68
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet]
+---
+ CMakeLists.txt | 23 +++++++++++++++++++----
+ INSTALL        |  2 +-
+ 2 files changed, 20 insertions(+), 5 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7791b1b1..58a9cf92 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -75,7 +75,14 @@ add_subdirectory(manual)
+ #-------------------------------------------------------------------------------
+ 
+ list(APPEND PKGDEPS glib-2.0>=2.28.0)
+-list(APPEND PKGDEPS glibmm-2.4>=2.28.0)
++
++set(LIBSR_GLIBMM "glibmm-2.4>=2.28.0")
++find_package(PkgConfig)
++pkg_check_modules(LIBSRGLIBMM24 ${LIBSR_GLIBMM})
++if(NOT LIBSRGLIBMM24_FOUND)
++	set(LIBSR_GLIBMM "glibmm-2.68>=2.68.0")
++endif()
++list(APPEND PKGDEPS ${LIBSR_GLIBMM})
+ 
+ if(ENABLE_FLOW)
+ 	list(APPEND PKGDEPS gstreamermm-1.0>=1.8.0)
+@@ -93,7 +100,6 @@ if(ANDROID)
+ 	list(APPEND PKGDEPS libsigrokandroidutils>=0.1.0)
+ endif()
+ 
+-find_package(PkgConfig)
+ pkg_check_modules(LIBSRCXX ${LIBSR_CXX_BINDING})
+ if(NOT LIBSRCXX_FOUND OR NOT LIBSRCXX_VERSION)
+ 	message(FATAL_ERROR "libsigrok C++ bindings missing, check libsigrok's 'configure' output (missing dependencies?)")
+@@ -225,7 +231,11 @@ memaccess_check_unaligned_le(HAVE_UNALIGNED_LITTLE_ENDIAN_ACCESS)
+ set(PV_TITLE PulseView)
+ set(PV_VERSION_STRING "0.5.0")
+ 
+-set(PV_GLIBMM_VERSION ${PKGDEPS_glibmm-2.4_VERSION})
++if(LIBSRGLIBMM24_FOUND)
++	set(PV_GLIBMM_VERSION ${PKGDEPS_glibmm-2.4_VERSION})
++else()
++	set(PV_GLIBMM_VERSION ${PKGDEPS_glibmm-2.68_VERSION})
++endif()
+ 
+ include(GetGitRevisionDescription)
+ 
+@@ -486,7 +496,12 @@ qt5_add_resources(pulseview_RESOURCES_RCC ${CMAKE_BINARY_DIR}/translations.qrc)
+ add_definitions(-DQT_NO_KEYWORDS)
+ add_definitions(-D__STDC_LIMIT_MACROS)
+ add_definitions(-Wall -Wextra)
+-add_definitions(-std=c++11)
++if(LIBSRGLIBMM24_FOUND)
++	add_definitions(-std=c++11)
++else()
++	# glibmm-2.68 reuires c++17
++	add_definitions(-std=c++17)
++endif()
+ add_definitions(-DBOOST_MATH_DISABLE_FLOAT128=1)
+ if(WIN32)
+ 	add_definitions(-Wa,-mbig-obj -O3)
+diff --git a/INSTALL b/INSTALL
+index da89be8d..8003fcfb 100644
+--- a/INSTALL
++++ b/INSTALL
+@@ -14,7 +14,7 @@ Requirements
+  - pkg-config >= 0.22
+  - cmake >= 2.8.12
+  - libglib >= 2.28.0
+- - glibmm-2.4 (>= 2.28.0)
++ - glibmm-2.4 (>= 2.28.0) or glibmm-2.68 (>= 2.68.0)
+  - Qt5 (>= 5.3), including the following components:
+     - Qt5Core, Qt5Gui, Qt5Widgets, Qt5Svg, Qt5LinguistTools
+     - Qt translation package (optional; needed at runtime, not build time)
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
