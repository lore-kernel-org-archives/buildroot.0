From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Dec 2013 14:19:25 +0100
Subject: [Buildroot] [PATCH 1/1] ktap: new package
In-Reply-To: <1384172666-25736-1-git-send-email-anders@chargestorm.se>
References: <1384172666-25736-1-git-send-email-anders@chargestorm.se>
Message-ID: <20131208141925.67fa9aea@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anders Darander,

On Mon, 11 Nov 2013 13:24:26 +0100, Anders Darander wrote:

> +KTAP_VERSION = 0.3
> +KTAP_SITE    = https://github.com/ktap/ktap/archive
> +KTAP_SOURCE  = v$(KTAP_VERSION).tar.gz
> +KTAP_LICENSE = GPLv2
> +KTAP_LICENSE_FILES = LICENSE-GPL
> +
> +KTAP_DEPENDENCIES = linux
> +
> +define KTAP_BUILD_CMDS
> +	$(MAKE) -C $(@D) CC=${TARGET_CC} ktap

Can you use:

	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) ktap

instead ?

> +	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_SRC=$(LINUX_DIR) KVERSION=${LINUX_VERSION_PROBED} mod

KVERSION=$(LINUX_VERSION_PROBED)

i.e use $() instead of ${}, since LINUX_VERSION_PROBED is a make
variable.

> +endef
> +
> +define KTAP_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m755 $(@D)/ktap  $(TARGET_DIR)/usr/bin/

	$(INSTALL) -D -m755 $(@D)/ktap $(TARGET_DIR/usr/bin/ktap

> +	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_SRC=$(LINUX_DIR) KVERSION=${LINUX_VERSION_PROBED} modules_install

Ditto for the ${} -> $().

> +endef
> +
> +$(eval $(generic-package))

Other than that, looks good to me!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
