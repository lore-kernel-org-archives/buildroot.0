From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 26 Oct 2019 20:22:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/assimp: bump version to 5.0.0
Message-ID: <20191026182248.10372-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebased patch and added link to upstream pull request.

Added dependency to host-pkgconf because the CMake function
FIND_PACKAGE is used to detect zlib:
https://github.com/assimp/assimp/blob/master/CMakeLists.txt#L440

Quoting configure output:
-- Looking for ZLIB...
-- Found PkgConfig: /home/buildroot/br/output/host/bin/pkg-config (found version "1.6.1")

mips64el also needs -mxgot which fixes an error at linking stage.

Upstream commit added a check for ssize_t
https://github.com/assimp/assimp/commit/bb11f90983c866760a22f11c26717ea2cc03505d#diff-6d654ad76d625ddbefeb15aeaf7853d8
based on various defines which are all not provided by musl causing a
build error:

  /home/buildroot/br/output/build/assimp-5.0.0/contrib/zip/src/zip.h:30:15:
   error: conflicting declaration ?typedef long int ssize_t?
     typedef long  ssize_t;  /* byte count or error */

To fix the problem we add the appropriate define to cflags and cxxflags
to fix the build of FBXConverter.cpp and zip.c.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Build-tested using this defconfig:

BR2_PACKAGE_ASSIMP=y

                     andes-nds32 [ 1/44]: SKIPPED
                     arm-aarch64 [ 2/44]: OK
                br-aarch64-glibc [ 3/44]: OK
                   br-arcle-hs38 [ 4/44]: OK
                    br-arm-basic [ 5/44]: SKIPPED
          br-arm-cortex-a9-glibc [ 6/44]: OK
           br-arm-cortex-a9-musl [ 7/44]: OK
           br-arm-cortex-m4-full [ 8/44]: OK
                     br-arm-full [ 9/44]: OK
            br-arm-full-nothread [10/44]: OK
              br-arm-full-static [11/44]: OK
           br-i386-pentium4-full [12/44]: OK
        br-i386-pentium-mmx-musl [13/44]: OK
               br-m68k-5208-full [14/44]: OK
              br-m68k-68040-full [15/44]: OK
            br-microblazeel-full [16/44]: OK
         br-mips32r6-el-hf-glibc [17/44]: OK
              br-mips64-n64-full [18/44]: OK
         br-mips64r6-el-hf-glibc [19/44]: OK
              br-mipsel-o32-full [20/44]: OK
                  br-nios2-glibc [21/44]: OK
              br-openrisc-uclibc [22/44]: OK
       br-powerpc-603e-basic-cpp [23/44]: SKIPPED
     br-powerpc64le-power8-glibc [24/44]: OK
       br-powerpc64-power7-glibc [25/44]: OK
          br-powerpc-e500mc-full [26/44]: OK
                      br-riscv32 [27/44]: OK
                      br-riscv64 [28/44]: OK
                     br-sh4-full [29/44]: OK
                br-sparc64-glibc [30/44]: OK
                 br-sparc-uclibc [31/44]: OK
            br-x86-64-core2-full [32/44]: OK
                  br-x86-64-musl [33/44]: OK
                  br-xtensa-full [34/44]: OK
               linaro-aarch64-be [35/44]: OK
                  linaro-aarch64 [36/44]: OK
                      linaro-arm [37/44]: OK
             sourcery-arm-armv4t [38/44]: OK
                    sourcery-arm [39/44]: OK
             sourcery-arm-thumb2 [40/44]: OK
                 sourcery-mips64 [41/44]: OK
                   sourcery-mips [42/44]: OK
                  sourcery-nios2 [43/44]: OK
                 sourcery-x86-64 [44/44]: OK
44 builds, 3 skipped, 0 build failed, 0 legal-info failed

