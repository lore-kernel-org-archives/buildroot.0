From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 22:02:58 +0100
Subject: [Buildroot] [git commit] toolchain/external: bump Linaro AArch64 to
	2015.08
Message-ID: <20151103210753.6573C818BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24bfce0ebc18e6ed7dda868250455a3566c0c116
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

That toolchain is built for an x86_64 host, so we make it available only
for x86_64, and we keep the old 2014.09 toolchain for x86 hosts.

To avoid dealing with legacy symbols and introduce versioned options,
we reuse the same symbol for both toolchains. Thanks to the different
depednencies (on the host), we can give them different prompts and
different help texts.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in             |   19 +++++++++++++++++--
 .../toolchain-external/toolchain-external.hash     |    1 +
 toolchain/toolchain-external/toolchain-external.mk |    5 +++++
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 9a492e6..f2eed7f 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -836,14 +836,14 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
 
+# See note about Linar ARM/ARMEB toolchains, above.
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	bool "Linaro AArch64 14.09"
 	depends on BR2_aarch64
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
@@ -851,6 +851,21 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
 
+# See note about Linar ARM/ARMEB toolchains, above.
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
+	bool "Linaro AArch64 2015.08"
+	depends on BR2_aarch64
+	depends on BR2_HOSTARCH = "x86_64"
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	help
+	  Toolchain for the AArch64 architecture, from
+	  http://www.linaro.org/engineering/armv8/
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	bool "CodeSourcery AArch64 2014.05"
 	depends on BR2_aarch64
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 422cf21..2d41389 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -54,6 +54,7 @@ sha256 34812c5d0556db86259ac6eb3f8bcf4ce8eca3fa8d7180875958492a42e9853f  gcc-lin
 sha256 4bc9d86390f8fa67a693ba4768ba5b12faaf7dd37c706c05ccd9321e765226e4  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 sha256 24b86799a6c64380c740bf31a700b46e854fc0a821da2341e9868f0196c864de  gcc-linaro-5.1-2015.08-x86_64_armeb-linux-gnueabihf.tar.xz
 sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
+sha256 b9137008744d9009877f662dbac7481d673cdcb1798e727e325a37c98a0f63da  gcc-linaro-5.1-2015.08-x86_64_aarch64-linux-gnu.tar.xz
 
 # Synopsys DesignWare ARC toolchains
 sha256 1fa4ea2c8616623205f1c7beca02ea31b019099528a7433e5b020b0876b93bf3  arc_gnu_2014.12_prebuilt_uclibc_le_arc700_linux_install.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index c9405a4..0f818b4 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -385,8 +385,13 @@ TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2014R1-RC2.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64),y)
+ifeq ($(HOSTARCH),x86)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
+else
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/components/toolchain/binaries/5.1-2015.08/aarch64-linux-gnu
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-5.1-2015.08-x86_64_aarch64-linux-gnu.tar.xz
+endif
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/aarch64-linux-gnu
