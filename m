From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Sep 2010 00:05:30 +0100
Subject: [Buildroot] [PATCH] introducing transmission bittorrent client
In-Reply-To: <1284884604-2433-1-git-send-email-marcus.osdoba@googlemail.com>
References: <1284884604-2433-1-git-send-email-marcus.osdoba@googlemail.com>
Message-ID: <20100923000530.049479ea@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 19 Sep 2010 10:23:24 +0200
Marcus Osdoba <marcus.osdoba@googlemail.com> wrote:

> +		IFCONFIG_OUTPUT=`ifconfig $NET_INTERFACE`
> +		IP_ADDR=`expr match "$IFCONFIG_OUTPUT" '.*inet addr:\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\).*'`
> +		while [ -z "$IP_ADDR" ]
> +		do
> +			sleep 5
> +			IFCONFIG_OUTPUT=`ifconfig $NET_INTERFACE`
> +			IP_ADDR=`expr match "$IFCONFIG_OUTPUT" '.*inet addr:\([0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\).*'`
> +		done

I'm still not a big fan of this loop. There's really no other solution ?

> +	start)
> +		echo "Starting $DESC" "$NAME..."
> +		do_start
> +		case "$?" in
> +			0) echo "   Start $DESC $NAME: SUCCESS" ;;
> +			*)
> +				echo "   Start $DESC $NAME: FAILED"
> +				exit 3
> +				;;
> +		esac
> +		;;

I don't think we have all this message printing handling in other S??*
scripts, could you simplify this a little bit, for example to make it
similar to package/dropbear/S50dropbear ?

> +ifneq ($(BR2_PACKAGE_TRANSMISSION_REMOTE),y)
> +TRANSMISSION_CONF_OPT += --disable-remote
> +endif

Add a new line here.

> +ifeq ($(BR2_PACKAGE_TRANSMISSION_REMOTE),y)
> +define TRANSMISSION_INITDSKRIPT_INSTALL

INITDSKRIPT looks strange. INIT_SCRIPT instead ?

> +	# install start/stop script
> +	$(call MESSAGE,"Installing S92transmission init script")
> +	if [ ! -f $(TARGET_DIR)/etc/init.d/S92transmission ]; then \
> +		$(INSTALL) -m 0755 -D package/transmission/S92transmission \
> +		$(TARGET_DIR)/etc/init.d/S92transmission; \
> +	fi
> +	$(Q)touch $@

The touch here is not needed.

Otherwise, looks good to me. Care to fix these and resend an updated
version ?

Thanks a lot for all your efforts and your patience!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
