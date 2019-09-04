From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  4 Sep 2019 23:02:37 +0200
Subject: [Buildroot] [PATCH 1/2] package/jsoncpp: switch build system to
 meson
Message-ID: <20190904210238.7585-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bumping jsoncpp to 1.9.1 will cause a CMake-related build error:
https://github.com/open-source-parsers/jsoncpp/issues/970

To fix the bug upstream suggests to switch to meson:
"Our official policy has been only supporting the meson build, and
 having users submit fixes for the CMake build."
https://github.com/open-source-parsers/jsoncpp/issues/970#issuecomment-509794015

Remove all _CONF_OPTS as they are not supported by meson.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Build-tested using this defconfig:

BR2_PACKAGE_JSONCPP=y

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
               br-powerpc-603e-basic-cpp [23/44]: OK
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
44 builds, 2 skipped, 0 build failed, 0 legal-info failed

 package/jsoncpp/jsoncpp.mk | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 2b527fc303..d54b31a8d6 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -10,15 +10,4 @@ JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE
 JSONCPP_INSTALL_STAGING = YES
 
-JSONCPP_CONF_OPTS += \
-	-DJSONCPP_WITH_POST_BUILD_UNITTEST=OFF \
-	-DJSONCPP_WITH_TESTS=OFF \
-	-DJSONCPP_WITH_STRICT_ISO=OFF
-
-ifeq ($(BR2_SHARED_LIBS),y)
-JSONCPP_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
-else
-JSONCPP_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
-endif
-
-$(eval $(cmake-package))
+$(eval $(meson-package))
-- 
2.20.1
