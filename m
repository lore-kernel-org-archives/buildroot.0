From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Mar 2021 17:09:24 +0100
Subject: [Buildroot] [PATCH 4/4] package/mender: Do not automatically
 select uboot tools if uboot is selected
In-Reply-To: <CAFSsvmoXU1x1OV9RjVQ-U8J8gFC8fDDatsQ6NNjh=msEGogbBg@mail.gmail.com>
References: <20210307222536.2743089-1-aduskett@gmail.com>
 <20210307222536.2743089-5-aduskett@gmail.com>
 <20210314231507.7336bf4f@windsurf.home>
 <CAFSsvmoXU1x1OV9RjVQ-U8J8gFC8fDDatsQ6NNjh=msEGogbBg@mail.gmail.com>
Message-ID: <20210315170924.32fd0f7a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Mar 2021 08:44:35 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> > > -     select BR2_PACKAGE_UBOOT_TOOLS if BR2_TARGET_UBOOT # runtime
> > > -     select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV if BR2_TARGET_UBOOT # runtime  
> >
> > It's a bit odd to drop these.
> >  
> Not really, because mender-grubenv has it's own fake fw_printenv.
> 
> > >       help
> > >         Mender is an open source over-the-air (OTA) software updater
> > >         for embedded Linux devices. Mender comprises a client
> > >         running at the embedded device, as well as a server that
> > >         manages deployments across many devices.
> > >
> > > +       Note:
> > > +       For systems using uboot as the bootloader:
> > > +         - uboot must be patched with the mender uboot patches.
> > > +         - uboot-tools must be selected.
> > > +         - fw_printenv must be functional on the device.  
> >
> > Indeed, here you are precisely saying that fw_printenv is needed. What
> > about keeping the selects *and* adding your Config.in comment, perhaps
> > without the "uboot-tools must be selected". It would be nice to have
> > some more specific reference to the Mender U-Boot patches.  
> The problem with this suggestion is that mender-grubenv has its own
> fw_printenv. So if both were built then
> uboot's fw_printenv may be built last, which would overwrite the
> fw_printenv provided by mender-grubenv.

Ah, so the problem comes from the situation where both U-Boot and grub
are enabled, I see. I still find that a very odd combination, are there
really people who do that?

That being said, with that info, indeed you can't really know if
U-Boot's fw_printenv should be used, or mender-grubenv's fw_printenv
should be used, so not selecting any of them probably makes the most
sense.

> I could provide a URL to the meta-mender repository for links to the
> uboot patches. Would that work?

That would certainly be a useful addition.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
