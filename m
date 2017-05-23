From: David Lechner <david@lechnology.com>
Date: Tue, 23 May 2017 13:04:05 -0500
Subject: [Buildroot] [PATCH 2/3] lego: ev3: Use genimage to rename uImage
	file
In-Reply-To: <1495562646-4410-1-git-send-email-david@lechnology.com>
References: <1495562646-4410-1-git-send-email-david@lechnology.com>
Message-ID: <1495562646-4410-3-git-send-email-david@lechnology.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This uses a genimage feature to rename the uImage file instead
of manually creating a symlink in the post-image script.

Signed-off-by: David Lechner <david@lechnology.com>
---
 board/lego/ev3/genimage.cfg  | 4 ++--
 board/lego/ev3/post-image.sh | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/board/lego/ev3/genimage.cfg b/board/lego/ev3/genimage.cfg
index 3568295..0ec580c 100644
--- a/board/lego/ev3/genimage.cfg
+++ b/board/lego/ev3/genimage.cfg
@@ -34,8 +34,8 @@ image flash.bin {
 
 image boot.vfat {
 	vfat {
-		files = {
-			"uImage"
+		file uImage {
+			image = "uImage.da850-lego-ev3"
 		}
 	}
 	size = 16M
diff --git a/board/lego/ev3/post-image.sh b/board/lego/ev3/post-image.sh
index 553d27a..81626dc 100755
--- a/board/lego/ev3/post-image.sh
+++ b/board/lego/ev3/post-image.sh
@@ -4,8 +4,6 @@ BOARD_DIR="$(dirname $0)"
 GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
-ln -sf "uImage.da850-lego-ev3" "${BINARIES_DIR}/uImage"
-
 rm -rf "${GENIMAGE_TMP}"
 
 genimage \
-- 
2.7.4
