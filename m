From: Julien Viard de Galbert <julien@vdg.name>
Date: Sat, 14 Jan 2017 14:37:30 +0100
Subject: [Buildroot] [PATCH 1/1] dieharder: new package
In-Reply-To: <e3682b0f-7f5c-6b00-06d7-36a72e31a8f9@gmail.com>
References: <1484259791-7227-1-git-send-email-julien@vdg.name>
 <e3682b0f-7f5c-6b00-06d7-36a72e31a8f9@gmail.com>
Message-ID: <20170114133730.GA11642@vdg.name>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 13, 2017 at 07:19:21PM +0100, Romain Naour wrote:
> Hello Julien,
> 
Hello Romain !

> Le 12/01/2017 ? 23:23, Julien Viard de Galbert a ?crit :
[...]
> > index 0000000..4e2dd08
> > --- /dev/null
> > +++ b/package/dieharder/0001-do-not-use-includedir-as-include-search-path-for-bui.patch
> > @@ -0,0 +1,57 @@
> > +From 691fd9bde5dce4a4da071a120b76c6eb95abb3a6 Mon Sep 17 00:00:00 2001
> > +From: Julien Viard de Galbert <julien@vdg.name>
> > +Date: Sun, 17 May 2015 15:04:54 +0200
> > +Subject: [PATCH 1/4] do not use includedir as include search path for build
> 
> Please add a small patch description and your SoB line here.
> 
> http://nightly.buildroot.org/manual.html#_format_and_licensing_of_the_package_patches
> 
Ok, will do, sorry I missed that.


[...]
> > diff --git a/package/dieharder/Config.in b/package/dieharder/Config.in
> > new file mode 100644
> > index 0000000..0288b82
> > --- /dev/null
> > +++ b/package/dieharder/Config.in
> > @@ -0,0 +1,10 @@
> > +config BR2_PACKAGE_DIEHARDER
> > +	bool "dieharder"
> > +	select BR2_PACKAGE_GSL
> > +	select BR2_PACKAGE_LIBTOOL
> 
> This add libtool for the target.
> It seems you only need host-libtool so you can remove this line.
> 
Right, thanks !

[...]

> > diff --git a/package/dieharder/dieharder.mk b/package/dieharder/dieharder.mk
> > new file mode 100644
> > index 0000000..cc1a359
> > --- /dev/null
> > +++ b/package/dieharder/dieharder.mk
> > @@ -0,0 +1,40 @@
> > +################################################################################
> > +#
> > +# dieharder
> > +#
> > +################################################################################
> > +
> > +DIEHARDER_VERSION = 3.31.1
> > +DIEHARDER_SITE = http://www.phy.duke.edu/~rgb/General/dieharder
> 
> I'm a bit worried about the maintenance of this tool, this version was released
> the 14-Oct-2011. But ok since it still build with gcc6 :)
> 
Well yes... but I don't think there are alternatives for the job...

> > +DIEHARDER_SOURCE = dieharder-$(DIEHARDER_VERSION).tgz
> > +DIEHARDER_STRIP_COMPONENTS = 2
> > +DIEHARDER_LICENSE = GPLv2 with beverage clause
> > +DIEHARDER_LICENSE_FILES = $(DIEHARDER_SUBDIR)/COPYING
> 
> DIEHARDER_SUBDIR is not set here, I guess you wanted to use dieharder/COPYING.
> Actually there are two COPYING files, one in the root of the source directory
> and another one in dieharder/COPYING

Yes that's a leftover of switching to use
 DIEHARDER_STRIP_COMPONENTS = 2

Again thanks for catching it.

I'll prepare and test a new version before submitting it.

Best Regards,

Julien

> 
> Otherwise looks good.
> 
> Best regards,
> Romain
> 
> > +DIEHARDER_DEPENDENCIES = gsl host-libtool
> > +
> > +# Fix m4 links to points to the ones in staging (provided by libtool hence
> > +# the patch dependency).
> > +define DIEHARDER_POST_PATCH_FIXUP
> > +        for m in $(@D)/m4/*; do \
> > +		l=$$(readlink $$m) ;\
> > +		rm $$m ;\
> > +		ln -s $(HOST_DIR)$$l $$m ;\
> > +	done
> > +endef
> > +DIEHARDER_POST_PATCH_HOOKS += DIEHARDER_POST_PATCH_FIXUP
> > +
> > +# Ensure the libtool version is updated,
> > +# also make _CONF_ENV works instead of _CONF_OPTS for endiannes
> > +DIEHARDER_AUTORECONF = YES
> > +
> > +# fix endiannes detection
> > +ifeq ($(BR2_ENDIAN),"BIG")
> > +DIEHARDER_CONF_ENV = ac_cv_c_endian=big
> > +else
> > +DIEHARDER_CONF_ENV = ac_cv_c_endian=little
> > +endif
> > +
> > +# parallel build fail, disable it
> > +DIEHARDER_MAKE = $(MAKE1)
> > +
> > +$(eval $(autotools-package))
> > 
