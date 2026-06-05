Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF00DCD6E5D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 11:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CDB640E73;
	Fri,  5 Jun 2026 11:13:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAJUQ8MymdWU; Fri,  5 Jun 2026 11:13:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A78A540E61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780657997;
	bh=13vEvgMdEeJZxYwkDQdnZAg8gSXYTtzqhsSL8LYlvNA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=JR3v6yNdRAPTkrfP/FHqLE4Z6CdS+GbdRX/MbY7hXrW82xHuAcJ7G9yfeJdpLaXPr
	 +PPVnpcP4VaOWMyCnQvT4sAHm6yLryLT4cEkN7yoVTeGjXBYgejC45PODhMNxH32mv
	 O8nlcL+H2+IyVEgP0dx5+17QbVJy3Q8j8Capz0ku74dQjbbu9AvRT2BlkK3HHczVAs
	 KsBtLfDX/pI470AgdsiS7J8sA9tkNHiA61xIDv+V8t10b6tbqiN6a4DZqeEXjhvAuS
	 nB6YGIBVLLzw876csaoMfMvUGGNlGEbeqhze3ePoy/R25nBYO8pL7Za1xfQAroDDAe
	 DTi35pt5fgBwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A78A540E61;
	Fri,  5 Jun 2026 11:13:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F2FE388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 11:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F2CA608B1
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 11:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-efmrsrj22H for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 11:13:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=paul.louvel@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B209D6085A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B209D6085A
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B209D6085A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 11:13:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3CF431A0A27;
 Fri,  5 Jun 2026 11:13:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 114915FED1;
 Fri,  5 Jun 2026 11:13:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 94136106A00B6; 
 Fri,  5 Jun 2026 13:13:07 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Nico Orlando <nico.orlando@dave.eu>, Roberto Zelbi <roberto.zelbi@dave.eu>,
 Paul Louvel <paul.louvel@bootlin.com>
Date: Fri,  5 Jun 2026 13:12:56 +0200
Message-ID: <20260605111256.107837-1-paul.louvel@bootlin.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780657990; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=9vnmaCgc0M378f4UM1zVwbLTSx3yE4Go9mbSb98OQQ0=;
 b=vptJeTKs3OfJUGuM36gWxr58NO4dXOQaSUE/Gr0yCObl77hy11WMuXgK/2RHTHx6mDKCvX
 pVrYmyduBVYyQF3WyVb4hKg5DvatVbM45m5qn9WqkHZYDjVjZ0C/n7E/sm3tbHAi/khGie
 gBqZFBca70A0INt3yk1UsISlDPiywhvLSL+RLvZ6ehVSNnCTL+fq7s1pM1BUVG/i/FiZ/G
 kdhOqeUVpRqhNTqAgw6nvdqmIWR16xFa5owZjyTZ+CSMvqtjdb+J9A6jDyueOv3FFK2rAw
 CpX9/Wm6Yq6QP/gfD4AEnlNhxIABYMPHoSDKG4n0Gpej+zzELpLnGOMT9GdvkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=vptJeTKs
Subject: [Buildroot] [PATCH] package/qt5/qt5webkit: fix QMake-generated
 artifacts location and content
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
From: Paul Louvel via buildroot <buildroot@buildroot.org>
Reply-To: Paul Louvel <paul.louvel@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building qt-webkit-kiosk fails because of several issues in the
configuration and installation process of the qt5webkit package.

A previous patch from Thomas Ballasi attempted to fix the issue [1].

Packages depending on QtWebKit and using QMake as their build system
initially fail with the following error (qt-webkit-kiosk):

Project MESSAGE: Settings:
Project MESSAGE: - QT : core gui network webkit widgets webkitwidgets printsupport multimedia testlib
Project MESSAGE: - PREFIX : /usr
Project MESSAGE: - TARGET : qt-webkit-kiosk
Project MESSAGE: - VERSION: 1.99.6
Project ERROR: Unknown module(s) in QT: webkit webkitwidgets

