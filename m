From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 22:22:50 +0200
Subject: [Buildroot] [PATCH 2/2] python-meson: new package
In-Reply-To: <1465047243-1169-3-git-send-email-eric.le.bihan.dev@free.fr>
References: <1465047243-1169-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1465047243-1169-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20160608222250.6d493138@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Jun 2016 15:34:03 +0200, Eric Le Bihan wrote:
> This new package provides the Meson Build System, an open source build
> system meant to be both extremely fast, and as user friendly as
> possible.
> 
> More precisely, Meson creates configuration files for the Ninja build
> system.
> 
> The host variant is also provided, which, besides building Meson,
> generates a cross-compilation configuration file:
> '$(HOST_DIR)/etc/meson/cross-compilation.conf'.
> 
> To be able to perform checks when cross-compiling, the host variant
> depends on host-qemu.
> 
> To cross-compile a Meson-based project for the target, its package
> should:
> 
>  - depend on host-python-meson
>  - invoke the host variant of Meson with the
>    *--cross-file=$(HOST_DIR)/etc/meson/cross-compilation.conf* option.
>  - invoke host variant of Ninja to perform the actual build.

It would probably be good to write this somewhere, as it is quite
important to know for users of this build system. But I'm not sure
where: you're going to have only a host package, so no Config.in file,
and therefore no help text. And I'm not sure where this could be added
in the Buildroot manual.

>  package/Config.in                              |  1 +
>  package/python-meson/Config.in                 |  9 +++++

As discussed, if it's a build system, please add only a host package.


> diff --git a/package/python-meson/python-meson.hash b/package/python-meson/python-meson.hash
> new file mode 100644
> index 0000000..7af56c5
> --- /dev/null
> +++ b/package/python-meson/python-meson.hash
> @@ -0,0 +1 @@
> +none xxx python-meson-0.31.0.tar.gz

Since you're fetching from Github, please add a real hash.


> +HOST_PYTHON_MESON_DEPENDENCIES = host-qemu
> +HOST_PYTHON_MESON_NEEDS_HOST_PYTHON = python3
> +
> +HOST_PYTHON_MESON_TARGET_ARCH = $(call qstrip,$(BR2_ARCH))

You can directly use the $(ARCH) variable, which is defined in the main
Makefile.

> +HOST_PYTHON_MESON_TARGET_ENDIAN = $(shell echo $(BR2_ENDIAN) | tr 'A-Z' 'a-z')

$(call LOWERCASE,$(call qstrip,$(BR2_ENDIAN))

> +
> +define HOST_PYTHON_MESON_REMOVE_GUI_TOOL
> +	rm -f $(HOST_DIR)/usr/bin/mesongui.py
> +endef

Not sure removing stuff from the host variant is really useful.

> +
> +define HOST_PYTHON_MESON_INSTALL_CROSS_CONF
> +	$(INSTALL) -D -m 0644 package/python-meson/cross-compilation.conf.in \
> +		$(HOST_DIR)/etc/meson/cross-compilation.conf
> +	$(SED) 's;@TARGET_CROSS@;$(TARGET_CROSS);g' \
> +		-e 's;@TARGET_ARCH@;$(HOST_PYTHON_MESON_TARGET_ARCH);g' \
> +		-e 's;@TARGET_ENDIAN@;$(HOST_PYTHON_MESON_TARGET_ENDIAN);g' \
> +		-e 's;@HOST_DIR@;$(HOST_DIR);g' \
> +		$(HOST_DIR)/etc/meson/cross-compilation.conf
> +endef
> +
> +define HOST_PYTHON_MESON_INSTALL_EXE_WRAPPER
> +	$(INSTALL) -D -m 0755 package/python-meson/meson-exe-wrapper.in \
> +		$(HOST_DIR)/usr/bin/meson-exe-wrapper
> +	$(SED) 's;@TARGET_ARCH@;$(HOST_PYTHON_MESON_TARGET_ARCH);g' \
> +		-e 's;@HOST_DIR@;$(HOST_DIR);g' \
> +		-e 's;@TARGET_DIR@;$(TARGET_DIR);g' \
> +		$(HOST_DIR)/usr/bin/meson-exe-wrapper
> +endef
> +
> +HOST_PYTHON_MESON_POST_INSTALL_HOOKS += \
> +	HOST_PYTHON_MESON_REMOVE_GUI_TOOL \
> +	HOST_PYTHON_MESON_INSTALL_CROSS_CONF \
> +	HOST_PYTHON_MESON_INSTALL_EXE_WRAPPER
> +
> +
> +$(eval $(python-package))
> +$(eval $(host-python-package))

Other than that, looks good!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
