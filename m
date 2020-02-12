From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Feb 2020 16:18:16 +0100
Subject: [Buildroot] [git commit] board/freescale/common/imx: add
 support for i.MX8
In-Reply-To: <CAOMZO5BOONSJYw9hrgJXNMJTOW0mDB+Xz7BfcexOPkuOZ80XeQ@mail.gmail.com>
References: <20200205111426.415708122F@busybox.osuosl.org>
 <CAOMZO5BOONSJYw9hrgJXNMJTOW0mDB+Xz7BfcexOPkuOZ80XeQ@mail.gmail.com>
Message-ID: <20200212161816.23f55959@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabio,

On Wed, 12 Feb 2020 12:18:37 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> This commit breaks the freescale_imx8qxpmek_defconfig target:
> 
> 774122 bytes (774 kB, 756 KiB) copied, 0,00407387 s, 190 MB/s
> AP file_offset = 0x25000 size = 0xbd000
> Can't open /home/fabio/buildroot/output/images/mx8qx-ahab-container.img:
> No such file or directory
> Makefile:806: recipe for target 'target-post-image' failed
> make: *** [target-post-image] Error 1
> 
> Reverting it make the build work again.
> 
> Please fix it.

It's my fault for applying only parts of Maeva's patches, because some
of the patches had already been applied in a different form.

Could you try this:

diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
index 302fd00658..45c648e360 100755
--- a/board/freescale/common/imx/imx8-bootloader-prepare.sh
+++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
@@ -28,9 +28,9 @@ main ()
                cp ${BINARIES_DIR}/bl31.bin ${BINARIES_DIR}/u-boot-atf.bin
                dd if=${BINARIES_DIR}/u-boot-hash.bin of=${BINARIES_DIR}/u-boot-atf.bin bs=1K seek=128
                if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8=y$" ${BR2_CONFIG}; then
-                       ${HOST_DIR}/bin/mkimage_imx8 -soc QM -rev B0 -append ${BINARIES_DIR}/mx8qm-ahab-container.img -c -scfw ${BINARIES_DIR}/mx8qm-mek-scfw-tcm.bin -ap ${BINARIES_DIR}/u-boot-atf.bin a53 0x80000000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
+                       ${HOST_DIR}/bin/mkimage_imx8 -soc QM -rev B0 -append ${BINARIES_DIR}/ahab-container.img -c -scfw ${BINARIES_DIR}/mx8qm-mek-scfw-tcm.bin -ap ${BINARIES_DIR}/u-boot-atf.bin a53 0x80000000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
                else
-                       ${HOST_DIR}/bin/mkimage_imx8 -soc QX -rev B0 -append ${BINARIES_DIR}/mx8qx-ahab-container.img -c -scfw ${BINARIES_DIR}/mx8qx-mek-scfw-tcm.bin -ap ${BINARIES_DIR}/u-boot-atf.bin a35 0x80000000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
+                       ${HOST_DIR}/bin/mkimage_imx8 -soc QX -rev B0 -append ${BINARIES_DIR}/ahab-container.img -c -scfw ${BINARIES_DIR}/mx8qx-mek-scfw-tcm.bin -ap ${BINARIES_DIR}/u-boot-atf.bin a35 0x80000000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
                fi
        fi
 

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
