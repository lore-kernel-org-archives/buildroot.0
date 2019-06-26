From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 26 Jun 2019 16:04:12 +0200
Subject: [Buildroot] [PATCH 2/2] package/qt5/qt5base: build with correct
 optimization
In-Reply-To: <20190626140412.101607-1-giulio.benetti@micronovasrl.com>
References: <20190626140412.101607-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190626140412.101607-2-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt5 has predefined optimization flags depending if you're building for
size, for debug etc. But this is a problem because those flags override
Buildroot's TARGET_CFLAGS. In particular QMAKE_CFLAGS_OPTIMIZE_FULL is
set to -O3 by default and when a qt5 module .pro file contains 'CONFIG
+= optimize_full', qmake appends QMAKE_CFLAGS_OPTIMIZE_FULL to CFLAGS.
So the only consistent way that avoid patching qt5 to set optimization
according to Buildroot is to set QMAKE_CFLAGS_OPTIMIZE_FULL =
$(TARGET_OPTIMIZATION) by passing a new qt variable BR_OPTIMIZATION when
calling qt5 ./configure.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/qt5/qt5base/qmake.conf.in | 1 +
 package/qt5/qt5base/qt5base.mk    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/qt5/qt5base/qmake.conf.in b/package/qt5/qt5base/qmake.conf.in
index 26bee2cb39..4de880d2a2 100644
--- a/package/qt5/qt5base/qmake.conf.in
+++ b/package/qt5/qt5base/qmake.conf.in
@@ -15,6 +15,7 @@ QMAKE_CXX               = $${CROSS_COMPILE}g++
 # modifications to gcc-base.conf
 QMAKE_CFLAGS           += $${BR_COMPILER_CFLAGS}
 QMAKE_CXXFLAGS         += $${BR_COMPILER_CXXFLAGS}
+QMAKE_CFLAGS_OPTIMIZE_FULL  = $${BR_OPTIMIZATION}
 CONFIG                 += nostrip
 
 QMAKE_LIBS             += -lrt -lpthread -ldl
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index e4aa76908a..69e90a37b3 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -361,6 +361,7 @@ define QT5BASE_CONFIGURE_CMDS
 		-device-option CROSS_COMPILE="$(TARGET_CROSS)" \
 		-device-option BR_COMPILER_CFLAGS="$(QT5BASE_CFLAGS)" \
 		-device-option BR_COMPILER_CXXFLAGS="$(QT5BASE_CXXFLAGS)" \
+		-device-option BR_OPTIMIZATION="$(TARGET_OPTIMIZATION)" \
 		$(QT5BASE_CONFIGURE_OPTS) \
 	)
 endef
-- 
2.17.1
