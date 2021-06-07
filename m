From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  7 Jun 2021 22:42:17 +0200
Subject: [Buildroot] [PATCH v5 2/5] package/bmap-tools: enable host package
In-Reply-To: <20210607204221.124908-1-thomas.petazzoni@bootlin.com>
References: <20210607204221.124908-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210607204221.124908-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bmaptool allows to drastically reduce the amount of data to transfer
when writing to an SD card. Example with a 544 MiB sdcard.img:

$ bmaptool create sdcard.img > sdcard.bmap
$ gzip sdcard.img
$ bmaptool copy sdcard.img.gz /dev/sdc
bmaptool: info: discovered bmap file 'sdcard.bmap'
bmaptool: info: block map format version 2.0
bmaptool: info: 139265 blocks of size 4096 (544.0 MiB), mapped 23918 blocks (93.4 MiB or 17.2%)
bmaptool: info: copying image 'sdcard.img.gz' to block device '/dev/sdc' using bmap file 'sdcard.bmap'
bmaptool: info: 100% copied
bmaptool: info: synchronizing '/dev/sdc'
bmaptool: info: copying time: 7.7s, copying speed 12.1 MiB/sec

So it means that instead of writing 544 MiB, only 93.4 MiB had to be
written.

In terms of implementation details, compared to the target bmap-tools
package, there are fewer "selects" that are needed because:

 - The dependency on setuptools is not needed, because the package
   uses the setuptools SETUP_TYPE, so host-python-setuptools is
   already a build dependency.

 - host-python and host-python3 are always built with Expat XML
   support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in.host            |  1 +
 package/bmap-tools/Config.in.host | 12 ++++++++++++
 package/bmap-tools/bmap-tools.mk  |  1 +
 3 files changed, 14 insertions(+)
 create mode 100644 package/bmap-tools/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 064c98af3d..8d443ea255 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -5,6 +5,7 @@ menu "Host utilities"
 	source "package/android-tools/Config.in.host"
 	source "package/asn1c/Config.in.host"
 	source "package/babeltrace2/Config.in.host"
+	source "package/bmap-tools/Config.in.host"
 	source "package/btrfs-progs/Config.in.host"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
diff --git a/package/bmap-tools/Config.in.host b/package/bmap-tools/Config.in.host
new file mode 100644
index 0000000000..a20829030d
--- /dev/null
+++ b/package/bmap-tools/Config.in.host
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOST_BMAP_TOOLS
+	bool "host bmap-tools"
+	select BR2_PACKAGE_HOST_PYTHON_SIX # runtime
+	help
+	  Tool to flash image files to block devices using the block map
+	  bmaptool is a generic tool for creating the block map (bmap)
+	  for a file, and copying files using the block map. The idea is
+	  that large file containing unused blocks, like raw system
+	  image files, can be copied or flashed a lot faster with
+	  bmaptool than with traditional tools like "dd" or "cp".
+
+	  https://github.com/intel/bmap-tools
diff --git a/package/bmap-tools/bmap-tools.mk b/package/bmap-tools/bmap-tools.mk
index c8b41c225f..32399ca151 100644
--- a/package/bmap-tools/bmap-tools.mk
+++ b/package/bmap-tools/bmap-tools.mk
@@ -11,3 +11,4 @@ BMAP_TOOLS_LICENSE_FILES = COPYING
 BMAP_TOOLS_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.31.1
