From: Gleb Mazovetskiy <glex.spb@gmail.com>
Date: Tue, 13 Apr 2021 07:26:14 +0100
Subject: [Buildroot] [PATCH v2 1/1] Fix -latomic for CMake packages
In-Reply-To: <20210413060942.2530596-1-glex.spb@gmail.com>
References: <20210413060942.2530596-1-glex.spb@gmail.com>
Message-ID: <20210413062615.2808309-1-glex.spb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The poppler package failed to build for me with errors such as this one:

    host/aarch64-buildroot-linux-gnu/include/c++/10.3.0/cstdlib:75:15: fatal error: stdlib.h: No such file or directory
       75 | #include_next <stdlib.h>
          |               ^~~~~~~~~~

Changing the CMake option to a link-specific one fixes the issue.

---
Changes v1 -> v2
  - Also fix kodi
---
 package/cutelyst/cutelyst.mk                           | 2 +-
 package/gerbera/gerbera.mk                             | 2 +-
 package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk | 2 +-
 package/kodi/kodi.mk                                   | 2 +-
 package/poppler/poppler.mk                             | 2 +-
 package/wampcc/wampcc.mk                               | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

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
index ccb3b2eeb5..f75595a46d 100644
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
index 6edb0b7fca..28fe4a6a92 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -184,7 +184,7 @@ endif
 
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
-- 
2.27.0
