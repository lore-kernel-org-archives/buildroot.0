From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 17 Jan 2015 21:37:03 +0200
Subject: [Buildroot] [PATCH 1/1] benejson: new package
In-Reply-To: <1421413381-25236-1-git-send-email-codehero@gmail.com>
References: <1421413381-25236-1-git-send-email-codehero@gmail.com>
Message-ID: <20150117193703.GB2827@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi David,

On Fri, Jan 16, 2015 at 08:03:01AM -0500, David Bender wrote:
> diff --git a/package/benejson/benejson.mk b/package/benejson/benejson.mk
> new file mode 100644
> index 0000000..851b95e
> --- /dev/null
> +++ b/package/benejson/benejson.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# benejson
> +#
> +################################################################################
> +
> +BENEJSON_VERSION = 0.9.7
> +BENEJSON_SITE =  $(call github,codehero,benejson,$(BENEJSON_VERSION))
> +BENEJSON_LICENSE = BSD-3c
> +BENEJSON_LICENSE_FILES = COPYING
> +BENEJSON_INSTALL_STAGING = YES
> +
> +BENEJSON_DEPENDENCIES = host-scons
> +
> +BENEJSON_SCONS_ENV = $(TARGET_CONFIGURE_OPTS) CROSS=$(TARGET_CROSS)
> +
> +define BENEJSON_BUILD_CMDS
> +	(cd $(@D); \
> +		$(BENEJSON_SCONS_ENV) \
> +		$(SCONS) \
> +		$(BENEJSON_SCONS_OPTS))

BENEJSON_SCONS_OPTS doesn't seem to be initialized here.

> +endef
> +
> +define BENEJSON_INSTALL_STAGING_CMDS
> +	(cd $(@D); \
> +		cp -ra include/benejson $(STAGING_DIR)/usr/include; \
> +		cp lib/libbenejson.{so,a} $(STAGING_DIR)/usr/lib \
> +		)
> +endef
> +
> +define BENEJSON_INSTALL_TARGET_CMDS
> +	(cd $(@D); \
> +		cp lib/libbenejson.{so,a} $(TARGET_DIR)/usr/lib \
> +		)
> +endef
> +
> +$(eval $(generic-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
