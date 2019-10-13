From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 12 Oct 2019 21:22:24 -0300
Subject: [Buildroot] [PATCH 1/9] support/scripts/genimage.sh: pass an empty
 rootpath to genimage
In-Reply-To: <20191013002232.1045-1-unixmania@gmail.com>
References: <20191013002232.1045-1-unixmania@gmail.com>
Message-ID: <20191013002232.1045-2-unixmania@gmail.com>
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
 support/scripts/genimage.sh | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
index 039b3fef1d..2796e19eb7 100755
--- a/support/scripts/genimage.sh
+++ b/support/scripts/genimage.sh
@@ -30,10 +30,18 @@ done
 
 [ -n "${GENIMAGE_CFG}" ] || die "Missing argument"
 
+# Pass an empty rootpath. genimage makes a full copy of the given rootpath to
+# ${GENIMAGE_TMP}/root so passing TARGET_DIR would be a waste of time and disk
+# space. We don't rely on genimage to build the rootfs image, just to insert a
+# pre-built one in the disk image.
+
+trap 'rm -rf "${ROOTPATH_TMP}"' EXIT
+ROOTPATH_TMP="$(mktemp -d)"
+
 rm -rf "${GENIMAGE_TMP}"
 
 genimage \
-	--rootpath "${TARGET_DIR}"     \
+	--rootpath "${ROOTPATH_TMP}"     \
 	--tmppath "${GENIMAGE_TMP}"    \
 	--inputpath "${BINARIES_DIR}"  \
 	--outputpath "${BINARIES_DIR}" \
-- 
2.18.1
