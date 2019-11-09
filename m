From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 9 Nov 2019 15:36:16 -0700
Subject: [Buildroot] [PATCH 07/15] package/connman: adapt to preset-all
In-Reply-To: <20191109221139.GT3419@scaer>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
 <20191103165640.21819-8-jeremy.rosen@smile.fr>
 <20191109221139.GT3419@scaer>
Message-ID: <CADvTj4rOOCzeF2FRPqfqpvLsNmr_yA2uKo2NsJGJ-vZONcwgVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 9, 2019 at 3:11 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> J?r?my, All,
>
> On 2019-11-03 17:56 +0100, J?r?my Rosen spake thusly:
> > connman has two services
> > * connman.service which is the real daemon
> > * connman-wait-online.service which is a sync point for network-online.target
> >
> > Only the first one was enabled. This adaptation enables both.
> >
> > Not enabling connman-wait-online.service is probably a bug
>
> Actually no, that's not a bug; not enabling it is a privacy feature.
> Some people are concerned about the phone-home-alike that check-online
> may do.
I don't think connman-wait-online.service phones home, it appears to wait for
an interface to be live which should not impact privacy.
See:
https://git.kernel.org/pub/scm/network/connman/connman.git/tree/src/connman-wait-online.service.in?h=1.37&id=caf6895ee2ea3b6ed58213ca8bacd0ec32f7e31c#n11
https://git.kernel.org/pub/scm/network/connman/connman.git/tree/src/connmand-wait-online.c
According to: https://01.org/connman/blogs/pflykt/2015/connman-1.31
connmand-wait-online works exactly like systemd-networkd-wait-online
which does not appear to phone home per:
https://www.freedesktop.org/software/systemd/man/systemd-networkd-wait-online.service.html
but rather waits until the interface is online.
>
> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> > ---
> >  package/connman/connman.mk | 6 ------
> >  1 file changed, 6 deletions(-)
> >
> > diff --git a/package/connman/connman.mk b/package/connman/connman.mk
> > index 839bc7a0e2..d70eb1ac82 100644
> > --- a/package/connman/connman.mk
> > +++ b/package/connman/connman.mk
> > @@ -32,12 +32,6 @@ define CONNMAN_INSTALL_INIT_SYSV
> >       $(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
> >  endef
> >
> > -define CONNMAN_INSTALL_INIT_SYSTEMD
> > -     mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> > -     ln -fs ../../../../usr/lib/systemd/system/connman.service \
> > -             $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/connman.service
> > -endef
> > -
> >  ifeq ($(BR2_PACKAGE_CONNMAN_CLIENT),y)
> >  CONNMAN_CONF_OPTS += --enable-client
> >  CONNMAN_DEPENDENCIES += readline
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
