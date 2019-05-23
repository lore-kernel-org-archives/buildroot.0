From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Thu, 23 May 2019 16:00:35 +0300
Subject: [Buildroot] [PATCH] package: dropbear: add support for
 displaying /etc/motd
In-Reply-To: <20190523142857.625748aa@windsurf.home>
References: <20190523121115.26098-1-ardeleanalex@gmail.com>
 <20190523142857.625748aa@windsurf.home>
Message-ID: <CA+U=DspkdLJKrQojQ0znt_M51hWwtbX_myL5Or6iEb7hDQ2pFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 23, 2019 at 3:28 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Alexandru,
>
> On Thu, 23 May 2019 15:11:15 +0300
> Alexandru Ardelean <ardeleanalex@gmail.com> wrote:
>
> > When dropbear changed the way how to configure things, by providing a
> > `localoptions.h` file, it also defaulted (somehow) to disable the display
> > of /etc/motd by default.
> >
> > This can be configured by adding a `#define DO_MOTD 1` in the
> > `localoptions.h`, which requires it's own `BR2_PACKAGE_DROPBEAR_MOTD`
> > Kconfig option.
> >
> > By default, support for displaying `/etc/motd` on login is disabled.
> >
> > Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
>
> Thanks for your patch.
>
> > +config BR2_PACKAGE_DROPBEAR_MOTD
> > +     bool "display motd on login"
> > +     help
> > +       Add support for displaying the contents of /etc/motd
> > +       when a user logs into a SSH session.
>
> In fact, I am a bit worried by all those additional dropbear options to
> tweak "minor" details of the dropbear configuration.
>
> Perhaps we should bite the bullet and add an option like this:
>
> config BR2_PACKAGE_DROPBEAR_CONFIG_FILE
>         string "path to dropbear config file"
>         help
>           Path to a file whose contents will be appended to Dropbear
>           localoptions.h. It can be used to tweak the Dropbear
>           configuration.
>
> And then, in the .mk:
>
> DROPBEAR_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_DROPBEAR_CONFIG_FILE))
> ifneq ($(DROPBEAR_CONFIG_FILE),)
> define DROPBEAR_APPEND_CONFIG_FILE
>         cat $(DROPBEAR_CONFIG_FILE) >> $(@D)/localoptions.h
> endef
> DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_APPEND_CONFIG_FILE
> endif
>

I'd be fine with this approach as well.

> This way, we have something that is much more flexible, as it allows
> you to define whatever Dropbear option you like.
>
> Note: this is just a suggestion; I don't know what other
> maintainers/developers will think about it.
>
> Best regards,
>

Thanks
Alex

> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
