From: Matthew Weber <mlweber1@rockwellcollins.com>
Date: Tue, 1 Oct 2013 14:33:50 -0500
Subject: [Buildroot] [PATCH 1/1] omniorb: cleanup autobuild failure,
 CFLAGS issue
In-Reply-To: <524AF88C.4070906@mind.be>
References: <1380311674-6883-1-git-send-email-mlweber1@rockwellcollins.com>
 <524AF88C.4070906@mind.be>
Message-ID: <OF8984387D.63FADA60-ON86257BF7.006A9834-86257BF7.006B779D@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> wrote on 10/01/2013 11:30:04 AM:

> From: Arnout Vandecappelle <arnout@mind.be>
> To: Matt Weber <mlweber1@rockwellcollins.com>
> Cc: buildroot at busybox.net
> Date: 10/01/2013 02:09 PM
> Subject: Re: [Buildroot] [PATCH 1/1] omniorb: cleanup autobuild 
> failure, CFLAGS issue
> 
> On 09/27/13 21:54, Matt Weber wrote:
> > Fixed:
> > http://autobuild.buildroot.net/results/
> a08baf8821e3ee1fb9c36c8f74c4ced466af167b/
> > http://autobuild.buildroot.net/results/
> f0c7379c1f405385d3a64c0349c3d9565065e8a7/
> > http://autobuild.buildroot.net/results/
> c3de25ca52fdb8ffda7472cf9f7b64514954cbb1/
> >
> > Change Log:
> > The target CFLAGS were getting mixed in during a manual build of some
> > omniorb pkg tools that could be viewed as host tools.
> > This manual build was a dirty workaround and created some bad
> > cornercases. So I converted the package over to actually using the
> > host pkg build and removed the need for a patch and custom mods inthe 
build.
> >
> > Also there wasn't a dependency on the target having python, just
> > host-python for performing the initial build.  So depends were 
adjusted
> > accordingly. If python bindings are required, they can be found in
> a different
> > package called omniORBpy.  The omniORB package only uses python for
> > the build process.
> >
> > Fixed a bug with long double support.  Currently leaving it disabled
> > as most targets won't use it.  This allows greater toolchain 
compatibility.
> >
> > Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
> 
>   Looks good. However:
> 
> [snip]
> > +# Defaulting long double support to a safe option for the
> > +# mix of embedded targets, this could later be automated
> > +# based on checking the capability of the cross toolchain
> > +# for "__LONG_DOUBLE_128__".  Currently the host and target
> > +# need to match because of the code generation done by the
> > +# host tools during the target compile (ie headers generated
> > +# on host are used in target build).
> 
>   Ouch, this smells like there could also be an issue when the host and 
> the target have different data representations (e.g. endianness or 
> bitwidth). Do you think there is a risk of this?

I don't believe there is a risk if I also disable it on the host 
(which I'll add in my next update). 
HOST_OMNIORB_CONF_OPT += --disable-longdouble
I think the use case of having both the host and target support it is 
going to 
have to be a customization done by a user for a specific target capability 
build. 
To accommodate that here would be impractical since we don't have control 
over 
the host compiler version and would really only have the option to 
immediately fail 
the build if the target toolchain didn't also support longdouble.  Is this 
a reasonable
assumption?  Leaving it disabled allows the pkg to work on all of the 
targets 
and if you need extended long support you could do additional 
customization
for your specific toolchain configuration.

> 
> > +OMNIORB_CONF_OPT += --disable-longdouble
> >
> > -# omniORB is currently not cross-compile friendly and has some 
assumptions
> > -# where a couple host tools are built in place and then used during 
the
> > -# build.  The tools generate code from the IDL description language, 
which
> > -# is then built into the cross compiled OMNIORB application.
> > -# So this first hook builds the tools required for the host side
> > -# generation of code. Then the second hook cleans up before the 
install.
> > +# omniORB is not completely cross-compile friendly and has some
> > +# assumptions where a couple host tools must be built and then
> > +# used by the target build.  The host tools generate code from
> > +# the IDL description language, which is then built into the
> > +# cross compiled target OMNIORB application.
> >   define OMNIORB_BUILD_TOOLS
> 
>   Minor nit: you probably want to rename this variable as well.

Sure.

> 
> > -   $(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
> > -      -C $(@D)/src/tool export
> > +   # Point to the host folder to get HOST_OMNIORB tools
> > +   $(SED) 's:TOOLBINDIR = $$(TOP)/$$(BINDIR):TOOLBINDIR = $
> (HOST_DIR)/usr/bin:g' $(@D)/mk/beforeauto.mk
> > +   # Disables OMNIORB tool building
> > +   echo "EmbeddedSystem=1" >> $(@D)/mk/beforeauto.mk
> >   endef
> >   OMNIORB_POST_CONFIGURE_HOOKS += OMNIORB_BUILD_TOOLS
> >
> > -define OMNIORB_CLEAN_TOOLS
> > -   $(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
> > -      -C $(@D)/src/tool clean
> > -endef
> > -OMNIORB_POST_BUILD_HOOKS += OMNIORB_CLEAN_TOOLS
> > -
> > -define OMNIORB_FIXUP_FILE_PATHS_HOOK
> > -   $(SED) "s:$(HOST_DIR)/usr:/usr:g" $(STAGING_DIR)/usr/bin/omniidl
> > -endef
> > -OMNIORB_POST_INSTALL_STAGING_HOOKS += OMNIORB_FIXUP_FILE_PATHS_HOOK
> > +HOST_OMNIORB_DEPENDENCIES = host-python
> 
>   We usually put the host DEPENDENCIES just below the target stuff. So:
> 
> ###########
> # header
> ###########
> 
> <target variable definitions>
> 
> <host variable definitions>
> 
> <conditional target variables>
> 
> <conditional host variables>
> 
> <target cmds and hooks>
> 
> <host cmds and hooks>
> 
> $(eval $(...))
> $(eval $(host-...))
> 

Sure, I'll get a header added and follow that by the host dependencies
and the new host conf opt for longdouble disable.

> 
> 
>   Regards,
>   Arnout
> 
> >
> >   $(eval $(autotools-package))
> > +$(eval $(host-autotools-package))
> >
> 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
