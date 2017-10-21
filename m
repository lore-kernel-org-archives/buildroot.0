From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 21:37:10 +0200
Subject: [Buildroot] [git commit] raspberrypi: post-image.sh fix gpu_mem
	option
Message-ID: <20171021192949.D3E8681022@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0b055239e10898b87ff8af02f8c4bd14426e3e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gpu_mem option is not using the proper option argument which causes sed to
fail.

	+ case "${arg}" in
	+ gpu_mem=ome/gportay/output-rpi3-qtwe/images
	+ sed -e '/^ome/gportay/output-rpi3-qtwe/images=/s,=.*,=ome/gportay/output-rpi3-qtwe/images,' -i /home/gportay/output-rpi3-qtwe/images/rpi-firmware/config.txt
	sed: -e expression #1, char 8: extra characters after command
	+ case "${arg}" in
	+ gpu_mem=ome/gportay/output-rpi3-qtwe/images
	+ sed -e '/^ome/gportay/output-rpi3-qtwe/images=/s,=.*,=ome/gportay/output-rpi3-qtwe/images,' -i /home/gportay/output-rpi3-qtwe/images/rpi-firmware/config.txt
	sed: -e expression #1, char 8: extra characters after command

The issue comes from the use of $1 instead of $arg to extract the gpu_mem
value. $1 is the $(BINARIES_DIR) which leads to a sed expression error.

Also, it adds the error flag to the shell script to prevent from such situation
and terminate the build in error.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/raspberrypi/post-image.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index a2d6a98..3c6c938 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -1,5 +1,7 @@
 #!/bin/bash
 
+set -e
+
 BOARD_DIR="$(dirname $0)"
 BOARD_NAME="$(basename ${BOARD_DIR})"
 GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
@@ -40,7 +42,7 @@ __EOF__
 		;;
 		--gpu_mem_256=*|--gpu_mem_512=*|--gpu_mem_1024=*)
 		# Set GPU memory
-		gpu_mem="${1:2}"
+		gpu_mem="${arg:2}"
 		sed -e "/^${gpu_mem%=*}=/s,=.*,=${gpu_mem##*=}," -i "${BINARIES_DIR}/rpi-firmware/config.txt"
 		;;
 	esac
