From: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
Date: Thu, 4 Feb 2016 11:38:09 +0530
Subject: [Buildroot] [PATCH V7] package/nvme: new package
In-Reply-To: <20160121052928.8568.3019.stgit@localhost.localdomain>
References: <20160121052928.8568.3019.stgit@localhost.localdomain>
Message-ID: <56B2EAC9.1090801@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

When NVME patch will get into "buildroot" project ?


On 01/21/2016 11:06 AM, Mamatha Inamdar wrote:
> Add support for building NVME utility - a utility for interacting with
> standard NVM Express (optimized PCI Express SSD interface) devices.
>
> Signed-off-by: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
> ---
>   package/Config.in                             |    1 +
>   package/nvme/0001-NVME-Makefile-cleanup.patch |   25 +++++++++++++++++++++++++
>   package/nvme/Config.in                        |    6 ++++++
>   package/nvme/nvme.hash                        |    2 ++
>   package/nvme/nvme.mk                          |   22 ++++++++++++++++++++++
>   5 files changed, 56 insertions(+)
>   create mode 100644 package/nvme/0001-NVME-Makefile-cleanup.patch
>   create mode 100644 package/nvme/Config.in
>   create mode 100644 package/nvme/nvme.hash
>   create mode 100755 package/nvme/nvme.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index e0c2e2a..4d173d4 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -380,6 +380,7 @@ endif
>   	source "package/neard/Config.in"
>   	source "package/nvidia-driver/Config.in"
>   	source "package/nvidia-tegra23/Config.in"
> +	source "package/nvme/Config.in"
>   	source "package/ofono/Config.in"
>   	source "package/ola/Config.in"
>   	source "package/on2-8170-modules/Config.in"
> diff --git a/package/nvme/0001-NVME-Makefile-cleanup.patch b/package/nvme/0001-NVME-Makefile-cleanup.patch
> new file mode 100644
> index 0000000..74beac9
> --- /dev/null
> +++ b/package/nvme/0001-NVME-Makefile-cleanup.patch
> @@ -0,0 +1,25 @@
> +From 985a18605f8decd766370a7d9873c77c16b9253c Mon Sep 17 00:00:00 2001
> +From: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
> +Date: Mon, 18 Jan 2016 12:40:00 +0530
> +Subject: [PATCH V2] NVME Makefile update
> +
> +Makefile cleanup: remove -Werror flag in CFLAGS
> +
> +Signed-off-by: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index d0c0ce4..003928b 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -1,4 +1,4 @@
> +-CFLAGS += -std=gnu99 -O2 -g -Wall -Werror
> ++CFLAGS += -std=gnu99 -O2 -g -Wall
> + CPPFLAGS += -I $(SRC) -D_GNU_SOURCE
> + NVME = nvme
> + INSTALL ?= install
> +--
> +1.9.3
> +
> diff --git a/package/nvme/Config.in b/package/nvme/Config.in
> new file mode 100644
> index 0000000..8b5d37d
> --- /dev/null
> +++ b/package/nvme/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_NVME
> +	bool "nvme"
> +	help
> +	  System utilities for IBM Power NVME devices
> +
> +	  https://github.com/linux-nvme/nvme-cli
> diff --git a/package/nvme/nvme.hash b/package/nvme/nvme.hash
> new file mode 100644
> index 0000000..539a2b6
> --- /dev/null
> +++ b/package/nvme/nvme.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256  914319930a51372293c981562b165ae6af0de70f7da37e42da23940fe23aa387 nvme-v0.2.tar.gz
> diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
> new file mode 100755
> index 0000000..f06ed47
> --- /dev/null
> +++ b/package/nvme/nvme.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# nvme
> +#
> +################################################################################
> +
> +NVME_VERSION = v0.2
> +NVME_SITE = $(call github,linux-nvme,nvme-cli,$(NVME_VERSION))
> +NVME_LICENSE = GPLv2+
> +NVME_LICENSE_FILES = COPYING
> +
> +define NVME_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
> +		LIBUDEV=1 -C $(@D)
> +endef
> +
> +define NVME_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
> +		PREFIX=/usr install-bin
> +endef
> +
> +$(eval $(generic-package))
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
