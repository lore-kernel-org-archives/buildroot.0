From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Mon, 4 Nov 2019 18:02:18 +0100
Subject: [Buildroot] [PATCH 01/15] new recipe : host-systemd
In-Reply-To: <CADvTj4o-OmADxosf4md8=cm63D0EUS+mo2ALA2D4odtv668w0Q@mail.gmail.com>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
 <20191103165640.21819-2-jeremy.rosen@smile.fr>
 <CADvTj4o-OmADxosf4md8=cm63D0EUS+mo2ALA2D4odtv668w0Q@mail.gmail.com>
Message-ID: <CAFvCimVNRXmoQJuxVBYRYZ7zbzpv+P3KoDPfronW9jFT71L13Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have to admit I have trouble testing/evaluationg the host-side
dependencies.
Systemd needs a kernel >= 3.13 according to the README.
Buildroot has no requirements for the host-side kernel right now, I'm not
really sure how to handle that. Advice welcomed.

Le dim. 3 nov. 2019 ? 18:20, James Hilliard <james.hilliard1@gmail.com> a
?crit :

> Does this depend on a minimum host kernel version? How should we be
> handling that?
>
> On Sun, Nov 3, 2019 at 11:57 AM J?r?my Rosen <jeremy.rosen@smile.fr>
> wrote:
> >
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
> >  package/Config.in.host         |  1 +
> >  package/systemd/Config.in.host |  4 ++
> >  package/systemd/systemd.mk     | 92 ++++++++++++++++++++++++++++++++++
> >  3 files changed, 97 insertions(+)
> >  create mode 100644 package/systemd/Config.in.host
> >
> > diff --git a/package/Config.in.host b/package/Config.in.host
> > index c0ac4fbbcc..d4e31ade2d 100644
> > --- a/package/Config.in.host
> > +++ b/package/Config.in.host
> > @@ -69,6 +69,7 @@ menu "Host utilities"
> >         source "package/squashfs/Config.in.host"
> >         source "package/sunxi-tools/Config.in.host"
> >         source "package/swig/Config.in.host"
> > +       source "package/systemd/Config.in.host"
> >         source "package/tegrarcm/Config.in.host"
> >         source "package/ti-cgt-pru/Config.in.host"
> >         source "package/uboot-tools/Config.in.host"
> > diff --git a/package/systemd/Config.in.host
> b/package/systemd/Config.in.host
> > new file mode 100644
> > index 0000000000..09099752d2
> > --- /dev/null
> > +++ b/package/systemd/Config.in.host
> > @@ -0,0 +1,4 @@
> > +config BR2_PACKAGE_HOST_SYSTEMD
> > +       bool "host systemd tools"
> > +       help
> > +         Systemd command-line tools for the host
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index 94d5f703cd..1e4f706517 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -550,3 +550,95 @@ SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
> >  SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
> >
> >  $(eval $(meson-package))
> > +
> > +
> > +
> > +#
> > +# Host-systemd configuration
> > +#
> > +HOST_SYSTEMD_CONF_OPTS= \
> > +       -Dsplit-bin=true \
> > +       -Dsplit-usr=false \
> > +       -Dutmp=false \
> > +       -Dhibernate=false \
> > +       -Dldconfig=false \
> > +       -Dresolve=false \
> > +       -Defi=false \
> > +       -Dtpm=false \
> > +       -Denvironment-d=false \
> > +       -Dbinfmt=false \
> > +       -Dcoredump=false \
> > +       -Dpstore=false \
> > +       -Dlogind=false \
> > +       -Dhostnamed=false \
> > +       -Dlocaled=false \
> > +       -Dmachined=false \
> > +       -Dportabled=false \
> > +       -Dnetworkd=false \
> > +       -Dtimedated=false \
> > +       -Dtimesyncd=false \
> > +       -Dremote=false \
> > +       -Dcreate-log-dirs=false \
> > +       -Dnss-myhostname=false \
> > +       -Dnss-mymachines=false \
> > +       -Dnss-resolve=false \
> > +       -Dnss-systemd=false \
> > +       -Dfirstboot=false \
> > +       -Drandomseed=false \
> > +       -Dbacklight=false \
> > +       -Dvconsole=false \
> > +       -Dquotacheck=false \
> > +       -Dsysusers=false \
> > +       -Dtmpfiles=false \
> > +       -Dimportd=false \
> > +       -Dhwdb=false \
> > +       -Drfkill=false \
> > +       -Dman=false \
> > +       -Dhtml=false \
> > +       -Dsmack=false \
> > +       -Dpolkit=false \
> > +       -Dblkid=false \
> > +       -Didn=false \
> > +       -Dadm-group=false \
> > +       -Dwheel-group=false \
> > +       -Dzlib=false \
> > +       -Dgshadow=false \
> > +       -Dima=false \
> > +       -Dtests=false \
> > +       -Dglib=false \
> > +       -Dacl=false \
> > +       -Dsysvinit-path='' \
> > +       --prefix=/usr \
> > +       --libdir=lib \
> > +       --sysconfdir=/etc \
> > +       --localstatedir=/var \
> > +
> > +
> > +HOST_SYSTEMD_DEPENDENCIES = \
> > +    host-util-linux \
> > +    host-patchelf \
> > +    host-libcap \
> > +    host-gperf \
> > +
> > +# Fix RPATH After installation
> > +# * systemd provides a install_rpath instruction to meson because the
> binaries need to link with
> > +#   libsystemd which is not in a standard path
> > +# * meson can only replace the RPATH, not append to it
> > +# * the original rpatch is thus lost.
> > +# * the original path had been tweaked by buildroot vial LD_FLAGS to
> add $(HOST_DIR)/lib
> > +# * thus re-tweak rpath after the installation for all binaries that
> need it
> > +#buildroot detects incorrect RPATH, so adding new binaries should be
> safe (it won't compile
> > +#unless properly integrated).
> > +HOST_SYSTEMD_HOST_TOOLS = \
> > +    systemd-analyze  systemd-mount systemctl
> > +
> > +define HOST_SYSTEMD_FIX_RPATH
> > +       $(foreach f,$(HOST_SYSTEMD_HOST_TOOLS), \
> > +               $(HOST_DIR)/bin/patchelf --set-rpath
> $(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd $(HOST_DIR)/bin/$(f)
> > +       )
> > +endef
> > +
> > +HOST_SYSTEMD_POST_INSTALL_HOOKS +=  HOST_SYSTEMD_FIX_RPATH
> > +HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
> > +
> > +$(eval $(host-meson-package))
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191104/6d253beb/attachment.html>
