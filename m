From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 15 May 2021 08:05:05 +0800
Subject: [Buildroot] [PATCH 1/2] package/jh71xx-tools: new package
In-Reply-To: <20210514220316.1942381-2-thomas.petazzoni@bootlin.com>
References: <20210514220316.1942381-1-thomas.petazzoni@bootlin.com>
 <20210514220316.1942381-2-thomas.petazzoni@bootlin.com>
Message-ID: <CAEUhbmVKoAwQbT93HA-okHSweigP4tZU1ci6kUSVfgGdx16Vwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 15, 2021 at 6:03 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Add jh71xx-tools as a new host package, it includes a tool that allows
> to recover the bootloader of JH71xx-based platforms, such as the
> BeagleV.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  DEVELOPERS                             |  1 +
>  package/Config.in.host                 |  1 +
>  package/jh71xx-tools/Config.in.host    |  7 +++++++
>  package/jh71xx-tools/jh71xx-tools.hash |  3 +++
>  package/jh71xx-tools/jh71xx-tools.mk   | 20 ++++++++++++++++++++
>  5 files changed, 32 insertions(+)
>  create mode 100644 package/jh71xx-tools/Config.in.host
>  create mode 100644 package/jh71xx-tools/jh71xx-tools.hash
>  create mode 100644 package/jh71xx-tools/jh71xx-tools.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ed86dc82ba..a90ad1c354 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2633,6 +2633,7 @@ F:        package/heirloom-mailx/
>  F:     package/hiawatha/
>  F:     package/igh-ethercat/
>  F:     package/intltool/
> +F:     package/jh71xx-tools/
>  F:     package/libcap/
>  F:     package/libffi/
>  F:     package/libsha1/
> diff --git a/package/Config.in.host b/package/Config.in.host
> index ba6a68c728..cef36cebc1 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -40,6 +40,7 @@ menu "Host utilities"
>         source "package/imx-mkimage/Config.in.host"
>         source "package/imx-usb-loader/Config.in.host"
>         source "package/jq/Config.in.host"
> +       source "package/jh71xx-tools/Config.in.host"

nits: this should put be before "jq" per alphabetical order

>         source "package/jsmin/Config.in.host"
>         source "package/kmod/Config.in.host"
>         source "package/libp11/Config.in.host"
> diff --git a/package/jh71xx-tools/Config.in.host b/package/jh71xx-tools/Config.in.host
> new file mode 100644
> index 0000000000..08872f295c
> --- /dev/null
> +++ b/package/jh71xx-tools/Config.in.host
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_HOST_JH71XX_TOOLS
> +       bool "host jh71xx-tools"
> +       depends on BR2_riscv
> +       help
> +         Bootloader recovery and updater tool for StarFive JH7100 SoCs.
> +
> +         https://github.com/kprasadvnsi/JH71xx-tools
> diff --git a/package/jh71xx-tools/jh71xx-tools.hash b/package/jh71xx-tools/jh71xx-tools.hash
> new file mode 100644
> index 0000000000..d8a88dcb22
> --- /dev/null
> +++ b/package/jh71xx-tools/jh71xx-tools.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  0f16ea896164f6e8bfe0a03bbbd95ff14d474445ba6f045f9377d01282c9364f  jh71xx-tools-7a29f4b9d2355aa39afa8680680909bb74e4991d.tar.gz
> +sha256  3ef425421620cd815709f3ede736bb83dbfc47201897b66731606dc699e98460  jh7100-recover.c
> diff --git a/package/jh71xx-tools/jh71xx-tools.mk b/package/jh71xx-tools/jh71xx-tools.mk
> new file mode 100644
> index 0000000000..b9f3974931
> --- /dev/null
> +++ b/package/jh71xx-tools/jh71xx-tools.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# jh71xx-tools
> +#
> +################################################################################
> +
> +JH71XX_TOOLS_VERSION = 7a29f4b9d2355aa39afa8680680909bb74e4991d
> +JH71XX_TOOLS_SITE = $(call github,kprasadvnsi,JH71xx-tools,$(JH71XX_TOOLS_VERSION))
> +JH71XX_TOOLS_LICENSE = MIT
> +JH71XX_TOOLS_LICENSE_FILES = jh7100-recover.c
> +
> +define HOST_JH71XX_TOOLS_BUILD_CMDS
> +       $(HOSTCC) -o $(@D)/jh7100-recover $(@D)/jh7100-recover.c
> +endef
> +
> +define HOST_JH71XX_TOOLS_INSTALL_CMDS
> +       $(INSTALL) -D -m 0755 $(@D)/jh7100-recover $(HOST_DIR)/bin/jh7100-recover
> +endef
> +
> +$(eval $(host-generic-package))

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
