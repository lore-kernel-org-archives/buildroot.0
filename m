From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 9 Nov 2019 15:25:39 -0700
Subject: [Buildroot] [PATCH 11/15] package/network-manager: adapt to
 preset-all
In-Reply-To: <20191109221420.GU3419@scaer>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
 <20191103165640.21819-12-jeremy.rosen@smile.fr>
 <20191109221420.GU3419@scaer>
Message-ID: <CADvTj4rCFU4YRi3A-60w4qobvYW2_D1uhcv2Qs4Ue_quGPNwjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 9, 2019 at 3:14 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> J?r?my, All,
>
> On 2019-11-03 17:56 +0100, J?r?my Rosen spake thusly:
> > NM has three services
> > * NetworkManger.service : the main daemon
> > * NetworkManger-dispatcher.service : a daemon handling network callbacks
> > * NetworkManager-wait-online.service : sync of other services with network-online
> >
> > Only the first two were activated. We now also enable
> > wait-online. Not enabling it was probably a bug.
>
> Same as for connman: it was intentional that this was not enabled.
>
> And besides the privacy concerns, some devices are never exposed to the
> real internet, and always only ever stay on closed networkd, so
> wait-online could not phone home to detect connectivity anyway.
I don't think that is actually how it works, AFAICT it just waits for
networkmanager startup, see here:
https://github.com/NetworkManager/NetworkManager/blob/1.20.6/data/NetworkManager-wait-online.service.in#L10
per nm-online help:
-s, --wait-for-startup      Wait for NetworkManager startup instead of
a connection
>
> Regards,
> Yann E. MORIN.
>
> > Note that buildroot adds an alias dbus-org.freedesktop.NetworkManager
> > Adding an alias that is not known upstream is not clean,
> > but I left it for backward compatibility
> >
> > Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> > ---
> >  package/network-manager/network-manager.mk | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> > index 6412d3a241..67e6a76774 100644
> > --- a/package/network-manager/network-manager.mk
> > +++ b/package/network-manager/network-manager.mk
> > @@ -88,16 +88,9 @@ define NETWORK_MANAGER_INSTALL_INIT_SYSV
> >  endef
> >
> >  define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
> > -     mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> > -
> >       ln -sf /usr/lib/systemd/system/NetworkManager.service \
> >               $(TARGET_DIR)/etc/systemd/system/dbus-org.freedesktop.NetworkManager.service
> >
> > -     ln -sf /usr/lib/systemd/system/NetworkManager.service \
> > -             $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/NetworkManager.service
> > -
> > -     ln -sf /usr/lib/systemd/system/NetworkManager-dispatcher.service \
> > -             $(TARGET_DIR)/etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service
> >  endef
> >
> >  $(eval $(autotools-package))
> > --
> > 2.24.0.rc1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
