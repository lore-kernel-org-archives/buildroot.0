From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 25 Feb 2020 13:47:52 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/frr: new package
In-Reply-To: <CAEyMn7ZxLyN6meBXH37RKFpQNwbkeANN=UTPJbLOXcVETjeSoA@mail.gmail.com>
References: <20200225025850.17209-1-vadim4j@gmail.com>
 <20200225025850.17209-3-vadim4j@gmail.com>
 <CAEyMn7ZxLyN6meBXH37RKFpQNwbkeANN=UTPJbLOXcVETjeSoA@mail.gmail.com>
Message-ID: <CAMw6YJJaxipADUtTrtKHWaNCs+FiUevv=kwww+b9eu102A3JFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 25, 2020 at 10:26 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> Hi Vadim and all,
>
> Am Di., 25. Feb. 2020 um 03:59 Uhr schrieb Vadim Kochan <vadim4j@gmail.com>:
> >
> > FRR is free software that implements and manages various IPv4 and IPv6
> > routing protocols. It runs on nearly all distributions of Linux and BSD
> > as well as Solaris and supports all modern CPU architectures.
> >
> > FRR currently supports the following protocols:
> >
> >     BGP
> >     OSPFv2
> >     OSPFv3
> >     RIPv1
> >     RIPv2
> >     RIPng
> >     IS-IS
> >     PIM-SM/MSDP
> >     LDP
> >     BFD
> >     Babel
> >     PBR
> >     OpenFabric
> >     VRRP
> >     EIGRP (alpha)
> >     NHRP (alpha)
> >
> > Some not-needed features were disabled to minimize package dependencies:
> >
> >     - POSIX capabilities
> >     - RPKi
> >
> > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> > ---
> >  DEVELOPERS            |  1 +
> >  package/Config.in     |  1 +
> >  package/frr/Config.in | 25 +++++++++++++++
> >  package/frr/S50frr    | 46 ++++++++++++++++++++++++++
> >  package/frr/frr.hash  |  2 ++
> >  package/frr/frr.mk    | 75 +++++++++++++++++++++++++++++++++++++++++++
> >  6 files changed, 150 insertions(+)
> >  create mode 100644 package/frr/Config.in
> >  create mode 100644 package/frr/S50frr
> >  create mode 100644 package/frr/frr.hash
> >  create mode 100644 package/frr/frr.mk
> >
>
> [SNIP]
>
> > diff --git a/package/frr/frr.mk b/package/frr/frr.mk
> > new file mode 100644
> > index 0000000000..448aa56690
> > --- /dev/null
> > +++ b/package/frr/frr.mk
> > @@ -0,0 +1,75 @@
> > +################################################################################
> > +#
> > +# frr
> > +#
> > +################################################################################
> > +
> > +FRR_VERSION = 7.3
> > +FRR_SOURCE = frr-$(FRR_VERSION).tar.gz
>
> You can remove FRR_SOURCE because it is not needed. Buildroot will
> automatically set this to "frr-$(FRR_VERSION).tar.gz".
>
> > +FRR_SITE = https://github.com/FRRouting/frr/archive
> > +FRR_LICENSE = GPL-2.0
> > +FRR_LICENSE_FILES = COPYING
> > +FRR_AUTORECONF = YES
> > +
> > +FRR_DEPENDENCIES = host-frr readline json-c \
> > +       libyang libnl c-ares
> > +
> > +HOST_FRR_DEPENDENCIES = host-flex host-bison host-python
> > +
> > +FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
> > +       --sysconfdir=/etc/frr \
> > +       --localstatedir=/var/run/frr \
> > +       --with-moduledir=/usr/lib/frr/modules \
> > +       --enable-configfile-mask=0640 \
> > +       --enable-logfile-mask=0640 \
> > +       --enable-multipath=256 \
> > +       --disable-ospfclient \
> > +       --enable-shell-access \
> > +       --enable-user=frr \
> > +       --enable-group=frr \
> > +       --enable-vty-group=frrvty \
> > +       --disable-exampledir \
> > +       --disable-capabilities \
> > +       --enable-fpm
> > +
> > +HOST_FRR_CONF_OPTS = --enable-clippy-only
> > +
> > +define FRR_RUN_BOOTSTRAP
> > +       (cd $(@D) && PATH=$(BR_PATH) ./bootstrap.sh)
> > +endef
> > +FRR_PRE_CONFIGURE_HOOKS += FRR_RUN_BOOTSTRAP
> > +HOST_FRR_PRE_CONFIGURE_HOOKS += FRR_RUN_BOOTSTRAP
>
> Do we realy need to call the bootstrap.sh? The only thing done here is
> to call "autoreconf -i". This is automatically called by buildroot
> when setting "FRR_AUTORECONF = YES".
>
> @@ -34,12 +33,6 @@ FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
>
>  HOST_FRR_CONF_OPTS = --enable-clippy-only
>
> -define FRR_RUN_BOOTSTRAP
> -       (cd $(@D) && PATH=$(BR_PATH) ./bootstrap.sh)
> -endef
> -FRR_PRE_CONFIGURE_HOOKS += FRR_RUN_BOOTSTRAP
> -HOST_FRR_PRE_CONFIGURE_HOOKS += FRR_RUN_BOOTSTRAP
> -
>  define HOST_FRR_INSTALL_CMDS
>         $(INSTALL) -D -m 0755 $(@D)/lib/clippy $(HOST_DIR)/bin/clippy
>  endef
>
>
[SNIP]
...
Thanks! all your suggestions works!
...
[SNIP]
> > +
> > +$(eval $(autotools-package))
> > +$(eval $(host-autotools-package))
> > --
> > 2.17.1
> >
>
> Also some warnings from "utils/check-package package/frr/*":
>
> package/frr/Config.in:16: help text: <tab><2 spaces><62 chars>
> (http://nightly.buildroot.org/#writing-rules-config-in)
> package/frr/frr.mk:8: remove default value of _SOURCE variable
> (http://nightly.buildroot.org/#generic-package-reference)
> 102 lines processed
> 2 warnings generated
>
> BR
> --
> Heiko
