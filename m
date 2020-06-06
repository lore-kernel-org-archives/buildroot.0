From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 7 Jun 2020 00:36:47 +0200
Subject: [Buildroot] [PATCH 2/2] package/dbus: remove /usr/lib/dbus-1.0
 if empty
In-Reply-To: <20200606223808.5797eb98@windsurf>
References: <20200605225247.13350-1-nolange79@gmail.com>
 <20200605225247.13350-2-nolange79@gmail.com>
 <20200606223808.5797eb98@windsurf>
Message-ID: <CADYdroNQNLa3a2TkgJoPJgj460+XD7rRcwWYKaa_2bV9sqejGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sa., 6. Juni 2020 um 22:38 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Sat,  6 Jun 2020 00:52:46 +0200
> Norbert Lange <nolange79@gmail.com> wrote:
>
> > ---
> >  package/dbus/dbus.mk | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
>
> Your Signed-off-by is missing, and there is no commit log. We clearly
> need a better explanation. And your commit title is wrong: you're not
> just removing /usr/lib/dbus-1.0 is empty: you're changing from removing
> it unconditionally to removing just /usr/lib/dbus-1.0/include and then
> removing /usr/lib/dbus-1.0 if it's empty.

Ok, gonna improve that in a v2 if you find no other objections

>
> So it means that you have installed *something* in /usr/lib/dbus-1.0
> that you want Buildroot to keep on the target. But what? This is not
> explained in your commit log.

I wrote this commit some months ago, would have to outright lie, but I
think it was dbusbroker (patch on the ML).
The basic gist is, that /usr/lib/dbus-1.0 is some sort of libexec dir
(on Debian and Fedora AFAIK), and I believe dbusbroker installs it
stuff there.

What we really want is to remove the unneeded files (the includes),
and the parent directory it is empty.

>
> > diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
> > index bb9f17a5e0..7a7762f537 100644
> > --- a/package/dbus/dbus.mk
> > +++ b/package/dbus/dbus.mk
> > @@ -80,7 +80,8 @@ endef
> >  DBUS_PRE_INSTALL_TARGET_HOOKS += DBUS_REMOVE_VAR_LIB_DBUS
> >
> >  define DBUS_REMOVE_DEVFILES
> > -     rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0
> > +     rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0/include
> > +     -rmdir $(TARGET_DIR)/usr/lib/dbus-1.0 2>/dev/null
>
> Can we use --ignore-fail-on-non-empty instead ? Yann, is this option
> reasonably available even on old distributions ?
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Norbert
