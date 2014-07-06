From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Jul 2014 22:28:18 +0200
Subject: [Buildroot] [PATCH 2/6] systemd: revert getty service
 installation
In-Reply-To: <1404406659-31109-3-git-send-email-eric.le.bihan.dev@free.fr>
References: <1404406659-31109-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1404406659-31109-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140706202818.GF3684@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-07-03 18:57 +0200, Eric Le Bihan spake thusly:
> Revert getty fixup from post installation hook to service installation,
> because service installation is performed before the installation of the
> package itself. The fixup will fail trying to delete a file that has not
> been installed yet.
> 
> Fixes http://autobuild.buildroot.net/results/5b03174318d8a6dc3112053ff141b70a90869c20/

Another, nore generic fix has just been committed:
    http://git.buildroot.org/buildroot/commit/?id=ea0f52fc3fca5e5ba3ea5cd46033df2f53e9b5a5

Would you care verify if this proposed patch is still valid now?

Regards,
Yann E. MORIN.

> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/systemd/systemd.mk |   12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 95e7214..97fa61a 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -138,6 +138,11 @@ define SYSTEMD_INSTALL_INIT_HOOK
>  	ln -fs ../../../lib/systemd/system/multi-user.target $(TARGET_DIR)/etc/systemd/system/default.target
>  endef
>  
> +define SYSTEMD_INSTALL_TTY_HOOK
> +	rm -f $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty at tty1.service
> +	ln -fs ../../../../lib/systemd/system/serial-getty at .service $(TARGET_DIR)/etc/systemd/system/getty.target.wants/serial-getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
> +endef
> +
>  define SYSTEMD_INSTALL_MACHINEID_HOOK
>  	touch $(TARGET_DIR)/etc/machine-id
>  endef
> @@ -149,6 +154,7 @@ endef
>  
>  SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
>  	SYSTEMD_INSTALL_INIT_HOOK \
> +	SYSTEMD_INSTALL_TTY_HOOK \
>  	SYSTEMD_INSTALL_MACHINEID_HOOK \
>  	SYSTEMD_SANITIZE_PATH_IN_UNITS
>  
> @@ -158,13 +164,7 @@ define SYSTEMD_USERS
>  	$(SYSTEMD_USER_TIMESYNC)
>  endef
>  
> -define SYSTEMD_INSTALL_SERVICE_TTY
> -	rm -f $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty at tty1.service
> -	ln -fs ../../../../lib/systemd/system/serial-getty at .service $(TARGET_DIR)/etc/systemd/system/getty.target.wants/serial-getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
> -endef
> -
>  define SYSTEMD_INSTALL_INIT_SYSTEMD
> -	$(SYSTEMD_INSTALL_SERVICE_TTY)
>  	$(SYSTEMD_INSTALL_SERVICE_NETWORK)
>  endef
>  
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
