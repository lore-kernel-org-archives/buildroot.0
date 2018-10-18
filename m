From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 18 Oct 2018 18:26:21 -0500
Subject: [Buildroot] [PATCH next] uboot: support external DTB in U-Boot
 images
In-Reply-To: <20181018220711.GA1613@archibald.tuxnet>
References: <20180304171815.35061-1-clemens.gruber@pqgruber.com>
 <CANQCQpa6ro4XehpbrS_ZAQ1tizkMhsBG_4+f8NNM1JHfvvA25A@mail.gmail.com>
 <20181018220711.GA1613@archibald.tuxnet>
Message-ID: <CANQCQpZWW5LoDTJm-mi0gaJfcxtge6nq6LZnKafTCG_oynsomw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Clemens,

On Thu, Oct 18, 2018 at 5:07 PM Clemens Gruber
<clemens.gruber@pqgruber.com> wrote:
>
> Hi Matthew,
>
> On Mon, Oct 15, 2018 at 02:50:13PM -0500, Matthew Weber wrote:
> > Clemens,
> >
> > On Mon, Oct 15, 2018 at 2:43 PM Clemens Gruber
> > <clemens.gruber@pqgruber.com> wrote:
> > >
> > > Allows signed FIT images to be verified with the public key in the DTB.
> > > The public key is stored in the bootloader image, which must have been
> > > verified by the previous stage in the trust chain, before loading it.
> > >
> > > Signed-off-by: Clemens Gruber <clemens.gruber@pqgruber.com>
> > > ---
> > >  boot/uboot/Config.in | 14 ++++++++++++++
> > >  boot/uboot/uboot.mk  |  5 +++++
> > >  2 files changed, 19 insertions(+)
> > >
> > > diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> > > index 264f343767..620aa02bb9 100644
> > > --- a/boot/uboot/Config.in
> > > +++ b/boot/uboot/Config.in
> > > @@ -460,6 +460,20 @@ config BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
> > >           To use this device tree source file, the U-Boot configuration
> > >           file must refer to it.
> > >
> > > +config BR2_TARGET_UBOOT_EXT_DTB
> > > +       bool "External DTB"
> > > +       help
> > > +         Put an external DTB in the U-Boot image. Used to store public
> > > +         keys for verifying signed FIT images.
> > > +
> > > +config BR2_TARGET_UBOOT_EXT_DTB_PATH
> > > +       string "Path to external DTB"
> > > +       depends on BR2_TARGET_UBOOT_EXT_DTB
> > > +       help
> > > +         Path to external DTB to be put in the U-Boot image.
> > > +         Prepend ${TOPDIR}/ to specify paths relative to the top
> > > +         buildroot source directory.
> > > +
> > >  endif
> >
> > Would the existing BR2_TARGET_UBOOT_CUSTOM_DTS_PATH option already
> > allow you to place your custom DTS files?  Then to use them, you would
> > need to either add a kconfig BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES
> > fragment to build on your default board kconfig or if you have a
> > custom board, set the kconfig path in
> > BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE to your custom kconfig.
> >
> > I believe the combination KCONFIG values that point at DTS files can
> > get your  BR2_TARGET_UBOOT_CUSTOM_DTS_PATH dts files included in the
> > uboot build without setting EXT_DTB.  What do you think?
>
> This would not work, afaik. The dtb passed with EXT_DTB is not just a
> "normal" device tree blob, directly generated from a dts file.
> It's a special dtb into which the public keys (used to verify the FIT
> image signatures) were written once and the blob is then reused
> everytime the bootloader image is generated.
>

Ok sure, for a pre-built keys only blob. (ie what mkimage puts out as
part of the signing process)

Couple items I can think to mention
1) From when we looked at verified boot for a project, the blob is
appended to the boot binary when a uboot.bin format is used. We found
that there were cases where we wanted a boot.bin without the dtb
appended and with. If we add the EX_DTB option, the output will always
include that file per the defconfig.  As once an image is built that
way, at runtime it solely enforces verified boot for all items you're
loading.  This didn't seem ideal for factory/lab integration.  Similar
to rootfs building, it's nice to have the unwrapped file and final
compressed/wrapped.  A solution which would leave both original uboot
and the one with signatures would be to do the DTB append in
Buildroot's uboot.mk's logic.  However you'd have to first confirm
that the DTB is only appended in the case of the raw uboot.bin binary
case and no other output formats.

2)  It would be possible to handle the (1) case in a post image script
without the proposed Buildroot change, if the .bin is the only file
every appended with the DTB.

3) As another option, you could reverse compile the DTB that comes out
of mkimage and include the source using the
BR2_TARGET_UBOOT_CUSTOM_DTS_PATH and an include in your existing dts.
That way everything is compiled at build time and not binaries are
committed to repositories for the DTB.  This also would not required
the proposed Buildroot change.

So it would be good to confirm if the EXT_DTB provides support for non
uboot.bin formats.  If that's the case, then a
BR2_TARGET_UBOOT_EXT_DTB_PATH option or reverse compile your DTB, make
the most sense vs using a post script.

Matt
