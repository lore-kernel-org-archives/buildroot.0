From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 21:52:44 +0100
Subject: [Buildroot] [git commit] toolchain/external: bump Linaro ARM to
	2015.08
Message-ID: <20151103210753.55EC281E7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b3b98bf5a0f5953ff86b59d8d76e3386d3be4af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

That toolchain is built for an x86_64 host, so we make it available only
for x86_64, and we keep the old 2014.09 toolchain for x86 hosts.

To avoid dealing with legacy symbols and introduce versioned options,
we reuse the same symbol for both toolchains. Thanks to the different
depednencies (on the host), we can give them different prompts and
different help texts.

[Thomas: s/eglibc/glibc/ as noticed by Baruch.]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in             |   28 ++++++++++++++++++-
 .../toolchain-external/toolchain-external.hash     |    1 +
 toolchain/toolchain-external/toolchain-external.mk |    5 +++
 3 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 3f6b8e8..00531be 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -11,17 +11,19 @@ comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
 	depends on !BR2_STATIC_LIBS
 
+# Note: we use the same symbol for both Linaro toolchains.
+# Since they have different dependencies (the host), we can
+# give them different prompts and different help texts.
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	bool "Linaro ARM 2014.09"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	help
@@ -33,6 +35,28 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	  with the hard floating point calling convention, and uses
 	  the VFPv3-D16 FPU instructions.
 
+# See the note above.
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
+	bool "Linaro ARM 2015.08"
+	depends on BR2_arm
+	depends on BR2_ARM_CPU_ARMV7A
+	depends on BR2_HOSTARCH = "x86_64"
+	depends on BR2_ARM_EABIHF
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	help
+	  Linaro toolchain for the ARM architecture. It uses Linaro
+	  GCC 2015.08 (based on gcc 5.1), Linaro GDB 2015.08 (based on
+	  GDB 7.10), glibc 2.21, Binutils 2015.10 (based on 2.25). It
+	  generates code that runs on all Cortex-A profile devices,
+	  but tuned for the Cortex-A9. The code generated is Thumb 2,
+	  with the hard floating point calling convention, and uses
+	  the VFPv3-D16 FPU instructions.
+
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	bool "Linaro armeb 2014.09"
 	depends on BR2_armeb
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 8424dca..d9c73b4 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -50,6 +50,7 @@ sha256 254af7d02eb3bcc8345c78e131700bc995d65b68232caaed21150a5fd1456070  arago-2
 
 # ARM and Aarch64 toolchains from Linaro
 sha256 0cffac0caea0eb3c8bdddfa14be011ce366680f40aeddbefc7cf23cb6d4f1891  gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
+sha256 34812c5d0556db86259ac6eb3f8bcf4ce8eca3fa8d7180875958492a42e9853f  gcc-linaro-5.1-2015.08-x86_64_arm-linux-gnueabihf.tar.xz
 sha256 4bc9d86390f8fa67a693ba4768ba5b12faaf7dd37c706c05ccd9321e765226e4  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
 
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 4e12a1c..b745ed7 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -312,8 +312,13 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	rm -rf $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/arago-2011.09/
 endef
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM),y)
+ifeq ($(HOSTARCH),x86)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
+else
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/components/toolchain/binaries/5.1-2015.08/arm-linux-gnueabihf
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.1-2015.08-x86_64_arm-linux-gnueabihf.tar.xz
+endif
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
