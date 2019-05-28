From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 May 2019 22:34:14 +0200
Subject: [Buildroot] [PATCH v2 4/6]
 toolchain/toolchain-external/toolchain-external-csky: new package
In-Reply-To: <20190528203416.32261-1-thomas.petazzoni@bootlin.com>
References: <20190528203416.32261-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190528203416.32261-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the csky_gx6605s_defconfig uses a custom pre-built external
C-SKY toolchain. Rather than using it just for a defconfig, let's
create a proper package for this toolchain, which will make it easier
to use.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Guo: I've list you as the developer in charge of this package in the
DEVELOPERS, please let me know if this is OK for you (or not). Thanks!
---
 DEVELOPERS                                        |  1 +
 toolchain/toolchain-external/Config.in            |  6 ++++++
 .../toolchain-external-csky/Config.in             | 15 +++++++++++++++
 .../toolchain-external-csky/Config.in.options     |  9 +++++++++
 .../toolchain-external-csky.hash                  |  2 ++
 .../toolchain-external-csky.mk                    | 11 +++++++++++
 6 files changed, 44 insertions(+)
 create mode 100644 toolchain/toolchain-external/toolchain-external-csky/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-csky/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-csky/toolchain-external-csky.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-csky/toolchain-external-csky.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 66dc2504ff..c3dce03f53 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -977,6 +977,7 @@ N:	Guo Ren <ren_guo@c-sky.com>
 F:	arch/Config.in.csky
 F:	board/csky/
 F:	configs/csky_*
+F:	toolchain/toolchain-external/toolchain-external-csky/
 
 N:	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
 F:	configs/arm_juno_defconfig
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index d234c1c552..76c127aa4a 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -34,6 +34,9 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.
 # ARM big-endian
 source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in"
 
+# C-SKY
+source "toolchain/toolchain-external/toolchain-external-csky/Config.in"
+
 # MIPS (use codesourcery toolchain by default)
 source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in"
 source "toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in"
@@ -138,6 +141,9 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.
 # ARM big-endian
 source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options"
 
+# C-SKY
+source "toolchain/toolchain-external/toolchain-external-csky/Config.in.options"
+
 # MIPS
 source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options"
diff --git a/toolchain/toolchain-external/toolchain-external-csky/Config.in b/toolchain/toolchain-external/toolchain-external-csky/Config.in
new file mode 100644
index 0000000000..6ad27d5dd9
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-csky/Config.in
@@ -0,0 +1,15 @@
+config BR2_TOOLCHAIN_EXTERNAL_CSKY
+	bool "C-SKY 2018.01.28"
+	depends on BR2_csky
+	depends on BR2_HOSTARCH = "x86_64"
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
+	help
+	  C-SKY glibc toolchain.
+
+	  https://github.com/c-sky/tools/
diff --git a/toolchain/toolchain-external/toolchain-external-csky/Config.in.options b/toolchain/toolchain-external/toolchain-external-csky/Config.in.options
new file mode 100644
index 0000000000..e77dd0a195
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-csky/Config.in.options
@@ -0,0 +1,9 @@
+if BR2_TOOLCHAIN_EXTERNAL_CSKY
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	default "csky-linux"
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-csky"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-csky/toolchain-external-csky.hash b/toolchain/toolchain-external/toolchain-external-csky/toolchain-external-csky.hash
new file mode 100644
index 0000000000..4c97a90eb8
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-csky/toolchain-external-csky.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 39317f9bea5aa92d6e09269cc5ce00a93914ab7060a498e0be9feee3c0d56e9c csky-linux-tools-x86_64-glibc-linux-4.9.56-20180128.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external-csky/toolchain-external-csky.mk b/toolchain/toolchain-external/toolchain-external-csky/toolchain-external-csky.mk
new file mode 100644
index 0000000000..2f5c26c00a
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-csky/toolchain-external-csky.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# toolchain-external-csky
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_CSKY_VERSION = 20180128
+TOOLCHAIN_EXTERNAL_CSKY_SITE = https://github.com/c-sky/tools/raw/master
+TOOLCHAIN_EXTERNAL_CSKY_SOURCE = csky-linux-tools-x86_64-glibc-linux-4.9.56-$(TOOLCHAIN_EXTERNAL_CSKY_VERSION).tar.gz
+
+$(eval $(toolchain-external-package))
-- 
2.21.0
