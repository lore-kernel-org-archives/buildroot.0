From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 21 May 2019 15:39:25 +0200
Subject: [Buildroot] [PATCH v2 05/12] package/flare-engine: fix BUG_85180
 build timeout
In-Reply-To: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
References: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190521133932.81841-6-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x build hangs on compiling last files.
This is due to bug 85180:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
Bug shows up building flare-engine with optimization but not when
building with -O0.

If BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 by:
- setting CMAKE_BUILD_TYPE to Dummy to avoid CMakeLists.txt to impose
  -O* and -g* flags
- pass -O0 to CXXFLAGS to override previous -O flags
Then remove 'depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85180' and its
comment if not available in Config.in

Fixes:
http://autobuild.buildroot.net/results/706/7065e14917a8bbc0faf21b29183ac55b6c800ee3/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/flare-engine/Config.in       | 4 ----
 package/flare-engine/flare-engine.mk | 6 ++++++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/flare-engine/Config.in b/package/flare-engine/Config.in
index e299a6b7de..cdcb018948 100644
--- a/package/flare-engine/Config.in
+++ b/package/flare-engine/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_FLARE_ENGINE
 	bool "flare-engine"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # SDL2
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85180
 	select BR2_PACKAGE_SDL2
 	select BR2_PACKAGE_SDL2_IMAGE
 	select BR2_PACKAGE_SDL2_MIXER
@@ -18,6 +17,3 @@ config BR2_PACKAGE_FLARE_ENGINE
 
 comment "flare-engine needs a toolchain w/ C++, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
-
-comment "flare-engine needs a toolchain not affected by GCC bug 85180"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85180
diff --git a/package/flare-engine/flare-engine.mk b/package/flare-engine/flare-engine.mk
index 2f36602348..a9d506e220 100644
--- a/package/flare-engine/flare-engine.mk
+++ b/package/flare-engine/flare-engine.mk
@@ -19,4 +19,10 @@ ifeq ($(BR2_ENABLE_DEBUG),y)
 FLARE_ENGINE_CONF_OPTS += -DCMAKE_BUILD_TYPE=RelWithDebInfo
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+# Avoid CMakeLists.txt to impose "-O* -g*" flags
+FLARE_ENGINE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Dummy
+FLARE_ENGINE_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -O0"
+endif
+
 $(eval $(cmake-package))
-- 
2.17.1
