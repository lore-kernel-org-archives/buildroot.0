From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 8 Aug 2020 10:02:49 +0300
Subject: [Buildroot] [PATCH v1 1/6] package/nvidia-modprobe: new package
In-Reply-To: <20200801213645.33787-1-christian@paral.in>
References: <20200801213645.33787-1-christian@paral.in>
Message-ID: <CALFsTFUsbwJohwJ4wRtd=jkyd=86jTtukirXW0pFHrHhx5NpwQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Aug 2, 2020 at 12:36 AM Christian Stewart <christian@paral.in> wrote:
>
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
> index 015a7f1054..3349641371 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -501,6 +501,7 @@ endmenu
>         source "package/nanocom/Config.in"
>         source "package/neard/Config.in"
>         source "package/nvidia-driver/Config.in"
> +       source "package/nvidia-modprobe/Config.in"
>         source "package/nvidia-tegra23/Config.in"
>         source "package/nvme/Config.in"
>         source "package/ofono/Config.in"
> diff --git a/package/nvidia-modprobe/Config.in b/package/nvidia-modprobe/Config.in
> new file mode 100644
> index 0000000000..35953a33d4
> --- /dev/null
> +++ b/package/nvidia-modprobe/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_NVIDIA_MODPROBE
> +       bool "nvidia-modprobe"
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on BR2_TOOLCHAIN_USES_GLIBC
> +       help
> +         nvidia-modprobe package adds a utility and headers for
> +         probing the NVIDIA hardware at runtime.
> +
> +         https://github.com/NVIDIA/nvidia-modprobe
> +
> +comment "nvidia-modprobe needs a glibc toolchain w/ threads"
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAN_USES_GLIBC
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
> +NVIDIA_MODPROBE_LICENSE_FILES = COPYING
> +
> +NVIDIA_MODPROBE_DEPENDENCIES = host-pkgconf
> +NVIDIA_MODPROBE_INSTALL_STAGING = YES
> +
> +define NVIDIA_MODPROBE_BUILD_CMDS
> +       mkdir -p $(@D)/bin
> +       $(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
> +               -I $(@D)/common-utils -I $(@D)/modprobe-utils \
> +               -o $(@D)/bin/nvidia-modprobe \
> +               -DNV_LINUX=true -DPROGRAM_NAME=\"nvidia-modprobe\" \
> +               -DNVIDIA_VERSION=\"$(NVIDIA_MODPROBE_VERSION)\" \
> +               $(@D)/nvidia-modprobe.c $(@D)/modprobe-utils/nvidia-modprobe-utils.c \
> +               $(@D)/modprobe-utils/pci-sysfs.c $(@D)/common-utils/common-utils.c \
> +               $(@D)/common-utils/msg.c $(@D)/common-utils/nvgetopt.c
> +endef
> +
> +define NVIDIA_MODPROBE_INSTALL_STAGING_CMDS
> +       $(INSTALL) -D -m 644 $(@D)/modprobe-utils/nvidia-modprobe-utils.h \
> +               $(STAGING_DIR)/usr/include/nvidia-modprobe-utils/nvidia-modprobe-utils.h
> +       $(INSTALL) -D -m 644 $(@D)/modprobe-utils/pci-enum.h \
> +               $(STAGING_DIR)/usr/include/nvidia-modprobe-utils/pci-enum.h
> +       $(INSTALL) -D -m 644 $(@D)/common-utils/common-utils.h \
> +               $(STAGING_DIR)/usr/include/nvidia-modprobe-utils/nvidia-common-utils.h
> +       $(INSTALL) -D -m 644 $(@D)/common-utils/msg.h \
> +               $(STAGING_DIR)/usr/include/nvidia-modprobe-utils/msg.h
> +       $(INSTALL) -D -m 644 $(@D)/common-utils/nvgetopt.h \
> +               $(STAGING_DIR)/usr/include/nvidia-modprobe-utils/nvgetopt.h
> +endef
> +
> +define NVIDIA_MODPROBE_INSTALL_TARGET_CMDS
> +       $(INSTALL) -m 0755 $(@D)/bin/nvidia-modprobe \
> +               $(TARGET_DIR)/usr/bin/nvidia-modprobe
> +endef

Why do you prefer to call the compiler explicitly instead of using the Makefile?
I tested this package with the following change, and it seems to work fine:
define NVIDIA_MODPROBE_BUILD_CMDS
$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
endef

define NVIDIA_MODPROBE_INSTALL_TARGET_CMDS
$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) PREFIX=$(TARGET_DIR)
$(MAKE) -C $(@D) install
endef

Maybe I miss something?
> +
> +$(eval $(generic-package))
> --
> 2.27.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,
Asaf.
