From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 7 May 2018 21:58:08 +0200
Subject: [Buildroot] [RFC PATCH 2/7] docs/manual: document pkg-meson
 infra
In-Reply-To: <20180507170855.3bf884fa@windsurf>
References: <20180507105741.31747-1-eric.le.bihan.dev@free.fr>
 <20180507105741.31747-3-eric.le.bihan.dev@free.fr>
 <20180507170855.3bf884fa@windsurf>
Message-ID: <20180507195808.GB15375@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 18-05-07 17:08:55, Thomas Petazzoni wrote:
> Hello,
>
> On Mon,  7 May 2018 12:57:36 +0200, Eric Le Bihan wrote:
> > Update documentation about adding meson-based packages with instructions for
> > using pkg-meson infrastructure.
> >
> > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>
> Looks good overall.
>
>
> > -47: $(eval $(generic-package))
> > +16: ifeq ($(BR2_PACKAGE_BAZ),y)
> > +17: FOO_CONF_OPTS += -Dbaz
> > +18: endif
>
> I know it wasn't in the example previously, but would it make sense to
> add:
>
> FOO_DEPENDENCIES += baz
>
> inside this condition ? It is quite common that external packages
> enabling features for a given package are build dependencies of that
> package.

This sounds sensible. I'll add it.

> > +==== +meson-package+ reference
> > +
> > +The main macro of the Meson package infrastructure is +meson-package+. It is
> > +similar to the +generic-package+ macro.
> > +
> > +Just like the generic infrastructure, the Meson infrastructure works by defining
> > +a number of variables before calling the +meson-package+ macro.
> > +
> > +First, all the package metadata information variables that exist in the generic
> > +infrastructure also exist in the Meson infrastructure: +FOO_VERSION+,
> > ++FOO_SOURCE+, +FOO_PATCH+, +FOO_SITE+, +FOO_SUBDIR+, +FOO_DEPENDENCIES+,
> > ++FOO_INSTALL_STAGING+, +FOO_INSTALL_TARGET+.
> > +
> > +A few additional variables, specific to the Meson infrastructure, can also be
> > +defined. Many of them are only useful in very specific cases, typical packages
> > +will therefore only use a few of them.
> > +
> > +* +FOO_CONF_ENV+, to specify additional environment variables to pass to
> > +  +meson+ for the configuration step. By default, empty.
> > +
> > +* +FOO_CONF_OPTS+, to specify additional options to pass to +meson+ for the
> > +  configuration step. By default, empty.
> > +
> > +* +FOO_NINJA_ENV+, to specify additional environment variables to pass to
> > +  +ninja+, meson companion tool in charge of the build operations. By default,
> > +  empty.
>
> Regarding the variable naming, I'm wondering if FOO_CONF_{ENV,OPTS} and
> FOO_NINJA_ENV is very consistent.
>
> Indeed, either you name the options after the step to which they apply:
> FOO_CONF_ENV, FOO_CONF_OPTS, FOO_BUILD_ENV. Or after the tool to which
> they apply: FOO_MESON_ENV, FOO_MESON_OPTS, FOO_NINJA_ENV.
>
> But:
>
>  - We already use this inconsistent notation: CONF_ENV and MAKE_ENV for
>    autotools packages
>
>  - Ninja options are not only used at build time, but also at install
>    time.
>
>  - Renaming FOO_CONF_OPTS to FOO_MESON_OPTS would really be weird, and
>    FOO_CONF_OPTS definitely makes a lot more sense.
>
> Conclusion: don't change anything, your current naming is my preference.

The need for FOO_NINJA_ENV comes from the systemd package, because of
some UTF-8 stuff. IHMO, it will not be used frequently in other
Meson-based packages.

And everybody is used to FOO_CONF_OPTS!

> However, I think you forgot to mention the existence of a host variant
> for Meson packages. The other package infrastructures say: "The ability
> to have target and host packages is also available, with the
> host-cmake-package macro."

I will add this.

Thanks for the review.

Regards,

--
ELB
