From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 3 Feb 2019 21:00:33 +0100
Subject: [Buildroot] [PATCH v5] package/ntp: sntp time sync script
In-Reply-To: <1544586337-7888-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1544586337-7888-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <b30f789e-46c6-b695-cb48-990624424f4d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Matt,

 I've finally applied to master since it really is a useful feature and it
works. However, I have a few additional remarks. Also one for Carlos, the init
script dude :-)

On 12/12/2018 04:45, Matt Weber wrote:
[snip]
> +#!/bin/sh
> +
> +DAEMON="sntp"

 Carlos, I'm starting to doubt the usefulness of this DAEMON variable. Other
variables are prefixed by SNTP_, only this one isn't. In other init scripts you
started using PROGRAM instead because it isn't actually a daemon.

 However, the only reason to make it a variable is to make it easier to copy and
adapt an existing init script. But really, doing a search/replace of that string
is not so much work. And you anyway need to review the entire file, e.g.
/usr/bin/$DAEMON is used which may not be correct.

 So I'd propose to replace DAEMON with a direct reference to the program. What
do you think?


> +# sntp uses all the IPs resolved for the hostname (i.e. pool.ntp.org has 4).
> +# It will try each until they either all timeout or time has been set. Thus
> +# default to only providing one NTP pool host.
> +SNTP_SERVERS="pool.ntp.org"

 I think this was discussed before, but why isn't this

if [ -e /etc/ntpd.conf ]; then
 	SNTP_SERVERS="$(sed -n
'/^[[:space:]]*server[[:space:]]\+\([^[:space:]]\+\).*$/s//\1/p' /etc/ntpd.conf
| head -1)"
else
	SNTP_SERVERS="pool.ntp.org"
fi

so the ntpd.conf gets reused by default?

[snip]
> diff --git a/package/ntp/S49ntp b/package/ntp/S49ntp
> old mode 100755
> new mode 100644

 I applied it now, but isn't this an accident?

> diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
> index af3c1aa..aad1cdd 100644
> --- a/package/ntp/ntp.mk
> +++ b/package/ntp/ntp.mk
> @@ -93,9 +93,18 @@ define NTP_INSTALL_TARGET_CMDS
>  	$(INSTALL) -m 644 package/ntp/ntpd.etc.conf $(TARGET_DIR)/etc/ntp.conf
>  endef
>  
> +# This script will step the time if there is a large difference
> +# before ntpd takes over the necessary slew adjustments
> +ifeq ($(BR2_PACKAGE_NTP_SNTP),y)
> +define NTP_INSTALL_INIT_SYSV_SNTP
> +	$(INSTALL) -D -m 755 package/ntp/S48sntp $(TARGET_DIR)/etc/init.d/S48sntp
> +endef
> +endif
> +
>  ifeq ($(BR2_PACKAGE_NTP_NTPD),y)
>  define NTP_INSTALL_INIT_SYSV
>  	$(INSTALL) -D -m 755 package/ntp/S49ntp $(TARGET_DIR)/etc/init.d/S49ntp
> +	$(NTP_INSTALL_INIT_SYSV_SNTP)

 So, the sntp script only gets installed if ntpd is installed. Is that
intentional? Doesn't sound ideal...

 Regards,
 Arnout

>  endef
>  
>  define NTP_INSTALL_INIT_SYSTEMD
> 
