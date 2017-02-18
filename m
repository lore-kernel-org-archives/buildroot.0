From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 18 Feb 2017 12:32:02 +0100
Subject: [Buildroot] [PATCH v3 3/3] qt5base: make harfbuzz support selectable
In-Reply-To: <20170218113202.14213-1-ps.report@gmx.net>
References: <20170218113202.14213-1-ps.report@gmx.net>
Message-ID: <20170218113202.14213-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If selected use:

 - system/buildroot harfbuzz in case __sync for 4 bytes is supported
 - qt harfbuzz otherwise (using QAtomic instead)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v2 -> v3:
  - add empty lines for better seperation (Arnout Vandecappelle)

Changes v1 -> v2:
  - make harfbuzz support selectable, preferre the system provided
    one, but fall back to qt provided one
---
 package/qt5/qt5base/Config.in  |  9 +++++++++
 package/qt5/qt5base/qt5base.mk | 16 ++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 337dcf245..27f225026 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -239,6 +239,15 @@ config BR2_PACKAGE_QT5BASE_FONTCONFIG
 	  This option enables Fontconfig and Freetype support using
 	  the system fontconfig and freetype2 libraries.
 
+config BR2_PACKAGE_QT5BASE_HARFBUZZ
+	bool "harfbuzz support"
+	select BR2_PACKAGE_HARFBUZZ if BR2_TOOLCHAIN_HAS_SYNC_4
+	help
+	  This option enables HarfBuzz support (either system
+	  harfbuzz if the toolchain supports __sync for 4 bytes
+	  or qt provided one which avoids this dependenc by using
+	  QAtomic).
+
 config BR2_PACKAGE_QT5BASE_GIF
 	bool "GIF support"
 	help
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 78db08ce4..155f994a8 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -104,6 +104,22 @@ QT5BASE_DEPENDENCIES += freetype
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
-- 
2.11.0
