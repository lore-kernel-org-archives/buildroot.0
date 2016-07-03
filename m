From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jul 2016 17:56:53 +0200
Subject: [Buildroot] [PATCH v4 2/2] configs: add defconfig for TS-4800
In-Reply-To: <1465498542-7333-3-git-send-email-patrick.keroulas@savoirfairelinux.com>
 (Patrick Keroulas's message of "Thu, 9 Jun 2016 14:55:42 -0400")
References: <1465498542-7333-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <1465498542-7333-3-git-send-email-patrick.keroulas@savoirfairelinux.com>
Message-ID: <87mvlyu33u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Patrick" == Patrick Keroulas <patrick.keroulas@savoirfairelinux.com> writes:

 > The TS-4800 is supported by mainline Linux as of 4.5.
 > u-boot-imx had to be patched and selected as a custom U-Boot until this
 > fork is merged into mainline U-Boot.

 > A post-image script is provided to generate an image that can be "dd"
 > directly to an SD card.

 > More details on the board here:
 >   http://wiki.embeddedarm.com/wiki/TS-4800

 > Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
 > Signed-off-by: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
 > ---
 >  board/technologic/ts4800/genimage.cfg   | 37 +++++++++++++++++++++++++++++++++
 >  board/technologic/ts4800/linux.fragment |  3 +++
 >  board/technologic/ts4800/post-image.sh  | 23 ++++++++++++++++++++
 >  configs/ts4800_defconfig                | 30 ++++++++++++++++++++++++++
 >  4 files changed, 93 insertions(+)
 >  create mode 100644 board/technologic/ts4800/genimage.cfg
 >  create mode 100644 board/technologic/ts4800/linux.fragment
 >  create mode 100755 board/technologic/ts4800/post-image.sh
 >  create mode 100644 configs/ts4800_defconfig

 > diff --git a/board/technologic/ts4800/genimage.cfg b/board/technologic/ts4800/genimage.cfg
 > new file mode 100644
 > index 0000000..4e47095
 > --- /dev/null
 > +++ b/board/technologic/ts4800/genimage.cfg
 > @@ -0,0 +1,37 @@
 > +image boot.vfat {
 > +        vfat {
 > +                files = {
 > +                        "zImage",
 > +                        "imx51-ts4800.dtb"
 > +                }
 > +        }
 > +        size = 8M
 > +}
 > +
 > +image sdcard.img {
 > +        hdimage {
 > +        }
 > +
 > +        partition mbrboot {
 > +                in-partition-table = "no"
 > +                image = "mbrboot.bin"
 > +                offset = 0
 > +        }

Does genimage really handle this correctly (E.G. doesn't overwrite the
bootloader when it writes the MBR)? I know that we at least postprocess
the genimage output for odroid2 where a similar boot logic is used
(board/hardkernel/odroidc2/post-image.sh)

> +
 > +        partition uboot {
 > +                partition-type = 0xda
 > +                image = "u-boot.bin"
 > +                size = 8M

Any particular reason why this is so big?

 > +${HOST_DIR}/usr/bin/genimage \
 > +        --config ${GENIMAGE_CFG} \
 > +        --rootpath ${TARGET_DIR} \
 > +        --tmppath ${GENIMAGE_TMP} \
 > +        --inputpath $IDIR \
 > +        --outputpath $IDIR
 > +
 > +ret=${?}
 > +rm -rf ${GENIMAGE_TMP}
 > +exit ${ret}
 > +

Empty trailing line. Other post-image scripts don't explicitly cleanup
the tmppath afterwards (instead do it before calling genimage). Any
specific reason to do it differently here?

> diff --git a/configs/ts4800_defconfig b/configs/ts4800_defconfig
 > new file mode 100644
 > index 0000000..ec1778a
 > --- /dev/null
 > +++ b/configs/ts4800_defconfig
 > @@ -0,0 +1,30 @@
 > +BR2_arm=y
 > +BR2_cortex_a8=y
 > +BR2_ARM_FPU_NEON=y

Why? That is normally not a good choice for compatibility reasons.

 > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y

Why not 4.6?


> +BR2_TOOLCHAIN_BUILDROOT_LOCALE=y

Our basic defconfigs should be minimal. Why do you want to enable locale
support?

 > +BR2_BINUTILS_VERSION_2_24_X=y

Why? Is this because of the objcopy issue? If so, that would be fixed by
the -R .note.gnu.build-id option.

 > +BR2_TOOLCHAIN_BUILDROOT_CXX=y

Same as for locale.

 > +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y

Any specific reason (E.G. firmware loading or what not) for wanting mdev?

 > +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 > +BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y

Are the kernel defaults not ok?

> +# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
 > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/technologic/ts4800/post-image.sh"
 > +BR2_LINUX_KERNEL=y
 > +BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 > +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(TOPDIR)/board/technologic/ts4800/linux.fragment"
 > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
 > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx51-ts4800"

You forgot to lock it to 4.5

 > +BR2_PACKAGE_BUSYBOX_WATCHDOG=y
 > +BR2_PACKAGE_FBTERM=y

Are these _REALLY_ needed for anything?

> +BR2_PACKAGE_TS4800_MBRBOOT=y
 > +BR2_TARGET_ROOTFS_EXT2=y
 > +BR2_TARGET_ROOTFS_EXT2_4=y
 > +# BR2_TARGET_ROOTFS_TAR is not set
 > +BR2_TARGET_UBOOT=y
 > +BR2_TARGET_UBOOT_CUSTOM_GIT=y
 > +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.denx.de/u-boot-imx.git"
 > +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="d2ba7a6adcef6e6f8c4418c7b0caf9d7ab98a6d4"
 > +BR2_TARGET_UBOOT_BOARDNAME="ts4800"
 > +BR2_PACKAGE_HOST_GENIMAGE=y

You create a fat filesystem with genimage, so you also need:

BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_MTOOLS=y

> +BR2_PACKAGE_HOST_SQUASHFS=y

Why? You don't seem to use it anywhere?

-- 
Bye, Peter Korsgaard
