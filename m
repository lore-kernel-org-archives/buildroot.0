From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jan 2021 10:51:01 +0100
Subject: [Buildroot] [PATCH v2 3/3] configs/qcom_db410c: new defconfig
In-Reply-To: <CABqcFRmgbcfZPUefccFssAEw+ahK+xtFt82iZJ+1sO9bczBBYA@mail.gmail.com>
 (Mike Frampton's message of "Sat, 21 Nov 2020 21:16:34 +1300")
References: <20201119090854.48955-1-mikeframpo@gmail.com>
 <20201119090854.48955-4-mikeframpo@gmail.com>
 <20201119143039.726f1485@windsurf.home>
 <CABqcFR=RDj0qCxQkvUb719GkttaZ9JfZJ-MeXY+3UaN9Aiw07A@mail.gmail.com>
 <CABqcFRmgbcfZPUefccFssAEw+ahK+xtFt82iZJ+1sO9bczBBYA@mail.gmail.com>
Message-ID: <87tur98flm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frampton <mikeframpo@gmail.com> writes:

 > Hi Thomas,
 >> > > +OUTIMG=$BINARIES_DIR/boot-db410c.img
 >> > > +KERNEL_BUILD=$BUILD_DIR/linux-release_qcomlt-5.4
 >> > > +
 >> > > +cp $KERNEL_BUILD/arch/arm64/boot/dts/qcom/apq8016-sbc.dtb $BINARIES_DIR
 >> > > +cp $KERNEL_BUILD/arch/arm64/boot/Image.gz $BINARIES_DIR
 >> >
 >> > Why is this needed ? Buildroot should have already copied the DT and
 >> > kernel image to BINARIES_DIR.
 >> 
 >> For some reason it doesn't in my configuration. When I look in
 >> linux/linux.mk, I found that
 >> LINUX_INSTALL_DTB is only defined if BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
 >> is not set. I'm not sure why?

 > I've done a bit more investigation into this. I was able to get the
 > dtb to copy to the output/images
 > folder by unsetting the BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT. I thought
 > that setting was
 > needed.

No, that is for a special case where the DTB is embedded inside the
kernel image. E.G. as we tried to explain in the help text:

	  Normally, the device tree(s) to be built have to be passed
	  explicitly to the kernel build system. For some binary
	  formats, however, the kernel build system links in the
	  device tree directly in the kernel binary. Select this option
	  if you have such a kernel binary format.


 > The Image.gz file was not being copied to the images/ folder. I was
 > able to get this to copy by
 > adding the following code. I think gmail has messed up the whitespace,
 > but I'm sure you get the
 > idea. If you think this is a useful thing to add, then I can expand it
 > to work for all the supported
 > output image formats and submit a patch.

 > diff --git a/linux/linux.mk b/linux/linux.mk
 > index e07e014d1e..71e6805ab7 100644
 > --- a/linux/linux.mk
 > +++ b/linux/linux.mk
 > @@ -245,6 +245,12 @@ else
 >  LINUX_IMAGE_PATH = $(LINUX_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME)
 >  endif # BR2_LINUX_KERNEL_VMLINUX

 > +LINUX_OUTPUT_IMAGES=$(LINUX_IMAGE_PATH)
 > +
 > +ifeq ($(BR2_LINUX_KERNEL_GZIP),y)
 > +    LINUX_OUTPUT_IMAGES += $(LINUX_IMAGE_PATH).gz
 > +endif

This may work but isn't really right. The compression options don't
apply to the 'Image' kernel format used on arm64 (as it is a "raw"
kernel without a bootloader in front), so keying off
BR2_LINUX_KERNEL_GZIP isn't good. Ideally we should hide those options
when the Image format is used.

The issue is actually that aarch64 (and riscv, where the logic is
copied) builds Image + Image.gz by default. From arch/arm64/Makefile:


all:	Image.gz

Image: vmlinux
	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@

Image.%: Image
	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@


So we could either extend the Image handling to copy both Image and
Image.gz, or add an Image.gz format option to get the Image.gz file
copied. For flexibility, the separate Image.gz format is probably the
nicest option. I'll send a patch for that.

-- 
Bye, Peter Korsgaard
