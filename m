From: Xavier Roumegue <xroumegue@gmail.com>
Date: Wed, 25 Nov 2020 19:30:15 +0100
Subject: [Buildroot] [PATCH v4 6/8] board/freescale/common/imx8: Use post
 build generated uboot image if present
In-Reply-To: <20201109142309.1135596-2-xroumegue@gmail.com>
References: <20201109142309.1135596-2-xroumegue@gmail.com>
Message-ID: <20201125183017.15585-7-xroumegue@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stick the uboot image filename to "imx8-boot-sd.bin" in case the
final uboot image, embedding fw files, is generated thanks to a post
build script.

This takes precedence over all uboot images generating during uboot
build.

This should help to remove the dedicated imx8 config template file

Signed-off-by: Xavier Roumegue <xroumegue@gmail.com>
---
 board/freescale/common/imx/post-image.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index 1cca1849be..7916b8dae6 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -66,7 +66,9 @@ imx_offset()
 
 uboot_image()
 {
-	if grep -Eq "^BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y$" ${BR2_CONFIG}; then
+	if [ -e "${BINARIES_DIR}"/imx8-boot-sd.bin ]; then
+		echo "imx8-boot-sd.bin"
+	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y$" ${BR2_CONFIG}; then
 		echo "u-boot-dtb.imx"
 	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_IMX=y$" ${BR2_CONFIG}; then
 		echo "u-boot.imx"
-- 
2.29.2
