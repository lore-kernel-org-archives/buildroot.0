From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Mon, 4 Nov 2019 18:03:56 +0100
Subject: [Buildroot] [PATCH 10/15] package/docker-engine: adapt to
 preset-all
In-Reply-To: <CADvTj4pQoKP8xHfSB7njnLaT-r8n-LkKVLf40++PnraHNm-dPg@mail.gmail.com>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
 <20191103165640.21819-11-jeremy.rosen@smile.fr>
 <CADvTj4pQoKP8xHfSB7njnLaT-r8n-LkKVLf40++PnraHNm-dPg@mail.gmail.com>
Message-ID: <CAFvCimV_21j65+yoL2-+FW9abFOMQMoJgi80_D+NRaw6Uy74kQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In that case, it's open to discussion. Enabling both means that it's
started at boot, and the socket enablement does nothing.

Adding the socket means that it would automatically restart, once stopped
on connexions.

Enabling both is harmless, so I'll follow your advice

Le dim. 3 nov. 2019 ? 18:25, James Hilliard <james.hilliard1@gmail.com> a
?crit :

> On Sun, Nov 3, 2019 at 11:57 AM J?r?my Rosen <jeremy.rosen@smile.fr>
> wrote:
> >
> > docker-engine has two services:
> > * docker.service, if enabled: docker will start at boot
> > * docker.socket, if enabled: docker will start at first connection
> >
> > buildroot currently enables only the service
> > this patch keeps it that way.
> The socket not being enabled looks to be a bug so I don't think it
> should be disabled.
> >
> > Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> > ---
> >  package/docker-engine/50-docker-engine.preset | 1 +
> >  package/docker-engine/docker-engine.mk        | 5 ++---
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >  create mode 100644 package/docker-engine/50-docker-engine.preset
> >
> > diff --git a/package/docker-engine/50-docker-engine.preset
> b/package/docker-engine/50-docker-engine.preset
> > new file mode 100644
> > index 0000000000..0d8cf35345
> > --- /dev/null
> > +++ b/package/docker-engine/50-docker-engine.preset
> > @@ -0,0 +1 @@
> > +disable docker.socket
> > diff --git a/package/docker-engine/docker-engine.mk
> b/package/docker-engine/docker-engine.mk
> > index 6a225ee5f0..8540cda9af 100644
> > --- a/package/docker-engine/docker-engine.mk
> > +++ b/package/docker-engine/docker-engine.mk
> > @@ -68,9 +68,8 @@ define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
> >                 $(TARGET_DIR)/usr/lib/systemd/system/docker.service
> >         $(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.socket \
> >                 $(TARGET_DIR)/usr/lib/systemd/system/docker.socket
> > -       mkdir -p
> $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
> > -       ln -fs ../../../../usr/lib/systemd/system/docker.service \
> > -
>  $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/docker.service
> > +       $(INSTALL) -D -m 644
> package/docker-engine/50-docker-engine.preset \
> > +
>  $(TARGET_DIR)/usr/lib/systemd/system-preset/50-docker-engine.preset
> >  endef
> >
> >  define DOCKER_ENGINE_INSTALL_INIT_SYSV
> > --
> > 2.24.0.rc1
> >
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191104/f8e9e11d/attachment.html>
