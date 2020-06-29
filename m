From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Mon, 29 Jun 2020 09:31:09 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/haveged: Change service file
 to run early
In-Reply-To: <CADYdroMM5zNtnQ8J7soZo+Vnv6eSuZFVj6Bq+GyZ4UyB4xkEgg@mail.gmail.com>
References: <20200609224116.13607-1-nolange79@gmail.com>
 <20200609224116.13607-2-nolange79@gmail.com>
 <CADYdroMM5zNtnQ8J7soZo+Vnv6eSuZFVj6Bq+GyZ4UyB4xkEgg@mail.gmail.com>
Message-ID: <CAFvCimVKi8eTQHnO6t0ZhcT86X74hqyM4JzQTJ_XWyxNVSFAWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Well
I still think you need Before=systemd-random-seed.service and I don't
understand why you are reluctant to add it.
(Honestly, I think the Before= and your work to make it an early boot
service should be upstreamed)

So, i'm a bit reluctant to give my reviewed-by. Again, it's not worse than
it was, but if you want
to make sure that all services that need randomness are correctly started
after haveged, then
you have to add that Before=

I won't block the patch going in if a BR maintainer want to commit it, but
i'd like to understand why you are reluctant
to add that

Regards
Jeremy

Le ven. 26 juin 2020 ? 00:39, Norbert Lange <nolange79@gmail.com> a ?crit :

> Jeremy,
>
> Can you have a look and add your reviewed-by pls?
> No drastic changes from v1, except adding a few isolation options from
> the upstream fedora service file.
>
> Am Mi., 10. Juni 2020 um 00:42 Uhr schrieb Norbert Lange <
> nolange79 at gmail.com>:
> >
> > Drop default dependencies, haveged needs nothing but
> > local sockets and /dev/random.
> >
> > The service file now mostly matches the upstream fedora file,
> > except alot of isolation options have been dropped.
> > The benefit for a completely controlled system is small,
> > and those option would pull in dependencies, delaying
> > entropy being filled up.
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > ---
> >  package/haveged/haveged.service | 22 +++++++++++++++++-----
> >  1 file changed, 17 insertions(+), 5 deletions(-)
> >
> > diff --git a/package/haveged/haveged.service
> b/package/haveged/haveged.service
> > index 91035c6711..cfdaa93a37 100644
> > --- a/package/haveged/haveged.service
> > +++ b/package/haveged/haveged.service
> > @@ -1,10 +1,22 @@
> >  [Unit]
> > -Description=Entropy Harvesting Daemon
> > -Documentation=man:haveged(8)
> > +# inspiration from upstream init.d/service.fedora
> > +Description=Entropy Daemon based on the HAVEGE algorithm
> > +Documentation=man:haveged(8) http://www.issihosts.com/haveged/
> > +DefaultDependencies=no
> > +# This would wait for filesystems, but we only need /dev/random,
> > +# which is certainly available after systemd initialised
> > +# After=systemd-tmpfiles-setup-dev.service
> > +Before=sysinit.target shutdown.target systemd-journald.service
> >
> >  [Service]
> > -ExecStart=/usr/sbin/haveged -F -w 1024 -v 1
> > -SuccessExitStatus=143
> > +ExecStart=/usr/sbin/haveged -w 1024 -v 1 --Foreground
> > +Restart=always
> > +SuccessExitStatus=137 143
> > +
> > +# Only simple isolation methods that dont pull in dependencies
> > +CapabilityBoundingSet=CAP_SYS_ADMIN
> > +SecureBits=noroot-locked
> > +ProtectSystem=full
> >
> >  [Install]
> > -WantedBy=multi-user.target
> > +WantedBy=sysinit.target
> > --
> > 2.26.2
> >
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200629/c2145c44/attachment.html>
