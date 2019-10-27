From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 12:21:43 +0100
Subject: [Buildroot] [git commit] board/raspberrypi/post-image.sh: pass an
 empty rootpath to genimage
Message-ID: <20191027111554.265F0814A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee47fea5781ab0ee1fa2d95a75ac020a2b38676b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

genimage makes a full copy of the given rootpath to ${GENIMAGE_TMP}/root
so passing TARGET_DIR would be a waste of time and disk space. We don't
rely on genimage to build the rootfs image, just to insert a pre-built
one in the disk image.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/raspberrypi/post-image.sh | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index 70447cd48b..bf9af5dc60 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -49,10 +49,18 @@ __EOF__
 
 done
 
+# Pass an empty rootpath. genimage makes a full copy of the given rootpath to
+# ${GENIMAGE_TMP}/root so passing TARGET_DIR would be a waste of time and disk
+# space. We don't rely on genimage to build the rootfs image, just to insert a
+# pre-built one in the disk image.
+
+trap 'rm -rf "${ROOTPATH_TMP}"' EXIT
+ROOTPATH_TMP="$(mktemp -d)"
+
 rm -rf "${GENIMAGE_TMP}"
 
-genimage                           \
-	--rootpath "${TARGET_DIR}"     \
+genimage \
+	--rootpath "${ROOTPATH_TMP}"   \
 	--tmppath "${GENIMAGE_TMP}"    \
 	--inputpath "${BINARIES_DIR}"  \
 	--outputpath "${BINARIES_DIR}" \
