From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 23:55:31 +0200
Subject: [Buildroot] [PATCH] package/uboot-tools: create /var/lock
 directory for fw_printenv
In-Reply-To: <20201004125538.15161-1-aleontiev@elvees.com>
References: <20201004125538.15161-1-aleontiev@elvees.com>
Message-ID: <20201014235531.301aa821@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Anton,

Thanks for your patch, I'm adding Norbert in Cc. See below for some comments.

On Sun,  4 Oct 2020 15:55:38 +0300
Anton Leontiev <aleontiev@elvees.com> wrote:

> fw_setenv/fw_printenv create lock-files in /var/lock. If this directory
> doesn't exist tools fail with following error:
> 
>   Error opening lock file /var/lock/fw_printenv.lock
> 
> Signed-off-by: Anton Leontiev <aleontiev@elvees.com>
> ---
>  package/uboot-tools/uboot-tools.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> index a06c25998f..578702f04e 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -65,6 +65,7 @@ ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV),y)
>  define UBOOT_TOOLS_INSTALL_FWPRINTENV
>  	$(INSTALL) -m 0755 -D $(@D)/tools/env/fw_printenv $(TARGET_DIR)/usr/sbin/fw_printenv
>  	ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
> +	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/lock

Unfortunately, this cannot be the correct solution: the
skeleton-init-sysv package already creates /var/lock, as a symlink to
/tmp, so your patch would clash with that. So I suppose you have a
systemd init?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
