From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Aug 2017 22:36:39 +0200
Subject: [Buildroot] [git commit] board/beaglebone: skip bonegreen.dtb if
	not built
Message-ID: <20170811204306.09F4480131@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f121eeb645d131efc2128917bed391250296c57f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The beaglebone_qt5_defconfig uses an older kernel version which does not
provide a device tree for the beagle bone green.
post-image.sh now selects genimage_linux41.cfg if am335x-bonegreen.dtb is
not build and genimage.cfg otherwise.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
[Thomas: minor tweaks.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/beaglebone/genimage_linux41.cfg | 32 ++++++++++++++++++++++++++++++++
 board/beaglebone/post-image.sh        | 10 +++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/board/beaglebone/genimage_linux41.cfg b/board/beaglebone/genimage_linux41.cfg
new file mode 100644
index 0000000..ba60297
--- /dev/null
+++ b/board/beaglebone/genimage_linux41.cfg
@@ -0,0 +1,32 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"MLO",
+			"u-boot.img",
+			"zImage",
+			"uEnv.txt",
+			"am335x-evm.dtb",
+			"am335x-evmsk.dtb",
+			"am335x-bone.dtb",
+			"am335x-boneblack.dtb",
+		}
+	}
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		partition-type = 0xC
+		bootable = "true"
+                image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/beaglebone/post-image.sh b/board/beaglebone/post-image.sh
index f0c2bc7..68fe089 100755
--- a/board/beaglebone/post-image.sh
+++ b/board/beaglebone/post-image.sh
@@ -8,7 +8,15 @@ BOARD_DIR="$(dirname $0)"
 # copy the uEnv.txt to the output/images directory
 cp board/beaglebone/uEnv.txt $BINARIES_DIR/uEnv.txt
 
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+# the 4.1 kernel does not provide a dtb for beaglebone green, so we
+# use a different genimage config if am335x-bonegreen.dtb is not
+# built:
+if [ -e ${BINARIES_DIR}/am335x-bonegreen.dtb ] ; then
+	GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+else
+	GENIMAGE_CFG="${BOARD_DIR}/genimage_linux41.cfg"
+fi
+
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
 rm -rf "${GENIMAGE_TMP}"
