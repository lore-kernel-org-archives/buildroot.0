From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 5 Sep 2020 23:36:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/apparmor: fix per-package build
 with apache
In-Reply-To: <20200905151615.358f20e8@windsurf.home>
References: <20200901201046.2757475-1-fontaine.fabrice@gmail.com>
 <20200905125058.GV14354@scaer> <20200905151615.358f20e8@windsurf.home>
Message-ID: <CAPi7W82Anu75J0unVwYpg8u60QqckPsYWfT95CP0_fBwK+9OFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le sam. 5 sept. 2020 ? 15:16, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Sat, 5 Sep 2020 14:50:58 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>
> > So, it is calling libtool from apache's host dir, and consequently, it
> > is calling gcc from apache's host dir, and uses include paths that point
> > to apache's sysroot.
> >
> > This is no good.
> >
> > In theory, we would want to fix apxs so we can only use path to the
> > current package's sysroot. This could probably be achievable, because:
> >
> >   - apxs is a perl script, so we could either sed it to replace paths,
> >     but this is not noce, or we could fix it to introduce a variable
> >     that contains the base directory to look from;
> >
> >   - there is a config_vars.mk file that contains hard-coded paths, which
> >     we could probably modify to also include a base directory to look
> >     from. For example, we could introduce "APXS_BASE_DIR = blabla", and
> >     then, right before the condifure step of dependant packages, fixup
> >     that file to inject the correct PPD base directory.
> >
> > This would not be very different from the fixups we apply to the meson's
> > cross-compilation.conf configuration file, but there we do have an edge,
> > in that this is done by an infra.
> >
> > However, for this apxs configs_var.mk, it is not so trivial, because
> > this is not part of an infra, and we do not have a way for packages to
> > export a hook that other packages would have to run automatically.
> >
> > We could probably have the apache package provide this as a set of
> > macros:
> >
> >     define APACHE_APXS_FIXUPS
> >         $(SED) blablaba $(STAGING_DIR)/usr/build/config_vars.mk
> >     endef
> >
> > and then packages would do something like:
> >
> >     APPARMOR_PRE_CONFIGURE_HOOKS += APACHE_APXS_FIXUPS
> >
> > But:
> >
> >  1. this is not so clean, because of the cross-package reference,
> >
> >  2. we so far have only two packages using apxs, and that is probably
> >     too-big a hammer to introduce this generic tweaking...
> >
> > So, I am still a bit undecided whether to apply this quick workaround
> > your patch is, or to require a full-blown, complete and correct fix...
> >
> > Thomas, Peter, Arnout, thoughts?
>
> We're already fixing a similar issue in the apache package as follows:
>
> ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> define APACHE_FIXUP_APR_LIBTOOL
>         $(SED) "s@$(PER_PACKAGE_DIR)/[^/]\+/@$(PER_PACKAGE_DIR)/apache/@g" \
>                 $(STAGING_DIR)/usr/build-1/libtool
> endef
> APACHE_POST_CONFIGURE_HOOKS += APACHE_FIXUP_APR_LIBTOOL
> endif
>
> Any reason not to do the same here ?
Thanks for spotting this solution, I'll send a v2.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
