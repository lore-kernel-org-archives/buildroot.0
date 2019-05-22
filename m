From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 22 May 2019 14:25:38 +0200
Subject: [Buildroot] [PATCH 4/8] package/assimp: re-enable package if
 BR2_microblaze is enabled
In-Reply-To: <20190522122542.84146-1-giulio.benetti@micronovasrl.com>
References: <20190522122542.84146-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190522122542.84146-5-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x build hangs on compiling first files.
This is due to bug 71124:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71124
This package has been excluded from building if BR2_microblaze is
enabled.
Bug shows up building assimp with optimization but not when building
with -O0.

In config.mk if BR2_TOOLCHAIN_HAS_GCC_BUG_71124=y force using -O0 by:
- passing -O0 to ASSIMP_CXXFLAGS
Then remove 'depends on !BR2_microblaze' and its comment if not
available from Config.in

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/assimp/Config.in | 5 -----
 package/assimp/assimp.mk | 4 ++++
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/assimp/Config.in b/package/assimp/Config.in
index 41c1bb348b..630758f3e7 100644
--- a/package/assimp/Config.in
+++ b/package/assimp/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_ASSIMP
 	bool "assimp"
-	# All gcc versions affected by
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71124, that
-	# cause an infinite loop in gcc when building this package.
-	depends on !BR2_microblaze
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_ZLIB
 	help
@@ -16,5 +12,4 @@ config BR2_PACKAGE_ASSIMP
 	  http://www.assimp.org
 
 comment "assimp needs a toolchain w/ C++"
-	depends on !BR2_microblaze
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index 1316720423..5720f9793f 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -24,6 +24,10 @@ ifeq ($(BR2_sh):$(BR2_STATIC_LIBS):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:y:)
 ASSIMP_CXXFLAGS += -O2
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+ASSIMP_CXXFLAGS += -O0
+endif
+
 ASSIMP_CONF_OPTS += -DASSIMP_BUILD_TESTS=OFF \
 	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(ASSIMP_CXXFLAGS)"
 
-- 
2.17.1
