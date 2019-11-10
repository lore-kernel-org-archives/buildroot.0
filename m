From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Sun, 10 Nov 2019 11:19:42 +0100
Subject: [Buildroot] [PATCH 07/15] package/connman: adapt to preset-all
In-Reply-To: <CADvTj4rOOCzeF2FRPqfqpvLsNmr_yA2uKo2NsJGJ-vZONcwgVA@mail.gmail.com>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
 <20191103165640.21819-8-jeremy.rosen@smile.fr>
 <20191109221139.GT3419@scaer>
 <CADvTj4rOOCzeF2FRPqfqpvLsNmr_yA2uKo2NsJGJ-vZONcwgVA@mail.gmail.com>
Message-ID: <CAFvCimXS=t0S3zNySwBzpF2tqp9e4gZW3oTpwnjwdAr1h52yGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, the whole "*-wait-online" mechanism is a boot synchronisation thing.

The point is to delay starting of all network-facing daemon until
* either the network is up (DHCP dialog is done)
* or the network has failed (and won't be brought up at all during boot)

The exact implementation depends on your network-manager, so it might be
different
for NetworkManager, connman or systemd-networkd.

That being said, I have never heard of any of those "phoning home" They
just wait for the
end of the network configuration.

Moreover, since sysV, network-facing daemons have always been delayed after
the
network was up (through unit.d file ordering) and changing that might break
things in
subtle ways.

I'm pretty sure it's a bug, I'll leave them enable for v2, but we can
discuss it some more if you want...


Le sam. 9 nov. 2019 ? 23:36, James Hilliard <james.hilliard1@gmail.com> a
?crit :

> On Sat, Nov 9, 2019 at 3:11 PM Yann E. MORIN <yann.morin.1998@free.fr>
> wrote:
> >
> > J?r?my, All,
> >
> > On 2019-11-03 17:56 +0100, J?r?my Rosen spake thusly:
> > > connman has two services
> > > * connman.service which is the real daemon
> > > * connman-wait-online.service which is a sync point for
> network-online.target
> > >
> > > Only the first one was enabled. This adaptation enables both.
> > >
> > > Not enabling connman-wait-online.service is probably a bug
> >
> > Actually no, that's not a bug; not enabling it is a privacy feature.
> > Some people are concerned about the phone-home-alike that check-online
> > may do.
> I don't think connman-wait-online.service phones home, it appears to wait
> for
> an interface to be live which should not impact privacy.
> See:
>
> https://git.kernel.org/pub/scm/network/connman/connman.git/tree/src/connman-wait-online.service.in?h=1.37&id=caf6895ee2ea3b6ed58213ca8bacd0ec32f7e31c#n11
>
> https://git.kernel.org/pub/scm/network/connman/connman.git/tree/src/connmand-wait-online.c
> According to: https://01.org/connman/blogs/pflykt/2015/connman-1.31
> connmand-wait-online
> <https://01.org/connman/blogs/pflykt/2015/connman-1.31connmand-wait-online>
> works exactly like systemd-networkd-wait-online
> which does not appear to phone home per:
>
> https://www.freedesktop.org/software/systemd/man/systemd-networkd-wait-online.service.html
> but rather waits until the interface is online.
> >
> > Regards,
> > Yann E. MORIN.
> >
> > > Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> > > ---
> > >  package/connman/connman.mk | 6 ------
> > >  1 file changed, 6 deletions(-)
> > >
> > > diff --git a/package/connman/connman.mk b/package/connman/connman.mk
> > > index 839bc7a0e2..d70eb1ac82 100644
> > > --- a/package/connman/connman.mk
> > > +++ b/package/connman/connman.mk
> > > @@ -32,12 +32,6 @@ define CONNMAN_INSTALL_INIT_SYSV
> > >       $(INSTALL) -m 0755 -D package/connman/S45connman
> $(TARGET_DIR)/etc/init.d/S45connman
> > >  endef
> > >
> > > -define CONNMAN_INSTALL_INIT_SYSTEMD
> > > -     mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> > > -     ln -fs ../../../../usr/lib/systemd/system/connman.service \
> > > -
>  $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/connman.service
> > > -endef
> > > -
> > >  ifeq ($(BR2_PACKAGE_CONNMAN_CLIENT),y)
> > >  CONNMAN_CONF_OPTS += --enable-client
> > >  CONNMAN_DEPENDENCIES += readline
> > > --
> > > 2.24.0.rc1
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> > --
> >
> .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>        |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There
> is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
> >
> '------------------------------^-------^------------------^--------------------'
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191110/6ec8e8ac/attachment.html>
