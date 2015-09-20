From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Sep 2015 23:45:52 +0200
Subject: [Buildroot] [PATCH 4/5] toolchain/external: bump Linaro to 2015.12
	for ARM (BE)
In-Reply-To: <cover.1442785491.git.yann.morin.1998@free.fr>
References: <cover.1442785491.git.yann.morin.1998@free.fr>
Message-ID: <e1b88cef7705821748912646bc779cb0c5365006.1442785491.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That toolchain is only available for x86_64 hosts, so hide it when the
host is not an x86_64.

Re-use the comment previously added for the ARM toolchain.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 toolchain/toolchain-external/Config.in             | 24 +++++++++++++++++++++-
 .../toolchain-external/toolchain-external.hash     |  1 +
 toolchain/toolchain-external/toolchain-external.mk |  4 ++++
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index ce3a5f1..3863c3d 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -7,7 +7,7 @@ comment "(e)glibc toolchains only available with shared lib support"
 	depends on BR2_STATIC_LIBS
 
 comment "Linaro 2015.02 toolchains need an x86_64 build machine"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_armeb
 	depends on (!BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF) \
 		|| !BR2_HOSTARCH = "x86_64"
 	depends on !BR2_STATIC_LIBS
@@ -60,6 +60,28 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM_2014_09
 	  with the hard floating point calling convention, and uses
 	  the VFPv3-D16 FPU instructions.
 
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB_2015_02
+	bool "Linaro armeb 2015.02"
+	depends on BR2_armeb
+	depends on BR2_ARM_CPU_ARMV7A
+	depends on BR2_HOSTARCH = "x86_64"
+	depends on BR2_ARM_EABIHF
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	help
+	  Linaro toolchain for the ARM big endian architecture. It
+	  uses Linaro GCC 2015.01 (based on gcc 4.9), Linaro GDB
+	  2015.02 (based on GDB 7.8), eglibc 2.19, Binutils 2014.11
+	  (based on 2.24) and kernel headers 3.17. It generates code
+	  that runs on all Cortex-A profile devices, but tuned for
+	  the Cortex-A9. The code generated is Thumb 2, with the hard
+	  floating point calling convention, and uses the VFPv3-D16
+	  FPU instructions.
+
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB_2014_09
 	bool "Linaro armeb 2014.09"
 	depends on BR2_armeb
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 7eafe82..8c9e153 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -52,6 +52,7 @@ sha256 254af7d02eb3bcc8345c78e131700bc995d65b68232caaed21150a5fd1456070  arago-2
 sha256 0cffac0caea0eb3c8bdddfa14be011ce366680f40aeddbefc7cf23cb6d4f1891  gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 sha256 94fca98cb436228a40e8c9b77eec91beee87be170055aea99a6cb1be3d83ee50  gcc-linaro-4.9-2015.02-3-x86_64_arm-linux-gnueabihf.tar.xz
 sha256 4bc9d86390f8fa67a693ba4768ba5b12faaf7dd37c706c05ccd9321e765226e4  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
+sha256 3f4b80a3eec1c28f92b17417b123d7f24ec9ed6d82be4929fa6cd4a8c17a1e74  gcc-linaro-4.9-2015.02-3-x86_64_armeb-linux-gnueabihf.tar.xz
 sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
 
 # Synopsys DesignWare ARC toolchains
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index be9568e..d3a0e8a 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -315,6 +315,10 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM_2014_09),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMHF_SYMLINK
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB_2015_02),y)
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/15.02/components/toolchain/binaries/armeb-linux-gnueabihf
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-4.9-2015.02-3-x86_64_armeb-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_ARMEBHF_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB_2014_09),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
-- 
1.9.1
