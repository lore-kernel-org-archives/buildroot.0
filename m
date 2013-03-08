From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 8 Mar 2013 10:37:00 +0100
Subject: [Buildroot] [PATCH 1/3] sunxi-tools: new host package
In-Reply-To: <1362695964-20697-1-git-send-email-carlo.caione@gmail.com>
References: <1362695964-20697-1-git-send-email-carlo.caione@gmail.com>
Message-ID: <CAHXCMMKh9EFBAaOP6SHNb2CmY20AmAFStfMxz8Wcara3QUEENA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlo,

2013/3/7 Carlo Caione <carlo.caione@gmail.com>:
> Tools to help hacking Allwinner A10 (aka sun4i) based devices
>
> Signed-off-by: Carlo Caione <carlo.caione@gmail.com>
> ---
>  package/Config.in.host             |  1 +
>  package/sunxi-tools/Config.in.host |  7 +++++++
>  package/sunxi-tools/sunxi-tools.mk | 20 ++++++++++++++++++++
>  3 files changed, 28 insertions(+)
>  create mode 100644 package/sunxi-tools/Config.in.host
>  create mode 100644 package/sunxi-tools/sunxi-tools.mk
>
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 79050f2..b2b9fbd 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -5,6 +5,7 @@ source "package/lpc3250loader/Config.in.host"
>  source "package/omap-u-boot-utils/Config.in.host"
>  source "package/openocd/Config.in.host"
>  source "package/sam-ba/Config.in.host"
> +source "package/sunxi-tools/Config.in.host"
>  source "package/uboot-tools/Config.in.host"
>
>  endmenu
> diff --git a/package/sunxi-tools/Config.in.host b/package/sunxi-tools/Config.in.host
> new file mode 100644
> index 0000000..71e0418
> --- /dev/null
> +++ b/package/sunxi-tools/Config.in.host
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_HOST_SUNXI_TOOLS
> +       bool "host sunxi-tools"
> +       help
> +          Tools to help hacking Allwinner A10 (aka sun4i) based devices and
Looks like the indentation is wrong (spaces instead of 1 tab + 2 spaces).

> +         possibly it's successors
> +
> +         https://github.com/linux-sunxi/sunxi-tools
> diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
> new file mode 100644
> index 0000000..60acff5
> --- /dev/null
> +++ b/package/sunxi-tools/sunxi-tools.mk
> @@ -0,0 +1,20 @@
> +#############################################################
> +#
> +# sunxi-tools
> +#
> +#############################################################
> +
> +SUNXI_TOOLS_VERSION = master

In Buildroot, we usually use commit sha1 instead of branch name;
otherwise it makes hard to spot what change in a package may have break a build.

> +SUNXI_TOOLS_SITE = git://github.com/linux-sunxi/sunxi-tools.git

BTW, with packages hosted on github, it is possible to just download
the tarball of the source at a given revision,
see: http://buildroot.org/downloads/manual/manual.html#github-download-url

> +
> +define HOST_SUNXI_TOOLS_BUILD_CMDS
> +       $(MAKE) -C $(@D)
> +endef
> +
> +define HOST_SUNXI_TOOLS_INSTALL_CMDS
> +       for f in fexc bin2fex fex2bin bootinfo fel pio nand-part ; do \
> +               install -m 755 -D $(@D)/$$f $(HOST_DIR)/usr/bin/$$f ; \
> +       done
> +endef
> +
> +$(eval $(host-generic-package))
> --
> 1.8.1.5
>

Regards,

-- 
Samuel
