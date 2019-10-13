From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 12 Oct 2019 21:22:30 -0300
Subject: [Buildroot] [PATCH 7/9] board/raspberrypi/post-image.sh: pass an
 empty rootpath to genimage
In-Reply-To: <20191013002232.1045-1-unixmania@gmail.com>
References: <20191013002232.1045-1-unixmania@gmail.com>
Message-ID: <20191013002232.1045-8-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

genimage makes a full copy of the given rootpath to ${GENIMAGE_TMP}/root
so passing TARGET_DIR would be a waste of time and disk space. We don't
rely on genimage to build the rootfs image, just to insert a pre-built
one in the disk image.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
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
-- 
2.18.1
