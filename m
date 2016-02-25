From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 25 Feb 2016 10:58:50 -0300 (BRT)
Subject: [Buildroot] [PATCH 1/1] uboot-tools: add option for dumpimage
In-Reply-To: <1456403424-7227-1-git-send-email-paulo.zaneti@datacom.ind.br>
References: <1456403424-7227-1-git-send-email-paulo.zaneti@datacom.ind.br>
Message-ID: <1962471383.1249575.1456408730968.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Paulo Zaneti" <paulo.zaneti@datacom.ind.br>
> To: buildroot at buildroot.org
> Sent: Thursday, February 25, 2016 9:30:24 AM
> Subject: [Buildroot] [PATCH 1/1] uboot-tools: add option for dumpimage

> The tool dumpimage extracts data from U-Boot images.
> U-Boot added dumpimage tool on release 2014.01.
> This commit allows installation on target and host.
> 
> Signed-off-by: Paulo Zaneti <paulo.zaneti@datacom.ind.br>
> ---
> package/uboot-tools/Config.in      | 6 ++++++
> package/uboot-tools/uboot-tools.mk | 8 ++++++++
> 2 files changed, 14 insertions(+)
> 
> diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
> index e2c621c..aca310b 100644
> --- a/package/uboot-tools/Config.in
> +++ b/package/uboot-tools/Config.in
> @@ -53,4 +53,10 @@ config BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
> 	  bootloader, which allows access to the U-Boot environment
> 	  from Linux.
> 
> +config BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE
> +	bool "dumpimage"
> +	help
> +	  The dumpimage tool from Das U-Boot bootloader, which allows
> +	  extraction of data from U-Boot images.
> +
> endif
> diff --git a/package/uboot-tools/uboot-tools.mk
> b/package/uboot-tools/uboot-tools.mk
> index 3150279..48d1307 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -52,10 +52,17 @@ define UBOOT_TOOLS_INSTALL_FWPRINTENV
> endef
> endif
> 
> +ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE),y)
> +define UBOOT_TOOLS_INSTALL_DUMPIMAGE
> +	$(INSTALL) -m 0755 -D $(@D)/tools/env/dumpimage

This should be $(@D)/tools/dumpimage, without the spurious "env".

> $(TARGET_DIR)/usr/sbin/dumpimage
> +endef
> +endif
> +
> define UBOOT_TOOLS_INSTALL_TARGET_CMDS
> 	$(UBOOT_TOOLS_INSTALL_MKIMAGE)
> 	$(UBOOT_TOOLS_INSTALL_MKENVIMAGE)
> 	$(UBOOT_TOOLS_INSTALL_FWPRINTENV)
> +	$(UBOOT_TOOLS_INSTALL_DUMPIMAGE)
> endef
> 
> ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
> @@ -79,6 +86,7 @@ endef
> define HOST_UBOOT_TOOLS_INSTALL_CMDS
> 	$(INSTALL) -m 0755 -D $(@D)/tools/mkimage $(HOST_DIR)/usr/bin/mkimage
> 	$(INSTALL) -m 0755 -D $(@D)/tools/mkenvimage $(HOST_DIR)/usr/bin/mkenvimage
> +	$(INSTALL) -m 0755 -D $(@D)/tools/dumpimage $(HOST_DIR)/usr/bin/dumpimage
> endef
> 
> $(eval $(generic-package))
> --
> 1.9.1

Does not install when applied on top buildroot's master branch, due to the spurious "env":

>>> uboot-tools 2016.01 Installing to target
/usr/bin/install -m 0755 -D /work/buildroot-2016.02/pd2901/build/uboot-tools-2016.01/tools/mkimage /work/buildroot-2016.02/pd2901/target/usr/bin/mkimage
/usr/bin/install -m 0755 -D /work/buildroot-2016.02/pd2901/build/uboot-tools-2016.01/tools/mkenvimage /work/buildroot-2016.02/pd2901/target/usr/bin/mkenvimage
/usr/bin/install -m 0755 -D /work/buildroot-2016.02/pd2901/build/uboot-tools-2016.01/tools/env/fw_printenv /work/buildroot-2016.02/pd2901/target/usr/sbin/fw_printenv
ln -sf fw_printenv /work/buildroot-2016.02/pd2901/target/usr/sbin/fw_setenv
/usr/bin/install -m 0755 -D /work/buildroot-2016.02/pd2901/build/uboot-tools-2016.01/tools/env/dumpimage /work/buildroot-2016.02/pd2901/target/usr/sbin/dumpimage
/usr/bin/install: cannot stat ?/work/buildroot-2016.02/pd2901/build/uboot-tools-2016.01/tools/env/dumpimage?: No such file or directory
package/pkg-generic.mk:276: recipe for target '/work/buildroot-2016.02/pd2901/build/uboot-tools-2016.01/.stamp_target_installed' failed
make[1]: *** [/work/buildroot-2016.02/pd2901/build/uboot-tools-2016.01/.stamp_target_installed] Error 1
Makefile:16: recipe for target '_all' failed


Carlos Santos (Casantos)
DATACOM, P&D
