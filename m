From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 21 Nov 2020 11:18:58 +0100
Subject: [Buildroot] [PATCH v4 1/5] package/nvidia-modprobe: new package
In-Reply-To: <20201119075328.8599-1-christian@paral.in>
References: <20201119075328.8599-1-christian@paral.in>
Message-ID: <c39da99f-96c6-66ef-8f49-4655112a5441@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

Le 19/11/2020 ? 08:53, Christian Stewart a ?crit?:
> nvidia-modprobe package adds a utility and headers for probing the NVIDIA
> hardware at runtime.
> 
> https://github.com/NVIDIA/nvidia-modprobe
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/Config.in                            |  1 +
>  package/nvidia-modprobe/Config.in            | 12 ++++++
>  package/nvidia-modprobe/nvidia-modprobe.hash |  3 ++
>  package/nvidia-modprobe/nvidia-modprobe.mk   | 45 ++++++++++++++++++++
>  4 files changed, 61 insertions(+)
>  create mode 100644 package/nvidia-modprobe/Config.in
>  create mode 100644 package/nvidia-modprobe/nvidia-modprobe.hash
>  create mode 100644 package/nvidia-modprobe/nvidia-modprobe.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 016a99ed1a..fa1b5d35e9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -502,6 +502,7 @@ endmenu
>  	source "package/nanocom/Config.in"
>  	source "package/neard/Config.in"
>  	source "package/nvidia-driver/Config.in"
> +	source "package/nvidia-modprobe/Config.in"
>  	source "package/nvme/Config.in"
>  	source "package/ofono/Config.in"
>  	source "package/on2-8170-modules/Config.in"
> diff --git a/package/nvidia-modprobe/Config.in b/package/nvidia-modprobe/Config.in
> new file mode 100644
> index 0000000000..35953a33d4
> --- /dev/null
> +++ b/package/nvidia-modprobe/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_NVIDIA_MODPROBE
> +	bool "nvidia-modprobe"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

glibc toolchains already select BR2_TOOLCHAIN_HAS_THREADS.

> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	help
> +	  nvidia-modprobe package adds a utility and headers for
> +	  probing the NVIDIA hardware at runtime.
> +
> +	  https://github.com/NVIDIA/nvidia-modprobe
> +
> +comment "nvidia-modprobe needs a glibc toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAN_USES_GLIBC
> diff --git a/package/nvidia-modprobe/nvidia-modprobe.hash b/package/nvidia-modprobe/nvidia-modprobe.hash
> new file mode 100644
> index 0000000000..99908680f0
> --- /dev/null
> +++ b/package/nvidia-modprobe/nvidia-modprobe.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256 396b4102d3075a2dee3024652fae206a1b38ace54b8efb1e2c20757a11ec19f1  nvidia-modprobe-450.57.tar.gz
> +sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/nvidia-modprobe/nvidia-modprobe.mk b/package/nvidia-modprobe/nvidia-modprobe.mk
> new file mode 100644
> index 0000000000..7eeee6716c
> --- /dev/null
> +++ b/package/nvidia-modprobe/nvidia-modprobe.mk
> @@ -0,0 +1,45 @@
> +################################################################################
> +#
> +# nvidia-modprobe
> +#
> +################################################################################
> +
> +NVIDIA_MODPROBE_VERSION = 450.57
> +NVIDIA_MODPROBE_SITE = $(call github,NVIDIA,nvidia-modprobe,$(NVIDIA_MODPROBE_VERSION))
> +NVIDIA_MODPROBE_LICENSE = GPL-2

The license should use identifier like GPL-2.0 or GPL-2.0+.
Here it should be GPL-2.0.

> +NVIDIA_MODPROBE_LICENSE_FILES = COPYING
> +
> +NVIDIA_MODPROBE_DEPENDENCIES = host-pkgconf

Why ? the binary is build by using gcc directly without any build system.

> +NVIDIA_MODPROBE_INSTALL_STAGING = YES
> +
> +define NVIDIA_MODPROBE_BUILD_CMDS
> +	mkdir -p $(@D)/bin
> +	$(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
> +		-I $(@D)/common-utils -I $(@D)/modprobe-utils \
> +		-o $(@D)/bin/nvidia-modprobe \
> +		-DNV_LINUX=true -DPROGRAM_NAME=\"nvidia-modprobe\" \
> +		-DNVIDIA_VERSION=\"$(NVIDIA_MODPROBE_VERSION)\" \
> +		$(@D)/nvidia-modprobe.c $(@D)/modprobe-utils/nvidia-modprobe-utils.c \
> +		$(@D)/modprobe-utils/pci-sysfs.c $(@D)/common-utils/common-utils.c \
> +		$(@D)/common-utils/msg.c $(@D)/common-utils/nvgetopt.c
> +endef

There is a Makefile why not using it ?
Ok it want to install the man pages but it should be easy to fix it.

> +
> +define NVIDIA_MODPROBE_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 644 $(@D)/modprobe-utils/nvidia-modprobe-utils.h \
> +		$(STAGING_DIR)/usr/include/nvidia-modprobe-utils/nvidia-modprobe-utils.h
> +	$(INSTALL) -D -m 644 $(@D)/modprobe-utils/pci-enum.h \
> +		$(STAGING_DIR)/usr/include/nvidia-modprobe-utils/pci-enum.h
> +	$(INSTALL) -D -m 644 $(@D)/common-utils/common-utils.h \
> +		$(STAGING_DIR)/usr/include/nvidia-modprobe-utils/nvidia-common-utils.h
> +	$(INSTALL) -D -m 644 $(@D)/common-utils/msg.h \
> +		$(STAGING_DIR)/usr/include/nvidia-modprobe-utils/msg.h
> +	$(INSTALL) -D -m 644 $(@D)/common-utils/nvgetopt.h \
> +		$(STAGING_DIR)/usr/include/nvidia-modprobe-utils/nvgetopt.h
> +endef

Same, we really don't want to maintain the gcc command line and the list of
installed files. The Makefile must do it for us :)

> +
> +define NVIDIA_MODPROBE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 $(@D)/bin/nvidia-modprobe \
> +		$(TARGET_DIR)/usr/bin/nvidia-modprobe
> +endef

Same.

Best regards,
Romain

> +
> +$(eval $(generic-package))
> 
