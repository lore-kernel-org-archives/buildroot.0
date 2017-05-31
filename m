From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 22:58:25 +0200
Subject: [Buildroot] [git commit branch/next] configs/lego_ev3: use genimage
	to rename uImage file
Message-ID: <20170531205846.80D217FA85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13a4d5e580f67b9ebda548b818dd6fea226851a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This uses a genimage feature to rename the uImage file instead
of manually creating a symlink in the post-image script.

Signed-off-by: David Lechner <david@lechnology.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
