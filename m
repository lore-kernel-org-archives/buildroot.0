From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Jun 2014 01:35:05 +0200
Subject: [Buildroot] [PATCH v2 2/3] system: convert "system.mk" recipes
 to "target-finalize" hooks
In-Reply-To: <1403252778-19761-3-git-send-email-fabio.porcedda@gmail.com>
References: <1403252778-19761-1-git-send-email-fabio.porcedda@gmail.com>
 <1403252778-19761-3-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <53A4C529.4070507@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/06/14 10:26, Fabio Porcedda wrote:
> Convert "system.mk" recipes to "target-finalize" hooks in order to:
> - Ensure an ordering even if top-level parallel make is being used.
> - Execute "system.mk" commands after the "target-finalize" initial message
>   is printed so they can be clearly distinguished from packages
>   building.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 One small remark:

[snip]
> +ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
> +ifeq ($(BR2_PACKAGE_SYSVINIT),y)
>  # In sysvinit inittab, the "id" must not be longer than 4 bytes, so we
>  # skip the "tty" part and keep only the remaining.
> -target-generic-getty-sysvinit:
> +define SYSTEM_GENERIC_GETTY_SYSVINIT
>  	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY_PORT) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
>  		$(TARGET_DIR)/etc/inittab
> +endef
> +TARGET_FINALIZE_HOOKS += SYSTEM_GENERIC_GETTY_SYSVINIT
> +else
> +# Add getty to busybox inittab
> +define SYSTEM_GENERIC_GETTY_BUSYBOX
> +	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY_PORT)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY_OPTIONS) $(TARGET_GENERIC_GETTY_PORT) $(TARGET_GENERIC_GETTY_BAUDRATE) $(TARGET_GENERIC_GETTY_TERM) #~' \
> +		$(TARGET_DIR)/etc/inittab
> +endef
> +TARGET_FINALIZE_HOOKS += SYSTEM_GENERIC_GETTY_BUSYBOX

 Wouldn't it be better/cleaner to define SYSTEM_GENERIC_GETTY in both cases, and
just define it differently depending on BR2_PACKAGE_SYSVINIT? Same for the
REMOUNT_ROOTFS, below.


 Regards,
 Arnout

> +endif
> +endif
>  
> +ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
>  # Find commented line, if any, and remove leading '#'s
> -target-generic-do-remount-rw:
> +define SYSTEM_GENERIC_DO_REMOUNT_RW
>  	$(SED) '/^#.*# REMOUNT_ROOTFS_RW$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
> -
> +endef
> +TARGET_FINALIZE_HOOKS += SYSTEM_GENERIC_DO_REMOUNT_RW
> +else
>  # Find uncommented line, if any, and add a leading '#'
> -target-generic-dont-remount-rw:
> +define SYSTEM_GENERIC_DONT_REMOUNT_RW
>  	$(SED) '/^[^#].*# REMOUNT_ROOTFS_RW$$/s~^~#~' $(TARGET_DIR)/etc/inittab
> -
> -ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
> -TARGETS += target-generic-securetty
> -endif
> -
> -ifneq ($(TARGET_GENERIC_HOSTNAME),)
> -TARGETS += target-generic-hostname
> -endif
> -
> -ifneq ($(TARGET_GENERIC_ISSUE),)
> -TARGETS += target-generic-issue
> +endef
> +TARGET_FINALIZE_HOOKS += SYSTEM_GENERIC_DONT_REMOUNT_RW
>  endif
>  
> -ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
> -TARGETS += target-root-passwd
> -
> -ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
> -TARGETS += target-generic-getty-$(if $(BR2_PACKAGE_SYSVINIT),sysvinit,busybox)
> -endif
> -
> -ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
> -TARGETS += target-generic-do-remount-rw
> -else
> -TARGETS += target-generic-dont-remount-rw
> -endif
> -endif
> +endif # BR2_ROOTFS_SKELETON_DEFAULT
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
