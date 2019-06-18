From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 18 Jun 2019 10:45:34 +0200
Subject: [Buildroot] [PATCH 3/4] package/qt5/qt5base: work around gcc bug
 90620
In-Reply-To: <20190618084535.75870-1-giulio.benetti@micronovasrl.com>
References: <20190618084535.75870-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190618084535.75870-4-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version <= 9.x the build hangs due to gcc bug
90620: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90620. The bug
shows up when building qt5base with optimization but not when
building with -O0. To work around this, if
BR2_TOOLCHAIN_HAS_GCC_BUG_90620=y we force using -O0.

Fixes:
http://autobuild.buildroot.net/results/4e5/4e563f5fc38ec681a730a576c5f056bc092db74e/
http://autobuild.buildroot.net/results/348/3482bd950c7ab5608666807a7ab7ea857c767333/
http://autobuild.buildroot.net/results/835/8351e3fbd6a39d05da6a6e7a978329d718dfc109/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/qt5/qt5base/qt5base.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index c732e766f3..e682ae3c7d 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -33,6 +33,14 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
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
@@ -350,8 +358,8 @@ define QT5BASE_CONFIGURE_CMDS
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
-- 
2.17.1
