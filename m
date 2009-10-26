From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Oct 2009 09:35:03 +0100
Subject: [Buildroot] [RFC] Package infrastructure: make variables or
 make targets ?
In-Reply-To: <1256514702.11941.85.camel@coalu.atr>
References: <20091025224056.59c9a6ef@surf>
	<1256514702.11941.85.camel@coalu.atr>
Message-ID: <20091026093503.61a72bf7@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Lionel,

Thanks for your input!

Le Mon, 26 Oct 2009 00:51:42 +0100,
Lionel Landwerlin <llandwerlin@gmail.com> a ?crit :

> > ======================================================================
> > define MYPKG_PRE_CONFIGURE_DO_THIS
> >  foobar
> > endef
> > 
> > MYPKG_PRE_CONFIGURE_HOOKS += MYPKG_PRE_CONFIGURE_DO_THIS
> 
> I like it less.
> 
> Why not defining entry points like thoses :
> 
> $PACKAGE_PRE_CONFIGURE
> $PACKAGE_POST_CONFIGURE
> $PACKAGE_PRE_COMPILE
> $PACKAGE_POST_COMPILE
> etc...
> 
> And we just do something like this in the Makefile.in :
> 
> $(1) => package name
> 
> $(BR_OUTPUT)/build/$(1)-$($(1)_VERSION)/.stamp_configured:
> ifdef $(1)_PRE_CONFIGURE
> 	$($(1)_PRE_CONFIGURE)
> endif
> ifdef $(1)_CONFIGURE
> 	$($(1)_CONFIGURE)
> else
> 	# Do default stuff...
> endef
> ifdef $(1)_POST_CONFIGURE
> 	$($(1)_POST_CONFIGURE)
> endif
> 
> So the package doesn't have to manipulate variables like
> MYPKG_PRE_CONFIGURE_HOOKS, it just defines its entry points.

Because this allows to have only one hook registered for each hook
location. And this is not enough with the inheritance of
Makefile.autotools.in from the generic package infrastructure.

The generic package infrastructure will define steps for :

 * download, implemented in a generic way
 * extract, implemented in a generic way
 * patch, implemented in a generic way
 * configure, calling a package specific definition
 * build, calling a package specific definition
 * install to target/staging/host, calling a package specific definition

With pre/post hooks mechanism before and after all these steps.

The Makefile.autotools.in infrastructure will plug into the generic one
by at least :

 * defining what configure, build, install to target/staging/host do
 * defining a post-patch hook to autoreconf if necessary, patch libtool
   if necessary

Then, if the package specific makefile using the autotools
infrastructure wants to define a post-patch hook, it cannot since, the
?slot? is already used by the generic infrastructure.

Therefore, I was thinking of a mechanism similar to OpenWRT, where the
hooks variables are list of variables names that in turn contain what
to do.

See for example
https://dev.openwrt.org/browser/trunk/include/autotools.mk (the end).

> Could we split the package's makefile in two parts ?
> 
> One defining data stuff like package version, source, site, etc...
> Then we call something like that :
> 
> $(eval $(call PKGDATA,package,mypkg))
> 
> That defines all paths we need etc...
> 
> And them we describe the actions we want to be triggered at each step
> of the build process, just like you described before.
> 
> Finally we call the rule evaluation defining actions with all the
> stamp files stuff.

Yes, we could. However, for the moment, the only variable I have in
mind is this package source code directory.

Would look like something like this:

=============================================================================
ICU_VERSION:=4c-3_8_1
ICU_SOURCE:=icu$(ICU_VERSION)-src.tgz
ICU_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/icu
ICU_DEPENDENCIES:=host-icu
ICU_SUBDIR:=source

HOST_ICU_VERSION:=$(ICU_VERSION)
HOST_ICU_SOURCE:=$(ICU_SOURCE)
HOST_ICU_SITE:=$(ICU_SITE)
HOST_ICU_SUBDIR:=source

$(eval $(call pkgdefinitions,package,icu,target))
$(eval $(call pkgdefinitions,package,icu,host))

define HOST_ICU_CONFIGURE
 $(HOST_CONFIGURE_OPTS) \
 $(HOST_CONFIGURE_ARGS) \
 $(HOST_CONFIGURE_ENV)  \
 ./configure --prefix=/usr
endef

define HOST_ICU_COMPILE
 make -C $(ICU_SRCDIR) # this variable was defined by pkgdefinitions above
endef

define HOST_ICU_INSTALL
 make -C $(ICU_SRCDIR) DESTDIR=$(HOST_DIR) install
endef

define ICU_CONFIGURE
 $(TARGET_CONFIGURE_OPTS) \
 $(TARGET_CONFIGURE_ARGS) \
 $(TARGET_CONFIGURE_ENV) \
 ./configure \
                --target=$(GNU_TARGET_NAME) \
                --host=$(GNU_TARGET_NAME) \
                --build=$(GNU_HOST_NAME) \
                --prefix=/usr \
                --mandir=/usr/man \
                --infodir=/usr/info \
                --enable-samples
endef

define ICU_COMPILE
 make -C $(ICU_SRCDIR)
endef

$(eval $(call pkgrules,package,icu,target))
$(eval $(call pkgrules,package,icu,host))
=============================================================================

Note 1: ICU is a fairly bad example since it should be converted to
Makefile.autotools.in, but since it is not converted yet, I've used it
as an example during my prototyping.

Note 2: I'd like HOST_ICU_VERSION, HOST_ICU_SOURCE, HOST_ICU_SITE and
HOST_ICU_SUBDIR default to ICU_VERSION, ICU_SOURCE, ICU_SITE and
ICU_SUBDIR so that they aren't duplicated, but this isn't implemented
in my prototype yet.

So, in the end, I understand you prefer the "make variables" way over
the "make targets" way. Am I correct ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
