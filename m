From: Clemens Gruber <clemens.gruber@pqgruber.com>
Date: Fri, 19 Oct 2018 00:07:11 +0200
Subject: [Buildroot] [PATCH next] uboot: support external DTB in U-Boot
 images
In-Reply-To: <CANQCQpa6ro4XehpbrS_ZAQ1tizkMhsBG_4+f8NNM1JHfvvA25A@mail.gmail.com>
References: <20180304171815.35061-1-clemens.gruber@pqgruber.com>
 <CANQCQpa6ro4XehpbrS_ZAQ1tizkMhsBG_4+f8NNM1JHfvvA25A@mail.gmail.com>
Message-ID: <20181018220711.GA1613@archibald.tuxnet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

On Mon, Oct 15, 2018 at 02:50:13PM -0500, Matthew Weber wrote:
> Clemens,
> 
> On Mon, Oct 15, 2018 at 2:43 PM Clemens Gruber
> <clemens.gruber@pqgruber.com> wrote:
> >
> > Allows signed FIT images to be verified with the public key in the DTB.
> > The public key is stored in the bootloader image, which must have been
> > verified by the previous stage in the trust chain, before loading it.
> >
> > Signed-off-by: Clemens Gruber <clemens.gruber@pqgruber.com>
> > ---
> >  boot/uboot/Config.in | 14 ++++++++++++++
> >  boot/uboot/uboot.mk  |  5 +++++
> >  2 files changed, 19 insertions(+)
> >
> > diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> > index 264f343767..620aa02bb9 100644
> > --- a/boot/uboot/Config.in
> > +++ b/boot/uboot/Config.in
> > @@ -460,6 +460,20 @@ config BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
> >           To use this device tree source file, the U-Boot configuration
> >           file must refer to it.
> >
> > +config BR2_TARGET_UBOOT_EXT_DTB
> > +       bool "External DTB"
> > +       help
> > +         Put an external DTB in the U-Boot image. Used to store public
> > +         keys for verifying signed FIT images.
> > +
> > +config BR2_TARGET_UBOOT_EXT_DTB_PATH
> > +       string "Path to external DTB"
> > +       depends on BR2_TARGET_UBOOT_EXT_DTB
> > +       help
> > +         Path to external DTB to be put in the U-Boot image.
> > +         Prepend ${TOPDIR}/ to specify paths relative to the top
> > +         buildroot source directory.
> > +
> >  endif
> 
> Would the existing BR2_TARGET_UBOOT_CUSTOM_DTS_PATH option already
> allow you to place your custom DTS files?  Then to use them, you would
> need to either add a kconfig BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES
> fragment to build on your default board kconfig or if you have a
> custom board, set the kconfig path in
> BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE to your custom kconfig.
> 
> I believe the combination KCONFIG values that point at DTS files can
> get your  BR2_TARGET_UBOOT_CUSTOM_DTS_PATH dts files included in the
> uboot build without setting EXT_DTB.  What do you think?

This would not work, afaik. The dtb passed with EXT_DTB is not just a
"normal" device tree blob, directly generated from a dts file. 
It's a special dtb into which the public keys (used to verify the FIT
image signatures) were written once and the blob is then reused
everytime the bootloader image is generated.

It is described in chapter 5 of
https://wiki.linaro.org/WorkingGroups/Security/Verified-U-boot

And also in
http://git.denx.de/?p=u-boot.git;a=blob;f=doc/uImage.FIT/beaglebone_vboot.txt

Best regards,
Clemens
