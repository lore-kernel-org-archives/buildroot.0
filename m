From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Sat, 26 Oct 2019 14:41:18 +0000
Subject: [Buildroot] [PATCH 1/2] package/bmap-tools: new package
Message-ID: <20191026144101.30599-1-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
---
 DEVELOPERS                         |  3 +++
 package/Config.in                  |  1 +
 package/bmap-tools/Config.in       | 13 +++++++++++++
 package/bmap-tools/bmap-tools.hash |  2 ++
 package/bmap-tools/bmap-tools.mk   | 15 +++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/bmap-tools/Config.in
 create mode 100644 package/bmap-tools/bmap-tools.hash
 create mode 100644 package/bmap-tools/bmap-tools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b9e6881419..6fe457ac47 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1725,6 +1725,9 @@ F:	package/libevdev/
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
 F:	package/uacme/
 
+N:	Nicolas Carrier <nicolas.carrier@orolia.com>
+F:	package/bmap-tools/
+
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 F:	package/libgit2/
 
diff --git a/package/Config.in b/package/Config.in
index 901c25fe02..951342042a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -184,6 +184,7 @@ menu "Filesystem and flash utilities"
 	source "package/aufs/Config.in"
 	source "package/aufs-util/Config.in"
 	source "package/autofs/Config.in"
+	source "package/bmap-tools/Config.in"
 	source "package/btrfs-progs/Config.in"
 	source "package/cifs-utils/Config.in"
 	source "package/cpio/Config.in"
diff --git a/package/bmap-tools/Config.in b/package/bmap-tools/Config.in
new file mode 100644
index 0000000000..63301f2558
--- /dev/null
+++ b/package/bmap-tools/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_BMAP_TOOLS
+	bool "bmap-tools"
+	depends on BR2_PACKAGE_PYTHON3 || \
+		BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	help
+	  Tool to flash image files to block devices using the block map
+	  bmaptool is a generic tool for creating the block map (bmap)
+	  for a file, and copying files using the block map. The idea is
+	  that large file containing unused blocks, like raw system
+	  image files, can be copied or flashed a lot faster with
+	  bmaptool than with traditional tools like "dd" or "cp".
diff --git a/package/bmap-tools/bmap-tools.hash b/package/bmap-tools/bmap-tools.hash
new file mode 100644
index 0000000000..ad56b98c85
--- /dev/null
+++ b/package/bmap-tools/bmap-tools.hash
@@ -0,0 +1,2 @@
+sha256  d410e2d97192d0fc2f88ef160a0bb6ed83fce99da97a606d7f6890cc654ec594  bmap-tools-v3.5.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/bmap-tools/bmap-tools.mk b/package/bmap-tools/bmap-tools.mk
new file mode 100644
index 0000000000..c86f545ab0
--- /dev/null
+++ b/package/bmap-tools/bmap-tools.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# bmap-tools
+#
+################################################################################
+
+BMAP_TOOLS_VERSION = v3.5
+BMAP_TOOLS_SITE = $(call github,intel,bmap-tools,$(BMAP_TOOLS_VERSION))
+BMAP_TOOLS_LICENSE = GPLv2
+BMAP_TOOLS_LICENSE_FILES = COPYING
+BMAP_TOOLS_SETUP_TYPE = setuptools
+BMAP_TOOLS_DEPENDENCIES = \
+	python-setuptools
+
+$(eval $(python-package))
-- 
2.20.1
