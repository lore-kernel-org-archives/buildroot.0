From: mlweber1 at rockwellcollins.com <mlweber1@rockwellcollins.com>
Date: Wed, 11 Sep 2013 09:04:09 -0500
Subject: [Buildroot] [PATCH 1/1] omniorb: new package
In-Reply-To: <522D66E4.9010104@mind.be>
References: <1378418584-21899-1-git-send-email-mlweber1@rockwellcollins.com>
 <20130906001706.0c59d0ff@skate>
 <OF9C2B3BB5.42526667-ON86257BDE.00063112-86257BDE.004AF018@LocalDomain>
 <OF2000AD28.53AF8D18-ON86257BDE.004D8E89-86257BDE.004DB0A9@rockwellcollins.com>
 <522D66E4.9010104@mind.be>
Message-ID: <OF73BC5A48.6FA35E99-ON86257BE3.0047E145-86257BE3.004D4DAD@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> wrote on 09/09/2013 01:12:52 AM:

> From: Arnout Vandecappelle <arnout@mind.be>
> To: mlweber1 at rockwellcollins.com
> Cc: thomas.petazzoni at free-electrons.com, buildroot at busybox.net
> Date: 09/09/2013 01:45 AM
> Subject: Re: [Buildroot] [PATCH 1/1] omniorb: new package
> 
> On 06/09/13 16:08, mlweber1 at rockwellcollins.com wrote:
> > Dear Thomas Petazzoni,
> >
> > Thank you for the feedback, I've included some comments below.  Let me
> > know what you think.
> >
> > Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on
> > 09/05/2013 05:17:06 PM:
> >
> >  > From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> >  > To: Matt Weber <mlweber1@rockwellcollins.com>
> >  > Cc: buildroot at busybox.net
> >  > Date: 09/05/2013 05:17 PM
> >  > Subject: Re: [Buildroot] [PATCH 1/1] omniorb: new package
> >  >
> >  > Dear Matt Weber,
> >  >
> >  > On Thu, 5 Sep 2013 17:03:04 -0500, Matt Weber wrote:
> >  >
> [snip]
> >  > > +OMNIORB_DEPENDENCIES = python
> >  >
> >  > Then this package either needs a depends on BR2_PACKAGE_PYTHON or a
> >  > select BR2_PACKAGE_PYTHON. What is omniORB exactly? Is it just a 
set of
> >  > Python modules? Something more than that?
> >  >
> > I'll add a select of python to the Config.in.  omniORB is a 
inter-process
> > transport abstraction, similar to DBUS.  We use both the C/C++ and 
python
> > bindings to the object broker server it provides.
> 
>   I guess the python bindings are optional, right? Then you shouldn't 
> select python in Config.in. Instead, you should make the dependency in 
> the .mk file optional. We also try to explicitly set the configure 
> options. E.g.
> 
> ifeq ($(BR2_PACKAGE_PYTHON),y)
> OMNIORB_DEPENDENCIES += python
> OMNIORB_CONF_OPT += --enable-python-bindings
> else
> OMNIORB_CONF_OPT += --disable-python-bindings
> endif
> 
> (I just inventend the --enable option, of course).
> 
Agree

> [snip]
> >  > > +define OMNIORB_INSTALL_TARGET_CMDS
> >  > > +   $(TARGET_MAKE_ENV) $($(PKG)_MAKE_ENV) $($(PKG)_MAKE) $($(PKG)
> >  > _INSTALL_TARGET_OPT) -C $($(PKG)_SRCDIR)
> >  > > +endef
> >  >
> >  > For autotools packages, please don't overload the
> >  > <pkg>_INSTALL_STAGING_CMDS and <pkg>_INSTALL_TARGET_COMMANDS.
> >  >
> >  > If you need to do some tweaking after the staging installation, use 
a
> >  > POST_INSTALL_STAGING_HOOKS (see the Buildroot manual for details).
> >  >
> > It doesn't look like I can use POST install hooks for a autotools 
package
> > (I double checked in the pkg-autotools.mk).
> 
>   Yes you can. If you look at the top of pkg-generic.mk, you'll see that 

> the POST_ hooks are called whatever the package build system is.
> 
Ok, I'll take a look, I wonder if I possibly had a typo in my naming and 
they weren't getting called.

