From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Mon, 11 Nov 2019 11:09:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: hybrid cgroupfs
 hierarchy for docker compatibility
In-Reply-To: <CADvTj4o4m-CSrPiJ_FSLKzUhxTKacMRVRKFjf99jUgCrLJKhrQ@mail.gmail.com>
References: <20191111083348.3964650-1-christian@paral.in>
 <CADvTj4o4m-CSrPiJ_FSLKzUhxTKacMRVRKFjf99jUgCrLJKhrQ@mail.gmail.com>
Message-ID: <CAFvCimUCex67b=3_NMgM=aWwfL=jSaJ00FFZ+o4=fHStXTpt2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Keeping a list like that is going to be tricky...
Let's just hope the pressure on docker is strong enough and in a version or
two we can move to unified
also:
Tested-by: J?r?my Rosen <jeremy.rosen@smile.fr>

Le lun. 11 nov. 2019 ? 10:05, James Hilliard <james.hilliard1@gmail.com> a
?crit :

> On Mon, Nov 11, 2019 at 1:33 AM Christian Stewart <christian@paral.in>
> wrote:
> >
> > Docker fails to start with "Devices cgroup isn't mounted" as of systemd
> 243.
> > According to the systemd documentation:
> >
> >   systemd now defaults to the "unified" cgroup hierarchy setup during
> >   build-time, i.e. -Ddefault-hierarchy=unified is now the build-time
> default.
> >   Previously, -Ddefault-hierarchy=hybrid was the default. [...]
> Downstream
> >   production distributions might want to continue to use
> >   -Ddefault-hierarchy=hybrid (or even =legacy) for their builds as
> unfortunately
> >   the popular container managers have not caught up with the kernel API
> changes.
> >
> > Changing this option to "hybrid" or "legacy" fixes the Docker startup.
> >
> > Reference: https://github.com/opencontainers/runc/issues/654
> >
> > Signed-off-by: Christian Stewart <christian@paral.in>
> > ---
> >  package/systemd/systemd.mk | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index 94d5f703cd..92490eb86b 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -26,6 +26,7 @@ SYSTEMD_CONF_OPTS += \
> >         -Dima=false \
> >         -Dldconfig=false \
> >         -Ddefault-dnssec=no \
> > +       -Ddefault-hierarchy=hybrid \
> This should probably be conditionally enabled only when packages that
> don't support the unified cgroup hierarchy are enabled.
> >         -Dtests=false \
> >         -Dsplit-bin=true \
> >         -Dsplit-usr=false \
> > --
> > 2.24.0
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191111/5ce8548b/attachment.html>
