From: Lothar Felten <lothar.felten@gmail.com>
Date: Fri, 11 Aug 2017 13:16:13 +0200
Subject: [Buildroot] [PATCH 1/1] board/beaglebone: skip bonegreen.dtb if not
	built
Message-ID: <1502450173-3058-1-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The beaglebone_qt5_defconfig does not provide a dtb for the beaglebone green.
This patch removes the am335x-bonegreen.dtb from the genimage config if it was
not built.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 board/beaglebone/post-image.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/board/beaglebone/post-image.sh b/board/beaglebone/post-image.sh
index f0c2bc7..ed99379 100755
--- a/board/beaglebone/post-image.sh
+++ b/board/beaglebone/post-image.sh
@@ -8,6 +8,14 @@ BOARD_DIR="$(dirname $0)"
 # copy the uEnv.txt to the output/images directory
 cp board/beaglebone/uEnv.txt $BINARIES_DIR/uEnv.txt
 
+#the 4.1 kernel does not provide a dtb for beaglebone green
+#remove it from the genimage config if am335x-bonegreen.dtb is not built:
+if [[ ! -e ${BINARIES_DIR}/am335x-bonegreen.dtb ]]
+then
+	sed -i '/am335x-bonegreen.dtb/d' ${BOARD_DIR}/genimage.cfg
+	echo "removed am335x-bonegreen.dtb from genimage.cfg"
+fi
+
 GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
-- 
1.9.1