> 
> >  However I think I can remove
> > the overload of the INSTALL_TARGET_COMMANDS as that's just duplicated 
of
> > what the build already does.
> >
> >  > > +# OMNIORB has some host tools integrated into it's build.  We
> >  > first build those, then use
> >  > > +# the host IDL2CPP/depend tools to generate code for the target
> > compilation
> >  >
> >  > Hum... I believe a post configure hook might be more appropriate 
here.
> >  > Something like:
> >  >
> >  > define OMNIORB_BUILD_HOST_TOOLS
> >  >    $(HOST_MAKE_ENV) $(HOST) $(HOST_CONFIGURE_OPTS) -C
> > $(@D)/src/tool/omkdepend
> >  >    cp $(@D)/src/tool/omkdepend/omkdepend $(@D)/bin/
> >  >    $(HOST_MAKE_ENV) $(HOST) $(HOST_CONFIGURE_OPTS) -C $(@D)/src/
> >  > tool/omniidl/cxx/cccp
> >  >    $(HOST_MAKE_ENV) $(HOST) $(HOST_CONFIGURE_OPTS) -C $(@D)/src/
> >  > tool/omniidl/cxx
> >  > endef
> >  >
> > It doesn't look like there are POST conf hooks available for autotools
> > package.
> 
>   Same here.
> 
Ok

> 
> > I should have added a better comment about this build step.  The 
package
> > has some complicated dependencies that require the tools folders to be
> > built with the host(within the target build) and then when the 
complete
> > target package build occurs it ignores the tool folder (since it's
> > already built) and builds the rest of the source.  However as part of
> > that source build it uses the applications in the tools folder to
> > generate C code from IDL (interface definition language) for the 
build.
> 
>   Does it actually require them to be installed? Generally, packages are 

> smart enough to use something like $(TOPDIR)/tools/omkdepend/omkdepend 
> instead of relying on omkdepend to be in the path...
> 

The build doesn't require them to be in the path. It assumes they will 
build as part of the over all pkg build and are located in their 
respective 
folders in the pkg source.  Then they're used at a later point in the same 
build to 
generate C code from a description language...  It would take modification 
to 
the package's pathing to get this fixed (support use of host approach).

> > I think I had two options to make this work...
> > 1)Patch the source to allow a host build of the complete package to 
place
> > the right executable(s) into the sysroot.
> 
>   That usually doesn't require patching the source. Just adding
> $(eval $(host-autotools-package)) is probably enough. And of course you 
> should add a dependency on host-omniorb.

The build currently isn't smart enough to look in the path, it is assuming 

you're doing a build for the current host architecture and not cross 
building.
They assume the tools files are being built as part of the overall build 
and 
used during the later half of the overall build.  Would the following be 
acceptable
for now until the package improves it's infrastructure for cross builds? 

# OMNIORB is currently not cross-compile friendly and has some assumptions 
where
# a couple host tools are built in place and then used during the build. 
The tools
# generate code from the IDL description language, which is then built 
into the.
# cross compiled OMNIORB application.
# So this hook first builds the tools required for the host side 
generation of code.
# It then leaves/places them in the locations where the existing build 
infrastructure expects.
define OMNIORB_BUILD_TOOLS_HOOK
>.......${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C 
$(@D)/src/tool/omkdepend
>.......cp $(@D)/src/tool/omkdepend/omkdepend $(@D)/bin/
>.......${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C 
$(@D)/src/tool/omniidl/cxx/cccp
>.......${HOST_MAKE_ENV} ${MAKE} CXX=${HOSTCXX} CC=${HOSTCC} -C 
$(@D)/src/tool/omniidl/cxx
endef
OMNIORB_POST_CONFIGURE_HOOKS += OMNIORB_BUILD_TOOLS_HOOK

> 
> >  Then patch the source
> > differently for the target build to look in the sysroot instead of 
it's
> > tool's folder for those applications.
> 
>   If it looks in the path, then no patching is necessary. You can
Ok

> 
>   If it doesn't look in the path, then actually autotools has the 
> infrastructure to build host utilities during the cross-build. That is 
> why CC_FOR_BUILD is passed to configure. So it would be sufficient to 
> patch the Makefile.am in the tools directory to use CC_FOR_BUILD (and 
> CPPFLAGS_FOR_BUILD and CFLAGS_FOR_BUILD). If you want an example, look 
at 
> yasm or nettle.
> 
>   If you patch the build system this way, the patch can be upstreamed 
and 
> we don't have to carry it for eternity.

It looks like the autotools version used for the package doesn't have 
CC_FOR_BUILD. 
I wish I could do it this way, since the files I need it for just need to 
be build 
for the host architecture and left in the tools/bin folder for use by the 
cross build. 
It would be perfect to have a single package build satisfy this.  I'll 
investigate 
if there is any traction on improving the cross building of this package.

> 
> 
>   Regards,
>   Arnout
> 
> > 2)Overload the build command and insert a host build step manually for
> > just those tools applications before the overall target cross compile.
> > I went with the option that didn't create additional patches to
> > complicate if/when the version bumps.
> >
> >  > Or, the alternative is to build a complete host variant of omniorb.
> [snip]
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F




Matthew L Weber / Sr Software Engineer / Platform SW 
mlweber1 at rockwellcollins.com
www.rockwellcollins.com 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130911/38c3058e/attachment-0001.html>
