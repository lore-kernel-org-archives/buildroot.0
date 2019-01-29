From: Robert J. Heywood <robert.heywood@codethink.co.uk>
Date: Tue, 29 Jan 2019 13:23:03 +0000
Subject: [Buildroot] [PATCH 2/8] board/raspberrypi: post-image --overlays
 option.
In-Reply-To: <20190129132309.3455-1-robert.heywood@codethink.co.uk>
References: <20190129132309.3455-1-robert.heywood@codethink.co.uk>
Message-ID: <20190129132309.3455-3-robert.heywood@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pull the device tree overlays into the boot partition if the
--overlays option is set.
In addition, --add-pi3-miniuart-bt-overlay now implies --overlays.

Since the board conf files no longer need to explicitly declare
the overlays, the line including the overlays were removed from
raspberrypi0w.conf and raspberrypi3.conf

Signed-off-by: Robert J. Heywood <robert.heywood@codethink.co.uk>
---
 board/raspberrypi/post-image.sh      | 9 +++++++++
 board/raspberrypi/raspberrypi0w.conf | 1 -
 board/raspberrypi/raspberrypi3.conf  | 1 -
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index 4042c5e9ac..5cc25a9ac6 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -6,6 +6,7 @@ BOARD_DIR="$(dirname $0)"
 BOARD_NAME="$(basename ${BOARD_DIR})"
 GENIMAGE_CFG="${BOARD_DIR}/genimage-raspberrypi-generic.cfg"
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+INCLUDE_OVERLAYS=false
 
 if [ -e ${BOARD_DIR}/${BOARD_NAME}.conf ]
 then
@@ -23,8 +24,12 @@ do
 # fixes rpi3 ttyAMA0 serial console
 dtoverlay=pi3-miniuart-bt
 __EOF__
+			INCLUDE_OVERLAYS=true
 		fi
 		;;
+		--overlays)
+			INCLUDE_OVERLAYS=true
+		;;
 		--aarch64)
 		# Run a 64bits kernel (armv8)
 		sed -e '/^kernel=/s,=.*,=Image,' -i "${BINARIES_DIR}/rpi-firmware/config.txt"
@@ -54,6 +59,10 @@ __EOF__
 
 done
 
+if $INCLUDE_OVERLAYS; then
+	FILES+=( "rpi-firmware/overlays" )
+fi
+
 for i in ${!FILES[*]}
 do
 	FILES[$i]="\"${FILES[$i]}\","
diff --git a/board/raspberrypi/raspberrypi0w.conf b/board/raspberrypi/raspberrypi0w.conf
index 1ae60ed8fb..27b4ec2399 100644
--- a/board/raspberrypi/raspberrypi0w.conf
+++ b/board/raspberrypi/raspberrypi0w.conf
@@ -1,5 +1,4 @@
 FILES=(
 	"bcm2708-rpi-0-w.dtb"
-	"rpi-firmware/overlays"
 	"zImage"
 )
diff --git a/board/raspberrypi/raspberrypi3.conf b/board/raspberrypi/raspberrypi3.conf
index b3c5466fc2..51df913860 100644
--- a/board/raspberrypi/raspberrypi3.conf
+++ b/board/raspberrypi/raspberrypi3.conf
@@ -2,6 +2,5 @@ FILES=(
 	"bcm2710-rpi-3-b.dtb"
 	"bcm2710-rpi-3-b-plus.dtb"
 	"bcm2710-rpi-cm3.dtb"
-	"rpi-firmware/overlays"
 	"zImage"
 )
-- 
2.11.0