When resolving dependencies, the host qmake searches for module pri
files in:

 $(HOST_DIR)/mkspecs/modules

However, the qt5webkit package incorrectly installs its pri files into:

 $(STAGING_DIR)/usr/mkspecs/modules

As a result, qmake cannot locate the required module definitions.

Additionally, the generated pri files contain hardcoded include and
library paths instead of using the appropriate qmake variables:

 $$QT_MODULE_LIB_BASE for library paths
 $$QT_MODULE_INCLUDE_BASE for include paths

Using hardcoded paths leads to a build failure even if the module
definitions are correctly located:

 cpu-vendor-os-g++: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'

The header files are also installed in
$(STAGING_DIR)/usr/include instead of
$(STAGING_DIR)/usr/include/qt5, which is the expected location for Qt
headers.

These problems can be fixed by using QMake system paths retrieved by CMake at
configure time with the qmake -query command. qt5webkit provides a
KDE_INSTALL_USE_QT_SYS_PATHS option that must be set to ON for the build system
to correctly use QMake configuration properties and install headers and module
definitions in the proper locations.

The patch from Thomas Ballasi used the
CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT configuration option to set
CMAKE_INSTALL_PREFIX to the correct Qt installation prefix.
Projects may check this variable to set CMAKE_INSTALL_PREFIX to a value other than
the default "/usr/local" on UNIX platforms.
However, CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT is not intended to be set
by users. It is implicitly set to ON when CMAKE_INSTALL_PREFIX is unset, and to
OFF otherwise, regardless of whether it was explicitly set by the user. In
Buildroot, CMAKE_INSTALL_PREFIX is set to "/usr" by the default CMake
configuration command, rendering this fix ineffective because as a result,
CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT is set to OFF.

Adding -DKDE_INSTALL_USE_QT_SYS_PATHS=ON fixes the header installation location,
but the pri files are still installed in the wrong location. This is caused by
the conditional in OptionsQt.cmake that sets KDE_INSTALL_USE_QT_SYS_PATHS to OFF
when CMAKE_INSTALL_PREFIX differs from the Qt installation prefix directory,
which is the case because Buildroot sets it to "/usr" by default.

Removing this check fixes the pri file content issue, but the build then fails
with another error:

 qt5webkit: installs files in $(STAGING_DIR)/$(HOST_DIR)

Because the DESTDIR parameter used by the default CMake _INSTALL_STAGING_CMDS is
set to $(STAGING_DIR), it gets prepended to the absolute installation path of
the module definitions:

 $(HOST_DIR)/mkspecs/modules

The resulting installation path is wrong:

 $(STAGING_DIR)/$(HOST_DIR)/mkspecs/modules

Defining custom QT5WEBKIT_INSTALL_{STAGING,TARGET}_CMDS commands that do not use
the DESTDIR variable fixes this issue. Instead, an alternative installation
prefix is specified with:

 --prefix=$(STAGING_DIR)/usr for staging --prefix=$(TARGET_DIR)/usr for target

Tested with a QEMU x86_64 target. qt-webkit-kiosk builds and runs successfully.

Please take into account that Qt WebKit is an old, deprecated project intended
to be replaced by Qt WebEngine [2] [3].

In addition, there has been no release since March 10, 2020, apart from
security-fix releases [4].

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20220929181350.1026033-1-thomas.ballasi@savoirfairelinux.com/

Note: Thomas refers to 'DATADIR' in his patch, but I believe he means
'DESTDIR' instead.

[2] https://forum.qt.io/topic/65982/now-that-qwebkit-has-been-deprecated-what-can-i-do
[3] https://lists.buildroot.org/pipermail/buildroot/2015-July/496272.html
[4] https://github.com/qtwebkit/qtwebkit/releases/tag/qtwebkit-5.212.0-alpha4

