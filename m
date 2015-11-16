From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Nov 2015 21:19:43 +0100
Subject: [Buildroot] [PATCH 1/2] vboot-utils: new package
In-Reply-To: <39f87349d2f42ac5d2acec7a00c94c4e5e9400a8.1447689401.git.alex.suykov@gmail.com>
References: <cover.1447689401.git.alex.suykov@gmail.com>
 <39f87349d2f42ac5d2acec7a00c94c4e5e9400a8.1447689401.git.alex.suykov@gmail.com>
Message-ID: <564A3A5F.3010301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16-11-15 18:54, Alex Suykov wrote:
> Host utilities for working with Chromium OS verified boot images.
> Needed to create signed kernel images and manipulating bootable
> partitions for Chromium OS bootloaders.
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/Config.in.host             |  1 +
>  package/vboot-utils/Config.in.host |  6 ++++++
>  package/vboot-utils/vboot-utils.mk | 23 +++++++++++++++++++++++
>  3 files changed, 30 insertions(+)
>  create mode 100644 package/vboot-utils/Config.in.host
>  create mode 100644 package/vboot-utils/vboot-utils.mk
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index ce1b6bc..7044a3b 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -29,5 +29,6 @@ menu "Host utilities"
>  	source "package/sunxi-tools/Config.in.host"
>  	source "package/uboot-tools/Config.in.host"
>  	source "package/util-linux/Config.in.host"
> +	source "package/vboot-utils/Config.in.host"
>  
>  endmenu
> diff --git a/package/vboot-utils/Config.in.host b/package/vboot-utils/Config.in.host
> new file mode 100644
> index 0000000..a0c7497
> --- /dev/null
> +++ b/package/vboot-utils/Config.in.host
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_HOST_VBOOT_UTILS
> +	bool "host vboot utils"
> +	help
> +	  ChromeOS verified boot utils: futility and cgpt.

 ChromeOS or Chromius OS? Please be consistent :-)

> +
> +	  https://www.chromium.org/chromium-os/chromiumos-design-docs/verified-boot
> diff --git a/package/vboot-utils/vboot-utils.mk b/package/vboot-utils/vboot-utils.mk
> new file mode 100644
> index 0000000..b160efa
> --- /dev/null
> +++ b/package/vboot-utils/vboot-utils.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# vboot
> +#
> +################################################################################
> +
> +VBOOT_UTILS_VERSION = bbdd62f9b030db7ad8eef789aaf58a7ff9a25656
> +VBOOT_UTILS_SITE = https://chromium.googlesource.com/chromiumos/platform/vboot_reference

 Since googlesource is shutting down: is there an alternative location already?
Possibly one which doesn't require git download method?

> +VBOOT_UTILS_SITE_METHOD = git
> +VBOOT_UTILS_LICENSE = BSD

 BSD doesn't exist, I think it's BSD-3c in this case.

> +
> +HOST_VBOOT_UTILS_DEPENDENCIES = host-openssl
> +
> +define HOST_VBOOT_UTILS_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) futil cgpt
> +endef
> +
> +define HOST_VBOOT_UTILS_INSTALL_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR)/usr \
> +		futil_install cgpt_install devkeys_install
> +endef

 Why not just 'make' and 'make install'? Please add the explanation as a comment.

 Regards,
 Arnout

> +
> +$(eval $(host-generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
