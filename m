From: Carlos Santos <unixmania@gmail.com>
Date: Mon, 24 Feb 2020 23:54:16 -0300
Subject: [Buildroot] [PATCH] package/eudev: add openrc init support
In-Reply-To: <20200224223809.0d780063@windsurf>
References: <20200224205255.9138-1-unixmania@gmail.com>
 <20200224223809.0d780063@windsurf>
Message-ID: <CAJ4jsaf6gCoLbc3U6=Haf0_uiGSXFfhx1nni7tzsARM1cvuv8w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 24, 2020 at 6:38 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Mon, 24 Feb 2020 17:52:55 -0300
> unixmania at gmail.com wrote:
>
> > From: Carlos Santos <unixmania@gmail.com>
> >
> > Use the Gentoo scripts for openrc.
> >
> > Signed-off-by: Carlos Santos <unixmania@gmail.com>
>
> Thanks! Glad to see you're picking up some of the OpenRC effort.
>
> > +ifeq ($(BR2_INIT_OPENRC),y)
> > +EUDEV_OPENRC_INIT_VERSION = 33
> > +EUDEV_OPENRC_INIT = udev-gentoo-scripts-$(EUDEV_OPENRC_INIT_VERSION).tar.bz2
> > +EUDEV_EXTRA_DOWNLOADS = https://gitweb.gentoo.org/proj/udev-gentoo-scripts.git/snapshot/$(EUDEV_OPENRC_INIT)
> > +define EUDEV_OPENRC_INIT_EXTRACT
> > +     $(call suitable-extractor,$(notdir $(EUDEV_OPENRC_INIT))) \
> > +             $(EUDEV_DL_DIR)/$(notdir $(EUDEV_OPENRC_INIT)) | \
> > +             $(TAR) -C $(@D) $(TAR_OPTIONS) -
> > +endef
> > +EUDEV_POST_EXTRACT_HOOKS += EUDEV_OPENRC_INIT_EXTRACT
> > +endif
>
> I think I would really prefer this to be handled by a separate package,
> because that's really what you're doing here. So let's have a
> udev-gentoo-scripts package, which eudev can select when OpenRC is the
> init system. I suppose there is no need for a build-time dependency
> between the two, so just selecting at the Config.in level is probably
> enough.
>
> What do you think ?

I sent a second patch but quite frankly I don't think it's worthwhile
to add a packge.

BTW, that hack required to prevent installing the sysvinit script in
eudev.mk is ugly.

-- 
Carlos Santos <unixmania@gmail.com>
