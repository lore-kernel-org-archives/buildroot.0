From: daggs <daggs@gmx.com>
Date: Sun, 17 Jul 2016 19:16:50 +0200
Subject: [Buildroot] [PATCH v4] libamcodec: New Package
In-Reply-To: <20160716141816.3b53ed8b@free-electrons.com>
References: <20160709174120.4438-1-daggs@gmx.com>,
 <20160716141816.3b53ed8b@free-electrons.com>
Message-ID: <trinity-367457f9-186f-47f1-a7c4-4bb9a49814a6-1468775810016@3capp-mailcom-bs10>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

> Hello,
> 
> I've applied, but did a few changes before that. See below.
> 
> On Sat,  9 Jul 2016 20:41:20 +0300, Dagg Stompler wrote:
> > v3 -> v4:
> >   - add missing LIBAMCODEC_INSTALL_STAGING (thanks to Bernd Kuhls).
> >   - use new version of git repo and update the hash.
> >   - drop 0001-libamcodec-fix-makefiles-to-allow-cross-compilation.patch patch as it was merged into the repo.
> > 
> > v2 -> v3:
> >   - fix sum256 value.
> >   - fix patch.
> 
> The changelog should be ...
> 
> > 
> > Signed-off-by: Dagg Stompler <daggs@gmx.com>
> > ---
> 
> ... here.
> 
> Otherwise, it gets merged as part of the commit log into the project
> Git history, which is not what we want.
> 
> 
> 
> > +LIBAMCODEC_VERSION = 6f9b99182f94be14fce785c75aa1e9bce868e229
> > +LIBAMCODEC_SITE = $(call github,mdrjr,c2_aml_libs,$(LIBAMCODEC_VERSION))
> > +LIBAMCODEC_DEPENDENCIES = alsa-lib
> > +LIBAMCODEC_LICENSE = Unclear
> > +LIBAMCODEC_INSTALL_STAGING = YES
> > +
> > +# This package uses the M_PREFIX or PREFIX variables to construct the header and
> > +# library paths used when compiling
> 
> In fact, a better variable is AML_LIBS_STAGING_DIR. It's the same
> across all components of libamcodec, which allows to replace:
> 
> > +define LIBAMCODEC_BUILD_CMDS
> > +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/amavutils M_PREFIX="$(STAGING_DIR)/usr"
> > +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/amadec M_PREFIX="$(STAGING_DIR)/usr"
> > +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/amcodec PREFIX="$(STAGING_DIR)"
> 
> by a foreach loop:
> 
> +define LIBAMCODEC_BUILD_CMDS
> +       $(foreach d,amavutils amadec amcodec,\
> +               $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> +                       -C $(@D)/$(d) AML_LIBS_STAGING_DIR=$(STAGING_DIR)
> +       )
> +endef
> 
> Thanks a lot!
> 
> Thomas

thanks a lot for all the help.

Dagg.
