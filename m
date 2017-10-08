From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 8 Oct 2017 16:48:17 +0200
Subject: [Buildroot] [PATCH v3 2/3] docs/manual: document meson-based
	packages
In-Reply-To: <20171008100341.GB2803@scaer>
References: <20170727095527.14324-1-joerg.krause@embedded.rocks>
 <20170727095527.14324-3-joerg.krause@embedded.rocks>
 <20171008100341.GB2803@scaer>
Message-ID: <20171008144817.GB17840@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17-10-08 12:03:41, Yann E. MORIN wrote:
> J?rg, ?ric, All,
>
> On 2017-07-27 11:55 +0200, J?rg Krause spake thusly:
> > From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> >
> > Add instructions for adding a package which uses the Meson build system.
> >
> > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> > [J?rg Krause:
> >  * use one-liner for buildtype]
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> > ---
> > v3:
> >  * none
> > ---
> >  docs/manual/adding-packages-meson.txt | 80 +++++++++++++++++++++++++++++++++++
> >  docs/manual/adding-packages.txt       |  2 +
> >  2 files changed, 82 insertions(+)
> >  create mode 100644 docs/manual/adding-packages-meson.txt
> >
> > diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
> > new file mode 100644
> > index 0000000000..697f2520c7
> > --- /dev/null
> > +++ b/docs/manual/adding-packages-meson.txt
> > @@ -0,0 +1,80 @@
> > +// -*- mode:doc; -*-
> > +// vim: set syntax=asciidoc:
> > +
> > +=== Integration of Meson-based packages
> > +
> > +[[meson-package-tutorial]]
> > +
> > +==== +meson-package+ tutorial
> > +
> > +http://mesonbuild.com[Meson] is an open source build system meant to be both
> > +extremely fast, and, even more importantly, as user friendly as possible.
> > +
> > +Buildroot does not (yet) provide a dedicated package infrastructure for
> > +meson-based packages. So, we will explain how to write a +.mk+ file for such a
> > +package. Let's start with an example:
> > +
> > +------------------------------
> > +01: ################################################################################
> > +02: #
> > +03: # foo
>
> We're not very consistent with the meta-name of the tutorial package.
> Some infras use libfoo, others use foo, while there is also foobar.
> Sigh...
>
> foo is nice for me, but I'd settle for anything as long as it is
> consistent.
>
> > +04: #
> > +05: ################################################################################
> > +06:
> > +07: FOO_VERSION = 1.0
> > +08: FOO_SOURCE = foo-$(FOO_VERSION).tar.gz
> > +09: FOO_SITE = http://www.foosoftware.org/download
> > +10: FOO_LICENSE = GPLv3+
> > +11: FOO_LICENSE_FILES = COPYING
> > +12:
> > +13: FOO_DEPENDENCIES = host-meson host-pkgconf bar
> > +14:
> > +15: FOO_MESON_OPTS += \
> > +16: 	--prefix=/usr \
> > +17: 	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
> > +18: 	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
>
> Whether we one day add a meson-package infra or not, I think this
> variable should be documented as FOO_CONF_OPTS for symetry with the
> other package infras.

OK.

> > +20: define FOO_CONFIGURE_CMDS
> > +21: 	rm -rf $(@D)/build
>
> We don't usually remove stuff created in a previous run, unless it
> breaks the build.

OK.

> > +22: 	mkdir -p $(@D)/build
> > +23: 	$(TARGET_MAKE_ENV) meson.py $(FOO_MESON_OPTS) $(@D) $(@D)/build
> > +24: endef
> > +25:
> > +26: define FOO_BUILD_CMDS
> > +27: 	$(TARGET_MAKE_ENV) ninja -C $(@D)/build
>
> Would the build accept additional options? I mean, do we need to prepare
> to pass extra parameteres, like FOO_MAKE_OPTS does for autotools?

I'll check this.

> > +28: endef
> > +29:
> > +30: define FOO_INSTALL_TARGET_CMDS
> > +31: 	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) ninja -C $(@D)/build install
>
> Ditto FOO_INSTALL_TARGET_OPTS and FOO_INSTALL_STAGING_OPTS?

I did not know about these two (I should have read the other pkg-*.mk
more carefully). I'll check this.

> > +32: endef
>
> If all the meson-based packages are just those three commands (configure,
> build and install) and never deviates by more than the _OPTS stuff, then
> I believe we should add the meson-package infra right away. And it
> should be reasonably easy.
>
> Regards,
> Yann E. MORIN.
>
> > +34: $(eval $(generic-package))
> > +--------------------------------
> > +
> > +The Makefile starts with the definition of the standard variables for package
> > +declaration (lines 7 to 11).
> > +
> > +As seen in line 34, it is based on the
> > +xref:generic-package-tutorial[+generic-package+ infrastructure]. So, it defines
> > +the variables required by this particular infrastructure, where Meson and its
> > +companion tool, Ninja, are invoked:
> > +
> > +* +FOO_CONFIGURE_CMDS+: the build directory required by Meson is created, and
> > +  Meson is invoked to generate the Ninja build file. The options required to
> > +  configure the cross-compilation of the package are passed via
> > +  +FOO_MESON_OPTS+.
> > +
> > +* +FOO_BUILD_CMDS+: Ninja is invoked to perform the build.
> > +
> > +* +FOO_INSTALL_TARGET_CMDS+: Ninja is invoked to install the files generated
> > +  during the build step.
> > +
> > +In order to have Meson available for the build, +FOO_DEPENDENCIES+ needs to
> > +contain +host-meson+. In the example, +host-pkgconf+ and +bar+ are also
> > +declared as dependencies because the Meson build file of +foo+ uses `pkg-config`
> > +to determine the compilation flags and libraries of package +bar+.
> > +
> > +To sum it up, to add a new meson-based package, the Makefile example can be
> > +copied verbatim then edited to replace all occurences of +FOO+ with the
> > +uppercase name of the new package and update the values of the standard
> > +variables.
> > diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
> > index d577ff030e..e542124cf9 100644
> > --- a/docs/manual/adding-packages.txt
> > +++ b/docs/manual/adding-packages.txt
> > @@ -34,6 +34,8 @@ include::adding-packages-rebar.txt[]
> >
> >  include::adding-packages-waf.txt[]
> >
> > +include::adding-packages-meson.txt[]
> > +
> >  include::adding-packages-kernel-module.txt[]
> >
> >  include::adding-packages-asciidoc.txt[]
> > --
> > 2.13.3
> >

Regards,

--
ELB
