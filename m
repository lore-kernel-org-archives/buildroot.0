From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 18 Jul 2016 10:14:36 +0200
Subject: [Buildroot] [PATCH 1/2] meson: new package
In-Reply-To: <20160717161135.GL3614@free.fr>
References: <1468072147-17509-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1468072147-17509-2-git-send-email-eric.le.bihan.dev@free.fr>
 <20160717161135.GL3614@free.fr>
Message-ID: <20160718101436.7ca80bea@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Le Sun, 17 Jul 2016 18:11:35 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> On 2016-07-09 15:49 +0200, Eric Le Bihan spake thusly:
> > This new package provides the host variant of the Meson Build
> > System, an open source build system meant to be both extremely
> > fast, and as user friendly as possible.
> > 
> > More precisely, Meson creates configuration files for the Ninja
> > build system.
> > 
> > Besides building Meson, it generates a configuration file
> > ("$(HOST_DIR)/etc/meson/cross-compilation.conf") to be used when
> > cross-compiling a Meson-based project.
> > 
> > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> > ---
> >  package/meson/cross-compilation.conf.in | 17 +++++++++++++++++
> >  package/meson/meson.hash                |  2 ++
> >  package/meson/meson.mk                  | 31
> > +++++++++++++++++++++++++++++++ 3 files changed, 50 insertions(+)
> >  create mode 100644 package/meson/cross-compilation.conf.in
> >  create mode 100644 package/meson/meson.hash
> >  create mode 100644 package/meson/meson.mk
> > 
> > diff --git a/package/meson/cross-compilation.conf.in
> > b/package/meson/cross-compilation.conf.in new file mode 100644
> > index 0000000..33fa001
> > --- /dev/null
> > +++ b/package/meson/cross-compilation.conf.in
> > @@ -0,0 +1,17 @@
> > +# Note: in Meson terminology, what Buildroot calls the "host"
> > system is the +# "build" system and the "target" system is called
> > the "host" system.  
> 
> Meson is using the correct terminology, the same as the autotools.
> It's Buildroot that is /special/. ;-)
> 
> But yes, the comment is useful, to remove any ambiguity.
> 
> > +[host_machine]
> > +system = 'linux'
> > +cpu_family ='@TARGET_ARCH@'
> > +cpu = 'generic'
> > +endian = '@TARGET_ENDIAN@'
> > +
> > +[properties]  
> 
> This properties section is empty. Can we do without it?

No. Otherwise Meson will complain. I informed the author about this.

> > +[binaries]
> > +c = '@TARGET_CROSS at gcc'
> > +cpp = '@TARGET_CROSS at g++'
> > +ar = '@TARGET_CROSS at ar'
> > +strip = '@TARGET_CROSS at strip'
> > +pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'
> > diff --git a/package/meson/meson.hash b/package/meson/meson.hash
> > new file mode 100644
> > index 0000000..3a9ac2a
> > --- /dev/null
> > +++ b/package/meson/meson.hash
> > @@ -0,0 +1,2 @@
> > +# Locally generated
> > +sha256
> > 372c18e40ffc3fe101f4ab48e8077f048dd774eaf4e87bbea3221908fca74835
> > meson-0.32.0.tar.gz diff --git a/package/meson/meson.mk
> > b/package/meson/meson.mk new file mode 100644 index 0000000..8b95a6f
> > --- /dev/null
> > +++ b/package/meson/meson.mk
> > @@ -0,0 +1,31 @@
> > +################################################################################
> > +#
> > +# meson
> > +#
> > +################################################################################
> > +
> > +MESON_VERSION = 0.32.0
> > +MESON_SITE = $(call github,mesonbuild,meson,$(MESON_VERSION))
> > +MESON_LICENSE = Apache-2.0
> > +MESON_LICENSE_FILES = COPYING
> > +MESON_SETUP_TYPE = setuptools
> > +
> > +HOST_MESON_DEPENDENCIES = host-ninja
> > +HOST_MESON_NEEDS_HOST_PYTHON = python3
> > +
> > +HOST_MESON_TARGET_ENDIAN = $(shell echo $(BR2_ENDIAN) | tr 'A-Z'
> > 'a-z') +
> > +define HOST_MESON_INSTALL_CROSS_CONF
> > +	$(INSTALL) -D -m 0644
> > package/meson/cross-compilation.conf.in \
> > +		$(HOST_DIR)/etc/meson/cross-compilation.conf
> > +	$(SED) 's;@TARGET_CROSS@;$(TARGET_CROSS);g' \
> > +		-e 's;@TARGET_ARCH@;$(ARCH);g' \
> > +		-e
> > 's;@TARGET_ENDIAN@;$(HOST_MESON_TARGET_ENDIAN);g' \
> > +		-e 's;@HOST_DIR@;$(HOST_DIR);g' \  
> 
> There is a reason I don;t like this $(SED): the first -e is implicit,
> and so the code is not obvious.
> 
> > +		$(HOST_DIR)/etc/meson/cross-compilation.conf  
> 
> Also, I would do it in a single pass:
> 
>     mkdir -p $(HOST_DIR)/etc/meson
>     sed -e 's;@TARGET_CROSS@;$(TARGET_CROSS);g' \
>         -e blabla \
>         $(MESON_PKGDIR)/cross-compilation.conf.in \
>         >$(HOST_DIR)/etc/meson/cross-compilation.conf  
> 
> And then I'd be happy because there would be no implicit '-e'! :-)
> 
> But wait yet a bit more for others to express their preferences... ;-)

I've always been confused by the heterogeneous use of $(SED) and 'sed
-e' in the various Makefiles. I thought that $(SED) was the preferred
way, because this variable may hide a non-standard path for the sed
program (besides the hidden '-e'). If there is no such thing, then I'll
gladly use 'sed -e'.

> > +endef
> > +
> > +HOST_MESON_POST_INSTALL_HOOKS += \
> > +	HOST_MESON_INSTALL_CROSS_CONF  
> 
> No need for a continuation line, it all fits on a single line.

OK.

Thanks for the review.

Regards,

-- 
ELB
