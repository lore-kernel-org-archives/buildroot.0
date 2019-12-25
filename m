From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 22:55:31 +0100
Subject: [Buildroot] [PATCH v2 1/1] board/freescale/common/imx: use
 nodtb variant in uboot images for 8M
In-Reply-To: <20191217203712.50491-1-juju@cotds.org> (Julien Olivain's message
 of "Tue, 17 Dec 2019 21:37:12 +0100")
References: <20191202200333.418111-1-juju@cotds.org>
 <20191217203712.50491-1-juju@cotds.org>
Message-ID: <87d0ccqdd8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Olivain <juju@cotds.org> writes:

 > In board/freescale/common/imx/imx8-bootloader-prepare.sh, when
 > invoking mkimage_fit_atf.sh, the U-Boot DTB is passed as parameter, to
 > be included in the FIT image. This parameter usually comes from
 > BR2_ROOTFS_POST_SCRIPT_ARGS config option. The variable
 > BL33=u-boot.bin set in the invocation uses the u-boot image which is
 > including its embedded DTB. This means the U-Boot DTB is included
 > twice.

 > The upstream script mkimage_fit_atf.sh plus its Buildroot patch are
 > meant to use by default the nodtb variant and use the DTB in a
 > separate image. See [1] and [2].

 > The U-Boot default DTB which will be included in u-boot.bin image is
 > selected with U-Boot CONFIG_DEFAULT_DEVICE_TREE, or DEVICE_TREE
 > variable when invoking "make". If one of those option is not aligned
 > to the BR2_ROOTFS_POST_SCRIPT_ARGS config option, it's possible the
 > two included U-Boot DTBs are different. If such case happens, the
 > built-in DTB is always used, regardless of the other one, selected
 > with BR2_ROOTFS_POST_SCRIPT_ARGS.

 > For example, this case happens for TechNexion Pico Pi i.MX8M and
 > i.MX8MMini. Since the U-Boot defconfig assumes the nodtb version will
 > be used, it does not set the default DTB. The u-boot.bin will include
 > the fsl-imx8mm-evk instead. Including the wrong board DTB breaks the
 > USB and UMS commands (and possibly others). Since those boards does
 > not have SD card slots, a recovery serial download is needed at every
 > update.

 > This patch make sure that only the separate U-Boot DTB will be
 > included in the FIT image by using the nodtb variant.

 > [1] https://source.codeaurora.org/external/imx/imx-mkimage/tree/iMX8M/mkimage_fit_atf.sh?h=rel_imx_4.14.98_2.0.0_ga#n35
 > [2] https://git.busybox.net/buildroot/tree/package/imx-mkimage/0001-add-support-for-overriding-bl32-and-bl33-not-only-bl.patch?h=2019.11#n42

 > Signed-off-by: Julien Olivain <juju@cotds.org>
 > ---
 > Changes v1 -> v2:
 >   - Add more details in the commit log

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
