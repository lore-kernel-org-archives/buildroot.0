Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33608C5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1F8A80DBD;
	Wed,  4 Jun 2025 18:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HFKanE795Mf8; Wed,  4 Jun 2025 18:46:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4EF781F15
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4EF781F15;
	Wed,  4 Jun 2025 18:46:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC12B1A6
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC6DB60855
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id stvw0A14T4Rn for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C907860680
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C907860680
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:46:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5FB687934; Wed,  4 Jun 2025 18:46:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Jun 2025 20:40:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1b759d34a59460b6754223ea05f8ee948b92abe
X-Git-Newrev: bd255e9e9c2bfe17525766fa6d61367787c30c00
X-Patchwork-Hint: ignore
Message-Id: <20250604184642.B5FB687934@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6tools: avoid build failures
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bd255e9e9c2bfe17525766fa6d61367787c30c00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we don't need assistant, designer or linguist on target, and we
don't need assistant or designer on host, we unconditionally disable
these tools, to avoid build failures without inreasing the complexity of
the package.

Fixes target linguist build:
-- Could NOT find Qt6LinguistTools (missing: Qt6LinguistTools_DIR)
CMake Error at <...>/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:768 (message):
  Failed to find the host tool "Qt6::lconvert".  It is part of the
  Qt6LinguistTools package, but the package could not be found.  Make sure
  you have built and installed the host Linguist module, which will ensure
  the creation of the Qt6LinguistTools package.
Call Stack (most recent call first):
  <...>/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:83 (qt_internal_find_tool)
  src/linguist/lconvert/CMakeLists.txt:9 (qt_internal_add_tool)

The following defconfig triggers a target linguist build without
building the necessary lconvert host tool. See:
https://code.qt.io/cgit/qt/qttools.git/tree/src/linguist/CMakeLists.txt?h=6.8.1#n17

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6BASE_GUI=y
BR2_PACKAGE_QT6BASE_PNG=y
BR2_PACKAGE_QT6BASE_WIDGETS=y
BR2_PACKAGE_QT6TOOLS=y

Fixes target designer build:
CMake Error at <...>/output/build/qt6base-6.8.1/cmake/QtPublicWalkLibsHelpers.cmake:267 (message):
  The Xml target is mentioned as a dependency for Designer, but not declared.
Call Stack (most recent call first):
  <...>/output/build/qt6base-6.8.1/cmake/QtPrlHelpers.cmake:8 (__qt_internal_walk_libs)
  <...>/output/build/qt6base-6.8.1/cmake/QtPrlHelpers.cmake:47 (qt_collect_libs)
  <...>/buildroot/output/build/qt6base-6.8.1/cmake/QtModuleHelpers.cmake:1027 (qt_generate_prl_file)
  <...>/buildroot/output/build/qt6base-6.8.1/cmake/QtScopeFinalizerHelpers.cmake:24:EVAL:1 (qt_finalize_module)
  src/designer/src/lib/CMakeLists.txt:DEFERRED

The following defconfig triggers a target designer build, without
selecting the necessary xml qt6base option. See:
https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n64
https://code.qt.io/cgit/qt/qttools.git/tree/src/designer/src/lib/CMakeLists.txt?h=6.8.1#n182

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6BASE_GUI=y
BR2_PACKAGE_QT6BASE_PNG=y
BR2_PACKAGE_QT6BASE_WIDGETS=y
BR2_PACKAGE_QT6TOOLS=y

Fixes target assistant build:
CMake Error at <...>/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:768 (message):
  Failed to find the host tool "Qt6::qhelpgenerator".  It is part of the
  Qt6ToolsTools package, but the package did not contain the tool.  Make sure
  that the host module Tools was built with all features enabled (no
  explicitly disabled tools).
Call Stack (most recent call first):
  <...>/buildroot/output/build/qt6base-6.8.1/cmake/QtToolHelpers.cmake:83 (qt_internal_find_tool)
  src/assistant/qhelpgenerator/CMakeLists.txt:9 (qt_internal_add_tool)

The following defconfig triggers a target assistant build, without
building the necessary qhelpgenerator host tool. See:
https://code.qt.io/cgit/qt/qttools.git/tree/configure.cmake?h=6.8.1#n45
https://code.qt.io/cgit/qt/qttools.git/tree/src/assistant/CMakeLists.txt?h=6.8.1#n4
https://code.qt.io/cgit/qt/qttools.git/tree/src/assistant/CMakeLists.txt?h=6.8.1#n21

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6BASE_GUI=y
BR2_PACKAGE_QT6BASE_PNG=y
BR2_PACKAGE_QT6BASE_PRINTSUPPORT=y
BR2_PACKAGE_QT6BASE_SQL=y
BR2_PACKAGE_QT6BASE_SQLITE=y
BR2_PACKAGE_QT6BASE_WIDGETS=y
BR2_PACKAGE_QT6TOOLS=y

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/qt6/qt6tools/Config.in.host | 3 ---
 package/qt6/qt6tools/qt6tools.mk    | 5 +++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/qt6/qt6tools/Config.in.host b/package/qt6/qt6tools/Config.in.host
index 7a6f8a5176..404ebfa923 100644
--- a/package/qt6/qt6tools/Config.in.host
+++ b/package/qt6/qt6tools/Config.in.host
@@ -2,9 +2,6 @@ config BR2_PACKAGE_HOST_QT6TOOLS
 	bool "host qt6tools"
 	# The Qt Qt Network module is required
 	select BR2_PACKAGE_HOST_QT6BASE_NETWORK
-	# Requires the Qt Sql module to build the qhelpgenerator
-	# tool, if target support for Sql is present
-	select BR2_PACKAGE_HOST_QT6BASE_SQL if BR2_PACKAGE_QT6BASE_SQL
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index b063f08887..a818cd7abc 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -28,6 +28,9 @@ QT6TOOLS_LICENSE_FILES = \
 	LICENSES/Qt-GPL-exception-1.0.txt
 
 QT6TOOLS_CONF_OPTS = \
+	-DFEATURE_assistant=OFF \
+	-DFEATURE_designer=OFF \
+	-DFEATURE_linguist=OFF \
 	-DQT_HOST_PATH=$(HOST_DIR) \
 	-DBUILD_WITH_PCH=OFF \
 	-DQT_BUILD_EXAMPLES=OFF \
@@ -42,6 +45,8 @@ QT6TOOLS_DEPENDENCIES += qt6declarative
 endif
 
 HOST_QT6TOOLS_CONF_OPTS = \
+	-DFEATURE_assistant=OFF \
+	-DFEATURE_designer=OFF \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
