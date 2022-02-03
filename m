Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF47C433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 19:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54CE141764;
	Thu,  3 Feb 2022 19:36:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m9L5q87Owx25; Thu,  3 Feb 2022 19:36:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDF6141753;
	Thu,  3 Feb 2022 19:36:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E9C971BF32C
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 19:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C800C40A79
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 19:36:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mbyKyRDWNGQ8 for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 19:36:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A635F4018A
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 19:36:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6E46582628; Thu,  3 Feb 2022 19:28:58 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 3 Feb 2022 20:27:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72b4229cfce065d877168bf368081378d6c80a6e
X-Git-Newrev: 5770a645a3a49a3f0f02972131a4ff5283b4c11e
X-Patchwork-Hint: ignore
Message-Id: <20220203192858.6E46582628@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5: bump packages to latest kde
 submodule versions
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
Content-Type: multipart/mixed; boundary="===============5288038120413797107=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5288038120413797107==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5770a645a3a49a3f0f02972131a4ff5283b4c11e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This points all qt5 packages to the latest kde submodule versions
available at https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15

There is no 5.15.8 release of the kde-maintained modules, no release
tarballs and no tags. Instead, there's just a rolling maintenance
branch. We take a snapshot of that branch and call it 5.15.8, to match
the latest qt5webengine release.

We need to remove some patches applied upstream already.

qt5location has mapboxgl as a submodule, which is not included in the
gitlab-generated tarball. Therefore, use the git download method with
submodules enabled.

We need to pin qt5 packages not available in the new upstream to the
previous 5.15.2 version.

We need to set SYNC_QT_HEADERS for all qt5 packages in the new
upstream as headers are only copied in release archives which are
not provided in the kde upstream.

Instead of calling syncqt.pl, update the MODULE_VERSION in .qmake.conf
to 5.15.8 and create a .git file so to trigger headers sync during
configure.

Hold back updating qt5webengine for now since the latest version
requires significant changes to build, just tweak existing version
to be compatible with latest kde versions for now.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-qmake.mk                               |   4 +-
 package/qt5/qt5.mk                                 |   4 +-
 package/qt5/qt53d/qt53d.hash                       |   4 +-
 package/qt5/qt53d/qt53d.mk                         |   7 +-
 ...0006-Fix-build-with-GCC-11-include-limits.patch |  53 -------
 ...-for-avoiding-huge-number-of-tiny-dashes.patch} |   0
 .../qt5/qt5base/0007-Build-fixes-for-GCC-11.patch  |  61 --------
 .../qt5base/0008-Add-missing-limits-include.patch  |  32 ----
 .../qt5/qt5base/0009-Fix-build-on-riscv32.patch    |  45 ------
 ...ssing-intensive-painting-of-high-number-o.patch | 163 ---------------------
 ...x-for-avoiding-huge-number-of-tiny-dashes.patch | 100 -------------
 package/qt5/qt5base/qt5base.hash                   |   4 +-
 package/qt5/qt5base/qt5base.mk                     |   7 +-
 package/qt5/qt5charts/qt5charts.hash               |   4 +-
 package/qt5/qt5charts/qt5charts.mk                 |   7 +-
 package/qt5/qt5coap/qt5coap.mk                     |   2 +-
 package/qt5/qt5connectivity/qt5connectivity.hash   |   4 +-
 package/qt5/qt5connectivity/qt5connectivity.mk     |   7 +-
 ...revent_p-needs-c-limits-inlcude-fixes-gcc.patch |  45 ------
 package/qt5/qt5declarative/qt5declarative.hash     |   4 +-
 package/qt5/qt5declarative/qt5declarative.mk       |   7 +-
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |   4 +-
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |   7 +-
 package/qt5/qt5imageformats/qt5imageformats.hash   |   4 +-
 package/qt5/qt5imageformats/qt5imageformats.mk     |   7 +-
 package/qt5/qt5knx/qt5knx.mk                       |   2 +-
 package/qt5/qt5location/Config.in                  |   1 +
 package/qt5/qt5location/qt5location.hash           |   4 +-
 package/qt5/qt5location/qt5location.mk             |   8 +-
 package/qt5/qt5lottie/qt5lottie.hash               |   4 +-
 package/qt5/qt5lottie/qt5lottie.mk                 |   7 +-
 package/qt5/qt5mqtt/qt5mqtt.mk                     |   2 +-
 package/qt5/qt5multimedia/qt5multimedia.hash       |   4 +-
 package/qt5/qt5multimedia/qt5multimedia.mk         |   7 +-
 package/qt5/qt5opcua/qt5opcua.mk                   |   2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |   4 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk   |   7 +-
 .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |   4 +-
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk |   7 +-
 package/qt5/qt5quicktimeline/qt5quicktimeline.hash |   4 +-
 package/qt5/qt5quicktimeline/qt5quicktimeline.mk   |   7 +-
 package/qt5/qt5remoteobjects/qt5remoteobjects.hash |   4 +-
 package/qt5/qt5remoteobjects/qt5remoteobjects.mk   |   7 +-
 package/qt5/qt5script/qt5script.hash               |   4 +-
 package/qt5/qt5script/qt5script.mk                 |   7 +-
 package/qt5/qt5scxml/qt5scxml.hash                 |   4 +-
 package/qt5/qt5scxml/qt5scxml.mk                   |   7 +-
 package/qt5/qt5sensors/qt5sensors.hash             |   4 +-
 package/qt5/qt5sensors/qt5sensors.mk               |   7 +-
 package/qt5/qt5serialbus/qt5serialbus.hash         |   4 +-
 package/qt5/qt5serialbus/qt5serialbus.mk           |   7 +-
 package/qt5/qt5serialport/qt5serialport.hash       |   4 +-
 package/qt5/qt5serialport/qt5serialport.mk         |   7 +-
 package/qt5/qt5svg/qt5svg.hash                     |   4 +-
 package/qt5/qt5svg/qt5svg.mk                       |   7 +-
 package/qt5/qt5tools/qt5tools.hash                 |   4 +-
 package/qt5/qt5tools/qt5tools.mk                   |   7 +-
 .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash |   4 +-
 .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk   |   7 +-
 package/qt5/qt5wayland/qt5wayland.hash             |   4 +-
 package/qt5/qt5wayland/qt5wayland.mk               |   7 +-
 package/qt5/qt5webchannel/qt5webchannel.hash       |   4 +-
 package/qt5/qt5webchannel/qt5webchannel.mk         |   7 +-
 ...romium-breakpad-fix-build-with-glibc-2.34.patch |  76 ++++++++++
 package/qt5/qt5webengine/qt5webengine.mk           |   9 +-
 package/qt5/qt5websockets/qt5websockets.hash       |   4 +-
 package/qt5/qt5websockets/qt5websockets.mk         |   7 +-
 package/qt5/qt5webview/qt5webview.hash             |   4 +-
 package/qt5/qt5webview/qt5webview.mk               |   7 +-
 package/qt5/qt5x11extras/qt5x11extras.hash         |   4 +-
 package/qt5/qt5x11extras/qt5x11extras.mk           |   7 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |   4 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |   7 +-
 73 files changed, 261 insertions(+), 649 deletions(-)

diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
index 4dcaf6dd62..fdaddf08df 100644
--- a/package/pkg-qmake.mk
+++ b/package/pkg-qmake.mk
@@ -24,7 +24,9 @@
 # Hook to sync Qt headers
 #
 define QT_HEADERS_SYNC_HOOK
-	$(Q)cd $($(PKG)_BUILDDIR) && $(HOST_DIR)/bin/syncqt.pl -version $(QT5_VERSION)
+	sed -e '/^MODULE_VERSION/s/5\.15\.[3456789]/$(QT5_VERSION)/' -i \
+		$($(PKG)_BUILDDIR)/.qmake.conf
+	touch $($(PKG)_BUILDDIR)/.git
 endef
 
 ################################################################################
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 3ffb7b0063..656e3067dc 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 QT5_VERSION_MAJOR = 5.15
-QT5_VERSION = $(QT5_VERSION_MAJOR).2
+QT5_VERSION = $(QT5_VERSION_MAJOR).8
 QT5_SOURCE_TARBALL_PREFIX = everywhere-src
