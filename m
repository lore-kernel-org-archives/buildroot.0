From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Nov 2019 21:55:03 +0100
Subject: [Buildroot] [PATCH v2] package/dcron: fix startup error due to
 missing directories
In-Reply-To: <20190722002425.6783-1-unixmania@gmail.com>
References: <20190722002425.6783-1-unixmania@gmail.com>
Message-ID: <20191108205503.GK3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2019-07-21 21:24 -0300, unixmania at gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> crond uses the /var/spool/cron/{crontabs,cronstamps} directories to
> store the per-user crontabs and timestamps for jobs, respectively.
> 
> On systems with busybox or sysv init /var/spool is by default a link to
> /tmp (see package/skeleton-init-sysv/skeleton/). So if those directories
> are created at installation time they actually are under /tmp/spool and
> vanish at run time when a tmpfs is mounted at /tmp. In this case crond
> issues error messages that can't be seen.
> 
> The error is hidden because we use start-stop-daemon to run crond in
> foreground mode to create a pid file and move crond to background. In
> this mode crond does not use syslog and all error messages are lost
> because start-stop-daemon redirects strderr to /dev/null.
> 
> Getting a presistent storage for /var/spool would require customisations
> of the directory layout, which can not be done in a generic way, as each
> one will need to adapt to their own constraints.
> 
> Fix these problem by means of the following changes:
> 
> - Add configs for the crontabs and cronstamps paths. They can be used to
>   move the directories to persistent filesystems, if necessary.
> - Change the init script and systemd unit to ensure that the directories
>   are created before starting crond.
> - Start crond in daemon mode in the init script and use "pidof crond" to
>   create the required pid file.
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=12011

I did provide some review on this patch, but I haven't seen any reply or
repost.

I've marked it changes-requested in Ptchwork. Feel free to respin a
fixed up version that addresses my comments (either in the commit log,
or as different changes).

Thanks!

Regards,
Yann E. MORIN.

> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
> Changes v1->v2:
>   - Remove (partially), since the fix is now complete
> ---
>  package/dcron/Config.in     | 16 ++++++++++++++++
>  package/dcron/S90dcron      |  8 +++++++-
>  package/dcron/dcron.mk      | 11 +++++++++--
>  package/dcron/dcron.service |  3 ++-
>  4 files changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/package/dcron/Config.in b/package/dcron/Config.in
> index d7f66bdb7d..1203c42dec 100644
> --- a/package/dcron/Config.in
> +++ b/package/dcron/Config.in
> @@ -21,3 +21,19 @@ config BR2_PACKAGE_DCRON
>  	  with sgid bit enabled.
>  
>  	  http://www.jimpryor.net/linux/dcron.html
> +
> +if BR2_PACKAGE_DCRON
> +
> +config BR2_PACKAGE_DCRON_CRONTABS_DIR
> +	string "crontabs directory"
> +	default "/var/spool/cron/crontabs"
> +	help
> +	  Directory of per-user crontabs
> +
> +config BR2_PACKAGE_DCRON_CRONSTAMPS_DIR
> +	string "cronstamps directory"
> +	default "/var/spool/cron/cronstamps"
> +	help
> +	  Directory of timestamps for @freq and FREQ=... jobs
> +
> +endif
> diff --git a/package/dcron/S90dcron b/package/dcron/S90dcron
> index de21d2ca13..4527277623 100644
> --- a/package/dcron/S90dcron
> +++ b/package/dcron/S90dcron
> @@ -1,9 +1,15 @@
>  #!/bin/sh
>  
> +CRONTABS_DIR=%%CRONTABS_DIR%%
> +CRONSTAMPS_DIR=%%CRONSTAMPS_DIR%%
> +
>  case "$1" in
>  	start)
>  		printf "Starting cron ... "
> -		start-stop-daemon -S -q -m -b -p /var/run/dcron.pid --exec /usr/sbin/crond -- -f
> +		mkdir -p "$CRONTABS_DIR" "$CRONSTAMPS_DIR"
> +		start-stop-daemon -S -q -p /var/run/dcron.pid -x /usr/sbin/crond \
> +			-- -c "$CRONTABS_DIR" -t "$CRONSTAMPS_DIR"
> +		pidof crond > /var/run/dcron.pid || rm -f /var/run/dcron.pid
>  		echo "done."
>  		;;
>  	stop)
> diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
> index 2ee0709af5..453e3acb54 100644
> --- a/package/dcron/dcron.mk
> +++ b/package/dcron/dcron.mk
> @@ -19,18 +19,25 @@ define DCRON_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D -m0644 $(@D)/extra/root.crontab $(TARGET_DIR)/etc/cron.d/system
>  	# Busybox provides run-parts, so there is no need to use nor install provided run-cron
>  	$(SED) 's#/usr/sbin/run-cron#/bin/run-parts#g' $(TARGET_DIR)/etc/cron.d/system
> -	$(INSTALL) -d -m0755 $(TARGET_DIR)/var/spool/cron/crontabs \
> -		$(TARGET_DIR)/etc/cron.daily $(TARGET_DIR)/etc/cron.hourly \
> +	$(INSTALL) -d -m750 $(TARGET_DIR)/etc/cron.daily $(TARGET_DIR)/etc/cron.hourly \
>  		$(TARGET_DIR)/etc/cron.monthly $(TARGET_DIR)/etc/cron.weekly
>  endef
>  
>  define DCRON_INSTALL_INIT_SYSV
>  	$(INSTALL) -D -m 0755 package/dcron/S90dcron $(TARGET_DIR)/etc/init.d/S90dcron
> +	$(SED) 's#%%CRONTABS_DIR%%#$(BR2_PACKAGE_DCRON_CRONTABS_DIR)#' \
> +		$(TARGET_DIR)/etc/init.d/S90dcron
> +	$(SED) 's#%%CRONSTAMPS_DIR%%#$(BR2_PACKAGE_DCRON_CRONSTAMPS_DIR)#' \
> +		$(TARGET_DIR)/etc/init.d/S90dcron
>  endef
>  
>  define DCRON_INSTALL_INIT_SYSTEMD
>  	$(INSTALL) -D -m 644 package/dcron/dcron.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/dcron.service
> +	$(SED) 's#%%CRONTABS_DIR%%#$(BR2_PACKAGE_DCRON_CRONTABS_DIR)#' \
> +		$(TARGET_DIR)/usr/lib/systemd/system/dcron.service
> +	$(SED) 's#%%CRONSTAMPS_DIR%%#$(BR2_PACKAGE_DCRON_CRONSTAMPS_DIR)#' \
> +		$(TARGET_DIR)/usr/lib/systemd/system/dcron.service
>  	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>  	ln -sf ../../../../usr/lib/systemd/system/dcron.service \
>  		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dcron.service
> diff --git a/package/dcron/dcron.service b/package/dcron/dcron.service
> index 924ed72205..abce25ba4f 100644
> --- a/package/dcron/dcron.service
> +++ b/package/dcron/dcron.service
> @@ -3,7 +3,8 @@ Description=Task scheduler daemon
>  After=syslog.target
>  
>  [Service]
> -ExecStart=/usr/sbin/crond -S
> +ExecStartPre=mkdir -p %%CRONTABS_DIR%% %%CRONSTAMPS_DIR%%
> +ExecStart=/usr/sbin/crond -c %%CRONTABS_DIR%% -t %%CRONSTAMPS_DIR%%
>  Type=forking
>  
>  [Install]
> -- 
> 2.18.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
