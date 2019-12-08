From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Sun, 8 Dec 2019 23:16:19 +0100
Subject: [Buildroot] [PATCH v3 01/13] new recipe : host-systemd
In-Reply-To: <20191207185310.GO2539@scaer>
References: <20191207180049.3245578-1-jeremy.rosen@smile.fr>
 <20191207180049.3245578-2-jeremy.rosen@smile.fr> <20191207185310.GO2539@scaer>
Message-ID: <CAFvCimW83A8NFJo3vY9osfoU8TCgwc0WuYVhSXSvffJTAwPAAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le sam. 7 d?c. 2019 ? 19:53, Yann E. MORIN <yann.morin.1998@free.fr> a
?crit :

> J?r?my, All,
>
> On 2019-12-07 19:00 +0100, J?r?my Rosen spake thusly:
> > Add the infrastructure to build the host version of systemd
> > * disable all optional features, they can be re-added when needed
> > * systemd has creative way of dealing with cross compile
> >   we build a "normal" host systemd, but install it in $HOST_DIR
> >   we use systemctl --root to correctly act on TARGET_DIR
> > * we need to adjust RPATH using patchelf because meson can't do it
> >   correctly by itsel
> >
> > Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> > ---
> [--SNIP--]
> > +HOST_SYSTEMD_HOST_TOOLS = \
> > +     systemd-analyze  systemd-mount systemctl udevadm
>
> udevadm was not in your previous iteration, but now it is.
>
> This means that, when BR2_PACKAGE_SYSTEMD_HWDB=y, we now have two host
> packages that provide udevadm: host-systemd and host-eudev.
>
> We can't keep both.
>
> So, I would change BR2_PACKAGE_SYSTEMD_HWDB to drop the select to host
> eudev now; we don't need it anymore. If systemd is enabled, then
> host-systemd will always be built, so we will always have a udevadm.
>
> Regards,
> Yann E. MORIN.
>
> Fixed locally (also tested with 244)

I'll wait a couple of days for more reviews and i'll repost a v4


> > +define HOST_SYSTEMD_FIX_RPATH
> > +     $(foreach f,$(HOST_SYSTEMD_HOST_TOOLS), \
> > +             $(HOST_DIR)/bin/patchelf --set-rpath
> $(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd $(HOST_DIR)/bin/$(f)
> > +     )
> > +endef
> > +
> > +HOST_SYSTEMD_POST_INSTALL_HOOKS +=  HOST_SYSTEMD_FIX_RPATH
> > +HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
> > +
> > +$(eval $(host-meson-package))
> > --
> > 2.24.0
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191208/363c5425/attachment.html>