Also build-tested qt53d based on br-x86-64-core2-full.config.


 ...BXConverter-use-proper-64-bit-constant.patch | 15 ++++++++++-----
 package/assimp/assimp.hash                      |  2 +-
 package/assimp/assimp.mk                        | 17 ++++++++++++-----
 3 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/package/assimp/0001-Fix-FBXConverter-use-proper-64-bit-constant.patch b/package/assimp/0001-Fix-FBXConverter-use-proper-64-bit-constant.patch
index bfcbeb55e3..df8a64f7a4 100644
--- a/package/assimp/0001-Fix-FBXConverter-use-proper-64-bit-constant.patch
+++ b/package/assimp/0001-Fix-FBXConverter-use-proper-64-bit-constant.patch
@@ -12,24 +12,29 @@ Use proper 64-bit constant for CONVERT_FBX_TIME(time) conversion, fixes:
   code/FBXConverter.cpp:2878: error: integer constant is too large for 'long' type
   code/FBXConverter.cpp:2888: error: integer constant is too large for 'long' type
 
+Patch sent upstream: https://github.com/assimp/assimp/pull/2697
+
+[Bernd: rebase for version 5.0.0]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  code/FBXConverter.cpp | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/code/FBXConverter.cpp b/code/FBXConverter.cpp
 index e0c6b9c..b1e9a71 100644
---- a/code/FBXConverter.cpp
-+++ b/code/FBXConverter.cpp
-@@ -67,7 +67,7 @@ namespace FBX {
+--- a/code/FBX/FBXConverter.cpp
++++ b/code/FBX/FBXConverter.cpp
+@@ -77,7 +77,7 @@
  
  #define MAGIC_NODE_TAG "_$AssimpFbx$"
  
 -#define CONVERT_FBX_TIME(time) static_cast<double>(time) / 46186158000L
 +#define CONVERT_FBX_TIME(time) static_cast<double>(time) / 46186158000LL
  
-     // XXX vc9's debugger won't step into anonymous namespaces
- //namespace {
+         FBXConverter::FBXConverter(aiScene* out, const Document& doc, bool removeEmptyBones )
+         : defaultMaterialIndex()
+
 -- 
 2.1.4
 
diff --git a/package/assimp/assimp.hash b/package/assimp/assimp.hash
index 72d367ac43..2296382d91 100644
--- a/package/assimp/assimp.hash
+++ b/package/assimp/assimp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 3520b1e9793b93a2ca3b797199e16f40d61762617e072f2d525fad70f9678a71  assimp-4.1.0.tar.gz
+sha256 b0110a91650d6bb4000e3d5c2185bf77b0ff0a2e7a284bc2c4af81b33988b63c  assimp-5.0.0.tar.gz
 sha256 a26ccc3dbf2f58ea99c100945a8a126fa0f9f4d7fd2b49aa8bdb8e09355864d8  LICENSE
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index ce02ef300c..595e5514fe 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -4,15 +4,16 @@
 #
 ################################################################################
 
-ASSIMP_VERSION = 4.1.0
+ASSIMP_VERSION = 5.0.0
 ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
 ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
-ASSIMP_DEPENDENCIES = zlib
+ASSIMP_DEPENDENCIES = host-pkgconf zlib
 ASSIMP_INSTALL_STAGING = YES
 
-# relocation truncated to fit: R_68K_GOT16O
-ifeq ($(BR2_m68k),y)
+# m68k: relocation truncated to fit: R_68K_GOT16O
+# mips64el: relocation truncated to fit: R_MIPS_CALL16
+ifeq ($(BR2_m68k)$(BR2_mips64el),y)
 ASSIMP_CXXFLAGS += -mxgot
 endif
 
@@ -28,7 +29,13 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 ASSIMP_CXXFLAGS += -O0
 endif
 
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+ASSIMP_CXXFLAGS += -D__ssize_t_defined
+ASSIMP_CFLAGS += -D__ssize_t_defined
+endif
+
 ASSIMP_CONF_OPTS += -DASSIMP_BUILD_TESTS=OFF \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(ASSIMP_CXXFLAGS)"
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(ASSIMP_CXXFLAGS)" \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(ASSIMP_CFLAGS)"
 
 $(eval $(cmake-package))
-- 
2.20.1
