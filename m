From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Oct 2017 21:37:28 +0200
Subject: [Buildroot] [git commit] qt5base: make harfbuzz support selectable
Message-ID: <20171021193007.6DCC581102@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7e71c0124a998893962e5fcc3500206f3b57a59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If selected use:

 - system/buildroot harfbuzz in case __sync for 4 bytes is supported
 - qt harfbuzz otherwise (using QAtomic instead)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/qt5base/Config.in  |  8 ++++++++
 package/qt5/qt5base/qt5base.mk | 16 ++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index f5de272..dc56474 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -229,6 +229,14 @@ config BR2_PACKAGE_QT5BASE_FONTCONFIG
 	  This option enables Fontconfig and Freetype support using
 	  the system fontconfig and freetype2 libraries.
 
+config BR2_PACKAGE_QT5BASE_HARFBUZZ
+	bool "harfbuzz support"
+	select BR2_PACKAGE_HARFBUZZ if BR2_TOOLCHAIN_HAS_SYNC_4
+	help
+	  This option enables HarfBuzz support (either system harfbuzz
+	  if the toolchain supports __sync for 4 bytes, or the qt
+	  provided one which avoids this dependency by using QAtomic).
+
 config BR2_PACKAGE_QT5BASE_GIF
 	bool "GIF support"
 	help
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 0ca11a5..1683eda 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -105,6 +105,22 @@ QT5BASE_DEPENDENCIES += freetype
 else
 QT5BASE_CONFIGURE_OPTS += -no-gui -no-freetype
 endif
+
+ifeq ($(BR2_PACKAGE_QT5BASE_HARFBUZZ),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_4),y)
+# system harfbuzz in case __sync for 4 bytes is supported
+QT5BASE_CONFIGURE_OPTS += -system-harfbuzz
+QT5BASE_DEPENDENCIES += harfbuzz
+else
+# qt harfbuzz otherwise (using QAtomic instead)
+QT5BASE_CONFIGURE_OPTS += -qt-harfbuzz
+QT5BASE_LICENSE := $(QT5BASE_LICENSE), MIT (harfbuzz)
+QT5BASE_LICENSE_FILES += src/3rdparty/harfbuzz-ng/COPYING
+endif
+else
+QT5BASE_CONFIGURE_OPTS += -no-harfbuzz
+endif
+
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_WIDGETS),-widgets,-no-widgets)
 # We have to use --enable-linuxfb, otherwise Qt thinks that -linuxfb
 # is to add a link against the "inuxfb" library.
