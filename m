From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 Jul 2018 22:51:49 +0200
Subject: [Buildroot] [PATCH 2/3] imx/post-image: Allow flashing
 u-boot-dtb.imx in the SD card
In-Reply-To: <CAOMZO5BDTyZfo0s7ppN3CORQ-9ru1PtUaPTcK-RpgytGxO2ShA@mail.gmail.com>
References: <1530818671-20390-1-git-send-email-festevam@gmail.com>
 <1530818671-20390-2-git-send-email-festevam@gmail.com>
 <75a18624-33ef-7d5d-3542-2e3b7b75e5f6@mind.be>
 <CAOMZO5BDTyZfo0s7ppN3CORQ-9ru1PtUaPTcK-RpgytGxO2ShA@mail.gmail.com>
Message-ID: <c40b2f73-d91b-1693-a938-8b6de39b84f1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-07-18 20:56, Fabio Estevam wrote:
> Hi Arnout,
> 
> On Thu, Jul 5, 2018 at 6:57 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>  This file only differs from the normal template in the name of the u-boot
>> binary, right? So wouldn't it make more sense to make that configurable, just
>> like the %FILES%, and handle it in an extra sed line?
> 
> I am trying to implement your suggestion, but I think I need some help.
> 
> Here is what I have done so far:
> 
> diff --git a/board/freescale/common/imx/genimage.cfg.template
> b/board/freescale/common/imx/genimage.cfg.template
> index acce058..41584d9 100644
> --- a/board/freescale/common/imx/genimage.cfg.template
> +++ b/board/freescale/common/imx/genimage.cfg.template
> @@ -22,7 +22,7 @@ image sdcard.img {
> 
>    partition u-boot {
>      in-partition-table = "no"
> -    image = "u-boot.imx"
> +    image = %UBOOTBIN%

 You want to keep the quotation marks, so

	image = "%UBOOBTIN%"

>      offset = 1024
>    }
> 
> diff --git a/board/freescale/common/imx/post-image.sh
> b/board/freescale/common/imx/post-image.sh
> index 264c8a4..2e57cef 100755
> --- a/board/freescale/common/imx/post-image.sh
> +++ b/board/freescale/common/imx/post-image.sh
> @@ -41,8 +41,18 @@ genimage_type()
>         fi
>  }
> 
> +uboot_image()
> +{
> +       if grep -Eq "^BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y$" ${BR2_CONFIG}; then
> +               echo "u-boot-dtb.imx"
> +       elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_IMX=y$" ${BR2_CONFIG}; then
> +               echo "u-boot.imx"
> +       fi
> +}
> +
>  main()
>  {
> +       local UBOOTBIN="$(uboot_image)"
>         local FILES="$(dtb_list) $(linux_image)"
>         local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
>         local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> @@ -50,6 +60,9 @@ main()
>         sed -e "s/%FILES%/${FILES}/" \
>                 board/freescale/common/imx/$(genimage_type) > ${GENIMAGE_CFG}
> 
> +       sed -e "s/%UBOOTBIN%/${UBOOTBIN}/" \
> +               board/freescale/common/imx/$(genimage_type) > ${GENIMAGE_CFG}
> +

 This way, you're overwriting the file that was created just above. You need to
do both in a single command:

	sed -e "s/%FILES%/${FILES}/" \
		-e "s/%UBOOTBIN%/${UBOOTBIN}/" \
		board/freescale/common/imx/$(genimage_type) > ${GENIMAGE_CFG}


 Regards,
 Arnout

>         rm -rf "${GENIMAGE_TMP}"
> 
>         genimage \
> 
> but it does not work:
> 
>>>>   Executing post-image script board/freescale/common/imx/post-image.sh
> file(%FILES%): stat(/home/fabio/buildroot/output/images/%FILES%)
> failed: No such file or directory
> vfat(boot.vfat): could not setup %FILES%
> 
> Could you please provide some suggestion?
> 
> Thanks
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
