From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 21:36:46 +0200
Subject: [Buildroot] [git commit] package/gnu-efi: add arm/aarch64 support
Message-ID: <20170606193650.D62CD82A51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd3355b0a2cdd13740e0689452f29d4e20681838
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need BR2_ARM_CPU_HAS_ARM, otherwise build for cortex-m4 breaks with
"target CPU does not support ARM mode".

We only enable arm/aarch64 support for now, mips support is broken:
test-pkg/br-mips64-n64-full/build/gnu-efi-3.0.5/lib/mips64el/setjmp.S:40:
 Error: opcode not supported on this processor: mips64 (mips64) `ext $v0,$v0,29,1'

Tested by test-pkg using this defconfig

BR2_PACKAGE_GNU_EFI=y

with the following results:

                armv5-ctng-linux-gnueabi [ 1/49]: OK
              armv7-ctng-linux-gnueabihf [ 2/49]: OK
                        br-aarch64-glibc [ 3/49]: OK
                           br-arcle-hs38 [ 4/49]: SKIPPED
                            br-arm-basic [ 5/49]: OK
                  br-arm-cortex-a9-glibc [ 6/49]: OK
                   br-arm-cortex-a9-musl [ 7/49]: OK
                   br-arm-cortex-m4-full [ 8/49]: SKIPPED
                             br-arm-full [ 9/49]: OK
                    br-arm-full-nothread [10/49]: OK
                      br-arm-full-static [11/49]: OK
                            br-bfin-full [12/49]: SKIPPED
                   br-i386-pentium4-full [13/49]: OK
                br-i386-pentium-mmx-musl [14/49]: OK
                       br-m68k-5208-full [15/49]: SKIPPED
                      br-m68k-68040-full [16/49]: SKIPPED
                    br-microblazeel-full [17/49]: SKIPPED
                 br-mips32r6-el-hf-glibc [18/49]: SKIPPED
                      br-mips64-n64-full [19/49]: SKIPPED
                 br-mips64r6-el-hf-glibc [20/49]: SKIPPED
                      br-mipsel-o32-full [21/49]: SKIPPED
                          br-nios2-glibc [22/49]: SKIPPED
                      br-openrisc-uclibc [23/49]: SKIPPED
               br-powerpc-603e-basic-cpp [24/49]: SKIPPED
             br-powerpc64le-power8-glibc [25/49]: SKIPPED
               br-powerpc64-power7-glibc [26/49]: SKIPPED
                  br-powerpc-e500mc-full [27/49]: SKIPPED
                             br-sh4-full [28/49]: SKIPPED
                        br-sparc64-glibc [29/49]: SKIPPED
                         br-sparc-uclibc [30/49]: SKIPPED
                    br-x86-64-core2-full [31/49]: OK
                          br-x86-64-musl [32/49]: OK
                          br-xtensa-full [33/49]: SKIPPED
                     i686-ctng-linux-gnu [34/49]: OK
                          linaro-aarch64 [35/49]: OK
                              linaro-arm [36/49]: OK
             mips64el-ctng_n32-linux-gnu [37/49]: SKIPPED
             mips64el-ctng_n64-linux-gnu [38/49]: SKIPPED
        powerpc-ctng_e500v2-linux-gnuspe [39/49]: SKIPPED
                     sourcery-arm-armv4t [40/49]: OK
                            sourcery-arm [41/49]: OK
                     sourcery-arm-thumb2 [42/49]: OK
                         sourcery-mips64 [43/49]: SKIPPED
                           sourcery-mips [44/49]: SKIPPED
                          sourcery-nios2 [45/49]: SKIPPED
                             sourcery-sh [46/49]: SKIPPED
                         sourcery-x86-64 [47/49]: OK
                            sourcery-x86 [48/49]: OK
           x86_64-ctng_locales-linux-gnu [49/49]: OK
49 builds, 27 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnu-efi/Config.in  | 9 +++++----
 package/gnu-efi/gnu-efi.mk | 4 ++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/gnu-efi/Config.in b/package/gnu-efi/Config.in
index 982102f..d8d92c2 100644
--- a/package/gnu-efi/Config.in
+++ b/package/gnu-efi/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_GNU_EFI
 	bool "gnu-efi"
-	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_ARM_CPU_HAS_ARM || BR2_aarch64 || \
+		BR2_aarch64_be || BR2_i386 || BR2_x86_64
 	help
-	  Develop EFI applications for IA-64 (IPF), IA-32 (x86), and
-	  x86_64 platforms using the GNU toolchain and the EFI
-	  development environment.
+	  Develop EFI applications for ARM-64, ARM-32, x86_64, IA-64
+	  (IPF), IA-32 (x86), and MIPS platforms using the GNU toolchain
+	  and the EFI development environment.
 
 	  http://gnu-efi.sourceforge.net/
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 2222583..274160d 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -20,6 +20,10 @@ ifeq ($(BR2_i386),y)
 GNU_EFI_PLATFORM = ia32
 else ifeq ($(BR2_x86_64),y)
 GNU_EFI_PLATFORM = x86_64
+else ifeq ($(BR2_arm)$(BR2_armeb),y)
+GNU_EFI_PLATFORM = arm
+else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
+GNU_EFI_PLATFORM = aarch64
 endif
 
 define GNU_EFI_BUILD_CMDS
