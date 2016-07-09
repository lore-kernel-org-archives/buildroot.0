From: Georges Savoundararadj <savoundg@gmail.com>
Date: Fri,  8 Jul 2016 23:39:59 -0700
Subject: [Buildroot] [PATCH 0/5] freescale: Factorize SD card generation
	scripts
Message-ID: <20160709064004.8844-1-savoundg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

At the beginning, I wanted to use the script board/freescale/create-boot-sd.sh
to create an SD card for the imx6sololitevk board. I noticed that script was
not working with sfdisk (>=2.26). I sent a patch to fix it but Thomas Petazzoni
suggested me to use genimage.

I noticed the boards imx6ulevk, imx6sabresd, mx25pdk, mx51evk, mx53loco were
using the same genimage.cfg except for the name of the .dtb blobs.  Therefore,
I created a common genimage template configuration genimage.cfg.template that
is used to create "on-the-fly" a genimage.cfg with the right .dtb file names.
Indeed, I added a common post-image.sh script that is able to guess from
${BR_CONFIG} what files should be copied.

Then, I noticed the boards imx6dlsabreauto, imx6dlsabresd, imx6qsabreauto,
imx6qsabresd, imx6sxsabresd were all using the script
board/freescale/create-boot-sd.sh which does not work with sfdisk (>=2.26). I
removed this script and changed the configuration of these boards in order to
make use of the common genimage template. The layout is actually slightly
different: in the script the offset of the first partition (boot) was +1MB and
is +8MB in the template. I do not think the offset of the first partition  has
an impact on the freescale boards.

I changed the configuration of the imx6sololiteevk in order to use the common
genimage template. That was the reason of these patches.

Also, I tested this serie of patches with the imx6dlsabresd and the
imx6sololiteevk and I saw that U-Boot, in its default environment, was looking
for a zImage. As the zImage is the default kernel image format, I fixed the
configurations in order to eventually get a fully bootable SD card.

These patches may require some tests as I have tested them only for two boards.

Regards,

Georges

Georges Savoundararadj (5):
  freescale: genimage: Factorize scripts
  freescale: genimage: Use the common genimage template
  imx6sololiteevk: use the common genimage template
  imx6sololiteevk: use zImage
  imx6dlsabresd: use zImage

 .../genimage.cfg => common/genimage.cfg.template}  | 13 ++-
 board/freescale/common/post-image.sh               | 71 +++++++++++++++++
 board/freescale/create-boot-sd.sh                  | 93 ----------------------
 board/freescale/imx25pdk/post-image.sh             | 16 ----
 board/freescale/imx25pdk/readme.txt                |  2 +-
 board/freescale/imx51evk/genimage.cfg              | 41 ----------
 board/freescale/imx51evk/post-image.sh             | 16 ----
 board/freescale/imx51evk/readme.txt                |  2 +-
 board/freescale/imx53loco/genimage.cfg             | 42 ----------
 board/freescale/imx53loco/post-image.sh            | 16 ----
 board/freescale/imx6sabre/readme.txt               | 10 ++-
 board/freescale/imx6ulevk/genimage.cfg             | 41 ----------
 board/freescale/imx6ulevk/post-image.sh            | 16 ----
 board/freescale/imx6ulevk/readme.txt               |  2 +-
 board/freescale/imx7dsdb/genimage.cfg              | 41 ----------
 board/freescale/imx7dsdb/post-image.sh             | 16 ----
 board/freescale/imx7dsdb/readme.txt                |  2 +-
 configs/freescale_imx6dlsabreauto_defconfig        |  6 ++
 configs/freescale_imx6dlsabresd_defconfig          |  8 +-
 configs/freescale_imx6qsabreauto_defconfig         |  6 ++
 configs/freescale_imx6qsabresd_defconfig           |  6 ++
 configs/freescale_imx6sololiteevk_defconfig        |  8 +-
 configs/freescale_imx6sxsabresd_defconfig          |  6 ++
 configs/freescale_imx6ulevk_defconfig              |  2 +-
 configs/freescale_imx7dsabresd_defconfig           |  2 +-
 configs/mx25pdk_defconfig                          |  2 +-
 configs/mx51evk_defconfig                          |  2 +-
 configs/mx53loco_defconfig                         |  2 +-
 28 files changed, 129 insertions(+), 361 deletions(-)
 rename board/freescale/{imx25pdk/genimage.cfg => common/genimage.cfg.template} (58%)
 create mode 100755 board/freescale/common/post-image.sh
 delete mode 100755 board/freescale/create-boot-sd.sh
 delete mode 100755 board/freescale/imx25pdk/post-image.sh
 delete mode 100644 board/freescale/imx51evk/genimage.cfg
 delete mode 100755 board/freescale/imx51evk/post-image.sh
 delete mode 100644 board/freescale/imx53loco/genimage.cfg
 delete mode 100755 board/freescale/imx53loco/post-image.sh
 delete mode 100644 board/freescale/imx6ulevk/genimage.cfg
 delete mode 100755 board/freescale/imx6ulevk/post-image.sh
 delete mode 100644 board/freescale/imx7dsdb/genimage.cfg
 delete mode 100755 board/freescale/imx7dsdb/post-image.sh

-- 
2.9.0
