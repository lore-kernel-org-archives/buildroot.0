From: Jerry Huang <jerry.huang@nxp.com>
Date: Thu, 6 Feb 2020 03:41:46 +0000
Subject: [Buildroot] [EXT] Re: [PATCH v4 1/9] package/nxp: new package
 directory
In-Reply-To: <CAEyMn7YhNQE8AaUu7vzpoO-TPcYgr5qWADKB-geq3AAj_MHZdw@mail.gmail.com>
References: <20200205105227.13698-1-jerry.huang@nxp.com>
 <CAEyMn7YhNQE8AaUu7vzpoO-TPcYgr5qWADKB-geq3AAj_MHZdw@mail.gmail.com>
Message-ID: <VI1PR04MB5136E5E9F34B5A91437E89B2FE1D0@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Best Regards
Jerry Huang

> -----Original Message-----
> From: Heiko Thiery <heiko.thiery@gmail.com>
> Sent: Wednesday, February 5, 2020 10:09 PM
> To: Jerry Huang <jerry.huang@nxp.com>
> Cc: buildroot at busybox.net; olteanv at gmail.com; Michael Walle
> <michael@walle.cc>; geomatsi at gmail.com; matthew.weber at collins.com;
> Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Subject: [EXT] Re: [Buildroot] [PATCH v4 1/9] package/nxp: new package
> directory
> 
> Caution: EXT Email
> 
> Hi Changming,
> 
> >
> +###############################################################
> ######
> > +###########
> > +#
> > +# helper
> > +#
> >
> +###############################################################
> ######
> > +###########
> > +
> > +# Helper for self-extracting binaries distributed by NXP.
> > +#
> > +# The --force option makes sure it doesn't fail if the source #
> > +directory already exists. The --auto-accept skips the license check,
> > +# as it is not needed in Buildroot because we have legal-info. Since
> > +# there's a EULA in the binary file, we extract it in this macro, and
> > +# it should therefore be added to the LICENSE_FILES variable of #
> > +packages using this macro. Also, remember to set REDISTRIBUTE to #
> > +"NO". Indeed, this is a legal minefield: the EULA specifies that the
> > +# Board Support Package includes software and hardware (sic!) for #
> > +which a separate license is needed...
> > +#
> > +# $(1): full path to the archive file # define NXP_EXTRACT_HELPER
> > +       awk 'BEGIN      { start = 0; } \
> > +            /^EOEULA/  { start = 0; } \
> > +                       { if (start) print; } \
> > +            /<<EOEULA/ { start = 1; }' \
> > +           $(1) > $(@D)/EULA
> > +       cd $(@D) && sh $(1) --force --auto-accept
> > +       find $(@D)/$(basename $(notdir $(1))) -mindepth 1 -maxdepth 1
> -exec mv {} $(@D) \;
> > +       rmdir $(@D)/$(basename $(notdir $(1))) endef
> > +
> > +include $(sort $(wildcard package/nxp/*/*.mk))
> 
> This seems to be a duplication of the FREESCALE_IMX_EXTRACT_HELPER, isn't
> it?
> Do we then can remove the other one and use only the new "nxp" one?
> 
> By the way is there a plan to move all NXP specific packages (qoriq and imx) to
> the nxp subdir?
Yes, the helper is the duplication of FREESCALE_IMX_EXTRACT_HELPER.
Because Freescale is merged into NXP a few years ago, according to NXP's policy, we need to use nxp, instead of freescale.
So, I think the packages related NXP should be move into nxp directory.

> --
> Heiko
