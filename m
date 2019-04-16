From: Nylon Chen <nylon7@andestech.com>
Date: Tue, 16 Apr 2019 15:25:44 +0800
Subject: [Buildroot] [PATCH v5 3/4] toolchain-external-andes-nds32: new
 package
In-Reply-To: <20190416072545.17633-1-nylon7@andestech.com>
References: <20190416072545.17633-1-nylon7@andestech.com>
Message-ID: <20190416072545.17633-4-nylon7@andestech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a new package for the Andes external toolchain for
the nds32 Little Endian architecture.

https://github.com/vincentzwc/prebuilt-nds32-toolchain/releases/download/20180521/nds32le-linux-glibc-v3-upstream.tar.gz

Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
Signed-off-by: Greentime Hu <greentime@andestech.com>
Signed-off-by: Nylon Chen <nylon7@andestech.com>
---
 DEVELOPERS                                         |  1 +
 toolchain/toolchain-external/Config.in             |  3 +++
 .../toolchain-external-andes-nds32/Config.in       |  9 +++++++++
 .../Config.in.options                              | 14 ++++++++++++++
 .../toolchain-external-andes-nds.hash              |  2 ++
 .../toolchain-external-andes-nds.mk                | 10 ++++++++++
 6 files changed, 39 insertions(+)
 create mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f053a34922..0bb3ad128e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1669,6 +1669,7 @@ N:	Nylon Chen <nylon7@andestech.com>
 F:	arch/Config.in.nds32
 F:	board/andes
 F:	configs/andes_ae3xx_defconfig
+F:	toolchain/toolchain-external/toolchain-external-andes-nds32/
 
 N:	Olaf Rempel <razzor@kopf-tisch.de>
 F:	package/ctorrent/
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 1f14f0350a..5135168890 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -124,6 +124,9 @@ source "toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config
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
index 0000000000..af57d6cd06
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
@@ -0,0 +1,9 @@
+config BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32
+	depends on BR2_nds32
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
+	help
+	  nds32 toolchain for the nds32 architecture. It uses GCC 8.2.1,
+	  GDB 8.1.1, glibc 2.28, Binutils 2.30. It generates code that
+	  runs on ae3xx platform
diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options
new file mode 100644
index 0000000000..3632e59564
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options
@@ -0,0 +1,14 @@
+if BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	default "nds32le-linux"
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-andes-nds32"
+
+config BR2_TOOLCHAIN_EXTERNAL_URL
+	string "Toolchain URL"
+	depends on BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
+	help
+	  URL of the custom toolchain tarball to download and install.
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds.hash b/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds.hash
new file mode 100644
index 0000000000..4314bb1f55
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds.hash
@@ -0,0 +1,2 @@
+# From https://github.com/vincentzwc/prebuilt-nds32-toolchain/releases/download/20180521/nds32le-linux-glibc-v3-upstream.tar.gz
+sha256 6050601df85ad93a4c211c1d57ed3773edb62aa505f7e07d7d555652e83af2cc  nds32le-linux-glibc-v3-upstream.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds.mk b/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds.mk
new file mode 100644
index 0000000000..c0df49e716
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# toolchain-external-andes-nds32
+#
+################################################################################
+TOOLCHAIN_EXTERNAL_ANDES_NDS32_SITE = https://github.com/vincentzwc/prebuilt-nds32-toolchain/releases/download/20180521/$(TOOLCHAIN_EXTERNAL_ANDES_NDS32_SOURCE)
+TOOLCHAIN_EXTERNAL_ANDES_NDS32_SOURCE = nds32le-linux-glibc-v3-upstream.tar.gz
+
+$(eval $(toolchain-external-package))
+
-- 
2.18.0
