From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Mar 2016 13:14:12 +0100
Subject: [Buildroot] [PATCH 1/1] olimex_imx233_olinuxino_defconfig:
	genimage support
In-Reply-To: <1457645651-2472-1-git-send-email-phil@zankapfel.net> (Phil
 Eichinger's message of "Thu, 10 Mar 2016 22:34:11 +0100")
References: <1457645651-2472-1-git-send-email-phil@zankapfel.net>
Message-ID: <87shzxi54b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Phil" == Phil Eichinger <phil.eichinger@gmail.com> writes:

 > * add a post-image.sh script
 > * update defconfig for genimage
 > * update readme.txt

 > Signed-off-by: Phil Eichinger <phil@zankapfel.net>

Thanks!

 > +genimage                           \
 > +	--rootpath "${TARGET_DIR}"     \
 > +	--tmppath "${GENIMAGE_TMP}"    \
 > +	--inputpath "${BINARIES_DIR}"  \
 > +	--outputpath "${BINARIES_DIR}" \
 > +	--config "${GENIMAGE_CFG}"
 > +
 > +exit $?

I know other post-image scripts do this as well, but there's really no
need for this 'exit $?'.

 > +=== Manual creation of SD card image =========================================
 > +
 >  You'll need a spare MicroSD card with Freescale's special partition layout.
 >  This is basically three partitions:

I'm not sure there's any reason to still document the manual approach,
but ok - I've left it for now.

 > diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
 > index 9951284..87684fc 100644
 > --- a/configs/olimex_imx233_olinuxino_defconfig
 > +++ b/configs/olimex_imx233_olinuxino_defconfig
 > @@ -39,3 +39,9 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 >  BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.01"
 >  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx23_olinuxino"
 >  BR2_TARGET_UBOOT_FORMAT_SD=y
 > + 
 > +# To generate SD Image
 > +BR2_PACKAGE_HOST_GENIMAGE=y
 > +BR2_PACKAGE_HOST_MTOOLS=y

The vfat handling also uses mkdosfs, so we need to add
BR2_PACKAGE_HOST_DOSFSTOOLS=y as well.

I noticed that we are missing it from some of the other defconfigs as
well, so I'll fix that.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
