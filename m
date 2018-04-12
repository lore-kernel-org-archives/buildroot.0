From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 22:28:25 +0200
Subject: [Buildroot] [git commit] board/freescale/common/imx: make
 post-image.sh arm64 compatible
Message-ID: <20180412202915.0384D88526@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4755bf2bd43a7b4c3bf4f88be790240a01b3116f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit makes the common post-image.sh script used by Freescale
platforms compatible with arm64:

 - Support having DTBs in sub-folders

 - Support a kernel image in the 'Image' format

Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/common/imx/post-image.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index b23974347b..70d2c9c600 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -7,10 +7,10 @@
 #
 dtb_list()
 {
-	local DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"
+	local DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([\/a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"
 
 	for dt in $DTB_LIST; do
-		echo -n "\"$dt.dtb\", "
+		echo -n "\"`basename $dt`.dtb\", "
 	done
 }
 
@@ -23,6 +23,8 @@ linux_image()
 {
 	if grep -Eq "^BR2_LINUX_KERNEL_UIMAGE=y$" ${BR2_CONFIG}; then
 		echo "\"uImage\""
+	elif grep -Eq "^BR2_LINUX_KERNEL_IMAGE=y$" ${BR2_CONFIG}; then
+		echo "\"Image\""
 	else
 		echo "\"zImage\""
 	fi
