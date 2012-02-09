From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Thu, 9 Feb 2012 13:42:55 +0100
Subject: [Buildroot] [PATCH v2] busybox: add watchdog daemon startup
 script
In-Reply-To: <1328783473-14658-1-git-send-email-fabio.porcedda@telit.com>
References: <1328783473-14658-1-git-send-email-fabio.porcedda@telit.com>
Message-ID: <20120209124255.GA1214@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  
>  if !BR2_PACKAGE_BUSYBOX # kconfig doesn't support else
> diff --git a/package/busybox/S15watchdog b/package/busybox/S15watchdog
> new file mode 100644
> index 0000000..3a2e8eb
> --- /dev/null
> +++ b/package/busybox/S15watchdog
> @@ -0,0 +1,20 @@
> +#!/bin/sh
> +#
> +# Start watchdog
> +#
> +
> +case "$1" in
> + start)
> +	echo "Starting watchdog..."
> +	watchdog -t 5 /dev/watchdog
> +	;;
> +  stop)
> +	;;
> +  restart|reload)
> +	;;
> +  *)
> +	echo $"Usage: $0 {start|stop|restart}"
> +	exit 1
> +esac
> +
> +exit $?
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 59448d5..88053ca 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -142,6 +142,16 @@ define BUSYBOX_INSTALL_LOGGING_SCRIPT
>  	else rm -f $(TARGET_DIR)/etc/init.d/S01logging; fi
>  endef
>  
> +ifeq ($(BR2_PACKAGE_BUSYBOX_WATCHDOG),y)
> +define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
> +	[ -f $(TARGET_DIR)/etc/init.d/S15watchdog ] || \
> +		install -D -m 0755 package/busybox/S15watchdog \
> +			$(TARGET_DIR)/etc/init.d/S15watchdog && \
> +		sed -i s/5/$(BR2_PACKAGE_BUSYBOX_WATCHDOG_RESETTIME)/ \
use somethink else than 5 for the sed

Best Regards,
J.
