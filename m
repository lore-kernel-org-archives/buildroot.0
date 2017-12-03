From: Dagg Stompler <daggs@gmx.com>
Date: Sun,  3 Dec 2017 14:56:17 +0200
Subject: [Buildroot] [PATCH 6/8] odoridc2: add mainline post image script.
In-Reply-To: <20171203125619.30919-1-daggs@gmx.com>
References: <20171203125619.30919-1-daggs@gmx.com>
Message-ID: <20171203125619.30919-6-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the mainline image doesn't have the signed firmwarfe bundled in the
uboot images.
to address this issue, the needed files are required to be retrieved
from the vendor's site, prepared and embbeded into the final image.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 board/hardkernel/odroidc2/post-image-mailine.sh | 40 +++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100755 board/hardkernel/odroidc2/post-image-mailine.sh

diff --git a/board/hardkernel/odroidc2/post-image-mailine.sh b/board/hardkernel/odroidc2/post-image-mailine.sh
new file mode 100755
index 0000000000..42e3c324b6
--- /dev/null
+++ b/board/hardkernel/odroidc2/post-image-mailine.sh
@@ -0,0 +1,40 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage-mainline.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+WORK_DIR="${BUILD_DIR}/hk-uboot-signing"
+FINAL_IMG_PATH="${BINARIES_DIR}/sdcard.img"
+SIGNED_UBOOT_IMG="${BINARIES_DIR}/uboot-odc2.img"
+SIGNED_FILES_URL="https://github.com/hardkernel/u-boot/archive/odroidc2-v2015.01.tar.gz"
+SIGNED_FILES_PATH_PREFIX="$(basename $(echo ${SIGNED_FILES_URL} | sed 's/\.tar.*$//g'))"
+
+rm -rf "${WORK_DIR}" "${GENIMAGE_TMP}"
+
+echo "Retrieving vendor files for signing"
+mkdir -p ${WORK_DIR}
+wget -qO- ${SIGNED_FILES_URL} | tar -C ${WORK_DIR} --strip-components=1 -zxf - u-boot-${SIGNED_FILES_PATH_PREFIX}/{tools/fip_create,fip/gxb,sd_fuse/bl1.bin.hardkernel} 
+
+echo "Building nessesary tools"
+CC="${HOSTCC}" make -C ${WORK_DIR}/tools/fip_create
+
+echo "Prepering files"
+${WORK_DIR}/tools/fip_create/fip_create --bl30 ${WORK_DIR}/fip/gxb/bl30.bin --bl301 ${WORK_DIR}/fip/gxb/bl301.bin --bl31 ${WORK_DIR}/fip/gxb/bl31.bin --bl33 ${BINARIES_DIR}/u-boot.bin ${WORK_DIR}/fip.bin
+${WORK_DIR}/tools/fip_create/fip_create --dump ${WORK_DIR}/fip.bin
+cat ${WORK_DIR}/fip/gxb/bl2.package ${WORK_DIR}/fip.bin > ${WORK_DIR}/boot_new.bin
+${HOST_DIR}/bin/amlbootsig ${WORK_DIR}/boot_new.bin ${WORK_DIR}/u-boot.img
+cp ${WORK_DIR}/sd_fuse/bl1.bin.hardkernel ${BINARIES_DIR} 
+
+echo "Genrating new uboot img file"
+dd if=${WORK_DIR}/u-boot.img of=${SIGNED_UBOOT_IMG} bs=512 skip=96
+
+genimage                           \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+echo "Signing image"
+dd if=${BINARIES_DIR}/bl1.bin.hardkernel of=${FINAL_IMG_PATH} conv=fsync,notrunc bs=1 count=442
+dd if=${BINARIES_DIR}/bl1.bin.hardkernel of=${FINAL_IMG_PATH} conv=fsync,notrunc bs=512 skip=1 seek=1
-- 
2.15.1
