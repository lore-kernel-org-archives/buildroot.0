From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Jul 2019 22:58:07 +0200
Subject: [Buildroot] [PATCH] package/dcron: create
 /var/spool/cron/cronstamps in installation
In-Reply-To: <20190720183936.20746-1-unixmania@gmail.com>
References: <20190720183936.20746-1-unixmania@gmail.com>
Message-ID: <20190720205807.GB31829@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2019-07-20 15:39 -0300, unixmania at gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> The directory is required by dcron at run-time.
> 
> On systems with busybox and sysvinit startup /var/spool is a symlink to
> /tmp (see package/skeleton-init-sysv/skeleton/) so the directories will
> vanish after mounting /tmp, which by default is a tmpfs. In order to
> really solve the problem we must also change skeleton-init-sysv to make
> /var/spool persistent across rebuilds.

How do you make that happen for read-only filesystems, like squashfs?

Getting a presistent storage, and customisations of the directory layout
to use those persistent locations, can not be done in a generic way. It
can only be handled locally, as each one will need to adapt to their own
constraints.

> Fixes: https://bugs.busybox.net/show_bug.cgi?id=12011 (partially)
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/dcron/dcron.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
> index 2ee0709af5..4a3994cd1a 100644
> --- a/package/dcron/dcron.mk
> +++ b/package/dcron/dcron.mk
> @@ -20,6 +20,7 @@ define DCRON_INSTALL_TARGET_CMDS
>  	# Busybox provides run-parts, so there is no need to use nor install provided run-cron
>  	$(SED) 's#/usr/sbin/run-cron#/bin/run-parts#g' $(TARGET_DIR)/etc/cron.d/system
>  	$(INSTALL) -d -m0755 $(TARGET_DIR)/var/spool/cron/crontabs \
> +		$(TARGET_DIR)/var/spool/cron/cronstamps \

If this directory is required at runtime, then it should be created by
the startup script, systemd unit, or any other startup mechanism.

Regards,
Yann E. MORIN.

>  		$(TARGET_DIR)/etc/cron.daily $(TARGET_DIR)/etc/cron.hourly \
>  		$(TARGET_DIR)/etc/cron.monthly $(TARGET_DIR)/etc/cron.weekly
>  endef
> -- 
> 2.18.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
