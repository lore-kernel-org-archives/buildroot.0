From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 22:50:15 +0100
Subject: [Buildroot] [git commit] rauc: select host-squashfs as a host
 dependency
In-Reply-To: <1511991010.9792.41.camel@impinj.com>
References: <20171129210644.C2457803E2@busybox.osuosl.org>
 <1511991010.9792.41.camel@impinj.com>
Message-ID: <20171129225015.577113ed@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Nov 2017 21:30:10 +0000, Trent Piepho wrote:

> > +	select BR2_PACKAGE_HOST_SQUASHFS # run-time dependency
> >  	help
> >  	  RAUC is the Robust Auto-Update Controller developed by
> >  	  Pengutronix. Enable this option to build the rauc
> > diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
> > index 479a583..67ef155 100644
> > --- a/package/rauc/rauc.mk
> > +++ b/package/rauc/rauc.mk
> > @@ -29,7 +29,7 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> >  RAUC_DEPENDENCIES += systemd
> >  endif
> >  
> > -HOST_RAUC_DEPENDENCIES = host-pkgconf host-openssl host-libglib2
> > +HOST_RAUC_DEPENDENCIES = host-pkgconf host-openssl host-libglib2 host-squashfs  
> 
> Would it work to not include the build dependency on host-sqaushfs? 
> Since squashfs is a command invoked at run time, rauc doesn't actually
> need to be present when building.  Minimize the dependency info, allow
> greater parallelism if packages were built in parallel, etc.  Or
> perhaps it's easier to always match the config dep with a build dep
> even if the latter isn't necessary in some cases?

I already pointed out this during the review, and Baruch made a useful
comment: if a package A has host-foo in its dependencies, it expects
host-foo to be fully ready and working by the time package A's
configure step starts.

So, what you say about runtime dependencies is completely correct for
*target* packages, and we do that everywhere in Buildroot: select the
package at the Config.in level, but not depend on it at the
<pkg>_DEPENDENCIES level. All what matters for target packages is that
all runtime dependencies are part of the final root filesystem image.

However, for host packages, we expect them to be ready and operational
as soon as their build completes. Hence, runtime dependencies need to
be considered as runtime dependencies.

Technically, we wouldn't need host-rauc-configure to depend on
host-squashfs. Having host-rauc depend on host-squashfs would be
sufficient (some kind of "install dependency"). But we don't have this
concept in Buildroot, and for just the few cases of runtime
dependencies of host packages, I'm not sure it's worth adding such a
feature.

Does that make sense?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
