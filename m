From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 09:18:27 +0200
Subject: [Buildroot] [git commit] toolchain/toolchain-external-andes-nds32:
 new package
Message-ID: <20190417074345.051DC8EF21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef058dcdb78185d132ae84de079c82cb2ce5d64f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a new package for the Andes external toolchain for
the nds32 Little Endian architecture.

https://github.com/vincentzwc/prebuilt-nds32-toolchain/releases/download/20180521/nds32le-linux-glibc-v3-upstream.tar.gz

Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
Signed-off-by: Greentime Hu <greentime@andestech.com>
Signed-off-by: Nylon Chen <nylon7@andestech.com>
[Thomas:
 - rename .mk and .hash files to carry the proper package name
 - fix <pkg>_SITE variable, which was incorrect
 - add prompt in Config.in
 - add missing include of Config.in in toolchain/toolchain-external/Config.in
 - add missing selects for RPC and SSP, since the toolchain supports
   both
 - drop BR2_TOOLCHAIN_EXTERNAL_URL option, the toolchain URL is
   provided by the .mk file]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                                   |  1 +
 toolchain/toolchain-external/Config.in                       |  6 ++++++
 .../toolchain-external-andes-nds32/Config.in                 | 12 ++++++++++++
 .../toolchain-external-andes-nds32/Config.in.options         |  9 +++++++++
 .../toolchain-external-andes-nds32.hash                      |  2 ++
 .../toolchain-external-andes-nds32.mk                        | 10 ++++++++++
 6 files changed, 40 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index db2c27c423..1dae65ed0a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1669,6 +1669,7 @@ F:	package/tcf-agent/
 
 N:	Nylon Chen <nylon7@andestech.com>
 F:	arch/Config.in.nds32
+F:	toolchain/toolchain-external/toolchain-external-andes-nds32/
 
 N:	Olaf Rempel <razzor@kopf-tisch.de>
 F:	package/ctorrent/
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 1f14f0350a..d234c1c552 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -23,6 +23,9 @@ source "toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config
 # ARC
 source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in"
 
+# Andes
+source "toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in"
+
 # ARM (use ARM toolchain by default)
 source "toolchain/toolchain-external/toolchain-external-arm-arm/Config.in"
 source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in"
@@ -124,6 +127,9 @@ source "toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config
 # ARC
 source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options"
 
+# Andes
+source "toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options"
+
 # ARM
 source "toolchain/toolchain-external/toolchain-external-arm-arm/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options"
diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
new file mode 100644
index 0000000000..e2fe63677d
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
@@ -0,0 +1,12 @@
+config BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32
+	bool "Andes nds32"
+	depends on BR2_nds32
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_TOOLCHAIN_HAS_SSP
+	help
+	  nds32 toolchain for the nds32 architecture. It uses GCC
+	  8.2.1, GDB 8.1.1, glibc 2.28, Binutils 2.30. It generates
+	  code that runs on ae3xx platform
diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options
new file mode 100644
index 0000000000..7d11ae2098
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options
@@ -0,0 +1,9 @@
+if BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	default "nds32le-linux"
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-andes-nds32"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.hash b/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.hash
new file mode 100644
index 0000000000..4314bb1f55
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.hash
@@ -0,0 +1,2 @@
+# From https://github.com/vincentzwc/prebuilt-nds32-toolchain/releases/download/20180521/nds32le-linux-glibc-v3-upstream.tar.gz
+sha256 6050601df85ad93a4c211c1d57ed3773edb62aa505f7e07d7d555652e83af2cc  nds32le-linux-glibc-v3-upstream.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.mk b/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.mk
new file mode 100644
index 0000000000..fa29490b4f
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# toolchain-external-andes-nds32
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_ANDES_NDS32_SITE = https://github.com/vincentzwc/prebuilt-nds32-toolchain/releases/download/20180521
+TOOLCHAIN_EXTERNAL_ANDES_NDS32_SOURCE = nds32le-linux-glibc-v3-upstream.tar.gz
+
+$(eval $(toolchain-external-package))
