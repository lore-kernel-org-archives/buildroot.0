From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Thu, 12 Apr 2018 14:35:23 +0200
Subject: [Buildroot] [PATCH 2/4] imx: make post-image.sh arm64 compatible
In-Reply-To: <1523536525-10280-1-git-send-email-karl.erik.larsson@gmail.com>
References: <1523536525-10280-1-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <1523536525-10280-2-git-send-email-karl.erik.larsson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
---
 board/freescale/common/imx/post-image.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index b239743..70d2c9c 100755
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
-- 
2.7.4
