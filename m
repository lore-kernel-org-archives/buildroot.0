From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Tue, 10 Apr 2018 19:31:51 +0200
Subject: [Buildroot] [PATCH v6 4/4] configs/freescale_imx8mqevk: new
 defconfig
In-Reply-To: <20180409224224.7ba2379a@windsurf>
References: <1520682702-10035-1-git-send-email-karl.erik.larsson@gmail.com>
 <1520682702-10035-5-git-send-email-karl.erik.larsson@gmail.com>
 <20180409224224.7ba2379a@windsurf>
Message-ID: <CAPP7BN2uRzk-8z-NTNpPe3uiEGUxU6ooKP2gDu0eQQ5eRGtebg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2018-04-09 22:42 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:
> Hello Erik,
>
> On Sat, 10 Mar 2018 12:51:42 +0100, Erik Larsson wrote:
>
>> diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
>> index b239743..4c77ae2 100755
>> --- a/board/freescale/common/imx/post-image.sh
>> +++ b/board/freescale/common/imx/post-image.sh
>> @@ -7,10 +7,10 @@
>>  #
>>  dtb_list()
>>  {
>> -     local DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"
>> +     local DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([\/a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"
>>
>>       for dt in $DTB_LIST; do
>> -             echo -n "\"$dt.dtb\", "
>> +             echo -n "\"`basename $dt`.dtb\", "
>>       done
>>  }
>>
>> @@ -23,6 +23,8 @@ linux_image()
>>  {
>>       if grep -Eq "^BR2_LINUX_KERNEL_UIMAGE=y$" ${BR2_CONFIG}; then
>>               echo "\"uImage\""
>> +     elif grep -Eq "^BR2_LINUX_KERNEL_IMAGE=y$" ${BR2_CONFIG}; then
>> +             echo "\"Image\""
>>       else
>>               echo "\"zImage\""
>>       fi
>
> Those two changes could be in a patch reworking post-image.sh to be
> compatible with arm64.
>
>> @@ -30,19 +32,39 @@ linux_image()
>>
>>  genimage_type()
>>  {
>> -     if grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
>> +     if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y$" ${BR2_CONFIG}; then
>> +             echo "genimage.cfg.template_imx8"
>> +     elif grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
>>               echo "genimage.cfg.template_spl"
>>       else
>>               echo "genimage.cfg.template"
>>       fi
>>  }
>>
>> +gen_imx8_boot()
>> +{
>> +     cat ${BINARIES_DIR}/lpddr4_pmu_train_1d_imem_pad.bin ${BINARIES_DIR}/lpddr4_pmu_train_1d_dmem_pad.bin > ${BINARIES_DIR}/lpddr4_pmu_train_1d_fw.bin
>> +     cat ${BINARIES_DIR}/lpddr4_pmu_train_2d_imem_pad.bin ${BINARIES_DIR}/lpddr4_pmu_train_2d_dmem.bin > ${BINARIES_DIR}/lpddr4_pmu_train_2d_fw.bin
>> +     cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/lpddr4_pmu_train_1d_fw.bin ${BINARIES_DIR}/lpddr4_pmu_train_2d_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
>> +     rm -f ${BINARIES_DIR}/lpddr4_pmu_train_1d_fw.bin ${BINARIES_DIR}/lpddr4_pmu_train_2d_fw.bin
>> +
>> +     BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot.bin ${HOST_DIR}/bin/mkimage_fit_atf.sh ${BINARIES_DIR}/fsl-imx8mq-evk.dtb > ${BINARIES_DIR}/u-boot.its
>> +     ${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
>> +     rm -f ${BINARIES_DIR}/u-boot.its
>> +
>> +     ${HOST_DIR}/bin/mkimage_imx8 -fit -signed_hdmi ${BINARIES_DIR}/signed_hdmi_imx8m.bin -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x7E1000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx-boot-imx8mqevk-sd.bin
>> +}
>
> Shouldn't this logic be moved to a specialized post-image script ? And
> then you do:
>
> BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
>
> or something like that ? Fabio, what do you think ?
>
> Also, could you split the i.MX8 stuff from the support of the i.MX8 EVK board itself ?
>
> I.e adding the genimage.cfg file, and adding imx8-bootloader.prepare.sh
> should be one patch, and then adding the i.MX8 EVK defconfig and
> readme.txt should be another patch.
>
> Could you rework the last two patches according to those comments ?

I've started to rework this and have something that at least works.
I've moved the generation of imx-boot-imx8mqevk-sd.bin to a separate
prepare script and tried to separate what is iMX8 general and what is
imx8mqevk specific in that script. So the gen_imx8_boot() function can
be removed from post-script.sh. I still need to keep the selection of
genimage.cfg.template in post-script.sh but instead of checking for
IMX8M it can check if it's a IMX8 platform. Is it something like that
you hade in mind?

>
> Thanks a lot!
>
> Thomas Petazzoni
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com

/Erik
