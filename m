From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 14:44:18 +0200
Subject: [Buildroot] [PATCH 2/2 v4] odroid-mali: New Package.
In-Reply-To: <20160724055602.7159-2-daggs@gmx.com>
References: <20160724055602.7159-1-daggs@gmx.com>
 <20160724055602.7159-2-daggs@gmx.com>
Message-ID: <20160724144418.79f779f4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 08:56:02 +0300, Dagg Stompler wrote:
> v3 -> v4:
>  - update repo rev to 46fe49f37e3506c6205ad8c50980eca9bfff11e3.
>  - update hash
>  - 32 and 64 bit flavors can now use the same repo rev.
> 
> v2 -> v3:
>  - fix pkgconfig installation.
> 
> v1 -> v2:
>  - added hash for 32 bits revision.
>  - fix file permissions for S50odroidc2_fb and odroidc2_init_fb.sh

The changelog should not be part of the commit log. It should go...

> 
> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---

... here.

>  package/Config.in                    |  1 +
>  package/odroid-mali/Config.in        | 21 +++++++++++++++++++++
>  package/odroid-mali/odroid-mali.hash |  2 ++
>  package/odroid-mali/odroid-mali.mk   | 36 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 60 insertions(+)
>  create mode 100644 package/odroid-mali/Config.in
>  create mode 100644 package/odroid-mali/odroid-mali.hash
>  create mode 100644 package/odroid-mali/odroid-mali.mk

> +	depends on BR2_PACKAGE_ODROID_SCRIPTS

Why do you have this dependency?

> +################################################################################
> +#
> +# odroid-mali
> +#
> +################################################################################
> +
> +ODROID_MALI_VERSION = 46fe49f37e3506c6205ad8c50980eca9bfff11e3
> +ODROID_MALI_SITE = $(call github,mdrjr,c2_mali,$(ODROID_MALI_VERSION))
> +ODROID_MALI_LICENSE = hardkernel

I think:

	Hardkernel EULA

would be better here.

> +ODROID_MALI_LICENSE_FILES = README.md
> +
> +ODROID_MALI_INSTALL_STAGING = YES
> +ODROID_MALI_PROVIDES = libegl libgles
> +
> +ifeq ($(BR2_aarch64),y)
> +ODROID_MALI_LIBS_INSTALL_ARCH=mali_libs
> +else
> +ODROID_MALI_LIBS_INSTALL_ARCH=32bit_libs
> +endif
> +
> +define ODROID_MALI_INSTALL_LIBS
> +	cp -aRP $(@D)/fbdev/$(ODROID_MALI_LIBS_INSTALL_ARCH)/lib* $(1)/lib/

Make it:

	cp -aRP $(@D)/fbdev/$(ODROID_MALI_LIBS_INSTALL_ARCH)/lib* $(1)/usr/lib/

This way you just have to pass TARGET_DIR or STAGING_DIR, and not
TARGET_DIR/usr and STAGING_DIR/usr.

Also, in Buildroot, we by convention use:

	cp -dpfr


> +endef
> +
> +define ODROID_MALI_INSTALL_STAGING_CMDS
> +	$(call ODROID_MALI_INSTALL_LIBS,$(STAGING_DIR)/usr)
> +	$(INSTALL) -d $(STAGING_DIR)/usr/lib/pkgconfig
> +	$(INSTALL) -m 644 $(@D)/pkgconfig/*.pc $(STAGING_DIR)/usr/lib/pkgconfig/

Use cp

> +	cp -aRP $(@D)/fbdev/mali_headers/* $(STAGING_DIR)/usr/include

cp -dpfr

> +endef
> +
> +define ODROID_MALI_INSTALL_TARGET_CMDS
> +	$(call ODROID_MALI_INSTALL_LIBS,$(TARGET_DIR)/usr)
> +endef
> +
> +$(eval $(generic-package))

Other than that, looks good.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
