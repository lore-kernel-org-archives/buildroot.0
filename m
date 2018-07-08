From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 8 Jul 2018 15:56:41 -0300
Subject: [Buildroot] [PATCH 2/3] imx/post-image: Allow flashing
 u-boot-dtb.imx in the SD card
In-Reply-To: <75a18624-33ef-7d5d-3542-2e3b7b75e5f6@mind.be>
References: <1530818671-20390-1-git-send-email-festevam@gmail.com>
 <1530818671-20390-2-git-send-email-festevam@gmail.com>
 <75a18624-33ef-7d5d-3542-2e3b7b75e5f6@mind.be>
Message-ID: <CAOMZO5BDTyZfo0s7ppN3CORQ-9ru1PtUaPTcK-RpgytGxO2ShA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Thu, Jul 5, 2018 at 6:57 PM, Arnout Vandecappelle <arnout@mind.be> wrote:

>  This file only differs from the normal template in the name of the u-boot
> binary, right? So wouldn't it make more sense to make that configurable, just
> like the %FILES%, and handle it in an extra sed line?

I am trying to implement your suggestion, but I think I need some help.

Here is what I have done so far:

diff --git a/board/freescale/common/imx/genimage.cfg.template
b/board/freescale/common/imx/genimage.cfg.template
index acce058..41584d9 100644
--- a/board/freescale/common/imx/genimage.cfg.template
+++ b/board/freescale/common/imx/genimage.cfg.template
@@ -22,7 +22,7 @@ image sdcard.img {

   partition u-boot {
     in-partition-table = "no"
-    image = "u-boot.imx"
+    image = %UBOOTBIN%
     offset = 1024
   }

diff --git a/board/freescale/common/imx/post-image.sh
b/board/freescale/common/imx/post-image.sh
index 264c8a4..2e57cef 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -41,8 +41,18 @@ genimage_type()
        fi
 }

+uboot_image()
+{
+       if grep -Eq "^BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y$" ${BR2_CONFIG}; then
+               echo "u-boot-dtb.imx"
+       elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_IMX=y$" ${BR2_CONFIG}; then
+               echo "u-boot.imx"
+       fi
+}
+
 main()
 {
+       local UBOOTBIN="$(uboot_image)"
        local FILES="$(dtb_list) $(linux_image)"
        local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
        local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
@@ -50,6 +60,9 @@ main()
        sed -e "s/%FILES%/${FILES}/" \
                board/freescale/common/imx/$(genimage_type) > ${GENIMAGE_CFG}

+       sed -e "s/%UBOOTBIN%/${UBOOTBIN}/" \
+               board/freescale/common/imx/$(genimage_type) > ${GENIMAGE_CFG}
+
        rm -rf "${GENIMAGE_TMP}"

        genimage \

but it does not work:

>>>   Executing post-image script board/freescale/common/imx/post-image.sh
file(%FILES%): stat(/home/fabio/buildroot/output/images/%FILES%)
failed: No such file or directory
vfat(boot.vfat): could not setup %FILES%

Could you please provide some suggestion?

Thanks
