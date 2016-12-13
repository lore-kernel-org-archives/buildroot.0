From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Dec 2016 19:45:52 +0100
Subject: [Buildroot] [PATCH] mx6sx: Add support for mx6sx udoo neo boards
In-Reply-To: <1481649193-29371-1-git-send-email-fabio.estevam@nxp.com> (Fabio
 Estevam's message of "Tue, 13 Dec 2016 15:13:13 -0200")
References: <1481649193-29371-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <87d1gv3bxb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Estevam <fabio.estevam@nxp.com> writes:

 > Add support for mx6sx udoo neo boards. For more information about these
 > boards, please check:
 > http://www.udoo.org/udoo-neo

 > The U-Boot and kernel dts patches will be removed when we bump U-Boot
 > to 2017.01 and kernel to 4.10 version as they have already been sent
 > upstream.

 > Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
 > ---
 >  board/udoo/neo/boot.scr.txt                        |   7 +
 >  board/udoo/neo/genimage.cfg                        |  31 +
 >  .../neo/patches/linux/0001-udoo_neo_support.patch  | 560 +++++++++++++++++
 >  board/udoo/neo/patches/uboot/0001-udoo.patch       | 691 +++++++++++++++++++++
 >  board/udoo/neo/post-build.sh                       |   8 +
 >  board/udoo/neo/post-image.sh                       |  15 +
 >  board/udoo/neo/readme.txt                          |  16 +
 >  configs/mx6sx_udoo_neo_defconfig                   |  29 +
 >  8 files changed, 1357 insertions(+)
 >  create mode 100644 board/udoo/neo/boot.scr.txt
 >  create mode 100644 board/udoo/neo/genimage.cfg
 >  create mode 100644 board/udoo/neo/patches/linux/0001-udoo_neo_support.patch
 >  create mode 100644 board/udoo/neo/patches/uboot/0001-udoo.patch
 >  create mode 100755 board/udoo/neo/post-build.sh
 >  create mode 100755 board/udoo/neo/post-image.sh
 >  create mode 100644 board/udoo/neo/readme.txt
 >  create mode 100644 configs/mx6sx_udoo_neo_defconfig

 > diff --git a/board/udoo/neo/boot.scr.txt b/board/udoo/neo/boot.scr.txt
 > new file mode 100644
 > index 0000000..f647db3
 > --- /dev/null
 > +++ b/board/udoo/neo/boot.scr.txt
 > @@ -0,0 +1,7 @@
 > +setenv finduuid "part uuid mmc 0:1 uuid"
 > +run finduuid
 > +run findfdt
 > +setenv bootargs "console=ttymxc0,115200 root=PARTUUID=${uuid} rootwait rootfstype=ext4"
 > +load mmc 0:1 ${fdt_addr} boot/${fdt_file}
 > +load mmc 0:1 ${loadaddr} boot/zImage
 > +bootz ${loadaddr} - ${fdt_addr}

> diff --git a/configs/mx6sx_udoo_neo_defconfig b/configs/mx6sx_udoo_neo_defconfig
 > new file mode 100644
 > index 0000000..cbea577
 > --- /dev/null
 > +++ b/configs/mx6sx_udoo_neo_defconfig
 > @@ -0,0 +1,29 @@
 > +BR2_arm=y
 > +BR2_cortex_a9=y
 > +# Linux headers same as kernel, a 4.9 series
 > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 > +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"

As you already pass console=ttymxc0 then I believe the default
(/dev/console) should work as well.

Committed, thanks. Will you send a patch to move the existing
board/udoo/* files to E.G. board/udoo/mx6 for consistency?

-- 
Bye, Peter Korsgaard
