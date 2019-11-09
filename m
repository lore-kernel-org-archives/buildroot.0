From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Nov 2019 22:52:21 +0100
Subject: [Buildroot] [PATCH 01/15] new recipe : host-systemd
In-Reply-To: <CADvTj4o-OmADxosf4md8=cm63D0EUS+mo2ALA2D4odtv668w0Q@mail.gmail.com>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
 <20191103165640.21819-2-jeremy.rosen@smile.fr>
 <CADvTj4o-OmADxosf4md8=cm63D0EUS+mo2ALA2D4odtv668w0Q@mail.gmail.com>
Message-ID: <20191109215221.GR3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, J?r?my, All,

On 2019-11-03 12:20 -0500, James Hilliard spake thusly:
> Does this depend on a minimum host kernel version? How should we be
> handling that?

So I mulled over that one for a little while...

AFAIK, the headers version is especially usfull for a few things in
systemd that we are not interested in and do not build (or need not
build) for our host-systemd:
  - udevd
  - the spwaning of services in namespaces and control groups nad
    whatnot
  - maybe a few other things.

But systemctl should be exempt from any such requirement.

So, as long as we can do a very trimmed-down build, we should not have
to worry too much about the host kernel headers...

(Famous Last Words (TM))

Regards,
Yann E. MORIN.

> On Sun, Nov 3, 2019 at 11:57 AM J?r?my Rosen <jeremy.rosen@smile.fr> wrote:
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
> > diff --git a/package/systemd/Config.in.host b/package/systemd/Config.in.host
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
> > +# * systemd provides a install_rpath instruction to meson because the binaries need to link with
> > +#   libsystemd which is not in a standard path
> > +# * meson can only replace the RPATH, not append to it
> > +# * the original rpatch is thus lost.
> > +# * the original path had been tweaked by buildroot vial LD_FLAGS to add $(HOST_DIR)/lib
> > +# * thus re-tweak rpath after the installation for all binaries that need it
> > +#buildroot detects incorrect RPATH, so adding new binaries should be safe (it won't compile
> > +#unless properly integrated).
> > +HOST_SYSTEMD_HOST_TOOLS = \
> > +    systemd-analyze  systemd-mount systemctl
> > +
> > +define HOST_SYSTEMD_FIX_RPATH
> > +       $(foreach f,$(HOST_SYSTEMD_HOST_TOOLS), \
> > +               $(HOST_DIR)/bin/patchelf --set-rpath $(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd $(HOST_DIR)/bin/$(f)
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
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
