From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 23:11:20 +0200
Subject: [Buildroot] [PATCH/next v2 1/1] package/icu: Add support to
 generate a subset of ICU data
In-Reply-To: <20210601060608.5531-1-bernd.kuhls@t-online.de>
References: <20210601060608.5531-1-bernd.kuhls@t-online.de>
Message-ID: <20210718231120.76adc4e3@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Bernd,

On Tue,  1 Jun 2021 08:06:08 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> This would reduce the size of libicudata.so to 12M.
> 
> [1] https://github.com/unicode-org/icu/blob/master/docs/userguide/icu_data/buildtool.md

This is really some good and useful contribution, but (as usual), I
have a couple of questions/requests.

> +config BR2_PACKAGE_ICU_DATA_FILTER_FILE
> +	string "Path to custom data configuration file"
> +	help
> +	  The ICU Data Build Tool enables you to write a configuration
> +	  file that specifies what features and locales to include in a
> +	  custom data bundle:
> +	  https://github.com/unicode-org/icu/blob/main/docs/userguide/icu_data/buildtool.md
> +	  Leave empty to not use this functionality.

We already have BR2_PACKAGE_ICU_CUSTOM_DATA_PATH which was also meant
to allow building ICU with a smaller dataset, based on pre-compiled
.dat file. It points to using http://apps.icu-project.org/datacustom/,
which in fact seems to no longer exists, as it redirects to
https://unicode-org.atlassian.net/browse/ICU-12977/, which says that
the feature is no longer available since ICU 58.x.

So I guess we should first drop BR2_PACKAGE_ICU_CUSTOM_DATA_PATH which
is already unusable today.

Then the second question is whether we can provide/generate some kind
of default file in Buildroot that would in a default Buildroot
configuration generate a more minimal ICU dataset. For example by
building only the support for English ? Or based on the value of
BR2_GENERATE_LOCALE ?

I know this would break backward compatibility, but it would really
make ICU a lot more reasonable in size for most of our users. Indeed,
they are unlikely to know that they can reduce the size of ICU by using
this new feature.

> +ICU_DATA_FILTER_FILE = $(call qstrip,$(BR2_PACKAGE_ICU_DATA_FILTER_FILE))
> +
> +ifneq ($(ICU_DATA_FILTER_FILE),)
> +HOST_ICU_DATA_SOURCE = $(subst src.tgz,data.zip,$(ICU_SOURCE))
> +HOST_ICU_EXTRA_DOWNLOADS += $(HOST_ICU_SITE)/$(HOST_ICU_DATA_SOURCE)
> +
> +define HOST_ICU_EXTRACT_DATA
> +	rm -rf $(@D)/$(HOST_ICU_SUBDIR)/data
> +	$(UNZIP) $(ICU_DL_DIR)/$(HOST_ICU_DATA_SOURCE) -d $(@D)/$(HOST_ICU_SUBDIR)
> +endef
> +HOST_ICU_POST_EXTRACT_HOOKS += HOST_ICU_EXTRACT_DATA
> +
> +HOST_ICU_CONF_ENV = ICU_DATA_FILTER_FILE=$(ICU_DATA_FILTER_FILE)
> +HOST_ICU_CONF_OPTS += --with-data-packaging=archive
> +
> +define ICU_COPY_CUSTOM_DATA
> +	$(INSTALL) -D -m 644 $(HOST_ICU_DIR)/$(HOST_ICU_SUBDIR)/data/out/icudt$(ICU_VERSION_MAJOR)l.dat $(@D)/$(ICU_SUBDIR)/data/in/
> +endef
> +ICU_PRE_CONFIGURE_HOOKS += ICU_COPY_CUSTOM_DATA
> +endif

It took me quite some time to understand what was going on here. My
understanding is as follows:

 * In a normal build, the pre-compiled source/data/in/icudt69l.dat
   provided in the ICU tarball is used.

 * When a custom dataset needs to be generated thanks to your new
   option, we need to download the source of this dataset as an extra
   download for the host-icu package, replace the source/data/ subdir
   with this source data set, and ask the host-icu package to generate
   icudt69l.dat. Then the target icu package grabs this pre-compiled
   icudt69l.dat.

Is that correct ? If so, then I'd say it would be useful to add a
comment above this code, as I find the logic to not be that trivial.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
