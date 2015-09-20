From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Sep 2015 23:45:53 +0200
Subject: [Buildroot] [PATCH 5/5] toolchain/external: bump Linaro to 2015.12
	for AArch64 (LE)
In-Reply-To: <cover.1442785491.git.yann.morin.1998@free.fr>
References: <cover.1442785491.git.yann.morin.1998@free.fr>
Message-ID: <f534ca154bca1af779660c7cf411203eaeb01eb8.1442785491.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That toolchain is only available for x86_64 hosts, so hide it when the
host is not an x86_64.

Re-use and adapt the comment for the two ARM/ARMEB toolchains about the
need for an x86_64 build machine.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 toolchain/toolchain-external/Config.in               | 19 +++++++++++++++++--
 toolchain/toolchain-external/toolchain-external.hash |  1 +
 toolchain/toolchain-external/toolchain-external.mk   |  4 ++++
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 3863c3d..5599767 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -6,9 +6,10 @@ choice
 comment "(e)glibc toolchains only available with shared lib support"
 	depends on BR2_STATIC_LIBS
 
+# Need to replicate the BR2_aarch64 a second time
 comment "Linaro 2015.02 toolchains need an x86_64 build machine"
-	depends on BR2_arm || BR2_armeb
-	depends on (!BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF) \
+	depends on BR2_arm || BR2_armeb || BR2_aarch64
+	depends on (!BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF) || BR2_aarch64 \
 		|| !BR2_HOSTARCH = "x86_64"
 	depends on !BR2_STATIC_LIBS
 
@@ -853,6 +854,20 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
 
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_2015_02
+	bool "Linaro AArch64 15.02"
+	depends on BR2_aarch64
+	depends on BR2_HOSTARCH = "x86_64"
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	help
+	  Toolchain for the AArch64 architecture, from
+	  http://www.linaro.org/engineering/armv8/
+
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_2014_09
 	bool "Linaro AArch64 14.09"
 	depends on BR2_aarch64
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 8c9e153..d8d1fdb 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -54,6 +54,7 @@ sha256 94fca98cb436228a40e8c9b77eec91beee87be170055aea99a6cb1be3d83ee50  gcc-lin
 sha256 4bc9d86390f8fa67a693ba4768ba5b12faaf7dd37c706c05ccd9321e765226e4  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 sha256 3f4b80a3eec1c28f92b17417b123d7f24ec9ed6d82be4929fa6cd4a8c17a1e74  gcc-linaro-4.9-2015.02-3-x86_64_armeb-linux-gnueabihf.tar.xz
 sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
+sha256 010bc180b42da770bcdfdb61e3d6237d13c3cf76d7b62c11d0c25a2218ade130  gcc-linaro-4.9-2015.02-3-x86_64_aarch64-linux-gnu.tar.xz
 
 # Synopsys DesignWare ARC toolchains
 sha256 1fa4ea2c8616623205f1c7beca02ea31b019099528a7433e5b020b0876b93bf3  arc_gnu_2014.12_prebuilt_uclibc_le_arc700_linux_install.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index d3a0e8a..00dba73 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -382,6 +382,10 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1),y)
 TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2014R1/2014R1-RC2/i386
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2014R1-RC2.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_2015_02),y)
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/15.02/components/toolchain/binaries/aarch64-linux-gnu
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-4.9-2015.02-3-x86_64_aarch64-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_2014_09),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
-- 
1.9.1
