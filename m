From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 12:29:29 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/modem-manager: init script
 for systemV-like init systems
In-Reply-To: <1435781472-13078-1-git-send-email-petr.vorel@gmail.com>
References: <1435781472-13078-1-git-send-email-petr.vorel@gmail.com>
Message-ID: <20150702122929.5798abc8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr,

On Wed,  1 Jul 2015 22:11:12 +0200, Petr Vorel wrote:

> +MODEMMANAGER_BIN=/usr/sbin/ModemManager

This variable was not needed, it's only used once, so I've just used
directly the path to ModemManager.

> +PIDFILE=/var/run/ModemManager.pid
> +
> +[ -x $MODEMMANAGER_BIN ] || exit 0
> +
> +start() {
> +	echo -n "Starting ModemManager: "
> +	umask 077
> +	start-stop-daemon -S -q -b -m -p $PIDFILE \
> +		--exec $MODEMMANAGER_BIN
> +	ret=$?
> +	[ $ret = 0 ] && echo "OK" || echo "FAIL"

ret variable not really needed.

> +}
> +stop() {
> +	echo -n "Stopping ModemManager: "
> +	start-stop-daemon -K -q -p $PIDFILE
> +	ret=$?
> +	[ $ret = 0 ] && { echo "OK"; rm -f $PIDFILE; } || echo "FAIL"

Ditto.


> +define MODEM_MANAGER_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 -D package/modem-manager/S44modem-manager $(TARGET_DIR)/etc/init.d/S44modem-manager

Line slightly too long, so I've broken it up with a \

Applied with those minor nits fixed!

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
