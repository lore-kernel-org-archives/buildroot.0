From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 16:29:27 +0200
Subject: [Buildroot] [git commit]
 board/boundarydevices/common/post-image.sh: use genimage.sh
Message-ID: <20200329141749.5F33288E47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3eac848e87a7342b840ef8fe5b2e84e9c4314f11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- To avoid code duplication and to benefit from support script
improvements like empty target dir.
- Note that currently genimage.sh can't be set in defconfig directly for
i.MX8 targets as the POST_SCRIPT_ARGS is used by
imx8-bootloader-prepare.sh

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/boundarydevices/common/post-image.sh | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/board/boundarydevices/common/post-image.sh b/board/boundarydevices/common/post-image.sh
index 9cca1b1789..5c70d98e54 100755
--- a/board/boundarydevices/common/post-image.sh
+++ b/board/boundarydevices/common/post-image.sh
@@ -1,16 +1,5 @@
 #!/bin/sh
 
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage                           \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
+support/scripts/genimage.sh -c $(dirname $0)/genimage.cfg
 
 exit $?
