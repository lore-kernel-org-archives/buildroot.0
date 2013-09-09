From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 09 Sep 2013 08:12:52 +0200
Subject: [Buildroot] [PATCH 1/1] omniorb: new package
In-Reply-To: <OF2000AD28.53AF8D18-ON86257BDE.004D8E89-86257BDE.004DB0A9@rockwellcollins.com>
References: <1378418584-21899-1-git-send-email-mlweber1@rockwellcollins.com>
 <20130906001706.0c59d0ff@skate>
 <OF9C2B3BB5.42526667-ON86257BDE.00063112-86257BDE.004AF018@LocalDomain>
 <OF2000AD28.53AF8D18-ON86257BDE.004D8E89-86257BDE.004DB0A9@rockwellcollins.com>
Message-ID: <522D66E4.9010104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/09/13 16:08, mlweber1 at rockwellcollins.com wrote:
> Dear Thomas Petazzoni,
>
> Thank you for the feedback, I've included some comments below.  Let me
> know what you think.
>
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on
> 09/05/2013 05:17:06 PM:
>
>  > From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  > To: Matt Weber <mlweber1@rockwellcollins.com>
>  > Cc: buildroot at busybox.net
>  > Date: 09/05/2013 05:17 PM
>  > Subject: Re: [Buildroot] [PATCH 1/1] omniorb: new package
>  >
>  > Dear Matt Weber,
>  >
>  > On Thu, 5 Sep 2013 17:03:04 -0500, Matt Weber wrote:
>  >
[snip]
>  > > +OMNIORB_DEPENDENCIES = python
>  >
>  > Then this package either needs a depends on BR2_PACKAGE_PYTHON or a
>  > select BR2_PACKAGE_PYTHON. What is omniORB exactly? Is it just a set of
>  > Python modules? Something more than that?
>  >
> I'll add a select of python to the Config.in.  omniORB is a inter-process
> transport abstraction, similar to DBUS.  We use both the C/C++ and python
> bindings to the object broker server it provides.

  I guess the python bindings are optional, right? Then you shouldn't 
select python in Config.in. Instead, you should make the dependency in 
the .mk file optional. We also try to explicitly set the configure 
options. E.g.

ifeq ($(BR2_PACKAGE_PYTHON),y)
OMNIORB_DEPENDENCIES += python
OMNIORB_CONF_OPT += --enable-python-bindings
else
OMNIORB_CONF_OPT += --disable-python-bindings
endif

(I just inventend the --enable option, of course).

[snip]
>  > > +define OMNIORB_INSTALL_TARGET_CMDS
>  > > +   $(TARGET_MAKE_ENV) $($(PKG)_MAKE_ENV) $($(PKG)_MAKE) $($(PKG)
>  > _INSTALL_TARGET_OPT) -C $($(PKG)_SRCDIR)
>  > > +endef
>  >
>  > For autotools packages, please don't overload the
>  > <pkg>_INSTALL_STAGING_CMDS and <pkg>_INSTALL_TARGET_COMMANDS.
>  >
>  > If you need to do some tweaking after the staging installation, use a
>  > POST_INSTALL_STAGING_HOOKS (see the Buildroot manual for details).
>  >
> It doesn't look like I can use POST install hooks for a autotools package
> (I double checked in the pkg-autotools.mk).

  Yes you can. If you look at the top of pkg-generic.mk, you'll see that 
the POST_ hooks are called whatever the package build system is.


>  However I think I can remove
> the overload of the INSTALL_TARGET_COMMANDS as that's just duplicated of
> what the build already does.
>
>  > > +# OMNIORB has some host tools integrated into it's build.  We
>  > first build those, then use
>  > > +# the host IDL2CPP/depend tools to generate code for the target
> compilation
>  >
>  > Hum... I believe a post configure hook might be more appropriate here.
>  > Something like:
>  >
>  > define OMNIORB_BUILD_HOST_TOOLS
>  >    $(HOST_MAKE_ENV) $(HOST) $(HOST_CONFIGURE_OPTS) -C
> $(@D)/src/tool/omkdepend
>  >    cp $(@D)/src/tool/omkdepend/omkdepend $(@D)/bin/
>  >    $(HOST_MAKE_ENV) $(HOST) $(HOST_CONFIGURE_OPTS) -C $(@D)/src/
>  > tool/omniidl/cxx/cccp
>  >    $(HOST_MAKE_ENV) $(HOST) $(HOST_CONFIGURE_OPTS) -C $(@D)/src/
>  > tool/omniidl/cxx
>  > endef
>  >
> It doesn't look like there are POST conf hooks available for autotools
> package.

  Same here.


> I should have added a better comment about this build step.  The package
> has some complicated dependencies that require the tools folders to be
> built with the host(within the target build) and then when the complete
> target package build occurs it ignores the tool folder (since it's
> already built) and builds the rest of the source.  However as part of
> that source build it uses the applications in the tools folder to
> generate C code from IDL (interface definition language) for the build.

  Does it actually require them to be installed? Generally, packages are 
smart enough to use something like $(TOPDIR)/tools/omkdepend/omkdepend 
instead of relying on omkdepend to be in the path...

> I think I had two options to make this work...
> 1)Patch the source to allow a host build of the complete package to place
> the right executable(s) into the sysroot.

  That usually doesn't require patching the source. Just adding
$(eval $(host-autotools-package)) is probably enough. And of course you 
should add a dependency on host-omniorb.

>  Then patch the source
> differently for the target build to look in the sysroot instead of it's
> tool's folder for those applications.

  If it looks in the path, then no patching is necessary. You can

  If it doesn't look in the path, then actually autotools has the 
infrastructure to build host utilities during the cross-build. That is 
why CC_FOR_BUILD is passed to configure. So it would be sufficient to 
patch the Makefile.am in the tools directory to use CC_FOR_BUILD (and 
CPPFLAGS_FOR_BUILD and CFLAGS_FOR_BUILD). If you want an example, look at 
yasm or nettle.

  If you patch the build system this way, the patch can be upstreamed and 
we don't have to carry it for eternity.


  Regards,
  Arnout

> 2)Overload the build command and insert a host build step manually for
> just those tools applications before the overall target cross compile.
> I went with the option that didn't create additional patches to
> complicate if/when the version bumps.
>
>  > Or, the alternative is to build a complete host variant of omniorb.
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
