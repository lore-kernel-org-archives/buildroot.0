From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Apr 2017 14:34:40 +0200
Subject: [Buildroot] [PATCH 1/2] phytool: new package
In-Reply-To: <20170412121634.8928-1-yegorslists@googlemail.com>
References: <20170412121634.8928-1-yegorslists@googlemail.com>
Message-ID: <8033a42c-841d-2646-42ac-afb484063161@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-04-17 14:16, yegorslists at googlemail.com wrote:
[snip]
> diff --git a/package/phytool/phytool.mk b/package/phytool/phytool.mk
> new file mode 100644
> index 000000000..6115cb837
> --- /dev/null
> +++ b/package/phytool/phytool.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# phytool
> +#
> +################################################################################
> +
> +PHYTOOL_VERSION = 3149bfdb4f513e2f0da0a7d0bc5d0873578696f2
> +PHYTOOL_SITE = $(call github,wkz,phytool,$(PHYTOOL_VERSION))

 There's an uploaded tarball including md5 sum of v1.0.1. There is only one
commit difference, and htat just adds LDFLAGS support. But that can be overcome
by using LDLIBS instead of LDFLAGS.

> +PHYTOOL_LICENSE = GPL-2.0

 I see GPL-2.0+ in all source files, did I miss anything?

> +PHYTOOL_LICENSE_FILES = LICENSE
> +
> +define PHYTOOL_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
> +		LDFLAGS="$(TARGET_LDFLAGS)" $(MAKE) -C $(@D)

 We prefer using TARGET_CONF_OPTS, like

	$(TARGET_MAKE_ENV) $(TARGET_CONF_OPTS) $(MAKE) -C $(@D) \
		LDLIBS="$(TARGET_LDFLAGS)"

> +endef
> +
> +define PHYTOOL_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" \
> +		PREFIX="usr" install

 We also generally prefer to use as much as possible the same command line for
the install commands, so including the extra flags.


 Regards,
 Arnout


> +endef
> +
> +$(eval $(generic-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
