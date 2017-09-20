From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 20 Sep 2017 07:40:24 +0300
Subject: [Buildroot] [PATCH 2/9] tini: new package
In-Reply-To: <20170920030210.19446-3-christian@paral.in>
References: <20170920030210.19446-1-christian@paral.in>
 <20170920030210.19446-3-christian@paral.in>
Message-ID: <20170920044024.hw3gktuy622jtlec@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,

On Wed, Sep 20, 2017 at 04:02:03AM +0100, Christian Stewart wrote:
> diff --git a/package/tini/tini.mk b/package/tini/tini.mk
> new file mode 100644
> index 0000000000..6fa40e7920
> --- /dev/null
> +++ b/package/tini/tini.mk
> @@ -0,0 +1,41 @@
> +################################################################################
> +#
> +# tini
> +#
> +################################################################################
> +
> +TINI_VERSION = v0.14.0

Any reason not to package the latest 0.16.1 version?

> +TINI_SITE = https://github.com/krallin/tini/archive
> +TINI_SOURCE = $(TINI_VERSION).tar.gz
> +TINI_LICENSE = MIT
> +TINI_LICENSE_FILES = LICENSE
> +TINI_CFLAGS = $(TARGET_CFLAGS) -DTINI_VERSION=\"$(TINI_VERSION)\" -DTINI_GIT=\"\"
> +
> +ifeq ($(BR2_PACKAGE_TINI_MINIMAL),y)
> +TINI_CFLAGS += -DTINI_MINIMAL
> +endif
> +
> +ifeq ($(BR2_PACKAGE_TINI_STATIC),y)
> +TINI_CFLAGS += -static
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
> +TINI_CFLAGS += -fstack-protector --param=ssp-buffer-size=4
> +endif
> +
> +define TINI_CONFIGURE_CMDS
> +	printf "#pragma once\n" > $(@D)/src/tiniConfig.h
> +endef
> +
> +define TINI_BUILD_CMDS
> +	$(TARGET_CC) \
> +		$(TINI_CFLAGS) \
> +		-o $(@D)/tini $(@D)/src/tini.c
> +endef
> +
> +define TINI_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/tini $(TARGET_DIR)/usr/bin/tini
> +endef
> +
> +# Tini's CMakeLists.txt is not suitable for Buildroot.

Please explain way.

> +$(eval $(generic-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
