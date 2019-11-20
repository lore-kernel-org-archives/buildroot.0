From: Jerry Huang <jerry.huang@nxp.com>
Date: Wed, 20 Nov 2019 09:30:26 +0000
Subject: [Buildroot] [EXT] Re: [PATCH 6/9]
 package/freescale-qoriq/cadence: new package
In-Reply-To: <20191120101322.00088afe@windsurf.home>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
 <20191120040725.32207-7-jerry.huang@nxp.com>
 <20191120101322.00088afe@windsurf.home>
Message-ID: <VI1PR04MB51363A932B60CC5F422C9A4AFE4F0@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks a lot for your detail comments.
Mine in lines.

Best Regards
Jerry Huang

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Wednesday, November 20, 2019 5:13 PM
> To: Jerry Huang <jerry.huang@nxp.com>
> Cc: buildroot at busybox.net
> Subject: [EXT] Re: [Buildroot] [PATCH 6/9] package/freescale-qoriq/cadence:
> new package
> 
> Caution: EXT Email
> 
> Hello,
> 
> On Wed, 20 Nov 2019 12:07:22 +0800
> Changming Huang <jerry.huang@nxp.com> wrote:
> 
> > This package provides the firmware for LS1028ARDB DP (display port).
> >
> > Signed-off-by: Changming Huang <jerry.huang@nxp.com>
> > ---
> >  package/freescale-qoriq/Config.in          |  2 ++
> >  package/freescale-qoriq/cadence/Config.in  |  9 +++++++++
> > package/freescale-qoriq/cadence/cadence.mk | 19 +++++++++++++++++++
> 
> We need an entry in the DEVELOPERS file for this package.
Ok, I will add the entry in DEVELOPERS

> Also, "cadence" is not descriptive enough as a package name.
> freescale-qoriq-cadence-dp-firmware perhaps? It's a bit long, but at least it's
> descriptive.
I think "cadence-dp-firmware" can be used for its name.
Because it is under sub-directory " freescale-qoriq", 
we can remove the prefix " freescale-qoriq" from package name.

> >  3 files changed, 30 insertions(+)
> >  create mode 100644 package/freescale-qoriq/cadence/Config.in
> >  create mode 100644 package/freescale-qoriq/cadence/cadence.mk
> 
> The .hash file is missing.
I will add the hash file.

> > diff --git a/package/freescale-qoriq/cadence/Config.in
> > b/package/freescale-qoriq/cadence/Config.in
> > new file mode 100644
> > index 0000000000..67292a799f
> > --- /dev/null
> > +++ b/package/freescale-qoriq/cadence/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_CADENCE
> > +     bool "display port firmware"
> 
> This should be just the package name.
Ok

> > +     help
> > +     Display Port, a resident EL3 firmware.
> 
> Indentation is not correct, we also need a link to some upstream web site that
> gives details about this firmware.
Sure, I will adjust it.

> Just curious: the DisplayPort really needs a firmware that runs on the main CPU,
> at EL3 ? This is pretty scary :-/ How does it get loaded ?
Yes, LS1028ARDB need this firmware for display port.
We used the command "hdp load" in uboot before starting Linux kernel.

> > +if BR2_PACKAGE_CADENCE
> > +config BR2_PACKAGE_CADENCE_DP_BIN
> > +     string "Custom DP Firmware BIN"
> 
> This is not needed, there is a single firmware image in the archive, just hardcode
> it in the package.
ok

> > +endif
> > diff --git a/package/freescale-qoriq/cadence/cadence.mk
> > b/package/freescale-qoriq/cadence/cadence.mk
> > new file mode 100644
> > index 0000000000..dd78411e15
> > --- /dev/null
> > +++ b/package/freescale-qoriq/cadence/cadence.mk
> > @@ -0,0 +1,19 @@
> >
> +###############################################################
> ######
> > +###########
> > +#
> > +# DP firmware for NXP layerscape platforms
> 
> Just the name of the package.
> 
> > +#
> >
> +###############################################################
> ######
> > +###########
> > +CADENCE_INSTALL_IMAGES = YES
> 
> One empty line between the comment header and the first variable.
> 
> Also, please specify _INSTALL_TARGET = NO
> 
> > +DP_BIN = $(call qstrip,$(BR2_PACKAGE_CADENCE_DP_BIN))
> 
> As per the comment above, this is not needed.
> 
> > +
> > +define CADENCE_BUILD_CMDS
> > +     cd $(@D)/ && wget
> > +https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.
> >
> +nxp.com%2Flgfiles%2Fsdk%2Flsdk1909%2Ffirmware-cadence-lsdk1909.bin&a
> m
> >
> +p;data=02%7C01%7Cjerry.huang%40nxp.com%7C9c92f3028db94a45041a08d
> 76d99
> >
> +e558%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637098380050
> 336719&
> >
> +amp;sdata=1f65%2B7j1t%2FuLicJMICfrV%2BrZpjme4a4YUtK88gDJF8g%3D&a
> mp;re
> > +served=0 &&\
> 
> Urgh, this is horrible: you are completely bypassing Buildroot's download
> infrastructure. Please use it:
> 
> <pkg>_VERSION = lsdk1909
> <pkg>_SITE =
> https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.nxp.
> com%2Flgfiles%2Fsdk%2Flsdk1909%2F&amp;data=02%7C01%7Cjerry.huang%4
> 0nxp.com%7C9c92f3028db94a45041a08d76d99e558%7C686ea1d3bc2b4c6fa9
> 2cd99c5c301635%7C0%7C0%7C637098380050336719&amp;sdata=NJTQlJNknn
> I3Dmi62e%2B06a%2BoI%2BzD8nT2DtXTS27c3SU%3D&amp;reserved=0
> <pkg>_SOURCE = firmware-cadence-$(<pkg>_VERSION).bin
> 
> define <pkg>_EXTRACT_CMDS
>         cd $(@D); \
>                 sh $(<pkg>_DL_DIR)/$(<pkg>_SOURCE) --auto-accept endef
> 
> > +define CADENCE_INSTALL_IMAGES_CMDS
> > +     cp $(@D)/firmware-cadence-lsdk1909/dp/$(DP_BIN)
> > +$(BINARIES_DIR)/;
> 
> Use:
> 
>         $(INSTALL) -D -m 0644
> $(@D)/firmware-cadence-lsdk1909/dp/ls1028a-dp-fw.bin
> $(BINARIES_DIR)/ls1028a-dp-fw.bin
? I will following the download infrastructure.

> Also, please add the appropriate licensing information, since there is a COPYING
> file in the archive.
Ok, will add the license information

> Thanks!
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.c
> om&amp;data=02%7C01%7Cjerry.huang%40nxp.com%7C9c92f3028db94a4504
> 1a08d76d99e558%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637
> 098380050336719&amp;sdata=1KYF0jJSSz75f%2FthSq5U3BPIoYst%2BqnqpVAe
> uYsMUD0%3D&amp;reserved=0
