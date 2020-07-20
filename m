From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Mon, 20 Jul 2020 15:49:44 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/systemd: make a couple
 dependencies optional
In-Reply-To: <CADYdroO=GZy+TghL+XS6EqPNJT+yEUUxQ5O6+JdL=WCCp+Oa4A@mail.gmail.com>
References: <20200717234256.17942-1-nolange79@gmail.com>
 <20200718202457.GO18825@scaer>
 <CADYdroO=GZy+TghL+XS6EqPNJT+yEUUxQ5O6+JdL=WCCp+Oa4A@mail.gmail.com>
Message-ID: <CAFvCimV-EkT-2sC3NphGuiPHXrBR1yd1b53mBL3F5=dubi9HjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain had a serie enabling systemd's self-test, but I'm not sure what
happened to it...

Le lun. 20 juil. 2020 ? 01:15, Norbert Lange <nolange79@gmail.com> a ?crit :

> Am Sa., 18. Juli 2020 um 22:25 Uhr schrieb Yann E. MORIN
> <yann.morin.1998@free.fr>:
> >
> > Norbert, All,
> >
> > On 2020-07-18 01:42 +0200, Norbert Lange spake thusly:
> > > Remove BR2_PACKAGE_UTIL_LINUX_BINARIES, as none
> > > of the tools is necessary.
> > >
> > > Remove BR2_PACKAGE_UTIL_LINUX_LIBBLKID, as this is optional.
> > > Aslong as MOUNT or FSCK are enabled, it will end up enabled
> > > anyway, but this seems more clear and correct.
> > >
> > > Remove BR2_PACKAGE_UTIL_LINUX_NOLOGIN, if this option is not
> > > enabled then fall back to using /bin/false instead.
> > >
> > > For importd, remove BR2_PACKAGE_BZIP2 and BR2_PACKAGE_LZ4,
> > > those arent dependencies.
> >
> > This patch does too many things. It should be at least split into four
> > patches:
> >
> >   - drop bzip2 and lz4 for importd
> >   - drop util-linux' binaries
> >   - make util-linux' nologin optional
> >   - make util-linux' libblkid optional
>
> Thats primary a matter of handling a set of patches and their rebases over
> quite some time.
>
> >
> > Also, I would extra love that we add a runtime test for this
> > stripped-down systemd settings, to check that a minimalist systemd still
> > works as expected
>
> Issue of time (lack thereof).
> I can guarantee you that I run a pretty minimal configuration (removed
> dbus/dbus-broker aswell),
> but I suspect that's not really tested upstream.
>
> Some better definition of what to expect of a functional systemd would
> be nice tho.
>
> > Not only will a runtime test help get confidence in this kind of
> > patches, but will help notice any breakage when we later update systemd
> > to a newer version.
> >
> > If at least because of the first point, I've marked this patch as
> > "changes requested" in patchwork.
>
> TBH I don't look at that, tried to wake up maintainers a few times by
> changing state did not seem to work either ;)
>
> >
> > Please, could you also mark any patch that is superseded in your
> > original series, now:
> >     https://patchwork.ozlabs.org/project/buildroot/list/?series=183318
>
> Done.
>
> >
> > Regards,
> > Yann E. MORIN.
> >
> > > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > > ---
> > > v1->v2:
> > > -   undo a copy-paste mistake in the repart section
> > > -   Drop some dependencies for importd aswell
> > >
> > > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > > ---
> > >  package/systemd/Config.in  |  5 -----
> > >  package/systemd/systemd.mk | 13 ++++++++++++-
> > >  2 files changed, 12 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> > > index dd3b8c534d..f754b9d0cf 100644
> > > --- a/package/systemd/Config.in
> > > +++ b/package/systemd/Config.in
> > > @@ -28,12 +28,9 @@ menuconfig BR2_PACKAGE_SYSTEMD
> > >       select BR2_PACKAGE_DBUS # runtime dependency only
> > >       select BR2_PACKAGE_LIBCAP
> > >       select BR2_PACKAGE_UTIL_LINUX
> > > -     select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> > >       select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
> > > -     select BR2_PACKAGE_UTIL_LINUX_BINARIES
> > >       select BR2_PACKAGE_UTIL_LINUX_AGETTY
> > >       select BR2_PACKAGE_UTIL_LINUX_MOUNT
> > > -     select BR2_PACKAGE_UTIL_LINUX_NOLOGIN
> > >       select BR2_PACKAGE_UTIL_LINUX_FSCK
> > >       select BR2_PACKAGE_KMOD
> > >       select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
> > > @@ -240,8 +237,6 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
> > >       depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
> > >       select BR2_PACKAGE_LIBCURL
> > >       select BR2_PACKAGE_LIBGCRYPT
> > > -     select BR2_PACKAGE_BZIP2
> > > -     select BR2_PACKAGE_LZ4
> > >       select BR2_PACKAGE_XZ
> > >       select BR2_PACKAGE_ZLIB
> > >       help
> > > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > > index c09ada091a..1b94ffc67a 100644
> > > --- a/package/systemd/systemd.mk
> > > +++ b/package/systemd/systemd.mk
> > > @@ -25,7 +25,6 @@ SYSTEMD_CONF_OPTS += \
> > >       -Dsysvinit-path= \
> > >       -Dsysvrcnd-path= \
> > >       -Dutmp=false \
> > > -     -Dblkid=true \
> > >       -Dman=false \
> > >       -Dima=false \
> > >       -Dldconfig=false \
> > > @@ -205,6 +204,18 @@ else
> > >  SYSTEMD_CONF_OPTS += -Dpcre2=false
> > >  endif
> > >
> > > +ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
> > > +SYSTEMD_CONF_OPTS += -Dblkid=true
> > > +else
> > > +SYSTEMD_CONF_OPTS += -Dblkid=false
> > > +endif
> > > +
> > > +ifeq ($(BR2_PACKAGE_UTIL_LINUX_NOLOGIN),y)
> > > +SYSTEMD_CONF_OPTS += -Dnologin-path=/usr/sbin/nologin
> > > +else
> > > +SYSTEMD_CONF_OPTS += -Dnologin-path=/bin/false
> > > +endif
> > > +
> > >  ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY),y)
> > >  SYSTEMD_DEPENDENCIES += libmicrohttpd
> > >  SYSTEMD_CONF_OPTS += -Dmicrohttpd=true
> > > --
> > > 2.27.0
> > >
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
>
> Norbert
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200720/82e98134/attachment.html>