Fixes: https://lists.buildroot.org/pipermail/buildroot/2022-February/323066.html
Signed-off-by: Paul Louvel (DAVE.eu) <paul.louvel@bootlin.com>
---
 ...-conditional-on-CMAKE_INSTALL_PREFIX.patch | 32 +++++++++++++++++++
 package/qt5/qt5webkit/qt5webkit.mk            | 19 +++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 package/qt5/qt5webkit/0014-remove-conditional-on-CMAKE_INSTALL_PREFIX.patch

diff --git a/package/qt5/qt5webkit/0014-remove-conditional-on-CMAKE_INSTALL_PREFIX.patch b/package/qt5/qt5webkit/0014-remove-conditional-on-CMAKE_INSTALL_PREFIX.patch
new file mode 100644
index 0000000000..ccfbaa5b10
--- /dev/null
+++ b/package/qt5/qt5webkit/0014-remove-conditional-on-CMAKE_INSTALL_PREFIX.patch
@@ -0,0 +1,32 @@
+From 38e96676cda9e555b4c55102a57e29c2073c30c2 Mon Sep 17 00:00:00 2001
+From: Paul Louvel <paul.louvel@bootlin.com>
+Date: Fri, 22 May 2026 15:47:43 +0200
+Subject: [PATCH] remove conditional on CMAKE_INSTALL_PREFIX.
+
+Remove a conditional on CMAKE_INSTALL_PREFIX, since Buildroot sets it to "/usr"
+by default. Prevent setting KDE_INSTALL_USE_QT_SYS_PATHS to OFF, which would
+cause the project to ignore QMake installation properties and install the module
+mkspecs in the wrong location with wrong values.
+
+Upstream: N/A QtWebkit is not maintained anymore, and this patch is only
+relevant for Buildroot.
+Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
+---
+ Source/cmake/OptionsQt.cmake | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/Source/cmake/OptionsQt.cmake b/Source/cmake/OptionsQt.cmake
+index 71f9afa01..fd52e8eab 100644
+--- a/Source/cmake/OptionsQt.cmake
++++ b/Source/cmake/OptionsQt.cmake
+@@ -1008,10 +1008,6 @@ endif ()
+
+ include(KDEInstallDirs)
+
+-if (NOT qt_install_prefix_dir STREQUAL "${CMAKE_INSTALL_PREFIX}")
+-    set(KDE_INSTALL_USE_QT_SYS_PATHS OFF)
+-endif ()
+-
+ # We split all installed files into 2 components: Code and Data. This is different from
+ # traditional approach with Runtime and Devel, but we need it to fix concurrent installation of
+ # debug and release builds in qmake-based build
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 6912359674..a5f44b2260 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -51,10 +51,29 @@ QT5WEBKIT_CONF_OPTS += -DENABLE_SAMPLING_PROFILER=OFF
 endif
 
 QT5WEBKIT_CONF_OPTS += \
+	-DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
 	-DENABLE_TOOLS=OFF \
 	-DPORT=Qt \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
 	-DSHARED_CORE=ON \
 	-DUSE_LIBHYPHEN=OFF
 
+# Remove the DESTDIR from the install command install so that the .pri files in
+# the correct location: $(HOST_DIR)/mkspecs/modules instead of
+# $(STAGING_DIR)$(HOST_DIR)/usr/mkspecs/modules.
+define QT5WEBKIT_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(QT5WEBKIT_BUILD_ENV) \
+		$(BR2_CMAKE) --install $(QT5WEBKIT_BUILDDIR) \
+		--prefix $(STAGING_DIR)/usr
+endef
+
+# Remove the DESTDIR from the install command install so that the .pri files in
+# the correct location: $(HOST_DIR)/mkspecs/modules instead of
+# $(TARGET_DIR)$(HOST_DIR)/usr/mkspecs/modules.
+define QT5WEBKIT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(QT5WEBKIT_BUILD_ENV) \
+		$(BR2_CMAKE) --install $(QT5WEBKIT_BUILDDIR) \
+		--prefix $(TARGET_DIR)/usr
+endef
+
 $(eval $(cmake-package))
-- 
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
