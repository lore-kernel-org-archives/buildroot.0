From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  7 Jun 2021 22:42:16 +0200
Subject: [Buildroot] [PATCH v5 1/5] package/bmap-tools: new package
In-Reply-To: <20210607204221.124908-1-thomas.petazzoni@bootlin.com>
References: <20210607204221.124908-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210607204221.124908-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Nicolas Carrier <nicolas.carrier@orolia.com>

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
[Thomas: numerous reworks, add myself in DEVELOPERS]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  2 ++
 package/Config.in                  |  1 +
 package/bmap-tools/Config.in       | 44 ++++++++++++++++++++++++++++++
 package/bmap-tools/bmap-tools.hash |  3 ++
 package/bmap-tools/bmap-tools.mk   | 13 +++++++++
 5 files changed, 63 insertions(+)
 create mode 100644 package/bmap-tools/Config.in
 create mode 100644 package/bmap-tools/bmap-tools.hash
 create mode 100644 package/bmap-tools/bmap-tools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0ab898d94d..973aab8824 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1976,6 +1976,7 @@ F:	board/intel/galileo/
 F:	configs/galileo_defconfig
 
 N:	Nicolas Carrier <nicolas.carrier@orolia.com>
+F:	package/bmap-tools/
 F:	package/php-xdebug/
 
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
@@ -2626,6 +2627,7 @@ F:	configs/stm32mp157c_dk2_defconfig
 F:	package/android-tools/
 F:	package/b43-firmware/
 F:	package/b43-fwcutter/
+F:	package/bmap-tools/
 F:	package/c-periphery/
 F:	package/cdrkit/
 F:	package/cifs-utils/
diff --git a/package/Config.in b/package/Config.in
index e42f579494..1fc68c7a06 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -196,6 +196,7 @@ menu "Filesystem and flash utilities"
 	source "package/aufs/Config.in"
 	source "package/aufs-util/Config.in"
 	source "package/autofs/Config.in"
+	source "package/bmap-tools/Config.in"
 	source "package/btrfs-progs/Config.in"
 	source "package/cifs-utils/Config.in"
 	source "package/cpio/Config.in"
diff --git a/package/bmap-tools/Config.in b/package/bmap-tools/Config.in
new file mode 100644
index 0000000000..83b4d92786
--- /dev/null
+++ b/package/bmap-tools/Config.in
@@ -0,0 +1,44 @@
+config BR2_PACKAGE_BMAP_TOOLS
+	bool "bmap-tools"
+	depends on BR2_PACKAGE_PYTHON3 || BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime, pkg_resources
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  Tool to flash image files to block devices using the block map
+	  bmaptool is a generic tool for creating the block map (bmap)
+	  for a file, and copying files using the block map. The idea is
+	  that large file containing unused blocks, like raw system
+	  image files, can be copied or flashed a lot faster with
+	  bmaptool than with traditional tools like "dd" or "cp".
+
+	  Relevant optional dependencies:
+
+	  - Busybox compiled with CONFIG_BZIP2, or BR2_PACKAGE_BZIP2,
+	    to support bz2 compressed images
+
+	  - BR2_PACKAGE_PIGZ for optimized gzip decompression
+
+	  - Busybox compiled with CONFIG_LZOP, or BR2_PACKAGE_LZOP, to
+	    support lzo compressed images.
+
+	  - BR2_PACKAGE_ZIP to support zip compressed images
+
+	  - BR2_PACKAGE_LZ4 to support lz4 compressed images
+
+	  - BR2_PACKAGE_ZSTD to support zstd compressed images
+
+	  - Busybox compiled CONFIG_FEATURE_SEAMLESS_* or
+	    BR2_PACKAGE_TAR to support tar compressed images
+
+	  - BR2_PACKAGE_OPENSSH to retrieve images over SSH.
+
+	  - BR2_PACKAGE_SSHPASS to retrieve images over SSH if
+	    password authentication is used.
+
+	  Image signature verification is not supported as
+	  python-gpgme is not available. Optimized bzip2 decompression
+	  is not supported as pbzip2 is not available.
+
+	  https://github.com/intel/bmap-tools
diff --git a/package/bmap-tools/bmap-tools.hash b/package/bmap-tools/bmap-tools.hash
new file mode 100644
index 0000000000..82a570ecac
--- /dev/null
+++ b/package/bmap-tools/bmap-tools.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  0658afb972e7221aa16fece3f84e29e5102e901c929253d7fb6040bde28243f7  bmap-tools-3.6.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/bmap-tools/bmap-tools.mk b/package/bmap-tools/bmap-tools.mk
new file mode 100644
index 0000000000..c8b41c225f
--- /dev/null
+++ b/package/bmap-tools/bmap-tools.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# bmap-tools
+#
+################################################################################
+
+BMAP_TOOLS_VERSION = 3.6
+BMAP_TOOLS_SITE = $(call github,intel,bmap-tools,v$(BMAP_TOOLS_VERSION))
+BMAP_TOOLS_LICENSE = GPL-2.0
+BMAP_TOOLS_LICENSE_FILES = COPYING
+BMAP_TOOLS_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.31.1
