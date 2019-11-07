From: Fabrice Goucem <fabrice.goucem@nxp.com>
Date: Thu, 7 Nov 2019 09:59:14 +0000
Subject: [Buildroot] [EXT] Re: [PATCH v3 1/2]
 package/freescale-imx/imx-m4-firmware: new package
In-Reply-To: <20191106172305.GA24513@g751>
References: <20191030133955.30611-1-fabrice.goucem@nxp.com>
 <20191105120304.19928-1-fabrice.goucem@nxp.com>
 <20191106172305.GA24513@g751>
Message-ID: <413c6aa15947a393c6088d21c6a9d08e966524e3.camel@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On Wed, 2019-11-06 at 18:23 +0100, Gary Bisson wrote:
> Caution: EXT Email
> 
> Hi Fabrice,
> 
> On Tue, Nov 05, 2019 at 12:03:55PM +0000, Fabrice Goucem wrote:
> > New package to download and install i.MX Cortex-M4 firmware
> > for following SoCs:
> > * i.MX7D
> > * i.MX7ULP
> > * i.MX8M
> > * i.MX8MM
> > * i.MX8QXP
> 
> Any reason why there's no i.MX6SX package?

Simply because I could not locate an M4 demo image from NXP servers.
I used the NXP Yocto recipes to locate the different M4 images and
i.MX6SX is not a SoC supported by these recipes.
Will gladly add an image if a reliable location is found.

> > Signed-off-by: Fabrice Goucem <fabrice.goucem@nxp.com>
> > Tested-by: Julien Olivain <julien.olivain@nxp.com>
> > ---
> >  DEVELOPERS                                    |  3 +
> >  board/freescale/common/imx/post-image.sh      | 14 +++-
> >  package/freescale-imx/Config.in               |  8 +++
> >  .../freescale-imx/imx-m4-firmware/Config.in   | 11 +++
> >  .../imx-m4-firmware/imx-m4-firmware.hash      |  8 +++
> >  .../imx-m4-firmware/imx-m4-firmware.mk        | 72
> > +++++++++++++++++++
> >  6 files changed, 115 insertions(+), 1 deletion(-)
> >  create mode 100644 package/freescale-imx/imx-m4-firmware/Config.in
> >  create mode 100644 package/freescale-imx/imx-m4-firmware/imx-m4-
> > firmware.hash
> >  create mode 100644 package/freescale-imx/imx-m4-firmware/imx-m4-
> > firmware.mk
> > 
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 24c57b25f7..93f395ed69 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -874,6 +874,9 @@ F:        package/tinydtls/
> >  F:   package/tinymembench/
> >  F:   package/whois/
> > 
> > +N:   Fabrice Goucem <fabrice.goucem@nxp.com>
> > +F:   package/freescale-imx/imx-m4-firmware/
> > +
> >  N:   Falco Hyfing <hyfinglists@gmail.com>
> >  F:   package/python-pymodbus/
> > 
> > diff --git a/board/freescale/common/imx/post-image.sh
> > b/board/freescale/common/imx/post-image.sh
> > index 19d8fffb63..f9851c2d3b 100755
> > --- a/board/freescale/common/imx/post-image.sh
> > +++ b/board/freescale/common/imx/post-image.sh
> > @@ -30,6 +30,18 @@ linux_image()
> >       fi
> >  }
> > 
> > +#
> > +# m4_image prints all available M4 firmware file names for the
> > genimage
> > +# configuration file
> > +#
> > +m4_image()
> > +{
> > +     if grep -Eq "^BR2_PACKAGE_IMX_M4_FIRMWARE=y$" ${BR2_CONFIG};
> > then
> > +             echo -n ", "
> > +             for f in $(ls ${BINARIES_DIR}/m4_*); do echo -n
> > "$(basename $f), "; done
> > +     fi
> > +}
> > +
> >  genimage_type()
> >  {
> >       if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y$"
> > ${BR2_CONFIG}; then
> > @@ -75,7 +87,7 @@ uboot_image()
> > 
> >  main()
> >  {
> > -     local FILES="$(dtb_list) $(linux_image)"
> > +     local FILES="$(dtb_list) $(linux_image) $(m4_image)"
> >       local IMXOFFSET="$(imx_offset)"
> >       local UBOOTBIN="$(uboot_image)"
> >       local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
> > diff --git a/package/freescale-imx/Config.in b/package/freescale-
> > imx/Config.in
> > index f010aab87b..76694bc788 100644
> > --- a/package/freescale-imx/Config.in
> > +++ b/package/freescale-imx/Config.in
> > @@ -83,10 +83,18 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
> >               BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
> >               BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
> > 
> > +config BR2_PACKAGE_FREESCALE_IMX_HAS_M4
> > +     bool
> > +     default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 || \
> > +             BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X || \
> > +             BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
> > +             BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
> 
> Same here.
> 
> Regards,
> Gary

Regards,

Fabrice
