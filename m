From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Sep 2015 11:43:27 +0200
Subject: [Buildroot] [PATCHv4] pkg-generic: detect incorrectly used
 package
In-Reply-To: <55EAB0CF.2040707@mind.be>
References: <1441141898-26885-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <55EAB0CF.2040707@mind.be>
Message-ID: <20150905114327.3075e0e4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sat, 5 Sep 2015 11:07:27 +0200, Arnout Vandecappelle wrote:

> > To detect such issues more easily, this patch adds a check in the
> > package infrastructure. When the build process of a package is being
> > triggered, we verify that the package is enabled in the
> > configuration. We do this check in the "configure" step, since this
> > step is the first common step between the normal download case and the
> > "local site method" / "package override" case.
> 
>  I would actually prefer checks like this to de done by a separate checkpackage
> script rather than as part of the package infrastructure. This is IMHO more in
> line with the buildroot is simple principle.
> 
>  However, we don't have a checkpackage script yet - I started on one a while ago
> but it still has a ways to go. And anyway, it is probably pretty complicated to
> check this in a checkpackage script. Therefore, let's include this feature.

I agree on principle, but I also believe doing such a check in a
separate script is going to be quite tricky.

> > This requires passing two new target variables to the configure
> > target:
> > 
> >  - TYPE, which is either host or target. This is needed since the test
> >    should only be done on target packages (most host packages don't
> >    have a Config.in option)
> 
>  You can just use $($(PKG)_TYPE).
> 
> > 
> >  - KCONFIG_VAR, which is the name of the Config.in variable
> >    corresponding to the package being built. For most packages, it's
> >    BR2_PACKAGE_<pkg>, but not for toolchain packages, bootloaders or
> >    linux.
> 
>  You can just use $($(PKG)_KCONFIG_VAR).

I'll try to do that, it seems like a good idea indeed.

> >  # Configure
> >  $(BUILD_DIR)/%/.stamp_configured:
> > +# Only trigger the check for default builds. If the user forces
> > +# building a package, even if not enabled in the configuration, we
> > +# want to accept it.
> > +ifeq ($(MAKECMDGOALS),)
> > +	@if test "$(TYPE)" = "target" -a -z "$($(KCONFIG_VAR))" ; then \
> > +		echo "ERROR: A package must have added $($(PKG)_NAME) to its _DEPENDENCIES line but" ; \
> > +		echo "forgot to add the corresponding select / depends on $(KCONFIG_VAR)." ; \
> > +		echo "Potential culprits: " ; \
> > +		for p in $($(PKG)_DEPENDENT_OF) ; do echo " - $$p" ; done ; \
> 
>  I don't really like adding that extra _DEPENDENT_OF variable just for this
> purpose. But it will be hard to avoid I guess. It _could_ be avoided by looping
> over $(.VARIABLES), then selecting the ones that match the _DEPENDENCIES pattern
> and that have $(call lowercase,$(PKG)) in them. But that's a bit complicated :-)

I am also not sure adding this additional variable just for this
purpose is really needed. My initial proposal did not have this, and
was just saying "some package has a problem". Yann proposed this
improvement to point to potential offenders, making the investigation
easier. So it's up to us to decide whether we want to make that
investigation easier (which requires this additional variable), or keep
the code simpler and remove one variable, but make the investigation of
such errors a bit more complicated.

I don't have a very strong feeling on this. It's just one more
variable, computed in a reasonably simple way.

> > +# Store reverse build-dependency information
> > +$$(eval $$(foreach d,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(call UPPERCASE,$$(d))_DEPENDENT_OF += $(1)$$(sep)))
> 
>  Can you split this over two lines? Or even three?
> $$(eval $$(foreach d,$$($(2)_FINAL_ALL_DEPENDENCIES),\
>   $$(call UPPERCASE,$$(d))_DEPENDENT_OF += $(1)$$(sep)\
> ))
> 
>  or perhaps even define a helper.

Will see what I can do. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
