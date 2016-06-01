From: daggs <daggs@gmx.com>
Date: Wed, 1 Jun 2016 22:52:50 +0200
Subject: [Buildroot] [PATCH 1/3] libamcodec: new Package
In-Reply-To: <20160601141655.5649aa21@free-electrons.com>
References: <20160601102720.3929-1-daggs@gmx.com>,
 <20160601141655.5649aa21@free-electrons.com>
Message-ID: <trinity-d3b293e2-4a13-4cd4-95af-c77cc680aa35-1464814370051@3capp-mailcom-bs13>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,
> Hello,
> 
> Thanks for your contributions! It generally looks good, but I have a
> few comments, see below.
> 
> On Wed,  1 Jun 2016 13:27:18 +0300, Dagg wrote:
> > Signed-off-by: Dagg <daggs@gmx.com>
> 
> Would it be possible to use your complete name for your contributions?
> 
I'd rather not, is this a limitation?

> > diff --git a/package/Config.in b/package/Config.in
> > index 6c6a562..0a56070 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1074,6 +1074,7 @@ endmenu
> >  
> >  menu "Multimedia"
> >  	source "package/bitstream/Config.in"
> > +	source "package/libamcodec/Config.in"
> >  	source "package/libass/Config.in"
> >  	source "package/libbluray/Config.in"
> >  	source "package/libdcadec/Config.in"
> > diff --git a/package/libamcodec/Config.in b/package/libamcodec/Config.in
> > new file mode 100644
> > index 0000000..bb2d924
> > --- /dev/null
> > +++ b/package/libamcodec/Config.in
> > @@ -0,0 +1,5 @@
> > +config BR2_PACKAGE_LIBAMCODEC
> > +	bool "libamcodec"
> > +	depends on BR2_arm || BR2_aarch64
> > +	help
> > +	    Interface library for Amlogic media codecs
> 
> Please add an empty line here, followed by the URL of the upstrealm
> project. It can be just a link to the homepage of the Github project.
> 
> > diff --git a/package/libamcodec/libamcodec.mk b/package/libamcodec/libamcodec.mk
> > new file mode 100644
> > index 0000000..e983192
> > --- /dev/null
> > +++ b/package/libamcodec/libamcodec.mk
> > @@ -0,0 +1,33 @@
> > +################################################################################
> > +#
> > +# libamcodec
> > +#
> > +################################################################################
> > +
> > +LIBAMCODEC_VERSION = ed1d8b8c54b05c1a02a8ee44c59744e4cbed3d8d
> > +LIBAMCODEC_SITE = https://github.com/mdrjr/c2_aml_libs.git
> > +LIBAMCODEC_SITE_METHOD = git
> 
> Please use the "github" function available in Buildroot. See the
> documentation and the numerous other examples in Buildroot (you can
> grep for "call,github").
> 
> Also, please add a hash file for this package.
> 
> > +LIBAMCODEC_LICENSE = GPL
> 
> This should be more specific: GPLv2, GPLv2+, GPLv3, GPLv3+.
> 
> Also, please add a value for <pkg>_LICENSE_FILES.
> 
there is no license files or label whatsoever, the only header I saw is like this:
/**
 * \file adec-external-ctrl.c
 * \brief  Audio Dec Lib Functions
 * \version 1.0.0
 * \date 2011-03-08
 */
/* Copyright (C) 2007-2011, Amlogic Inc.
 * All right reserved
 *
 */

> > +
> > +define LIBAMCODEC_BUILD_CMDS
> > +	$(MAKE) -C $(@D)/amavutils CC="$(TARGET_CC)" LD="$(TARGET_LD)" PREFIX="$(STAGING_DIR)/usr"
> > +	$(MAKE) -C $(@D)/amadec CC="$(TARGET_CC)" LD="$(TARGET_LD)" PREFIX="$(STAGING_DIR)/usr"
> > + 	$(MAKE) -C $(@D)/amcodec CC="$(TARGET_CC)" LD="$(TARGET_LD)" PREFIX="$(STAGING_DIR)/usr"
> 
> Can you use $(TARGET_CONFIGURE_OPTS) instead of CC=... LD=... ?
> 
> PREFIX=$(STAGING_DIR)/usr is not correct, it should be PREFIX=/usr,
> because once on the target, things will be in /usr.
> 
> Also, why is the PREFIX needed at build time?
> 
> > +endef
> > +
> > +define LIBAMCODEC_INSTALL_STAGING_CMDS
> > +	$(INSTALL) -D -m 0755 $(@D)/amavutils/libamavutils.so $(STAGING_DIR)/usr/lib
> > +	$(INSTALL) -D -m 0555 $(@D)/amadec/libamadec.so $(STAGING_DIR)/usr/lib
> > +	$(INSTALL) -D -m 0555 $(@D)/amcodec/libamcodec.so $(STAGING_DIR)/usr/lib
> > +
> > +	mkdir -p $(STAGING_DIR)/usr/include/amcodec
> > +	cp -rf $(@D)/amcodec/include/* $(STAGING_DIR)/usr/include/amcodec
> > +endef
> > +
> > +define LIBAMCODEC_INSTALL_TARGET_CMDS
> > +	$(INSTALL) -D -m 0755 $(@D)/amavutils/libamavutils.so $(TARGET_DIR)/usr/lib
> > +	$(INSTALL) -D -m 0555 $(@D)/amadec/libamadec.so $(TARGET_DIR)/usr/lib
> > +	$(INSTALL) -D -m 0555 $(@D)/amcodec/libamcodec.so $(TARGET_DIR)/usr/lib
> > +endef
> > +									    
> > +$(eval $(generic-package))
> 
> Other than that, looks good.
> 
> Thanks!
> 
> Thomas
done, will suggest a new patch soon.
thanks for the comments.

Dagg.
