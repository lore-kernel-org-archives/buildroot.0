From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 Sep 2017 16:29:56 +0200
Subject: [Buildroot] [PATCH 2/2] package/libpng: switch to cmake
In-Reply-To: <20170902142956.22181-1-bernd.kuhls@t-online.de>
References: <20170902142956.22181-1-bernd.kuhls@t-online.de>
Message-ID: <20170902142956.22181-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We have no arch-specific options to control mips msa and powerpc vsx
support so we disable these options atm to prevent build errors.

Tested using this defconfig:

BR2_PACKAGE_LIBPNG=y

                armv5-ctng-linux-gnueabi [ 1/47]: OK
              armv7-ctng-linux-gnueabihf [ 2/47]: OK
                        br-aarch64-glibc [ 3/47]: OK
                           br-arcle-hs38 [ 4/47]: OK
                            br-arm-basic [ 5/47]: OK
                  br-arm-cortex-a9-glibc [ 6/47]: OK
                   br-arm-cortex-a9-musl [ 7/47]: OK
                   br-arm-cortex-m4-full [ 8/47]: OK
                             br-arm-full [ 9/47]: OK
                    br-arm-full-nothread [10/47]: OK
                      br-arm-full-static [11/47]: OK
                            br-bfin-full [12/47]: OK
                   br-i386-pentium4-full [13/47]: OK
                br-i386-pentium-mmx-musl [14/47]: OK
                       br-m68k-5208-full [15/47]: OK
                      br-m68k-68040-full [16/47]: OK
                    br-microblazeel-full [17/47]: OK
                 br-mips32r6-el-hf-glibc [18/47]: OK
                      br-mips64-n64-full [19/47]: OK
                 br-mips64r6-el-hf-glibc [20/47]: OK
                      br-mipsel-o32-full [21/47]: OK
                          br-nios2-glibc [22/47]: OK
                      br-openrisc-uclibc [23/47]: OK
               br-powerpc-603e-basic-cpp [24/47]: OK
             br-powerpc64le-power8-glibc [25/47]: OK
               br-powerpc64-power7-glibc [26/47]: OK
                  br-powerpc-e500mc-full [27/47]: OK
                             br-sh4-full [28/47]: OK
                        br-sparc64-glibc [29/47]: OK
                         br-sparc-uclibc [30/47]: OK
                    br-x86-64-core2-full [31/47]: OK
                          br-x86-64-musl [32/47]: OK
                          br-xtensa-full [33/47]: OK
                     i686-ctng-linux-gnu [34/47]: OK
                          linaro-aarch64 [35/47]: OK
                              linaro-arm [36/47]: OK
             mips64el-ctng_n32-linux-gnu [37/47]: OK
             mips64el-ctng_n64-linux-gnu [38/47]: OK
        powerpc-ctng_e500v2-linux-gnuspe [39/47]: OK
                     sourcery-arm-armv4t [40/47]: OK
                            sourcery-arm [41/47]: OK
                     sourcery-arm-thumb2 [42/47]: OK
                         sourcery-mips64 [43/47]: OK
                           sourcery-mips [44/47]: OK
                          sourcery-nios2 [45/47]: OK
                         sourcery-x86-64 [46/47]: OK
           x86_64-ctng_locales-linux-gnu [47/47]: OK
47 builds, 0 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...3-CMakeLists.txt-Enable-building-asm-code.patch | 40 ++++++++++++++++++++++
 package/libpng/libpng.mk                           | 22 ++++++++----
 2 files changed, 56 insertions(+), 6 deletions(-)
 create mode 100644 package/libpng/0003-CMakeLists.txt-Enable-building-asm-code.patch

diff --git a/package/libpng/0003-CMakeLists.txt-Enable-building-asm-code.patch b/package/libpng/0003-CMakeLists.txt-Enable-building-asm-code.patch
new file mode 100644
index 000000000..4bc5345fe
--- /dev/null
+++ b/package/libpng/0003-CMakeLists.txt-Enable-building-asm-code.patch
@@ -0,0 +1,40 @@
+From b47e0f5ceb525796dd98900613f3744d45331216 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 2 Sep 2017 15:09:30 +0200
+Subject: [PATCH] CMakeLists.txt: Enable building asm code
+
+NEON support is provided by filter_neon.S which is currently not build
+by cmake causing an error when linking with libpng16.so.16.32.0:
+
+[ 97%] Linking C executable pngstest
+libpng16.so.16.32.0: undefined reference to `png_read_filter_row_avg4_neon'
+libpng16.so.16.32.0: undefined reference to `png_read_filter_row_paeth3_neon'
+libpng16.so.16.32.0: undefined reference to `png_read_filter_row_up_neon'
+libpng16.so.16.32.0: undefined reference to `png_read_filter_row_avg3_neon'
+libpng16.so.16.32.0: undefined reference to `png_read_filter_row_paeth4_neon'
+libpng16.so.16.32.0: undefined reference to `png_read_filter_row_sub4_neon'
+libpng16.so.16.32.0: undefined reference to `png_read_filter_row_sub3_neon'
+
+Patch sent upstream: https://github.com/glennrp/libpng/pull/174
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4803a720d..153d6caf6 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -31,7 +31,7 @@ endif(POLICY CMP0054)
+ 
+ set(CMAKE_CONFIGURATION_TYPES "Release;Debug;MinSizeRel;RelWithDebInfo")
+ 
+-project(libpng C)
++project(libpng ASM C)
+ enable_testing()
+ 
+ set(PNGLIB_MAJOR 1)
+-- 
+2.11.0
+
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 2aa021712..6e915a47f 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -15,17 +15,27 @@ LIBPNG_DEPENDENCIES = host-pkgconf zlib
 HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
 LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config
 
+LIBPNG_CONF_OPTS += -DPNG_MIPS_MSA=off -DPNG_POWERPC_VSX=off
+
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBPNG_CONF_OPTS += -DPNG_SHARED=OFF -DPNG_STATIC=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+LIBPNG_CONF_OPTS += -DPNG_SHARED=ON -DPNG_STATIC=OFF
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+LIBPNG_CONF_OPTS += -DPNG_SHARED=ON -DPNG_STATIC=ON
+endif
+
 ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
-LIBPNG_CONF_OPTS += --enable-arm-neon
+LIBPNG_CONF_OPTS += -DPNG_ARM_NEON=on
 else
-LIBPNG_CONF_OPTS += --disable-arm-neon
+LIBPNG_CONF_OPTS += -DPNG_ARM_NEON=off
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
-LIBPNG_CONF_OPTS += --enable-intel-sse
+LIBPNG_CONF_OPTS += -DPNG_INTEL_SSE=on
 else
-LIBPNG_CONF_OPTS += --disable-intel-sse
+LIBPNG_CONF_OPTS += -DPNG_INTEL_SSE=off
 endif
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.11.0
