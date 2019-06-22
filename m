From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 20:42:41 +0200
Subject: [Buildroot] [git commit] package/qt5/qt5base: work around gcc bug
 90620
Message-ID: <20190622185146.A164B82B9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1667f31cd7ed3e89f6b5101e55cb3f143088d2b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On Microblaze, with gcc versions <= 9.x and optimization enabled, the
build fails with:

  internal compiler error: in do_output_reload, at reload1.c:7978

This is due to gcc bug 90620
(https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90620). The bug shows up
when building qt5base (or other qt5 modules) with optimization but not
when building with -O0. To work around this bug, if
BR2_TOOLCHAIN_HAS_GCC_BUG_90620=y we force using -O0.

Fixes:
http://autobuild.buildroot.net/results/4e5/4e563f5fc38ec681a730a576c5f056bc092db74e/
http://autobuild.buildroot.net/results/348/3482bd950c7ab5608666807a7ab7ea857c767333/
http://autobuild.buildroot.net/results/835/8351e3fbd6a39d05da6a6e7a978329d718dfc109/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/qt5base.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index f4b40913f4..e4aa76908a 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -34,6 +34,14 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5BASE_CONFIGURE_OPTS += -no-optimize-debug
 endif
 
+QT5BASE_CFLAGS = $(TARGET_CFLAGS)
+QT5BASE_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_90620),y)
+QT5BASE_CFLAGS += -O0
+QT5BASE_CXXFLAGS += -O0
+endif
+
 ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
 QT5BASE_DEPENDENCIES += pcre
 else
@@ -351,8 +359,8 @@ define QT5BASE_CONFIGURE_CMDS
 		-nomake tests \
 		-device buildroot \
 		-device-option CROSS_COMPILE="$(TARGET_CROSS)" \
-		-device-option BR_COMPILER_CFLAGS="$(TARGET_CFLAGS)" \
-		-device-option BR_COMPILER_CXXFLAGS="$(TARGET_CXXFLAGS)" \
+		-device-option BR_COMPILER_CFLAGS="$(QT5BASE_CFLAGS)" \
+		-device-option BR_COMPILER_CXXFLAGS="$(QT5BASE_CXXFLAGS)" \
 		$(QT5BASE_CONFIGURE_OPTS) \
 	)
 endef
