From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 23:15:18 +0100
Subject: [Buildroot] [PATCH v6 3/3] ypbind-mt: new package
In-Reply-To: <1453832900-25757-4-git-send-email-yba@tkos.co.il>
References: <1453832900-25757-1-git-send-email-yba@tkos.co.il>
 <1453832900-25757-4-git-send-email-yba@tkos.co.il>
Message-ID: <20160306231518.63807855@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jonathan Ben-Avraham,

Sorry for the slow answer :/

On Tue, 26 Jan 2016 20:28:20 +0200, Jonathan Ben-Avraham wrote:

> diff --git a/package/ypbind-mt/S70ypbind b/package/ypbind-mt/S70ypbind
> new file mode 100755
> index 0000000..e73bec6
> --- /dev/null
> +++ b/package/ypbind-mt/S70ypbind
> @@ -0,0 +1,93 @@
> +#!/bin/sh
> +# Based on /etc/init.d/ypbind from SuSe Linux by Thorsten Kukuk
> +
> +DAEMON=/usr/sbin/ypbind
> +pidfile=/var/run/ypbind.pid

Capital letters for the variable.

> +[ -x ${DAEMON} ] || exit 0

Not needed, the daemon is guaranteed to be installed.

> +[ -f /etc/default/ypbind ] && source /etc/default/ypbind
> +
> +case "$1" in
> +	start)
> +		echo -n "Starting ypbind: "

echo -n => printf

> +		# Check for preset YP domainname
> +		ypdomainname &> /dev/null
> +		if [ $? -ne 0 ]; then
> +			if [ ! -f /etc/defaultdomain ]; then
> +				# No configured YP domainname
> +				echo "FAIL"
> +				exit 1
> +			fi
> +			# Assume that /etc/defaultdomain contains
> +			# a valid domainname and assume ypdomainname
> +			# succeeds
> +			XDOMAINNAME=$(cat /etc/defaultdomain)
> +			ypdomainname "${XDOMAINNAME}"
> +		fi
> +
> +		if [ ! -f /etc/yp.conf -a "${YPBIND_BROADCAST}" != "yes" ]; then
> +			# We need a local configuration if not in broadcast mode
> +			echo "FAIL"
> +			exit 1
> +		fi
> +
> +		OPTIONS=""
> +		test "${YPBIND_LOCAL_ONLY}" = "yes" && \
> +			OPTIONS="-local-only ${OPTIONS}"
> +		test "${YPBIND_BROADCAST}" = "yes" && \
> +			OPTIONS="-broadcast ${OPTIONS}"
> +		test "${YPBIND_BROKEN_SERVER}" = "yes" && \
> +			OPTIONS="-broken-server ${OPTIONS}"

Why are we doing this complicated dance instead of just having
YPBIND_OPTIONS defined in /etc/default/ypbind ?

> +		start-stop-daemon --start --quiet --pidfile ${pidfile} \
> +			--exec ${DAEMON} -- ${OPTIONS}
> +
> +		if [ $? -ne 0 ]; then
> +			echo "FAIL"
> +			exit 1
> +		fi

You should print OK if start-stop-daemon succeeded. Look at other init
scripts in Buildroot.

> +
> +		# Make sure we have a server so that later scripts can know
> +		notfound=1
> +		for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15; do

for i in $(seq 1 16)

> +			if ypwhich &>/dev/null; then
> +				notfound=0
> +				break
> +			fi
> +			echo -n " ."
> +			sleep 1;
> +		done
> +
> +		if [ ${notfound} -eq 1 ]; then
> +			# No NIS server found
> +			echo "FAIL"
> +			exit 1
> +		fi
> +
> +		echo "OK"

Could you move all of this into a start() function ? It would nicely
reduce the indentation level.

> +		;;
> +
> +	stop)
> +		echo "Shutting down ypbind "

printf

> +		start-stop-daemon --stop --quiet --pidfile $pidfile

And print OK / FAIL. Look at other init scripts in Buildroot to see
which options we typically pass when calling start-stop-daemon to stop
a daemon.

> +	restart)
> +		${0} stop
> +		sleep 1
> +		${0} start

Then you can use the stop() and start() functions.

> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# ypbind-mt
> +#
> +################################################################################
> +
> +# The github releases of ypbind-mt are often a release or more ahead of the
> +# "Download" links on http://www.linux-nis.org/nis/ypbind-mt/
> +YPBIND_MT_VERSION = ypbind-mt-2_2
> +YPBIND_MT_SITE = $(call github,thkukuk,ypbind-mt,$(YPBIND_MT_VERSION))
> +YPBIND_MT_LICENSE = GPLv2
> +YPBIND_MT_LICENSE_FILES = COPYING
> +YPBIND_MT_AUTORECONF = YES
> +YPBIND_MT_DEPENDENCIES = host-pkgconf yp-tools
> +YPBIND_MT_CONF_ENV = \
> +	PKG_CONFIG_SYSROOT_DIR="$(TARGET_DIR)" \
> +	PKG_CONFIG_PATH="$(TARGET_DIR)/usr/lib/pkgconfig"

This is wrong. There is no reason to have .pc files in $(TARGET_DIR),
and they are in fact removed at the end of the build. Can you explain
why you override those variables ?

Could you rework the patch to take into account those comments and send
an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
