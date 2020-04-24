From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 24 Apr 2020 12:14:16 -0700
Subject: [Buildroot] [PATCH v3 2/2] package/firewalld: new package
In-Reply-To: <20200423211911.GT5035@scaer>
References: <20200423173302.280424-1-aduskett@gmail.com>
 <20200423173302.280424-2-aduskett@gmail.com>
 <20200423211911.GT5035@scaer>
Message-ID: <CAFSsvmqFEN7TM5JQOaeMrTd2KaxT6K=7xAku21YvzuLjW9-psg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello;

On Thu, Apr 23, 2020 at 2:19 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Adam, All,
>
> On 2020-04-23 10:33 -0700, aduskett at gmail.com spake thusly:
> > From: Adam Duskett <Aduskett@gmail.com>
> >
> > Firewalld provides a dynamically managed firewall with
> > support for network or firewall zones to define the trust level of network
> > connections or interfaces.
> >
> > Items of note:
> >
> >  - Iptables is set as a requirement because many applications such as Docker
> >    require direct-passthrough rules which firewalld does not support.
> >
> >  - Setting FIREWALLD_AUTORECONF=YES results in the following error:
> >    "error: cannot find input file: `po/Makefile.in.in'" As such, a manual call
> >    to autogen.sh is necessary with PATH=$(BR_PATH) set to ensure the script
> >    uses the host intltoolize binary.
>
> I think we can do better. ;-)
>
>     # Prpare the tree as autogen.sh would; allows using _AUTORECONF=YES
>     define FIREWALLD_INTLTOOLIZE
>         ls -1 $(@D)/po/*.po |sed -r -e 's:.*/::; s:.po$$::' >$(@D)/po/LINGUAS
>         cd $(@D) && $(HOST_DIR)/bin/intltoolize --force --automake
>     endef
>     FIREWALLD_PRE_CONFIGURE_HOOKS += FIREWALLD_INTLTOOLIZE
>
I heavily disagree:
1) The existing autogen.sh script may change in the future which would
make this macro
    more unmaintanable.
2) package/sdl/sdl.mk has PATH=$(BR_PATH) ./autogen.sh, which means
there is already
    a precident for this kind of logic.

> >  - Setting PYTHON="/usr/bin/env python$(PYTHON3_VERSION_MAJOR)" prevents
> >    Firewalld from setting the shebang in the installed python files to the full
> >    path to the python interpreter used when building.
> >
> >  - The bundled provided SYSV init file has several bashisms and requires
> >    /etc/init.d/functions which buildroot doesn't provide. So instead, we
> >    provide a more simple init.d file in the package directory, which does not
> >    require bash.
> >
> > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> > ---
> [--SNIP--]
> > diff --git a/package/firewalld/firewalld.hash b/package/firewalld/firewalld.hash
> > new file mode 100644
> > index 0000000000..93cf67ccea
> > --- /dev/null
> > +++ b/package/firewalld/firewalld.hash
> > @@ -0,0 +1,3 @@
> > +# Locally computed
> > +sha256  769c57d5c49218821ad30639a3f802831f9618899e403a811802c56e30f93c79  firewalld-v0.8.2.tar.gz
> > +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> > diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
> > new file mode 100644
> > index 0000000000..aedc250be1
> > --- /dev/null
> > +++ b/package/firewalld/firewalld.mk
> > @@ -0,0 +1,84 @@
> > +# iptables, ip6tables, ebtables, and ipset *should* be unnecessary
> > +# when the nftables backend is available, because nftables supersedes all of
> > +# them. However we still need to build and install iptables and ip6tables
> > +# because application relying on direct passthrough rules (IE docker) will
> > +# break.
>
> So it should nt be the responsibility of firewalld to select iptables or
> ebtables, but the individual applications, like docker, which should
> either unconditionally select them, or conditionally select them, like
> for example:
>
Possibly? This change would have the potential to make things far more
complicated,
as docker is just one example. I can't find a distribution (including
OE) that does not always
compile firewalld with iptables.

>     seelct BR2_PACKAGE_IPTABLES if BR2_PACKAGE_FIREWALLD
>
> > +# /etc/sysconfig/firewalld is a Red Hat-ism, only referenced by
> > +# the Red Hat-specific init script which isn't used, so we set
> > +# --disable-sysconfig.
> > +FIREWALLD_CONF_OPTS += \
> > +     --disable-rpmmacros \
> > +     --disable-sysconfig \
> > +     --with-ip6tables-restore=/usr/sbin/ip6tables-restore \
> > +     --with-ip6tables=/usr/sbin/ip6tables \
> > +     --with-iptables-restore=/usr/sbin/iptables-restore \
> > +     --with-iptables=/usr/sbin/iptables \
> > +     --with-nft=/usr/sbin/nft \
> > +     --without-ebtables \
> > +     --without-ebtables-restore \
> > +     --without-ipset \
> > +     --without-xml-catalog
> > +
> > +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> > +FIREWALLD_DEPENDENCIES += systemd
> > +FIREWALLD_CONF_OPTS += --with-systemd-unitdir=/usr/lib/systemd/system
>
> We also want an explicit --enable-systemd
>
> This was just a quick review, I may come back to it later in the WE...
>
> Regards,
> Yann E. MORIN.
>
> > +else
> > +FIREWALLD_CONF_OPTS += --disable-systemd
> > +endif
> > +
> > +define FIREWALLD_INSTALL_INIT_SYSTEMD
> > +     $(INSTALL) -D -m 0644 $(@D)/config/firewalld.service \
> > +             $(TARGET_DIR)/usr/lib/systemd/system/firewalld.service
> > +endef
> > +
> > +# The bundled sysvinit file requires /etc/init.d/functions which is not
> > +# provided by buildroot. As such, we provide our own firewalld init file.
> > +define FIREWALLD_INSTALL_INIT_SYSV
> > +     $(INSTALL) -D -m 0755 $(FIREWALLD_PKGDIR)/S41firewalld \
> > +             $(TARGET_DIR)/etc/init.d/S41firewalld
> > +endef
> > +
> > +$(eval $(autotools-package))
> > --
> > 2.25.3
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
