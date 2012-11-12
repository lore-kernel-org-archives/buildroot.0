From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Nov 2012 19:34:58 +0100
Subject: [Buildroot] [PATCH v2 1/6] hdmiservice: new package
In-Reply-To: <1352742102-19010-2-git-send-email-gregory.hermant@calao-systems.com>
References: <1352742102-19010-1-git-send-email-gregory.hermant@calao-systems.com>
 <1352742102-19010-2-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <20121112193458.1504468b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gregory Hermant,

On Mon, 12 Nov 2012 18:41:37 +0100, Gregory Hermant wrote:
> 
> Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
> ---
>  package/Config.in                  |    1 +
>  package/hdmiservice/Config.in      |   10 +++++++++
>  package/hdmiservice/hdmiservice.mk |   43 ++++++++++++++++++++++++++++++++++++

Is this software something generic, or very specific to the Snowball
platform? I am worried by the package name that is way too generic for
something that looks board specific. It seems to be tied to a very
custom graphics driver.

> diff --git a/package/hdmiservice/hdmiservice.mk b/package/hdmiservice/hdmiservice.mk
> new file mode 100644
> index 0000000..7199f1c
> --- /dev/null
> +++ b/package/hdmiservice/hdmiservice.mk
> @@ -0,0 +1,43 @@
> +#############################################################
> +#
> +# hdmiservice
> +#
> +#############################################################
> +HDMISERVICE_VERSION = f75c99d1c52707240a78b4ba78e41d20d3aa3b08
> +HDMISERVICE_SITE = git://igloocommunity.org/git/bsp/hdmiservice.git
> +HDMISERVICE_LICENSE = MIT
> +HDMISERVICE_LICENSE_FILES = debian/copyright
> +HDMISERVICE_INSTALL_STAGING = YES
> +
> +define HDMISERVICE_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC)" -C $(@D)
> +endef
> +
> +define HDMISERVICE_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/hdmiservice.so $(STAGING_DIR)/usr/lib/hdmiservice.so
> +	$(INSTALL) -D -m 0644 $(@D)/include/hdmi_service_api.h $(STAGING_DIR)/usr/include/hdmi_service_api.h
> +	$(INSTALL) -D -m 0644 $(@D)/include/hdmi_service_local.h $(STAGING_DIR)/usr/include/hdmi_service_local.h
> +endef
> +
> +define HDMISERVICE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/hdmiservice.so $(TARGET_DIR)/usr/lib/hdmiservice.so
> +	$(INSTALL) -D -m 0755 $(@D)/hdmistart $(TARGET_DIR)/usr/bin/hdmistart
> +endef

Any reason not to use the 'make install' target which apparently does
the right thing?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
