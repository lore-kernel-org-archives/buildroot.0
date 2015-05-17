From: Julien Viard de Galbert <julien.viarddegalbert@openwide.fr>
Date: Sun, 17 May 2015 14:18:15 +0200
Subject: [Buildroot] [PATCH v3] dieharder: new package
In-Reply-To: <20150517102036.464066b9@free-electrons.com>
References: <1431848603-30142-1-git-send-email-julien.viarddegalbert@openwide.fr>
 <20150517102036.464066b9@free-electrons.com>
Message-ID: <20150517121815.GA29019@vdg.name>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, May 17, 2015 at 10:20:36AM +0200, Thomas Petazzoni wrote:
> Hello Julien,
> 
> On Sun, 17 May 2015 09:43:23 +0200, julien.viarddegalbert at openwide.fr
> wrote:
> 
> > diff --git a/package/Config.in b/package/Config.in
> > index af4d2b7..cc0bd79 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -61,6 +61,7 @@ menu "Debugging, profiling and benchmark"
> >  	source "package/bonnie/Config.in"
> >  	source "package/cache-calibrator/Config.in"
> >  	source "package/dhrystone/Config.in"
> > +	source "package/dieharder/Config.in"
> >  	source "package/dmalloc/Config.in"
> >  	source "package/dropwatch/Config.in"
> >  	source "package/dstat/Config.in"
> > diff --git a/package/dieharder/Config.in b/package/dieharder/Config.in
> > new file mode 100644
> > index 0000000..9f81876
> > --- /dev/null
> > +++ b/package/dieharder/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_DIEHARDER
> > +	bool "dieharder"
> > +	select BR2_PACKAGE_GSL
> > +	help
> > +	  dieharder is a fairly involved random number/uniform deviate generator
> > +	  tester. It is thus suitable for use in testing both software RNG's and
> > +	  hardware RNG's.
> 
> Those help lines look fairly too long. Make sure they're not longer
> than 72 columns.
> 
Ok, also I just sent another patch to document that point.

> > diff --git a/package/dieharder/dieharder.mk b/package/dieharder/dieharder.mk
> > new file mode 100644
> > index 0000000..2a3d46b
> > --- /dev/null
> > +++ b/package/dieharder/dieharder.mk
> > @@ -0,0 +1,26 @@
> > +################################################################################
> > +#
> > +# dieharder
> > +#
> > +################################################################################
> > +
> > +DIEHARDER_VERSION = 3.31.1
> > +DIEHARDER_SITE = http://www.phy.duke.edu/~rgb/General/dieharder/
> > +DIEHARDER_SOURCE = dieharder-$(DIEHARDER_VERSION).tgz
> > +DIEHARDER_SUBDIR = dieharder-$(DIEHARDER_VERSION)
> > +DIEHARDER_LICENSE = GPLv2b
> 
> What is GPLv2b ? We normally have GPLv2 or GPLv2+.
> 
You are right this should be made more explicit, there is an
extra "beverage" clause in the licence file.
I could either use the syntax the software uses:
DIEHARDER_LICENSE = GPLv2b (b for beverage)

Or make it simply:
DIEHARDER_LICENSE = GPLv2 with beverage clause

What do you think ?

> > +DIEHARDER_LICENSE_FILES = $(DIEHARDER_SUBDIR)/COPYING
> > +DIEHARDER_DEPENDENCIES = gsl
> > +
> > +DIEHARDER_CONF_OPTS = --includedir=$(STAGING_DIR)/usr/include
> 
> Why do you need this? This looks wrong, as it would install the
> headers in a completely wrong location, if dieharder would be
> installing headers. --includedir is not used to specify where a program
> should look for headers of libraries, but to tell where it should
> install its own headers.
> 
That was to try to fix the build using "/usr/include/" but it's wrong.
I overlooked the normal --includedir function. So I guess the upstream
scripts are wrong as they use the --includedir value to also specify
some include search path...

Also it _really_ do install some headers there. We probably don't want
those on the target rootfs. So I guess I need to find how to tell it not
to do that...

> > +# fix endiannes detection
> > +ifeq ($(BR2_ENDIAN),"BIG")
> > +DIEHARDER_CONF_OPTS += ac_cv_c_endian=big
> > +else
> > +DIEHARDER_CONF_OPTS += ac_cv_c_endian=little
> > +endif
> 
> We generally pass such values in <pkg>_CONF_ENV instead.
> 
OK, I'll do that.

> > +
> > +# parallel build fail, disable it
> > +DIEHARDER_MAKE=$(MAKE1)
> 
> Spaces around = sign please.
OK, sorry, I read about that one... my mistake.
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

-- 
Julien Viard de Galbert
