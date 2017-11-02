From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Thu, 02 Nov 2017 19:26:05 +0100
Subject: [Buildroot] [PATCH v3] uboot-tools: disable pylibfdt
In-Reply-To: <20171101171849.7957-1-matthew.weber@rockwellcollins.com>
References: <20171101171849.7957-1-matthew.weber@rockwellcollins.com>
Message-ID: <d045227b-a064-4104-8822-dc3c32097837@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On st?eda 1. listopadu 2017 18:18:49 CET, Matt Weber wrote:
> Using concepts from the future upstream fix (post 2017.11),
> which sets up a kconfig variable for pylibfdt and
> conditionally enables the swig wrapper creation (default=n).
> (https://patchwork.ozlabs.org/patch/826742/)
> (https://patchwork.ozlabs.org/patch/826752/)
>
> This does not disable the use of the swig wrapper directly with
> the version of u-boot being used. The uboot package still has
> the BR2_TARGET_UBOOT_NEEDS_PYLIBFDT option to enable this feature.
>
> Fixes (one of many):
> http://autobuild.buildroot.net/results/f9e13caae9b31c9dcde7d24caecc036324f269cc
>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>
> --
> Changes
> v2 -> v3
>  - Moved from removing the swig and python to instead following
>    the pattern of the future changes captured in this patchset
>    to expose it through kconfig.
>    (https://lists.denx.de/pipermail/u-boot/2017-October/309560.html)
>
> v1 -> v2
>  - Removed all swig and python content from Makefile and noted
>    future changes coming upstream in 2017.11
> ---
>  .../0004-uboot-tools-disable-pylibfdt.patch        | 72 
> ++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 
> package/uboot-tools/0004-uboot-tools-disable-pylibfdt.patch
>
> diff --git 
> a/package/uboot-tools/0004-uboot-tools-disable-pylibfdt.patch 
> b/package/uboot-tools/0004-uboot-tools-disable-pylibfdt.patch
> new file mode 100644
> index 0000000..1e38944
> --- /dev/null
> +++ b/package/uboot-tools/0004-uboot-tools-disable-pylibfdt.patch
> @@ -0,0 +1,72 @@
> +From d882c99de59316e50bfee7f5fce10fe9062dfa32 Mon Sep 17 00:00:00 2001
> +From: Matt Weber <matthew.weber@rockwellcollins.com>
> +Date: Wed, 1 Nov 2017 10:57:31 -0500
> +Subject: [PATCH] uboot-tools: disable pylibfdt
> +
> +Using concepts from the future upstream fix (post 2017.11),
> +which sets up a kconfig variable for pylibfdt and
> +conditionally enables the swig wrapper creation (default=n).
> +(https://patchwork.ozlabs.org/patch/826742/)
> +(https://patchwork.ozlabs.org/patch/826752/)
> +
> +This does not disable the use of the swig wrapper directly with
> +the version of u-boot being used. The u-boot package still has
> +the option to kconfig enable this feature.
> +
> +Fixes (one of many):
> +http://autobuild.buildroot.net/results/f9e13caae9b31c9dcde7d24caecc036324f269cc
> +
> +Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> +
> +--
> +Changes
> +v2 -> v3
> + - Moved from removing the swig and python to instead following
> +   the pattern of the future changes captured in this patchset
> +   to expose it through kconfig.
> +   (https://lists.denx.de/pipermail/u-boot/2017-October/309560.html)
> +
> +v1 -> v2
> + - Removed all swig and python content from Makefile and noted
> +   future changes coming upstream in 2017.11
> +---
> + Kconfig        | 5 +++++
> + tools/Makefile | 6 +++---
> + 2 files changed, 8 insertions(+), 3 deletions(-)
> +
> +diff --git a/Kconfig b/Kconfig
> +index bb80ada..99b0258 100644
> +--- a/Kconfig
> ++++ b/Kconfig
> +@@ -358,6 +358,11 @@ source "disk/Kconfig"
> + 
> + source "dts/Kconfig"
> + 
> ++config PYLIBFDT
> ++	bool
> ++	help
> ++	  Enables the generation of the pylibfdt swig wrapper.
> ++
> + source "net/Kconfig"
> + 
> + source "drivers/Kconfig"
> +diff --git a/tools/Makefile b/tools/Makefile
> +index 77706a9..cb6cb7a 100644
> +--- a/tools/Makefile
> ++++ b/tools/Makefile
> +@@ -226,9 +226,9 @@ clean-dirs := lib common
> + 
> + always := $(hostprogs-y)
> + 
> +-# Build a libfdt Python module if swig is available
> +-# Use 'sudo apt-get install swig libpython-dev' to enable this
> +-always += $(if $(shell which swig 2> /dev/null),_libfdt.so)
> ++ifneq ($(CONFIG_PYLIBFDT),)
> ++always += _libfdt.so
> ++endif
> + 
> + # Generated LCD/video logo
> + LOGO_H = $(objtree)/include/bmp_logo.h
> +-- 
> +1.8.3.1
> +

Thanks, this makes it possible to build U-Boot for clearfog on a minimal 
CentOS7 image without BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y.

Tested-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
Reviewed-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
