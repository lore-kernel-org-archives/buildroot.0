From: Julien Corjon <corjon.j@ecagroup.com>
Date: Tue, 15 Nov 2016 18:13:01 +0100
Subject: [Buildroot] [Rejected v2 1/7] qt5webkit: Get sources from
	Qt-5-unofficial-builds
In-Reply-To: <20161115171307.7499-1-corjon.j@ecagroup.com>
References: <20161115171307.7499-1-corjon.j@ecagroup.com>
Message-ID: <20161115171307.7499-2-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of messing with git we may get tarballs of obsolete but still
existing submodules as we used to but from a bit different location.

It turned out Qt people still create packages for obsolete submodules
for so-called "unofficial builds", see [1].

[1] https://wiki.qt.io/Qt-5-unofficial-builds

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/qt5/qt5.mk                   |  1 +
 package/qt5/qt5webkit/qt5webkit.hash |  4 ++--
 package/qt5/qt5webkit/qt5webkit.mk   | 14 +++-----------
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index d25f663..e937e23 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -1,6 +1,7 @@
 QT5_VERSION_MAJOR = 5.6
 QT5_VERSION = $(QT5_VERSION_MAJOR).2
 QT5_SITE = http://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/submodules
+QT5_SNAPSHOTS_SITE = http://download.qt.io/snapshots/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)/latest_src/submodules
 include $(sort $(wildcard package/qt5/*/*.mk))
 
 define QT5_LA_PRL_FILES_FIXUP
diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
index 96b8bdd..309f776 100644
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ b/package/qt5/qt5webkit/qt5webkit.hash
@@ -1,2 +1,2 @@
-# locally computed
-sha256 bdd659573e7e75cd4ad57b7160a7353d98d21a6fef06e4fb9e114a5b1f1e9dab qt5webkit-b35917bcb44d7f200af0f4ac68a126fa0aa8d93d.tar.gz
+# Hash from: http://download.qt.io/snapshots/qt/5.6/5.6.2/latest_src/submodules/qtwebkit-opensource-src-5.6.2.tar.xz.mirrorlist
+sha256 528a6b8b1c5095367b26e8ce4f3a46bb739e2e9913ff4dfc6ef58a04fcd73966 qtwebkit-opensource-src-5.6.2.tar.xz
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 378cdf7..980d2af 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-QT5WEBKIT_VERSION = b35917bcb44d7f200af0f4ac68a126fa0aa8d93d
-# Using GitHub since it supports downloading tarballs from random commits.
-# The http://code.qt.io/cgit/qt/qtwebkit.git/ repo doesn't allow to do so.
-QT5WEBKIT_SITE = $(call github,qtproject,qtwebkit,$(QT5WEBKIT_VERSION))
+QT5WEBKIT_VERSION = $(QT5_VERSION)
+QT5WEBKIT_SITE = $(QT5_SNAPSHOTS_SITE)
+QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
 QT5WEBKIT_DEPENDENCIES = \
 	host-bison host-flex host-gperf host-python host-ruby \
 	qt5base sqlite
@@ -43,14 +42,7 @@ define QT5WEBKIT_PYTHON2_SYMLINK
 endef
 QT5WEBKIT_PRE_CONFIGURE_HOOKS += QT5WEBKIT_PYTHON2_SYMLINK
 
-# Since we get the source from git, generated header files are not included.
-# qmake detects that header file generation (using the syncqt tool) must be
-# done based on the existence of a .git directory (cfr. the git_build config
-# option which is set in qt_build_paths.prf).
-# So, to make sure that qmake detects that header files must be generated,
-# create an empty .git directory.
 define QT5WEBKIT_CONFIGURE_CMDS
-	mkdir -p $(@D)/.git
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
-- 
2.9.3