-QT5_SITE = https://download.qt.io/archive/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
+QT5_SITE = https://invent.kde.org/qt/qt
 
 include $(sort $(wildcard package/qt5/*/*.mk))
 
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 43b2132cc7..32d3675619 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qt3d-everywhere-src-5.15.2.tar.xz.sha256
-sha256  03ed6a48c813c75296c19f5d721184ab168280b69d2656cf16f877d3d4c55c1d  qt3d-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  4c40260d4298b3e71a9879b43530b1e0b3f235a680bb0e7be76a375f4ae24696  qt3d-dba14d48611b9e9d59576172658779ab4a39b416.tar.bz2
 
 # Hashes for license files:
 sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPL
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index f3eff9edf0..9a07d189bd 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-QT53D_VERSION = $(QT5_VERSION)
-QT53D_SITE = $(QT5_SITE)
-QT53D_SOURCE = qt3d-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT53D_VERSION).tar.xz
+QT53D_VERSION = dba14d48611b9e9d59576172658779ab4a39b416
+QT53D_SITE = $(QT5_SITE)/qt3d/-/archive/$(QT53D_VERSION)
+QT53D_SOURCE = qt3d-$(QT53D_VERSION).tar.bz2
 QT53D_DEPENDENCIES = qt5declarative
 QT53D_INSTALL_STAGING = YES
+QT53D_SYNC_QT_HEADERS = YES
 
 ifeq ($(BR2_PACKAGE_ASSIMP),y)
 QT53D_DEPENDENCIES += assimp
diff --git a/package/qt5/qt5base/0006-Fix-build-with-GCC-11-include-limits.patch b/package/qt5/qt5base/0006-Fix-build-with-GCC-11-include-limits.patch
deleted file mode 100644
index f014a160d5..0000000000
--- a/package/qt5/qt5base/0006-Fix-build-with-GCC-11-include-limits.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 9c56d4da2ff631a8c1c30475bd792f6c86bda53c Mon Sep 17 00:00:00 2001
-From: Thiago Macieira <thiago.macieira@intel.com>
-Date: Mon, 18 Jan 2021 07:40:54 -0800
-Subject: [PATCH] Fix build with GCC 11: include <limits>
-
-Fixes: QTBUG-90395
-Pick-to: 6.0
-Change-Id: Iecc74d2000eb40dfbe7bfffd165b5dd3708b7a40
-Reviewed-by: Edward Welbourne <edward.welbourne@qt.io>
-
-[Retrieved (and backported) from:
-https://github.com/qt/qtbase/commit/9c56d4da2ff631a8c1c30475bd792f6c86bda53c]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/corelib/global/qendian.h  | 6 ++++--
- src/corelib/global/qfloat16.h | 1 +
- 2 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/src/corelib/global/qendian.h b/src/corelib/global/qendian.h
-index 99b529f17cd..c874c5e47ab 100644
---- a/src/corelib/global/qendian.h
-+++ b/src/corelib/global/qendian.h
-@@ -1,7 +1,7 @@
- /****************************************************************************
- **
--** Copyright (C) 2016 The Qt Company Ltd.
--** Copyright (C) 2016 Intel Corporation.
-+** Copyright (C) 2021 The Qt Company Ltd.
-+** Copyright (C) 2021 Intel Corporation.
- ** Contact: https://www.qt.io/licensing/
- **
- ** This file is part of the QtCore module of the Qt Toolkit.
-@@ -44,6 +44,8 @@
- #include <QtCore/qfloat16.h>
- #include <QtCore/qglobal.h>
- 
-+#include <limits>
-+
- // include stdlib.h and hope that it defines __GLIBC__ for glibc-based systems
- #include <stdlib.h>
- #include <string.h>
-diff --git a/src/corelib/global/qfloat16.h b/src/corelib/global/qfloat16.h
-index e9477d2ecec..a25fac28862 100644
---- a/src/corelib/global/qfloat16.h
-+++ b/src/corelib/global/qfloat16.h
-@@ -44,6 +44,7 @@
-
- #include <QtCore/qglobal.h>
- #include <QtCore/qmetatype.h>
-+#include <limits>
- #include <string.h>
- 
- #if defined(QT_COMPILER_SUPPORTS_F16C) && defined(__AVX2__) && !defined(__F16C__)
diff --git a/package/qt5/qt5base/0011-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch b/package/qt5/qt5base/0006-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch
similarity index 100%
rename from package/qt5/qt5base/0011-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch
rename to package/qt5/qt5base/0006-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch
diff --git a/package/qt5/qt5base/0007-Build-fixes-for-GCC-11.patch b/package/qt5/qt5base/0007-Build-fixes-for-GCC-11.patch
deleted file mode 100644
index d20600c6ce..0000000000
--- a/package/qt5/qt5base/0007-Build-fixes-for-GCC-11.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 86494659b2ab14edc653cd2d9260561ad4c4e4e8 Mon Sep 17 00:00:00 2001
-From: Ville Voutilainen <ville.voutilainen@qt.io>
-Date: Mon, 18 Jan 2021 09:58:17 +0200
-Subject: [PATCH] Build fixes for GCC 11
-
-Task-number: QTBUG-89977
-Change-Id: Ic1b7ddbffb8a0a00f8c621d09a868f1d94a52c21
-Reviewed-by: Lars Knoll <lars.knoll@qt.io>
-Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
-[Retrieved (and backported) from:
-https://github.com/qt/qtbase/commit/813a928c7c3cf98670b6043149880ed5c955efb9]
-Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
----
- src/corelib/text/qbytearraymatcher.h     | 2 ++
- src/corelib/tools/qsharedpointer_impl.h  | 3 ---
- src/plugins/platforms/xcb/qxcbwindow.cpp | 2 +-
- 3 files changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/src/corelib/text/qbytearraymatcher.h b/src/corelib/text/qbytearraymatcher.h
-index 0eedfc1d20..f5f9bef7b8 100644
---- a/src/corelib/text/qbytearraymatcher.h
-+++ b/src/corelib/text/qbytearraymatcher.h
-@@ -42,6 +42,8 @@
- 
- #include <QtCore/qbytearray.h>
- 
-+#include <limits>
-+
- QT_BEGIN_NAMESPACE
- 
- 
-diff --git a/src/corelib/tools/qsharedpointer_impl.h b/src/corelib/tools/qsharedpointer_impl.h
-index 790c187cb9..4aee98af53 100644
---- a/src/corelib/tools/qsharedpointer_impl.h
-+++ b/src/corelib/tools/qsharedpointer_impl.h
-@@ -155,9 +155,6 @@ namespace QtSharedPointer {
- #endif
-         inline void checkQObjectShared(...) { }
-         inline void setQObjectShared(...) { }
--
--        inline void operator delete(void *ptr) { ::operator delete(ptr); }
--        inline void operator delete(void *, void *) { }
-     };
-     // sizeof(ExternalRefCountData) = 12 (32-bit) / 16 (64-bit)
- 
-diff --git a/src/plugins/platforms/xcb/qxcbwindow.cpp b/src/plugins/platforms/xcb/qxcbwindow.cpp
-index 9e7e1a5572..f0866a90ac 100644
---- a/src/plugins/platforms/xcb/qxcbwindow.cpp
-+++ b/src/plugins/platforms/xcb/qxcbwindow.cpp
-@@ -698,7 +698,7 @@ void QXcbWindow::show()
-         if (isTransient(window())) {
-             const QWindow *tp = window()->transientParent();
-             if (tp && tp->handle())
--                transientXcbParent = static_cast<const QXcbWindow *>(tp->handle())->winId();
-+                transientXcbParent = tp->handle()->winId();
-             // Default to client leader if there is no transient parent, else modal dialogs can
-             // be hidden by their parents.
-             if (!transientXcbParent)
--- 
-2.31.1
-
diff --git a/package/qt5/qt5base/0008-Add-missing-limits-include.patch b/package/qt5/qt5base/0008-Add-missing-limits-include.patch
deleted file mode 100644
index e489f2e551..0000000000
--- a/package/qt5/qt5base/0008-Add-missing-limits-include.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 87a869a8404047240cccaa9f101351aeb9417a26 Mon Sep 17 00:00:00 2001
-From: Nicolas Fella <nicolas.fella@kdab.com>
-Date: Sun, 20 Jun 2021 17:36:41 +0200
-Subject: [PATCH] Add missing limits include
-
-The code uses std::numeric_limits but is lacking the appropriate include
-
-Pick-to: 5.15 6.1 6.2
-Change-Id: I41fa5ac4d8c4e06f35b5b1551ef2ad8417df80bd
-Reviewed-by: Giuseppe D'Angelo <giuseppe.dangelo@kdab.com>
-
-[Upstream: https://code.qt.io/cgit/qt/qtbase.git/patch/?id=2b2b3155d9f6ba1e4f859741468fbc47db09292b]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- src/corelib/tools/qoffsetstringarray_p.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/corelib/tools/qoffsetstringarray_p.h b/src/corelib/tools/qoffsetstringarray_p.h
-index 4dd9e960..e26a57ff 100644
---- a/src/corelib/tools/qoffsetstringarray_p.h
-+++ b/src/corelib/tools/qoffsetstringarray_p.h
-@@ -55,6 +55,7 @@
- 
- #include <tuple>
- #include <array>
-+#include <limits>
- 
- QT_BEGIN_NAMESPACE
- 
--- 
-2.32.0
-
diff --git a/package/qt5/qt5base/0009-Fix-build-on-riscv32.patch b/package/qt5/qt5base/0009-Fix-build-on-riscv32.patch
deleted file mode 100644
index 98c7210551..0000000000
--- a/package/qt5/qt5base/0009-Fix-build-on-riscv32.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 035dc537bee26e3b63a211b2835d8560439e161f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 27 Aug 2021 16:28:32 +0200
-Subject: Fix build on riscv32
-
-riscv32 fails to build because __NR_futex is not defined on this
-architecture:
-
-In file included from thread/qmutex_linux.cpp:45,
-                 from thread/qmutex.cpp:804:
-thread/qfutex_p.h: In function 'int QtLinuxFutex::_q_futex(int*, int, int, quintptr, int*, int)':
-thread/qfutex_p.h:116:30: error: '__NR_futex' was not declared in this scope; did you mean '_q_futex'?
-  116 |         int result = syscall(__NR_futex, addr, op | FUTEX_PRIVATE_FLAG, val, val2, addr2, val3);
-      |                              ^~~~~~~~~~
-      |                              _q_futex
-
-Pick-to: 6.1 6.2
-Fixes: QTBUG-96067
-Change-Id: Ib6a9bcc496f37e69ac39362cb0a021fccaf311f5
-Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
-[Retrieved from:
-https://code.qt.io/cgit/qt/qtbase.git/commit/?id=035dc537bee26e3b63a211b2835d8560439e161f]
----
- src/corelib/thread/qfutex_p.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/corelib/thread/qfutex_p.h b/src/corelib/thread/qfutex_p.h
-index 40482b6fc1..037207a5c0 100644
---- a/src/corelib/thread/qfutex_p.h
-+++ b/src/corelib/thread/qfutex_p.h
-@@ -103,6 +103,11 @@ QT_END_NAMESPACE
- // if not defined in linux/futex.h
- #  define FUTEX_PRIVATE_FLAG        128         // added in v2.6.22
- 
-+// RISC-V does not supply __NR_futex
-+#  ifndef __NR_futex
-+#    define __NR_futex __NR_futex_time64
-+#  endif
-+
- QT_BEGIN_NAMESPACE
- namespace QtLinuxFutex {
-     constexpr inline bool futexAvailable() { return true; }
--- 
-cgit v1.2.1
-
diff --git a/package/qt5/qt5base/0010-Avoid-processing-intensive-painting-of-high-number-o.patch b/package/qt5/qt5base/0010-Avoid-processing-intensive-painting-of-high-number-o.patch
deleted file mode 100644
index 03287d19ca..0000000000
--- a/package/qt5/qt5base/0010-Avoid-processing-intensive-painting-of-high-number-o.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-From 307bc02e379e63aa9b7a3d21bbcd9c84d34c600f Mon Sep 17 00:00:00 2001
-From: Eirik Aavitsland <eirik.aavitsland@qt.io>
-Date: Tue, 13 Apr 2021 14:23:45 +0200
-Subject: [PATCH] Avoid processing-intensive painting of high number of tiny
- dashes
-
-When stroking a dashed path, an unnecessary amount of processing would
-be spent if there is a huge number of dashes visible, e.g. because of
-scaling. Since the dashes are too small to be indivdually visible
-anyway, just replace with a semi-transparent solid line for such
-cases.
-
-Pick-to: 6.1 6.0 5.15
-Change-Id: I9e9f7861257ad5bce46a0cf113d1a9d7824911e6
-Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
-(cherry picked from commit f4d791b330d02777fcaf02938732892eb3167e9b)
-
-* asturmlechner 2021-08-21:
-Conflict from preceding 94dd2ceb in dev branch:
-	src/gui/painting/qpaintengineex.cpp
-	Resolved via:
-
-     if (pen.style() > Qt::SolidLine) {
-         QRectF cpRect = path.controlPointRect();
-         const QTransform &xf = state()->matrix;
--        if (pen.isCosmetic()) {
-+        if (qt_pen_is_cosmetic(pen, state()->renderHints)){
-             clipRect = d->exDeviceRect;
-             cpRect.translate(xf.dx(), xf.dy());
-         } else {
-
-FTBFS from preceding 471e4fcb in dev branch changing QVector to QList:
-	Resolved via:
-
-         QRectF extentRect = cpRect.adjusted(-pw, -pw, pw, pw) & clipRect;
-         qreal extent = qMax(extentRect.width(), extentRect.height());
-         qreal patternLength = 0;
--        const QList<qreal> pattern = pen.dashPattern();
-+        const QVector<qreal> pattern = pen.dashPattern();
-         const int patternSize = qMin(pattern.size(), 32);
-         for (int i = 0; i < patternSize; i++)
-             patternLength += qMax(pattern.at(i), qreal(0));
-
-[Retrieved from: https://invent.kde.org/qt/qt/qtbase/-/commit/081d835c040a90f8ee76807354355062ac521dfb]
-Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
----
- src/gui/painting/qpaintengineex.cpp           | 44 +++++++++++++++----
- .../other/lancelot/scripts/tinydashes.qps     | 34 ++++++++++++++
- 2 files changed, 69 insertions(+), 9 deletions(-)
- create mode 100644 tests/auto/other/lancelot/scripts/tinydashes.qps
-
-diff --git a/src/gui/painting/qpaintengineex.cpp b/src/gui/painting/qpaintengineex.cpp
-index 5d8f89eadd..55fdb0c2a0 100644
---- a/src/gui/painting/qpaintengineex.cpp
-+++ b/src/gui/painting/qpaintengineex.cpp
-@@ -385,7 +385,7 @@ QPainterState *QPaintEngineEx::createState(QPainterState *orig) const
- 
- Q_GUI_EXPORT extern bool qt_scaleForTransform(const QTransform &transform, qreal *scale); // qtransform.cpp
- 
--void QPaintEngineEx::stroke(const QVectorPath &path, const QPen &pen)
-+void QPaintEngineEx::stroke(const QVectorPath &path, const QPen &inPen)
- {
- #ifdef QT_DEBUG_DRAW
-     qDebug() << "QPaintEngineEx::stroke()" << pen;
-@@ -403,6 +403,38 @@ void QPaintEngineEx::stroke(const QVectorPath &path, const QPen &pen)
-         d->stroker.setCubicToHook(qpaintengineex_cubicTo);
-     }
- 
-+    QRectF clipRect;
-+    QPen pen = inPen;
-+    if (pen.style() > Qt::SolidLine) {
-+        QRectF cpRect = path.controlPointRect();
-+        const QTransform &xf = state()->matrix;
-+        if (qt_pen_is_cosmetic(pen, state()->renderHints)){
-+            clipRect = d->exDeviceRect;
-+            cpRect.translate(xf.dx(), xf.dy());
-+        } else {
-+            clipRect = xf.inverted().mapRect(QRectF(d->exDeviceRect));
-+        }
-+        // Check to avoid generating unwieldy amount of dashes that will not be visible anyway
-+        QRectF extentRect = cpRect & clipRect;
-+        qreal extent = qMax(extentRect.width(), extentRect.height());
-+        qreal patternLength = 0;
-+        const QVector<qreal> pattern = pen.dashPattern();
-+        const int patternSize = qMin(pattern.size(), 32);
-+        for (int i = 0; i < patternSize; i++)
-+            patternLength += qMax(pattern.at(i), qreal(0));
-+        if (pen.widthF())
-+            patternLength *= pen.widthF();
-+        if (qFuzzyIsNull(patternLength)) {
-+            pen.setStyle(Qt::NoPen);
-+        } else if (extent / patternLength > 10000) {
-+            // approximate stream of tiny dashes with semi-transparent solid line
-+            pen.setStyle(Qt::SolidLine);
-+            QColor color(pen.color());
-+            color.setAlpha(color.alpha() / 2);
-+            pen.setColor(color);
-+        }
-+    }
-+
-     if (!qpen_fast_equals(pen, d->strokerPen)) {
-         d->strokerPen = pen;
-         d->stroker.setJoinStyle(pen.joinStyle());
-@@ -430,14 +462,8 @@ void QPaintEngineEx::stroke(const QVectorPath &path, const QPen &pen)
-         return;
-     }
- 
--    if (pen.style() > Qt::SolidLine) {
--        if (qt_pen_is_cosmetic(pen, state()->renderHints)){
--            d->activeStroker->setClipRect(d->exDeviceRect);
--        } else {
--            QRectF clipRect = state()->matrix.inverted().mapRect(QRectF(d->exDeviceRect));
--            d->activeStroker->setClipRect(clipRect);
--        }
--    }
-+    if (!clipRect.isNull())
-+        d->activeStroker->setClipRect(clipRect);
- 
-     if (d->activeStroker == &d->stroker)
-         d->stroker.setForceOpen(path.hasExplicitOpen());
-diff --git a/tests/auto/other/lancelot/scripts/tinydashes.qps b/tests/auto/other/lancelot/scripts/tinydashes.qps
-new file mode 100644
-index 0000000000..d41ced7f5f
---- /dev/null
-+++ b/tests/auto/other/lancelot/scripts/tinydashes.qps
-@@ -0,0 +1,34 @@
-+# Version: 1
-+# CheckVsReference: 5%
-+
-+path_addEllipse mypath 20.0 20.0 200.0 200.0
-+
-+save
-+setPen blue 20 SolidLine FlatCap
-+pen_setCosmetic true
-+pen_setDashPattern [ 0.0004 0.0004 ]
-+setBrush yellow
-+
-+drawPath mypath
-+translate 300 0
-+setRenderHint Antialiasing true
-+drawPath mypath
-+restore
-+
-+path_addEllipse bigpath 200000.0 200000.0 2000000.0 2000000.0
-+
-+setPen blue 20 DotLine FlatCap
-+setBrush yellow
-+
-+save
-+translate 0 300
-+scale 0.0001 0.00011
-+drawPath bigpath
-+restore
-+
-+save
-+translate 300 300
-+setRenderHint Antialiasing true
-+scale 0.0001 0.00011
-+drawPath bigpath
-+restore
--- 
-2.34.1
-
diff --git a/package/qt5/qt5base/0012-Refix-for-avoiding-huge-number-of-tiny-dashes.patch b/package/qt5/qt5base/0012-Refix-for-avoiding-huge-number-of-tiny-dashes.patch
deleted file mode 100644
index ca3c2736ae..0000000000
--- a/package/qt5/qt5base/0012-Refix-for-avoiding-huge-number-of-tiny-dashes.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 3b1a60f651776a7b2d155803b07a52a9e27bdf78 Mon Sep 17 00:00:00 2001
-From: Eirik Aavitsland <eirik.aavitsland@qt.io>
-Date: Fri, 30 Jul 2021 13:03:49 +0200
-Subject: [PATCH] Refix for avoiding huge number of tiny dashes
-
-Previous fix hit too widely so some valid horizontal and vertical
-lines were affected; the root problem being that such lines have an
-empty control point rect (width or height is 0). Fix by caculating in
-the pen width.
-
-Pick-to: 6.2 6.1 5.15
-Change-Id: I7a436e873f6d485028f6759d0e2c6456f07eebdc
-Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
-(cherry picked from commit 84aba80944a2e1c3058d7a1372e0e66676411884)
-[Retrieved from: https://invent.kde.org/qt/qt/qtbase/-/commit/427df34efdcb56582a9ae9f7d2d1f39eeff70328]
-Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
----
- src/gui/painting/qpaintengineex.cpp           |  8 ++---
- .../gui/painting/qpainter/tst_qpainter.cpp    | 31 +++++++++++++++++++
- 2 files changed, 35 insertions(+), 4 deletions(-)
-
-diff --git a/src/gui/painting/qpaintengineex.cpp b/src/gui/painting/qpaintengineex.cpp
-index 19e4b23423..9fe510827a 100644
---- a/src/gui/painting/qpaintengineex.cpp
-+++ b/src/gui/painting/qpaintengineex.cpp
-@@ -415,18 +415,18 @@ void QPaintEngineEx::stroke(const QVectorPath &path, const QPen &inPen)
-             clipRect = xf.inverted().mapRect(QRectF(d->exDeviceRect));
-         }
-         // Check to avoid generating unwieldy amount of dashes that will not be visible anyway
--        QRectF extentRect = cpRect & clipRect;
-+        qreal pw = pen.widthF() ? pen.widthF() : 1;
-+        QRectF extentRect = cpRect.adjusted(-pw, -pw, pw, pw) & clipRect;
-         qreal extent = qMax(extentRect.width(), extentRect.height());
-         qreal patternLength = 0;
-         const QVector<qreal> pattern = pen.dashPattern();
-         const int patternSize = qMin(pattern.size(), 32);
-         for (int i = 0; i < patternSize; i++)
-             patternLength += qMax(pattern.at(i), qreal(0));
--        if (pen.widthF())
--            patternLength *= pen.widthF();
-+        patternLength *= pw;
-         if (qFuzzyIsNull(patternLength)) {
-             pen.setStyle(Qt::NoPen);
--        } else if (qFuzzyIsNull(extent) || extent / patternLength > 10000) {
-+        } else if (extent / patternLength > 10000) {
-             // approximate stream of tiny dashes with semi-transparent solid line
-             pen.setStyle(Qt::SolidLine);
-             QColor color(pen.color());
-diff --git a/tests/auto/gui/painting/qpainter/tst_qpainter.cpp b/tests/auto/gui/painting/qpainter/tst_qpainter.cpp
-index 42e98ce363..d7c3f95f1d 100644
---- a/tests/auto/gui/painting/qpainter/tst_qpainter.cpp
-+++ b/tests/auto/gui/painting/qpainter/tst_qpainter.cpp
-@@ -308,6 +308,7 @@ private slots:
-     void fillPolygon();
- 
-     void drawImageAtPointF();
-+    void scaledDashes();
- 
- private:
-     void fillData();
-@@ -5468,6 +5469,36 @@ void tst_QPainter::drawImageAtPointF()
-     paint.end();
- }
- 
-+void tst_QPainter::scaledDashes()
-+{
-+    // Test that we do not hit the limit-huge-number-of-dashes path
-+    QRgb fore = qRgb(0, 0, 0xff);
-+    QRgb back = qRgb(0xff, 0xff, 0);
-+    QImage image(5, 32, QImage::Format_RGB32);
-+    image.fill(back);
-+    QPainter p(&image);
-+    QPen pen(QColor(fore), 3, Qt::DotLine);
-+    p.setPen(pen);
-+    p.scale(1, 2);
-+    p.drawLine(2, 0, 2, 16);
-+    p.end();
-+
-+    bool foreFound = false;
-+    bool backFound = false;
-+    int i = 0;
-+    while (i < 32 && (!foreFound || !backFound)) {
-+        QRgb pix = image.pixel(3, i);
-+        if (pix == fore)
-+            foreFound = true;
-+        else if (pix == back)
-+            backFound = true;
-+        i++;
-+    }
-+
-+    QVERIFY(foreFound);
-+    QVERIFY(backFound);
-+}
-+
- QTEST_MAIN(tst_QPainter)
- 
- #include "tst_qpainter.moc"
--- 
-2.34.1
-
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index a824890e3c..396f5044ff 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtbase-everywhere-src-5.15.2.tar.xz.sha256
-sha256  909fad2591ee367993a75d7e2ea50ad4db332f05e1c38dd7a5a274e156a4e0f8  qtbase-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  269ae20ed74cb949420ac3abac0bdef3b65501ea47c9312c01e8f9073baf24fe  qtbase-53a047c212af7fbded6505651f648172f9d7a34d.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 4ef3759566..d8a0bf1d16 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-QT5BASE_VERSION = $(QT5_VERSION)
-QT5BASE_SITE = $(QT5_SITE)
-QT5BASE_SOURCE = qtbase-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5BASE_VERSION).tar.xz
+QT5BASE_VERSION = 53a047c212af7fbded6505651f648172f9d7a34d
+QT5BASE_SITE = $(QT5_SITE)/qtbase/-/archive/$(QT5BASE_VERSION)
+QT5BASE_SOURCE = qtbase-$(QT5BASE_VERSION).tar.bz2
 
 QT5BASE_DEPENDENCIES = host-pkgconf pcre2 zlib
 QT5BASE_INSTALL_STAGING = YES
+QT5BASE_SYNC_QT_HEADERS = YES
 
 # 0010-Avoid-processing-intensive-painting-of-high-number-o.patch
 # 0011-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index b52be714b7..021d4ea19f 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtcharts-everywhere-src-5.15.2.tar.xz.sha256
-sha256  e0750e4195bd8a8b9758ab4d98d437edbe273cd3d289dd6a8f325df6d13f3d11  qtcharts-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  60f973c79aa059981347864ca26ef361ac38bc835286ac5875f6c7c1248a9b21  qtcharts-130463160b4923069eb98da49edaf7d93180f4f8.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
index 2c40ac1c89..24e635b93b 100644
--- a/package/qt5/qt5charts/qt5charts.mk
+++ b/package/qt5/qt5charts/qt5charts.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-QT5CHARTS_VERSION = $(QT5_VERSION)
-QT5CHARTS_SITE = $(QT5_SITE)
-QT5CHARTS_SOURCE = qtcharts-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5CHARTS_VERSION).tar.xz
+QT5CHARTS_VERSION = 130463160b4923069eb98da49edaf7d93180f4f8
+QT5CHARTS_SITE = $(QT5_SITE)/qtcharts/-/archive/$(QT5CHARTS_VERSION)
+QT5CHARTS_SOURCE = qtcharts-$(QT5CHARTS_VERSION).tar.bz2
 QT5CHARTS_INSTALL_STAGING = YES
+QT5CHARTS_SYNC_QT_HEADERS = YES
 
 QT5CHARTS_LICENSE = GPL-3.0
 QT5CHARTS_LICENSE_FILES = LICENSE.GPL3
diff --git a/package/qt5/qt5coap/qt5coap.mk b/package/qt5/qt5coap/qt5coap.mk
index 24de869120..a50f19d7f2 100644
--- a/package/qt5/qt5coap/qt5coap.mk
+++ b/package/qt5/qt5coap/qt5coap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5COAP_VERSION = $(QT5_VERSION)
+QT5COAP_VERSION = 5.15.2
 QT5COAP_SITE = https://code.qt.io/cgit/qt/qtcoap.git
 QT5COAP_SITE_METHOD = git
 QT5COAP_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index 3edc2d666a..12e9d637b2 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtconnectivity-everywhere-src-5.15.2.tar.xz.sha256
-sha256  0380327871f76103e5b8c2a305988d76d352b6a982b3e7b3bc3cdc184c64bfa0  qtconnectivity-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  216e9f6b1be00897ac1ce12f0ea4d1733eb70acd49ec3a83d01cd472b2fb5450  qtconnectivity-5e9ca5d36d65dadb98ef90013a1dcf15fbd7ae26.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index 6402b505bf..a4c79be10b 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-QT5CONNECTIVITY_VERSION = $(QT5_VERSION)
-QT5CONNECTIVITY_SITE = $(QT5_SITE)
-QT5CONNECTIVITY_SOURCE = qtconnectivity-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5CONNECTIVITY_VERSION).tar.xz
+QT5CONNECTIVITY_VERSION = 5e9ca5d36d65dadb98ef90013a1dcf15fbd7ae26
+QT5CONNECTIVITY_SITE = $(QT5_SITE)/qtconnectivity/-/archive/$(QT5CONNECTIVITY_VERSION)
+QT5CONNECTIVITY_SOURCE = qtconnectivity-$(QT5CONNECTIVITY_VERSION).tar.bz2
 QT5CONNECTIVITY_INSTALL_STAGING = YES
+QT5CONNECTIVITY_SYNC_QT_HEADERS = YES
 
 QT5CONNECTIVITY_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5CONNECTIVITY_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
diff --git a/package/qt5/qt5declarative/0003-qqmlprofilerevent_p-needs-c-limits-inlcude-fixes-gcc.patch b/package/qt5/qt5declarative/0003-qqmlprofilerevent_p-needs-c-limits-inlcude-fixes-gcc.patch
deleted file mode 100644
index 0e6da652f9..0000000000
--- a/package/qt5/qt5declarative/0003-qqmlprofilerevent_p-needs-c-limits-inlcude-fixes-gcc.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From cc8d62f556c065d28a52e4b784b5d22f2cca3001 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Thu, 22 Jul 2021 23:13:43 +0200
-Subject: [PATCH] qqmlprofilerevent_p: needs c++ limits inlcude (fixes gcc-11
- compile)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-
-  In file included from qqmlprofilertypedevent_p.h:43,
-                   from qqmlprofilertypedevent.cpp:40:
-  qqmlprofilerevent_p.h: In member function ‘void QQmlProfilerEvent::assignNumbers(const Container&)’:
-  qqmlprofilerevent_p.h:314:65: error: ‘numeric_limits’ is not a member of ‘std’
-    314 |                     static_cast<quint16>(numbers.size()) : std::numeric_limits<quint16>::max();
-        |                                                                 ^~~~~~~~~~~~~~
-  qqmlprofilerevent_p.h:314:87: error: expected primary-expression before ‘>’ token
-    314 |                     static_cast<quint16>(numbers.size()) : std::numeric_limits<quint16>::max();
-        |                                                                                       ^
-  qqmlprofilerevent_p.h:314:90: error: ‘::max’ has not been declared; did you mean ‘std::max’?
-    314 |                     static_cast<quint16>(numbers.size()) : std::numeric_limits<quint16>::max();
-        |                                                                                          ^~~
-        |                                                                                          std::max
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- src/qmldebug/qqmlprofilerevent_p.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/qmldebug/qqmlprofilerevent_p.h b/src/qmldebug/qqmlprofilerevent_p.h
-index a7e37d1964..01b2f58f16 100644
---- a/src/qmldebug/qqmlprofilerevent_p.h
-+++ b/src/qmldebug/qqmlprofilerevent_p.h
-@@ -48,6 +48,7 @@
- #include <QtCore/qmetatype.h>
- 
- #include <initializer_list>
-+#include <limits>
- #include <type_traits>
- 
- //
--- 
-2.32.0
-
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index ab83b71814..adda7e03ba 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtdeclarative-everywhere-src-5.15.2.tar.xz.sha256
-sha256  c600d09716940f75d684f61c5bdaced797f623a86db1627da599027f6c635651  qtdeclarative-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  14a4b9640a2cd94771108dc3658a77c04c680f3d6444750d55e313b20774ce00  qtdeclarative-9349f3975d26632befc036fc9f2ea6e03aee2182.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 3318cd24c8..e63a78021a 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-QT5DECLARATIVE_VERSION = $(QT5_VERSION)
-QT5DECLARATIVE_SITE = $(QT5_SITE)
-QT5DECLARATIVE_SOURCE = qtdeclarative-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5DECLARATIVE_VERSION).tar.xz
+QT5DECLARATIVE_VERSION = 9349f3975d26632befc036fc9f2ea6e03aee2182
+QT5DECLARATIVE_SITE = $(QT5_SITE)/qtdeclarative/-/archive/$(QT5DECLARATIVE_VERSION)
+QT5DECLARATIVE_SOURCE = qtdeclarative-$(QT5DECLARATIVE_VERSION).tar.bz2
 QT5DECLARATIVE_INSTALL_STAGING = YES
+QT5DECLARATIVE_SYNC_QT_HEADERS = YES
 
 QT5DECLARATIVE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index 9d7a837b8b..e755f0848b 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtgraphicaleffects-everywhere-src-5.15.2.tar.xz.sha256
-sha256  ec8d67f64967d5046410490b549c576f9b9e8b47ec68594ae84aa8870173dfe4  qtgraphicaleffects-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  3035f0a07a0c0a0627ecd082de4b39bbe91521314f11bb63bf4ce81347b855f9  qtgraphicaleffects-c36998dc1581167b12cc3de8e4ac68c2a5d9f76e.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index a9ddff454e..542eb4de90 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-QT5GRAPHICALEFFECTS_VERSION = $(QT5_VERSION)
-QT5GRAPHICALEFFECTS_SITE = $(QT5_SITE)
-QT5GRAPHICALEFFECTS_SOURCE = qtgraphicaleffects-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5GRAPHICALEFFECTS_VERSION).tar.xz
+QT5GRAPHICALEFFECTS_VERSION = c36998dc1581167b12cc3de8e4ac68c2a5d9f76e
+QT5GRAPHICALEFFECTS_SITE = $(QT5_SITE)/qtgraphicaleffects/-/archive/$(QT5GRAPHICALEFFECTS_VERSION)
+QT5GRAPHICALEFFECTS_SOURCE = qtgraphicaleffects-$(QT5GRAPHICALEFFECTS_VERSION).tar.bz2
 QT5GRAPHICALEFFECTS_DEPENDENCIES = qt5declarative
 QT5GRAPHICALEFFECTS_INSTALL_STAGING = YES
+QT5GRAPHICALEFFECTS_SYNC_QT_HEADERS = YES
 
 QT5GRAPHICALEFFECTS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index b4281e712d..49690de3bb 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtimageformats-everywhere-src-5.15.2.tar.xz.sha256
-sha256  bf8285c7ce04284527ab823ddc7cf48a1bb79131db3a7127342167f4814253d7  qtimageformats-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  f2ff68c0d7192443e2fbcfdec73ee6a6bb160461b7757539906d9ad0c7f600d9  qtimageformats-cb82c74310837fe4e832c8ab72176a5d63e4355f.tar.bz2
 
 # Hashes for license files:
 sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index ffb094d566..506cd123a8 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-QT5IMAGEFORMATS_VERSION = $(QT5_VERSION)
-QT5IMAGEFORMATS_SITE = $(QT5_SITE)
-QT5IMAGEFORMATS_SOURCE = qtimageformats-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5IMAGEFORMATS_VERSION).tar.xz
+QT5IMAGEFORMATS_VERSION = cb82c74310837fe4e832c8ab72176a5d63e4355f
+QT5IMAGEFORMATS_SITE = $(QT5_SITE)/qtimageformats/-/archive/$(QT5IMAGEFORMATS_VERSION)
+QT5IMAGEFORMATS_SOURCE = qtimageformats-$(QT5IMAGEFORMATS_VERSION).tar.bz2
 QT5IMAGEFORMATS_INSTALL_STAGING = YES
+QT5IMAGEFORMATS_SYNC_QT_HEADERS = YES
 
 QT5IMAGEFORMATS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
diff --git a/package/qt5/qt5knx/qt5knx.mk b/package/qt5/qt5knx/qt5knx.mk
index 9fc121111c..412e31c652 100644
--- a/package/qt5/qt5knx/qt5knx.mk
+++ b/package/qt5/qt5knx/qt5knx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5KNX_VERSION = $(QT5_VERSION)
+QT5KNX_VERSION = 5.15.2
 QT5KNX_SITE = https://code.qt.io/cgit/qt/qtknx.git
 QT5KNX_SITE_METHOD = git
 QT5KNX_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5location/Config.in b/package/qt5/qt5location/Config.in
index 3d91adaf1f..b811f9a590 100644
--- a/package/qt5/qt5location/Config.in
+++ b/package/qt5/qt5location/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_QT5LOCATION
 	bool "qt5location"
 	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5LOCATION_MAPBOXGL
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 0bb293305c..17da2bb9ad 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtlocation-everywhere-src-5.15.2.tar.xz.sha256
-sha256  984fcb09e108df49a8dac35d5ce6dffc49caafd2acb1c2f8a5173a6a21f392a0  qtlocation-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  11cf8320598821c97f853635c529451503917895f11e664dfdd0b63bf48c8a46  qt5location-861e372b6ad81570d4f496e42fb25a6699b72f2f-br1.tar.gz
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index ea741d0df6..b1d19d7811 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-QT5LOCATION_VERSION = $(QT5_VERSION)
-QT5LOCATION_SITE = $(QT5_SITE)
-QT5LOCATION_SOURCE = qtlocation-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5LOCATION_VERSION).tar.xz
+QT5LOCATION_VERSION = 861e372b6ad81570d4f496e42fb25a6699b72f2f
+QT5LOCATION_SITE = $(QT5_SITE)/qtlocation
+QT5LOCATION_SITE_METHOD = git
+QT5LOCATION_GIT_SUBMODULES = YES
 QT5LOCATION_INSTALL_STAGING = YES
+QT5LOCATION_SYNC_QT_HEADERS = YES
 
 QT5LOCATION_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5LOCATION_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
diff --git a/package/qt5/qt5lottie/qt5lottie.hash b/package/qt5/qt5lottie/qt5lottie.hash
index 740f9072f2..46ab3f60df 100644
--- a/package/qt5/qt5lottie/qt5lottie.hash
+++ b/package/qt5/qt5lottie/qt5lottie.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtlottie-everywhere-src-5.15.2.tar.xz.sha256
-sha256  cec6095ab8f714e609d2ad3ea8c4fd819461ce8793adc42abe37d0f6dc432517  qtlottie-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  edbf1270733e385189dbcdad67ecec24c9e372168215873eadb31735d0947de1  qtlottie-fa8c8bfc6742ab98b61d1351e054e0e73e9a42f4.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5lottie/qt5lottie.mk b/package/qt5/qt5lottie/qt5lottie.mk
index 1423a629b9..e9614fbecf 100644
--- a/package/qt5/qt5lottie/qt5lottie.mk
+++ b/package/qt5/qt5lottie/qt5lottie.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-QT5LOTTIE_VERSION = $(QT5_VERSION)
-QT5LOTTIE_SITE = $(QT5_SITE)
-QT5LOTTIE_SOURCE = qtlottie-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5LOTTIE_VERSION).tar.xz
+QT5LOTTIE_VERSION = fa8c8bfc6742ab98b61d1351e054e0e73e9a42f4
+QT5LOTTIE_SITE = $(QT5_SITE)/qtlottie/-/archive/$(QT5LOTTIE_VERSION)
+QT5LOTTIE_SOURCE = qtlottie-$(QT5LOTTIE_VERSION).tar.bz2
 QT5LOTTIE_DEPENDENCIES = qt5declarative
 QT5LOTTIE_INSTALL_STAGING = YES
+QT5LOTTIE_SYNC_QT_HEADERS = YES
 
 QT5LOTTIE_LICENSE = GPL-3.0
 QT5LOTTIE_LICENSE_FILES = LICENSE.GPL3 LICENSE.GPL3-EXCEPT
diff --git a/package/qt5/qt5mqtt/qt5mqtt.mk b/package/qt5/qt5mqtt/qt5mqtt.mk
index 54cc1de632..0b62cf1bed 100644
--- a/package/qt5/qt5mqtt/qt5mqtt.mk
+++ b/package/qt5/qt5mqtt/qt5mqtt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5MQTT_VERSION = $(QT5_VERSION)
+QT5MQTT_VERSION = 5.15.2
 QT5MQTT_SITE = https://code.qt.io/cgit/qt/qtmqtt.git
 QT5MQTT_SITE_METHOD = git
 QT5MQTT_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index b70a4ecf51..1c4d930248 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtmultimedia-everywhere-src-5.15.2.tar.xz.sha256
-sha256  0c3758810e5131aabcf76e4965e4c18b8911af54d9edd9305d2a8278d8346df5  qtmultimedia-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  95e94b016f256b57b2df3f1df7d02d6f077c600faa4312561f02121623dfecef  qtmultimedia-bd29c87027637a013f2c5e3b549fcda84e4d7545.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 39eddc3afc..6695369063 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-QT5MULTIMEDIA_VERSION = $(QT5_VERSION)
-QT5MULTIMEDIA_SITE = $(QT5_SITE)
-QT5MULTIMEDIA_SOURCE = qtmultimedia-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5MULTIMEDIA_VERSION).tar.xz
+QT5MULTIMEDIA_VERSION = bd29c87027637a013f2c5e3b549fcda84e4d7545
+QT5MULTIMEDIA_SITE = $(QT5_SITE)/qtmultimedia/-/archive/$(QT5MULTIMEDIA_VERSION)
+QT5MULTIMEDIA_SOURCE = qtmultimedia-$(QT5MULTIMEDIA_VERSION).tar.bz2
 QT5MULTIMEDIA_INSTALL_STAGING = YES
+QT5MULTIMEDIA_SYNC_QT_HEADERS = YES
 
 QT5MULTIMEDIA_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
diff --git a/package/qt5/qt5opcua/qt5opcua.mk b/package/qt5/qt5opcua/qt5opcua.mk
index a58c4c5e14..ef51abddf8 100644
--- a/package/qt5/qt5opcua/qt5opcua.mk
+++ b/package/qt5/qt5opcua/qt5opcua.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5OPCUA_VERSION = $(QT5_VERSION)
+QT5OPCUA_VERSION = 5.15.2
 QT5OPCUA_SITE = https://code.qt.io/qt/qtopcua.git
 QT5OPCUA_SITE_METHOD = git
 QT5OPCUA_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 1fa0d6430a..2138b3e313 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtquickcontrols-everywhere-src-5.15.2.tar.xz.sha256
-sha256  c393fb7384b1f047f10e91a6832cf3e6a4c2a41408b8cb2d05af2283e8549fb5  qtquickcontrols-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  7df0648d9b8fdde1ea27abd9d6eb3ff170e8e666872ea97c07e1bb5ac241be4b  qtquickcontrols-cf3f6d7fec824cdf01f9b329ab3b92b1c0e0a420.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index 1ac8689d6e..c2b5ae182e 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-QT5QUICKCONTROLS_VERSION = $(QT5_VERSION)
-QT5QUICKCONTROLS_SITE = $(QT5_SITE)
-QT5QUICKCONTROLS_SOURCE = qtquickcontrols-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5QUICKCONTROLS_VERSION).tar.xz
+QT5QUICKCONTROLS_VERSION = cf3f6d7fec824cdf01f9b329ab3b92b1c0e0a420
+QT5QUICKCONTROLS_SITE = $(QT5_SITE)/qtquickcontrols/-/archive/$(QT5QUICKCONTROLS_VERSION)
+QT5QUICKCONTROLS_SOURCE = qtquickcontrols-$(QT5QUICKCONTROLS_VERSION).tar.bz2
 QT5QUICKCONTROLS_DEPENDENCIES = qt5declarative
 QT5QUICKCONTROLS_INSTALL_STAGING = YES
+QT5QUICKCONTROLS_SYNC_QT_HEADERS = YES
 
 QT5QUICKCONTROLS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
 QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.LGPL3 LICENSE.FDL
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index f66a1186ee..766fd69077 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtquickcontrols2-everywhere-src-5.15.2.tar.xz.sha256
-sha256  671b6ce5f4b8ecc94db622d5d5fb29ef4ff92819be08e5ea55bfcab579de8919  qtquickcontrols2-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  f0315b0f0301fdb16d6ee78c57e3cd600121884c1356ca1160ace96a57ac17bc  qtquickcontrols2-d8d6b14b9907adbc6ce307d52be34aaa761a58fa.tar.bz2
 
 # Hashes for license files:
 sha256  d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca  LICENSE.GPLv3
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
index 2f6dcd1f2f..ff1a49a9ce 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-QT5QUICKCONTROLS2_VERSION = $(QT5_VERSION)
-QT5QUICKCONTROLS2_SITE = $(QT5_SITE)
-QT5QUICKCONTROLS2_SOURCE = qtquickcontrols2-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5QUICKCONTROLS2_VERSION).tar.xz
+QT5QUICKCONTROLS2_VERSION = d8d6b14b9907adbc6ce307d52be34aaa761a58fa
+QT5QUICKCONTROLS2_SITE = $(QT5_SITE)/qtquickcontrols2/-/archive/$(QT5QUICKCONTROLS2_VERSION)
+QT5QUICKCONTROLS2_SOURCE = qtquickcontrols2-$(QT5QUICKCONTROLS2_VERSION).tar.bz2
 QT5QUICKCONTROLS2_DEPENDENCIES = qt5declarative
 QT5QUICKCONTROLS2_INSTALL_STAGING = YES
+QT5QUICKCONTROLS2_SYNC_QT_HEADERS = YES
 
 QT5QUICKCONTROLS2_LICENSE = GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
 QT5QUICKCONTROLS2_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
diff --git a/package/qt5/qt5quicktimeline/qt5quicktimeline.hash b/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
index ac97fc319c..c2d0b11f2b 100644
--- a/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
+++ b/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtquicktimeline-everywhere-src-5.15.2.tar.xz.sha256
-sha256  b9c247227607437acec7c7dd18ad46179d20369c9d22bdb1e9fc128dfb832a28  qtquicktimeline-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  4d88f7f70c8a983378cb9702bf1551c6a150fb283d0540bd43a120d953e077e3  qtquicktimeline-67503cdadea43b95ddad0de1a04951aff0ce1a07.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5quicktimeline/qt5quicktimeline.mk b/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
index ef6927f928..49d0cb330b 100644
--- a/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
+++ b/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-QT5QUICKTIMELINE_VERSION = $(QT5_VERSION)
-QT5QUICKTIMELINE_SITE = $(QT5_SITE)
-QT5QUICKTIMELINE_SOURCE = qtquicktimeline-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5QUICKTIMELINE_VERSION).tar.xz
+QT5QUICKTIMELINE_VERSION = 67503cdadea43b95ddad0de1a04951aff0ce1a07
+QT5QUICKTIMELINE_SITE = $(QT5_SITE)/qtquicktimeline/-/archive/$(QT5QUICKTIMELINE_VERSION)
+QT5QUICKTIMELINE_SOURCE = qtquicktimeline-$(QT5QUICKTIMELINE_VERSION).tar.bz2
 QT5QUICKTIMELINE_DEPENDENCIES = qt5declarative
 QT5QUICKTIMELINE_INSTALL_STAGING = YES
+QT5QUICKTIMELINE_SYNC_QT_HEADERS = YES
 
 QT5QUICKTIMELINE_LICENSE = GPL-3.0, GFDL-1.3 (docs)
 QT5QUICKTIMELINE_LICENSE_FILES = LICENSE.GPL3
diff --git a/package/qt5/qt5remoteobjects/qt5remoteobjects.hash b/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
index 30c5bfc51d..a2573a018a 100644
--- a/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
+++ b/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtremoteobjects-everywhere-src-5.15.2.tar.xz.sha256
-sha256  6781b6bc90888254ea77ce812736dac00c67fa4eeb3095f5cd65e4b9c15dcfc2  qtremoteobjects-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  43c876d475228a0b727d2b2ae47cecc8cbd665d1574ad4db61b209c08a488b90  qtremoteobjects-4d6d1e35fb8e0cb900b5e5e9266edea51dc4f735.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5remoteobjects/qt5remoteobjects.mk b/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
index a6b5f0954c..b7dee4f2f3 100644
--- a/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
+++ b/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-QT5REMOTEOBJECTS_VERSION = $(QT5_VERSION)
-QT5REMOTEOBJECTS_SITE = $(QT5_SITE)
-QT5REMOTEOBJECTS_SOURCE = qtremoteobjects-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5REMOTEOBJECTS_VERSION).tar.xz
+QT5REMOTEOBJECTS_VERSION = 4d6d1e35fb8e0cb900b5e5e9266edea51dc4f735
+QT5REMOTEOBJECTS_SITE = $(QT5_SITE)/qtremoteobjects/-/archive/$(QT5REMOTEOBJECTS_VERSION)
+QT5REMOTEOBJECTS_SOURCE = qtremoteobjects-$(QT5REMOTEOBJECTS_VERSION).tar.bz2
 QT5REMOTEOBJECTS_DEPENDENCIES = qt5base
 QT5REMOTEOBJECTS_INSTALL_STAGING = YES
 QT5REMOTEOBJECTS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools), GFDL-1.3 (docs)
 QT5REMOTEOBJECTS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3
+QT5REMOTEOBJECTS_SYNC_QT_HEADERS = YES
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5REMOTEOBJECTS_DEPENDENCIES += qt5declarative
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 783598047b..0b34ff3e8f 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtscript-everywhere-src-5.15.2.tar.xz.sha256
-sha256  a299715369afbd1caa4d7fa2875d442eab91adcaacafce54a36922442624673e  qtscript-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  bd748330ad08ea504875b9e0a316c0ecc01e6990e16d3bec61f5f55b9e291011  qtscript-5be95f966aabc5170f0aacfd4b0a46217241bfd6.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index 77254fec0f..4e51eacfc3 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-QT5SCRIPT_VERSION = $(QT5_VERSION)
-QT5SCRIPT_SITE = $(QT5_SITE)
-QT5SCRIPT_SOURCE = qtscript-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5SCRIPT_VERSION).tar.xz
+QT5SCRIPT_VERSION = 5be95f966aabc5170f0aacfd4b0a46217241bfd6
+QT5SCRIPT_SITE = $(QT5_SITE)/qtscript/-/archive/$(QT5SCRIPT_VERSION)
+QT5SCRIPT_SOURCE = qtscript-$(QT5SCRIPT_VERSION).tar.bz2
 QT5SCRIPT_INSTALL_STAGING = YES
+QT5SCRIPT_SYNC_QT_HEADERS = YES
 
 # JavaScriptCore contains files under BSD-2-Clause, BSD-3-Clause, and LGPL-2+.
 # This is linked into libQt5Script, which also contains Qt sources under
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index 6f816548e6..85e72f5378 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtscxml-everywhere-src-5.15.2.tar.xz.sha256
-sha256  60b9590b9a41c60cee7b8a8c8410ee4625f0389c1ff8d79883ec5a985638a7dc  qtscxml-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  6ce28e969efae2ab74fe3eda61a5d90fcfc4bf734cd9f36942a6968189530e69  qtscxml-7a15000f42c7a3171719727cd056f82a78244ed7.tar.bz2
 
 # Hashes for license files:
 sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
index 186a2d381b..d5d26536a3 100644
--- a/package/qt5/qt5scxml/qt5scxml.mk
+++ b/package/qt5/qt5scxml/qt5scxml.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-QT5SCXML_VERSION = $(QT5_VERSION)
-QT5SCXML_SITE = $(QT5_SITE)
-QT5SCXML_SOURCE = qtscxml-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5SCXML_VERSION).tar.xz
+QT5SCXML_VERSION = 7a15000f42c7a3171719727cd056f82a78244ed7
+QT5SCXML_SITE = $(QT5_SITE)/qtscxml/-/archive/$(QT5SCXML_VERSION)
+QT5SCXML_SOURCE = qtscxml-$(QT5SCXML_VERSION).tar.bz2
 QT5SCXML_DEPENDENCIES = qt5declarative
 QT5SCXML_INSTALL_STAGING = YES
+QT5SCXML_SYNC_QT_HEADERS = YES
 
 QT5SCXML_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5SCXML_LICENSE_FILES = LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 179c9833e0..6be87e8cf9 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtsensors-everywhere-src-5.15.2.tar.xz.sha256
-sha256  3f0011f9e9942cad119146b54d960438f4568a22a274cdad4fae06bb4e0e4839  qtsensors-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  1db8f6093595b574217eaec98da874d5eb46bb80343ddaa0a5bff0f6b45c5498  qtsensors-921a31375f29e429e95352b08b2b9dbfea663cb1.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index f928aad1c1..eebda912a9 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-QT5SENSORS_VERSION = $(QT5_VERSION)
-QT5SENSORS_SITE = $(QT5_SITE)
-QT5SENSORS_SOURCE = qtsensors-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5SENSORS_VERSION).tar.xz
+QT5SENSORS_VERSION = 921a31375f29e429e95352b08b2b9dbfea663cb1
+QT5SENSORS_SITE = $(QT5_SITE)/qtsensors/-/archive/$(QT5SENSORS_VERSION)
+QT5SENSORS_SOURCE = qtsensors-$(QT5SENSORS_VERSION).tar.bz2
 QT5SENSORS_INSTALL_STAGING = YES
 QT5SENSORS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5SENSORS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
+QT5SENSORS_SYNC_QT_HEADERS = YES
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5SENSORS_DEPENDENCIES += qt5declarative
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index 4f05049b99..8b560a8a83 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtserialbus-everywhere-src-5.15.2.tar.xz.sha256
-sha256  aeeb7e5c0d3f8503215b22e1a84c0002ca67cf63862f6e3c6ef44a67ca31bd88  qtserialbus-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  77056fba2ea313241c4780d959d8a3d916add816ced4cd5c95138e331a178d6b  qtserialbus-8884c5e43df846deac5a0c7c290eeb633d6bfe32.tar.bz2
 
 # Hashes for license files:
 sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
index 412a255612..fc62c85318 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.mk
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-QT5SERIALBUS_VERSION = $(QT5_VERSION)
-QT5SERIALBUS_SITE = $(QT5_SITE)
-QT5SERIALBUS_SOURCE = qtserialbus-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5SERIALBUS_VERSION).tar.xz
+QT5SERIALBUS_VERSION = 8884c5e43df846deac5a0c7c290eeb633d6bfe32
+QT5SERIALBUS_SITE = $(QT5_SITE)/qtserialbus/-/archive/$(QT5SERIALBUS_VERSION)
+QT5SERIALBUS_SOURCE = qtserialbus-$(QT5SERIALBUS_VERSION).tar.bz2
 QT5SERIALBUS_DEPENDENCIES = qt5serialport
 QT5SERIALBUS_INSTALL_STAGING = YES
+QT5SERIALBUS_SYNC_QT_HEADERS = YES
 
 QT5SERIALBUS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
 QT5SERIALBUS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 37bc8401f8..6d821c387f 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtserialport-everywhere-src-5.15.2.tar.xz.sha256
-sha256  59c559d748417306bc1b2cf2315c1e63eed011ace38ad92946af71f23e2ef79d  qtserialport-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  fb618df447132364cabf75e36b5a1d74ae7664a604662366711b58e10d1ce075  qtserialport-941d1d8560d1f3e40077c251fbde6fd6a5b0f0d4.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 902967c757..370093f6f8 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-QT5SERIALPORT_VERSION = $(QT5_VERSION)
-QT5SERIALPORT_SITE = $(QT5_SITE)
-QT5SERIALPORT_SOURCE = qtserialport-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5SERIALPORT_VERSION).tar.xz
+QT5SERIALPORT_VERSION = 941d1d8560d1f3e40077c251fbde6fd6a5b0f0d4
+QT5SERIALPORT_SITE = $(QT5_SITE)/qtserialport/-/archive/$(QT5SERIALPORT_VERSION)
+QT5SERIALPORT_SOURCE = qtserialport-$(QT5SERIALPORT_VERSION).tar.bz2
 QT5SERIALPORT_INSTALL_STAGING = YES
 QT5SERIALPORT_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5SERIALPORT_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
+QT5SERIALPORT_SYNC_QT_HEADERS = YES
 
 $(eval $(qmake-package))
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 7773a940bb..1e4dc54c67 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtsvg-everywhere-src-5.15.2.tar.xz.sha256
-sha256  8bc3c2c1bc2671e9c67d4205589a8309b57903721ad14c60ea21a5d06acb585e  qtsvg-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  7f45cc161ede4e918a4f3236af7e81d63404199529460cf74b620565dfce6d9e  qtsvg-728012f7762ecd5762d493f8796907c6456f31e7.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index d4b31c231e..849a2b7f1b 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-QT5SVG_VERSION = $(QT5_VERSION)
-QT5SVG_SITE = $(QT5_SITE)
-QT5SVG_SOURCE = qtsvg-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5SVG_VERSION).tar.xz
+QT5SVG_VERSION = 728012f7762ecd5762d493f8796907c6456f31e7
+QT5SVG_SITE = $(QT5_SITE)/qtsvg/-/archive/$(QT5SVG_VERSION)
+QT5SVG_SOURCE = qtsvg-$(QT5SVG_VERSION).tar.bz2
 QT5SVG_INSTALL_STAGING = YES
 QT5SVG_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5SVG_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
+QT5SVG_SYNC_QT_HEADERS = YES
 
 $(eval $(qmake-package))
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index e52d8e6df7..a563801997 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qttools-everywhere-src-5.15.2.tar.xz.sha256
-sha256  c189d0ce1ff7c739db9a3ace52ac3e24cb8fd6dbf234e49f075249b38f43c1cc  qttools-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  e5ee14a50d5be68ba53e11c76c6e90cc7d7023eab5050447869e7f5e472478a8  qttools-33693a928986006d79c1ee743733cde5966ac402.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index 0543afd8f7..e2385080ce 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-QT5TOOLS_VERSION = $(QT5_VERSION)
-QT5TOOLS_SITE = $(QT5_SITE)
-QT5TOOLS_SOURCE = qttools-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5TOOLS_VERSION).tar.xz
+QT5TOOLS_VERSION = 33693a928986006d79c1ee743733cde5966ac402
+QT5TOOLS_SITE = $(QT5_SITE)/qttools/-/archive/$(QT5TOOLS_VERSION)
+QT5TOOLS_SOURCE = qttools-$(QT5TOOLS_VERSION).tar.bz2
 
 QT5TOOLS_INSTALL_STAGING = YES
+QT5TOOLS_SYNC_QT_HEADERS = YES
 
 # linguist tools compile conditionally on qtHaveModule(qmldevtools-private),
 # but the condition is used only used to decide if lupdate will support
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
index 82f132378e..432e3099c3 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtvirtualkeyboard-everywhere-src-5.15.2.tar.xz.sha256
-sha256  9a3193913be30f09a896e3b8c2f9696d2e9b3f88a63ae9ca8c97a2786b68cf55  qtvirtualkeyboard-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  a91024f241df0d24ee398c262b61d126d451c70f05ef109901cfb483d1201538  qtvirtualkeyboard-98d1fd864cbb6c7c012c4139118808af110fb8f0.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index 3984c9866e..8e997a2426 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-QT5VIRTUALKEYBOARD_VERSION = $(QT5_VERSION)
-QT5VIRTUALKEYBOARD_SITE = $(QT5_SITE)
-QT5VIRTUALKEYBOARD_SOURCE = qtvirtualkeyboard-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5VIRTUALKEYBOARD_VERSION).tar.xz
+QT5VIRTUALKEYBOARD_VERSION = 98d1fd864cbb6c7c012c4139118808af110fb8f0
+QT5VIRTUALKEYBOARD_SITE = $(QT5_SITE)/qtvirtualkeyboard/-/archive/$(QT5VIRTUALKEYBOARD_VERSION)
+QT5VIRTUALKEYBOARD_SOURCE = qtvirtualkeyboard-$(QT5VIRTUALKEYBOARD_VERSION).tar.bz2
 QT5VIRTUALKEYBOARD_DEPENDENCIES = qt5declarative qt5svg
 QT5VIRTUALKEYBOARD_INSTALL_STAGING = YES
+QT5VIRTUALKEYBOARD_SYNC_QT_HEADERS = YES
 
 QT5VIRTUALKEYBOARD_LICENSE = GPL-3.0
 QT5VIRTUALKEYBOARD_LICENSE_FILES = LICENSE.GPL3
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index b17dbdd10d..1a7400de67 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtwayland-everywhere-src-5.15.2.tar.xz.sha256
-sha256  193732229ff816f3aaab9a5e2f6bed71ddddbf1988ce003fe8dd84a92ce9aeb5  qtwayland-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  a29d52c7b12987ed56d922455e0776e161075392969f7c6a8b141b00bd3dd46b  qtwayland-b6d85c2a75f5618e87267f5b5c361455be257a17.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index 0076bbfe73..bcc4915022 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-QT5WAYLAND_VERSION = $(QT5_VERSION)
-QT5WAYLAND_SITE = $(QT5_SITE)
-QT5WAYLAND_SOURCE = qtwayland-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5WAYLAND_VERSION).tar.xz
+QT5WAYLAND_VERSION = b6d85c2a75f5618e87267f5b5c361455be257a17
+QT5WAYLAND_SITE = $(QT5_SITE)/qtwayland/-/archive/$(QT5WAYLAND_VERSION)
+QT5WAYLAND_SOURCE = qtwayland-$(QT5WAYLAND_VERSION).tar.bz2
 QT5WAYLAND_DEPENDENCIES = wayland
 QT5WAYLAND_INSTALL_STAGING = YES
+QT5WAYLAND_SYNC_QT_HEADERS = YES
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
 QT5WAYLAND_DEPENDENCIES += qt5declarative
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index 47c7da3365..af195b32b3 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtwebchannel-everywhere-src-5.15.2.tar.xz.sha256
-sha256  127fe79c43b386713f151ed7d411cd81e45e29f9c955584f29736f78c9303ec1  qtwebchannel-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  cc75d29ca38d512b79f2bfbcdb641cdb02dd3a1024f2c9c530abec00418effbf  qtwebchannel-fa8b07105b5e274daaa8adcc129fa4aa0447f9f7.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index 176c0fd7a3..042a28fca9 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-QT5WEBCHANNEL_VERSION = $(QT5_VERSION)
-QT5WEBCHANNEL_SITE = $(QT5_SITE)
-QT5WEBCHANNEL_SOURCE = qtwebchannel-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5WEBCHANNEL_VERSION).tar.xz
+QT5WEBCHANNEL_VERSION = fa8b07105b5e274daaa8adcc129fa4aa0447f9f7
+QT5WEBCHANNEL_SITE = $(QT5_SITE)/qtwebchannel/-/archive/$(QT5WEBCHANNEL_VERSION)
+QT5WEBCHANNEL_SOURCE = qtwebchannel-$(QT5WEBCHANNEL_VERSION).tar.bz2
 QT5WEBCHANNEL_DEPENDENCIES = qt5websockets
 QT5WEBCHANNEL_INSTALL_STAGING = YES
 QT5WEBCHANNEL_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
+QT5WEBCHANNEL_SYNC_QT_HEADERS = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5WEBCHANNEL_LICENSE += , BSD-3-Clause (examples)
diff --git a/package/qt5/qt5webengine/0002-chromium-breakpad-fix-build-with-glibc-2.34.patch b/package/qt5/qt5webengine/0002-chromium-breakpad-fix-build-with-glibc-2.34.patch
new file mode 100644
index 0000000000..44a6424c7d
--- /dev/null
+++ b/package/qt5/qt5webengine/0002-chromium-breakpad-fix-build-with-glibc-2.34.patch
@@ -0,0 +1,76 @@
+From a3bc792bdc116806a50e022d9102914c8daf6210 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 4 Aug 2021 19:11:06 +0200
+Subject: [PATCH] chromium: breakpad: fix build with glibc-2.34
+
+* fixes:
+[218/24061] CXX obj/third_party/breakpad/client/exception_handler.o
+FAILED: obj/third_party/breakpad/client/exception_handler.o
+/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/qtwebengine/5.15.4+gitAUTOINC+dd7f7a9166_555f348ae8-r0/recipe-sysroot-native/usr/bin/x86_64-webos-linux/x86_64-webos-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -Wdate-time --sysroot=/OE/build/luneos-honister/webos-ports/tmp-glibc/work/core2-64-webos-linux/qtwebengine/5.15.4+gitAUTOINC+dd7f7a9166_555f348ae8-r0/recipe-sysroot -MMD -MF obj/third_party/breakpad/client/exception_handler.o.d -DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DOFFICIAL_BUILD -DTOOLKIT_QT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNO_UNWIND_TABLES -DCR_SYSROOT_HASH=5f64b417e1018dcf8fcc81dc2714e0f264b9b911 -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -I../../../../git/src/3rdparty/chromium/third_party/breakpad -I../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src -I../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client -I../../../../git/
 src/3rdparty/chromium/third_party/breakpad/breakpad/src/third_party/linux/include -Igen -I../../../../git/src/3rdparty/chromium -I../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src -fno-strict-aliasing --param=ssp-buffer-size=4 -fstack-protector -fno-unwind-tables -fno-asynchronous-unwind-tables -fPIC -pipe -pthread -m64 -O2 -fno-ident -fdata-sections -ffunction-sections -fno-omit-frame-pointer -g1 -fvisibility=hidden -Wno-unused-local-typedefs -Wno-maybe-uninitialized -Wno-deprecated-declarations -fno-delete-null-pointer-checks -Wno-comments -Wno-packed-not-aligned -Wno-dangling-else -Wno-missing-field-initializers -Wno-unused-parameter -std=gnu++14 -fno-exceptions -fno-rtti --sysroot=../../../../recipe-sysroot -fvisibility-inlines-hidden -Wno-narrowing -Wno-class-memaccess -Wno-attributes -Wno-class-memaccess -Wno-subobject-linkage -Wno-invalid-offsetof -Wno-return-type -Wno-deprecated-copy -c ../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad
 /src/client/linux/handler/exception_handler.cc -o obj/third_party/breakpad/client/exception_handler.o
+../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc: In function 'void google_breakpad::{anonymous}::InstallAlternateStackLocked()':
+../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc:141:49: error: no matching function for call to 'max(int, long int)'
+  141 |   static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
+      |                                         ~~~~~~~~^~~~~~~~~~~~~~~~~
+In file included from ../../../../recipe-sysroot/usr/include/c++/11.2.0/bits/char_traits.h:39,
+                 from ../../../../recipe-sysroot/usr/include/c++/11.2.0/string:40,
+                 from ../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.h:38,
+                 from ../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc:66:
+../../../../recipe-sysroot/usr/include/c++/11.2.0/bits/stl_algobase.h:254:5: note: candidate: 'template<class _Tp> constexpr const _Tp& std::max(const _Tp&, const _Tp&)'
+  254 |     max(const _Tp& __a, const _Tp& __b)
+      |     ^~~
+../../../../recipe-sysroot/usr/include/c++/11.2.0/bits/stl_algobase.h:254:5: note:   template argument deduction/substitution failed:
+../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc:141:49: note:   deduced conflicting types for parameter 'const _Tp' ('int' and 'long int')
+  141 |   static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
+      |                                         ~~~~~~~~^~~~~~~~~~~~~~~~~
+In file included from ../../../../recipe-sysroot/usr/include/c++/11.2.0/bits/char_traits.h:39,
+                 from ../../../../recipe-sysroot/usr/include/c++/11.2.0/string:40,
+                 from ../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.h:38,
+                 from ../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc:66:
+../../../../recipe-sysroot/usr/include/c++/11.2.0/bits/stl_algobase.h:300:5: note: candidate: 'template<class _Tp, class _Compare> constexpr const _Tp& std::max(const _Tp&, const _Tp&, _Compare)'
+  300 |     max(const _Tp& __a, const _Tp& __b, _Compare __comp)
+      |     ^~~
+../../../../recipe-sysroot/usr/include/c++/11.2.0/bits/stl_algobase.h:300:5: note:   template argument deduction/substitution failed:
+../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc:141:49: note:   deduced conflicting types for parameter 'const _Tp' ('int' and 'long int')
+  141 |   static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
+      |                                         ~~~~~~~~^~~~~~~~~~~~~~~~~
+In file included from ../../../../recipe-sysroot/usr/include/c++/11.2.0/algorithm:62,
+                 from ../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc:85:
+../../../../recipe-sysroot/usr/include/c++/11.2.0/bits/stl_algo.h:3461:5: note: candidate: 'template<class _Tp> constexpr _Tp std::max(std::initializer_list<_Tp>)'
+ 3461 |     max(initializer_list<_Tp> __l)
+      |     ^~~
+../../../../recipe-sysroot/usr/include/c++/11.2.0/bits/stl_algo.h:3461:5: note:   template argument deduction/substitution failed:
+../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc:141:49: note:   mismatched types 'std::initializer_list<_Tp>' and 'int'
+  141 |   static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
+      |                                         ~~~~~~~~^~~~~~~~~~~~~~~~~
+In file included from ../../../../recipe-sysroot/usr/include/c++/11.2.0/algorithm:62,
+                 from ../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc:85:
+../../../../recipe-sysroot/usr/include/c++/11.2.0/bits/stl_algo.h:3467:5: note: candidate: 'template<class _Tp, class _Compare> constexpr _Tp std::max(std::initializer_list<_Tp>, _Compare)'
+ 3467 |     max(initializer_list<_Tp> __l, _Compare __comp)
+      |     ^~~
+../../../../recipe-sysroot/usr/include/c++/11.2.0/bits/stl_algo.h:3467:5: note:   template argument deduction/substitution failed:
+../../../../git/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc:141:49: note:   mismatched types 'std::initializer_list<_Tp>' and 'int'
+  141 |   static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
+      |                                         ~~~~~~~~^~~~~~~~~~~~~~~~~
+
+Adapted from:
+https://github.com/meta-qt5/meta-qt5/blob/2a38fca150f065f869ed530fffe1a07beec80692/recipes-qt/qt5/qtwebengine/chromium/0013-chromium-breakpad-fix-build-with-glibc-2.34.patch
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ .../breakpad/src/client/linux/handler/exception_handler.cc      | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc b/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc
+index ca353c40997..2e43ba6fc04 100644
+--- a/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc
++++ b/src/3rdparty/chromium/third_party/breakpad/breakpad/src/client/linux/handler/exception_handler.cc
+@@ -138,7 +138,7 @@ void InstallAlternateStackLocked() {
+   // SIGSTKSZ may be too small to prevent the signal handlers from overrunning
+   // the alternative stack. Ensure that the size of the alternative stack is
+   // large enough.
+-  static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
++  static const unsigned kSigStackSize = std::max<size_t>(16384, SIGSTKSZ);
+ 
+   // Only set an alternative stack if there isn't already one, or if the current
+   // one is too small.
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 64c9c96cc2..cebd6d0fe2 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-QT5WEBENGINE_VERSION = $(QT5_VERSION)
-QT5WEBENGINE_SITE = $(QT5_SITE)
+QT5WEBENGINE_VERSION_MAJOR = 5.15
+QT5WEBENGINE_VERSION = $(QT5WEBENGINE_VERSION_MAJOR).2
+QT5WEBENGINE_SITE = https://download.qt.io/archive/qt/$(QT5WEBENGINE_VERSION_MAJOR)/$(QT5WEBENGINE_VERSION)/submodules
 QT5WEBENGINE_SOURCE = qtwebengine-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5WEBENGINE_VERSION).tar.xz
 QT5WEBENGINE_DEPENDENCIES = ffmpeg libglib2 libvpx libxkbcommon opus webp \
 	qt5declarative qt5webchannel host-bison host-flex host-gperf \
@@ -44,7 +45,9 @@ endif
 # QtWebengine's build system uses python, but only supports python2. We work
 # around this by forcing python2 early in the PATH, via a python->python2
 # symlink.
-QT5WEBENGINE_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
+QT5WEBENGINE_ENV = \
+	PATH=$(@D)/host-bin:$(BR_PATH) \
+	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
 define QT5WEBENGINE_PYTHON2_SYMLINK
 	mkdir -p $(@D)/host-bin
 	ln -sf $(HOST_DIR)/bin/python2 $(@D)/host-bin/python
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 29a9ebe439..3cc87865dc 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtwebsockets-everywhere-src-5.15.2.tar.xz.sha256
-sha256  a0b42d85dd34ff6e2d23400e02f83d8b85bcd80e60efd1521d12d9625d4a233f  qtwebsockets-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  0f59abfa0172e1d4f7cddc3ed457b71faa3bba1cc25b02a06aa79b5ba0c68653  qtwebsockets-b13b56904b76e96ea52d0efe56395acc94b17d96.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index a35cdc5799..d222f025ee 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-QT5WEBSOCKETS_VERSION = $(QT5_VERSION)
-QT5WEBSOCKETS_SITE = $(QT5_SITE)
-QT5WEBSOCKETS_SOURCE = qtwebsockets-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5WEBSOCKETS_VERSION).tar.xz
+QT5WEBSOCKETS_VERSION = b13b56904b76e96ea52d0efe56395acc94b17d96
+QT5WEBSOCKETS_SITE = $(QT5_SITE)/qtwebsockets/-/archive/$(QT5WEBSOCKETS_VERSION)
+QT5WEBSOCKETS_SOURCE = qtwebsockets-$(QT5WEBSOCKETS_VERSION).tar.bz2
 QT5WEBSOCKETS_INSTALL_STAGING = YES
 QT5WEBSOCKETS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools)
 QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3
+QT5WEBSOCKETS_SYNC_QT_HEADERS = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5WEBSOCKETS_LICENSE += , BSD-3-Clause (examples)
diff --git a/package/qt5/qt5webview/qt5webview.hash b/package/qt5/qt5webview/qt5webview.hash
index c1cee9cf85..51d0fb0d7a 100644
--- a/package/qt5/qt5webview/qt5webview.hash
+++ b/package/qt5/qt5webview/qt5webview.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtwebview-everywhere-src-5.15.2.tar.xz.sha256
-sha256  be9f46167e4977ead5ef5ecf883fdb812a4120f2436383583792f65557e481e7  qtwebview-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  0fd949c35355bbde613c9daa61e32a3d8ed4a7b3e9fc0e3acf92981cc8bf16c3  qtwebview-920de5f1cd9f9001cfef1bfd2c19e6720793362f.tar.bz2
 
 # Hashes for license files:
 sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
diff --git a/package/qt5/qt5webview/qt5webview.mk b/package/qt5/qt5webview/qt5webview.mk
index 0f37f3eb85..ed1cfe5065 100644
--- a/package/qt5/qt5webview/qt5webview.mk
+++ b/package/qt5/qt5webview/qt5webview.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-QT5WEBVIEW_VERSION = $(QT5_VERSION)
-QT5WEBVIEW_SITE = $(QT5_SITE)
-QT5WEBVIEW_SOURCE = qtwebview-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5WEBVIEW_VERSION).tar.xz
+QT5WEBVIEW_VERSION = 920de5f1cd9f9001cfef1bfd2c19e6720793362f
+QT5WEBVIEW_SITE = $(QT5_SITE)/qtwebview/-/archive/$(QT5WEBVIEW_VERSION)
+QT5WEBVIEW_SOURCE = qtwebview-$(QT5WEBVIEW_VERSION).tar.bz2
 QT5WEBVIEW_DEPENDENCIES = qt5webengine
 QT5WEBVIEW_INSTALL_STAGING = YES
 QT5WEBVIEW_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0, GFDL-1.3 (docs)
 QT5WEBVIEW_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
+QT5WEBVIEW_SYNC_QT_HEADERS = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5WEBVIEW_LICENSE += , BSD-3-Clause (examples)
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index 08e6753f21..b854cedcb6 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtx11extras-everywhere-src-5.15.2.tar.xz.sha256
-sha256  7014702ee9a644a5a93da70848ac47c18851d4f8ed622b29a72eed9282fc6e3e  qtx11extras-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  b562bc8b81e35d71df5530be07522b50065f177fb744782e4fc7536970c5d9da  qtx11extras-3898f5484fd4864b047729bfeda9a1222f32364f.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index 075d36dcd8..7b1e32df17 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-QT5X11EXTRAS_VERSION = $(QT5_VERSION)
-QT5X11EXTRAS_SITE = $(QT5_SITE)
-QT5X11EXTRAS_SOURCE = qtx11extras-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5X11EXTRAS_VERSION).tar.xz
+QT5X11EXTRAS_VERSION = 3898f5484fd4864b047729bfeda9a1222f32364f
+QT5X11EXTRAS_SITE = $(QT5_SITE)/qtx11extras/-/archive/$(QT5X11EXTRAS_VERSION)
+QT5X11EXTRAS_SOURCE = qtx11extras-$(QT5X11EXTRAS_VERSION).tar.bz2
 QT5X11EXTRAS_INSTALL_STAGING = YES
 QT5X11EXTRAS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
+QT5X11EXTRAS_SYNC_QT_HEADERS = YES
 
 $(eval $(qmake-package))
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index 682e114a7f..c0e3caa407 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.15/5.15.2/submodules/qtxmlpatterns-everywhere-src-5.15.2.tar.xz.sha256
-sha256  76ea2162a7c349188d7e7e4f6c77b78e8a205494c90fee3cea3487a1ae2cf2fa  qtxmlpatterns-everywhere-src-5.15.2.tar.xz
+# Locally calculated
+sha256  20363267cd8dc93622a0f444708eb83f0ed6d9d9bceaf13c5db806d96b00cf09  qtxmlpatterns-189e28d0aff1f3d7960228ba318b83e3cadac98c.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 6845483327..27818ecb78 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-QT5XMLPATTERNS_VERSION = $(QT5_VERSION)
-QT5XMLPATTERNS_SITE = $(QT5_SITE)
-QT5XMLPATTERNS_SOURCE = qtxmlpatterns-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5XMLPATTERNS_VERSION).tar.xz
+QT5XMLPATTERNS_VERSION = 189e28d0aff1f3d7960228ba318b83e3cadac98c
+QT5XMLPATTERNS_SITE = $(QT5_SITE)/qtxmlpatterns/-/archive/$(QT5XMLPATTERNS_VERSION)
+QT5XMLPATTERNS_SOURCE = qtxmlpatterns-$(QT5XMLPATTERNS_VERSION).tar.bz2
 QT5XMLPATTERNS_INSTALL_STAGING = YES
 QT5XMLPATTERNS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
+QT5XMLPATTERNS_SYNC_QT_HEADERS = YES
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5XMLPATTERNS_DEPENDENCIES += qt5declarative


--===============5288038120413797107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5288038120413797107==--

