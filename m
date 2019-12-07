From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Sat, 7 Dec 2019 13:19:45 +0100
Subject: [Buildroot] [PATCH v2 6/9] package/connman: adapt to preset-all
In-Reply-To: <20191205125722.GG2539@scaer>
References: <20191111172443.6874-1-jeremy.rosen@smile.fr>
 <20191111172443.6874-7-jeremy.rosen@smile.fr>
 <20191205125722.GG2539@scaer>
Message-ID: <CAFvCimUSuA9DfMmJ2A9Uk1wBCfdJF7zta1-bRgf=XYOs+mg_Og@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The network-online is a bit complicated...

* network-managers provide XXX-wait-online.service
   * block until "the network is up" (whatever that means for that
particular NM)
   * WantedBy= and Before= network-online.target
* systemd provides network-online.target, which is thus always available,
but not started as part of the boot process
* any daemon that wants to be started after the network is up has Wants=
and After= network-online.target

So, technically, with systemd the network is not configured at boot time.
It is configured before we start a
daemon that needs the network.

Now, if no NM provide any XXX-wait-online.service, network-online.target
will be started right away, it will not
wait for the network to be up and the dependant services too early.

This is consistent with the network-online.target semantic which is "the
point during the boot where either the
network is up or the network has failed"
If there is no NM at all, there is no network, so network-online triggers
immediately.

Le jeu. 5 d?c. 2019 ? 13:57, Yann E. MORIN <yann.morin.1998@free.fr> a
?crit :

> J?r?my, All,
>
> On 2019-11-11 18:24 +0100, J?r?my Rosen spake thusly:
> > connman has two services
> > * connman.service which is the real daemon
> > * connman-wait-online.service which is a sync point for
> network-online.target
> >
> > Only the first one was enabled. This adaptation enables both.
> >
> > Not enabling connman-wait-online.service is probably a bug
>
> If that was not installed so far, what would provide for the
> network-online.target instead? Or was that target always satisfied?
>
> BTW, you forgot your SoB line too.
>
> Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  package/connman/connman.mk | 6 ------
> >  1 file changed, 6 deletions(-)
> >
> > diff --git a/package/connman/connman.mk b/package/connman/connman.mk
> > index 839bc7a0e2..d70eb1ac82 100644
> > --- a/package/connman/connman.mk
> > +++ b/package/connman/connman.mk
> > @@ -32,12 +32,6 @@ define CONNMAN_INSTALL_INIT_SYSV
> >       $(INSTALL) -m 0755 -D package/connman/S45connman
> $(TARGET_DIR)/etc/init.d/S45connman
> >  endef
> >
> > -define CONNMAN_INSTALL_INIT_SYSTEMD
> > -     mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> > -     ln -fs ../../../../usr/lib/systemd/system/connman.service \
> > -
>  $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/connman.service
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
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191207/d5cf99b6/attachment.html>
