From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 19 Feb 2018 14:44:47 +0200
Subject: [Buildroot] [PATCH 3/3] add support for iMX8MQ-evk board
In-Reply-To: <CAPP7BN3ZFBKcn6+ALDUCLvZTBce0dBAn4f5=ycUVky39WVBy=A@mail.gmail.com>
References: <1518960511-4823-1-git-send-email-karl.erik.larsson@gmail.com>
 <1518960511-4823-4-git-send-email-karl.erik.larsson@gmail.com>
 <20180218144709.gcmyrsjowpmii446@sapphire.tkos.co.il>
 <CAPP7BN3ZFBKcn6+ALDUCLvZTBce0dBAn4f5=ycUVky39WVBy=A@mail.gmail.com>
Message-ID: <20180219124447.kyx3q3qfw4ori7sa@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Erik,

On Mon, Feb 19, 2018 at 07:01:54AM +0100, Erik Larsson wrote:
> 2018-02-18 15:47 GMT+01:00 Baruch Siach <baruch@tkos.co.il>:
> > On Sun, Feb 18, 2018 at 02:28:31PM +0100, Erik Larsson wrote:
> > > +gen_imx8_boot()
> > > +{
> > > +     objcopy -I binary -O binary --pad-to 0x8000 --gap-fill=0x0
> > ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_1d_imem.bin
> > ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_1d_imem_pad.bin
> > > +     objcopy -I binary -O binary --pad-to 0x4000 --gap-fill=0x0
> > ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_1d_dmem.bin
> > ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_1d_dmem_pad.bin
> > > +     objcopy -I binary -O binary --pad-to 0x8000 --gap-fill=0x0
> > ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_2d_imem.bin
> > ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_2d_imem_pad.bin
> > > +     cat ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_1d_imem_pad.bin
> > ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_1d_dmem_pad.bin >
> > ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_1d_fw.bin
> > > +     cat ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_2d_imem_pad.bin
> > ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_2d_dmem.bin >
> > ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_2d_fw.bin
> > > +     cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_1d_fw.bin
> > ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_2d_fw.bin >
> > ${BINARIES_DIR}/u-boot-spl-ddr.bin
> > > +     rm -f ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_1d_fw.bin
> > ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_2d_fw.bin
> > ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_1d_imem_pad.bin
> > ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_1d_dmem_pad.bin
> > ${BINARIES_DIR}/imx-boot/lpddr4_pmu_train_2d_imem_pad.bin
> > > +
> > > +     BL31=${BINARIES_DIR}/imx-boot/bl31.bin
> > BL33=${BINARIES_DIR}/u-boot.bin mkimage_fit_atf.sh
> > ${BINARIES_DIR}/fsl-imx8mq-evk.dtb > ${BINARIES_DIR}/imx-boot/u-boot.its
> > > +     pushd ${BINARIES_DIR}
> > > +     mkimage -E -p 0x3000 -f ${BINARIES_DIR}/imx-boot/u-boot.its
> > ${BINARIES_DIR}/u-boot.itb
> > > +     popd
> > > +        rm -f ${BINARIES_DIR}/imx-boot/u-boot.its
> > > +
> > > +     mkimage_imx8 -fit -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin
> > 0x7E1000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out
> > ${BINARIES_DIR}/imx-boot-imx8mqevk-sd.bin
> > > +}
> >
> > Instead of reproducing the convoluted way of generating the i.MX8 boot
> > image, can't you just copy the files into the iMX8M/ subdirectory of 
> > imx-mkimage, and run there 'make SOC=iMX8M flash_spl_uboot'?
> >
> Yes this is pretty convoluted, just as you say. There are some issues with
> doing this in the imx-mkimage (at least I think so, please let me know if
> I'm wrong :) ).
> The main Makefile of imx-mkimage has a step called buildinfo which reads
> information from its git repository, in buildroot there are no git
> repository during build time. This can off course be fixed using a small
> patch in the packet.

Yes. I think that patching the top-level Makefile is preferable.

> The other problem is that we need to have a way of
> selecting which file is used as BL33 in the mkimage_fit_aft.sh which is
> called from iMX8M/soc.mk. This can also be fixed with a packet patch, or we
> can simply copy our u-boot.bin and call it u-boot-nodtb.bin as
> mkimage_fit_atf.sh is expecting it to be called.

Renaming u-boot.bin to u-boot-nodtb.bin is a small price to pay for not having 
to duplicate the logic of iMX8M/soc.mak in Buildroot. This logic has changed 
in the recent past, and I don't think we want to chase the creative 
imagination of NXP engineers.

Over at the U-Boot mailing list Fabio indicated[1] that imx-mkimage will merge 
into the U-Boot mkimage. So hopefully we can get rid of this mess at some 
point.

[1] https://patchwork.ozlabs.org/patch/857974/#1843851

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
