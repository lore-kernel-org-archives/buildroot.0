From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 1 May 2021 15:00:18 +0200
Subject: [Buildroot] [git commit] Fix -latomic for CMake packages
Message-ID: <20210501123628.E548886900@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7333207eaf2900076185cba6641c6406d61c235e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The poppler package failed to build for me with errors such as this one:

    host/aarch64-buildroot-linux-gnu/include/c++/10.3.0/cstdlib:75:15: fatal error: stdlib.h: No such file or directory
       75 | #include_next <stdlib.h>
          |               ^~~~~~~~~~

Changing the CMake option to a link-specific one fixes the issue.

Also change other packages with the same issue: cutelyst, gerbera,
kf5-modemmanager-qt, kodi and wampcc.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/cutelyst/cutelyst.mk                           | 2 +-
 package/gerbera/gerbera.mk                             | 2 +-
 package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk | 2 +-
 package/kodi/kodi.mk                                   | 3 +--
 package/poppler/poppler.mk                             | 2 +-
 package/wampcc/wampcc.mk                               | 2 +-
 6 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/cutelyst/cutelyst.mk b/package/cutelyst/cutelyst.mk
index 9520922454..5313b003ad 100644
--- a/package/cutelyst/cutelyst.mk
+++ b/package/cutelyst/cutelyst.mk
@@ -18,7 +18,7 @@ CUTELYST_CONF_OPTS += \
 
 # Qt 5.8 needs atomics, which on various architectures are in -latomic
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-CUTELYST_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
+CUTELYST_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPWQUALITY),y)
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index 69d52e2677..b88fe8cc34 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -20,7 +20,7 @@ GERBERA_CONF_OPTS = -DWITH_DEBUG=OFF
 
 # Uses __atomic_fetch_add_4
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-GERBERA_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
+GERBERA_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
 ifeq ($(BR2_PACKAGE_DUKTAPE),y)
diff --git a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk
index 2a782b35e1..81617492c0 100644
--- a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk
+++ b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk
@@ -15,7 +15,7 @@ KF5_MODEMMANAGER_QT_INSTALL_STAGING = YES
 
 # Uses __atomic_fetch_add_4
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-KF5_MODEMMANAGER_QT_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
+KF5_MODEMMANAGER_QT_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
 $(eval $(cmake-package))
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 6edb0b7fca..b945534711 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -60,7 +60,6 @@ KODI_EXTRA_DOWNLOADS += \
 
 KODI_CONF_OPTS += \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(KODI_C_FLAGS)" \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(KODI_CXX_FLAGS)" \
 	-DENABLE_APP_AUTONAME=OFF \
 	-DENABLE_CCACHE=OFF \
 	-DENABLE_DVDCSS=ON \
@@ -184,7 +183,7 @@ endif
 
 # mips: uses __atomic_load_8
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-KODI_CXX_FLAGS += -latomic
+KODI_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),)
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 44ad04bf7c..a5a97d974b 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -21,7 +21,7 @@ POPPLER_CONF_OPTS = \
 	-DENABLE_GTK_DOC=OFF
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-POPPLER_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
+POPPLER_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
 ifeq ($(BR2_PACKAGE_BOOST),y)
diff --git a/package/wampcc/wampcc.mk b/package/wampcc/wampcc.mk
index 5e7ee03651..11bb1f90b5 100644
--- a/package/wampcc/wampcc.mk
+++ b/package/wampcc/wampcc.mk
@@ -13,7 +13,7 @@ WAMPCC_LICENSE_FILES = LICENSE
 
 # Uses __atomic_fetch_add_8
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-WAMPCC_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
+WAMPCC_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
 $(eval $(cmake-package))
