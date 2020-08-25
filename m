From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Aug 2020 10:43:13 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: ensure tmpfiles.d/legacy.conf
 is installed
In-Reply-To: <20200825000246.4035-1-joseph.kogut@gmail.com>
References: <20200825000246.4035-1-joseph.kogut@gmail.com>
Message-ID: <20200825104313.6691deaa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm adding Norbert Lange in Cc, since he has done quite a bit of
systemd work in Buildroot recently. Norbert, could you review the below
patch ?

Also, Norbert, I think it would be nice if you could add yourself in
the DEVELOPERS file for package/systemd/. You have been very active
recently in improving our systemd package, and it would be good to have
someone review systemd related patches.

Thanks!

Thomas

On Mon, 24 Aug 2020 17:02:46 -0700
Joseph Kogut <joseph.kogut@gmail.com> wrote:

> Systemd doesn't install tmpfiles.d/legacy.conf when sysv compatiblity
> isn't enabled. This config sets up /var/lock, which many programs such
> as uboot's fw_printenv/setenv still depend on by default.
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  package/systemd/systemd.mk | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index e356cb1add..8454993823 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -512,10 +512,18 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
>  	touch $(TARGET_DIR)/etc/machine-id
>  endef
>  
> +# systemd doesn't install legacy.conf without sysv-compat
> +# This config ensures /var/lock is created
> +define SYSTEMD_INSTALL_LEGACY_CONF_HOOK
> +	$(INSTALL) -D -m 0644 $(@D)/tmpfiles.d/legacy.conf \
> +		$(TARGET_DIR)/usr/lib/tmpfiles.d
> +endef
> +
>  SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
>  	SYSTEMD_INSTALL_INIT_HOOK \
>  	SYSTEMD_INSTALL_MACHINEID_HOOK \
> -	SYSTEMD_INSTALL_RESOLVCONF_HOOK
> +	SYSTEMD_INSTALL_RESOLVCONF_HOOK \
> +	SYSTEMD_INSTALL_LEGACY_CONF_HOOK
>  
>  define SYSTEMD_INSTALL_IMAGES_CMDS
>  	$(SYSTEMD_INSTALL_BOOT_FILES)



-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
