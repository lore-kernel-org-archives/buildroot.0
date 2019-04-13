From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Apr 2019 22:53:18 +0200
Subject: [Buildroot] [PATCH 2/2] package/suricata: new package
In-Reply-To: <20190314212600.20918-2-fontaine.fabrice@gmail.com>
References: <20190314212600.20918-1-fontaine.fabrice@gmail.com>
 <20190314212600.20918-2-fontaine.fabrice@gmail.com>
Message-ID: <20190413225318.5ce5559b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Thu, 14 Mar 2019 22:26:00 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Suricata is a free and open source, mature, fast and robust
> network threat detection engine.
> 
> The Suricata engine is capable of real time intrusion
> detection (IDS), inline intrusion prevention (IPS), network
> security monitoring (NSM) and offline pcap processing.
> 
> https://suricata-ids.org
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Overall looks good. I was about to commit, but I have some doubts about
the systemd unit, and therefore will take advantage of those doubts to
also make a few comments about other aspects.

> diff --git a/package/suricata/S99suricata b/package/suricata/S99suricata
> new file mode 100644
> index 0000000000..35a034b179
> --- /dev/null
> +++ b/package/suricata/S99suricata

In terms of init scripts, package/busybox/S02klogd is now the
"reference". I recommend following this example.

> @@ -0,0 +1,39 @@
> +#!/bin/sh
> +
> +NAME=suricata
> +PIDFILE=/var/run/$NAME.pid
> +DAEMON=/usr/bin/$NAME
> +DAEMON_ARGS="-c /etc/suricata/suricata.yaml -i eth0"

You clearly want to include a /etc/default/${DAEMON} file. DAEMON
should be just the name of the program, see S02klogd.

> +case "$1" in
> +  start)
> +	start
> +	;;
> +  stop)
> +	stop
> +	;;
> +  restart|reload)
> +	restart
> +	;;
> +  *)
> +	echo "Usage: $0 {start|stop|restart}"
> +	exit 1

Please follow the indentation style of S02klogd.


> +ifeq ($(BR2_PACKAGE_PYTHON),y)
> +SURICATA_CONF_OPTS += --enable-python
> +SURICATA_DEPENDENCIES += python
> +else
> +SURICATA_CONF_OPTS += --disable-python
> +endif

So only Python 2.x is supported ?

> +ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
> +SURICATA_CONF_OPTS += --enable-gccprotect
> +else
> +SURICATA_CONF_OPTS += --disable-gccprotect
> +endif

We should unconditionally use --disable-gccprotect and let our
gcc/wrapper pass the appropriate SSP/hardening options.

> diff --git a/package/suricata/suricata.service b/package/suricata/suricata.service
> new file mode 100644
> index 0000000000..ca0be02dae
> --- /dev/null
> +++ b/package/suricata/suricata.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=Suricata Intrusion Detection Service
> +After=network.target
> +
> +[Service]
> +ExecStartPre=/bin/rm -f /var/run/suricata.pid
> +ExecStartPre=/usr/bin/mkdir -p /var/log/suricata
> +ExecStart=/usr/bin/suricata -c /etc/suricata/suricata.yaml -i eth0 --pidfile /var/run/suricata.pid
> +ExecReload=/bin/kill -USR2 $MAINPID

I am a bit skeptical about the PID file handling. How is systemd going
to know that the PID file is /var/run/suricata.pid ? Is this useful in
the context of systemd ?

I'm by no means not a systemd expert, but this seems weird to me. If a
systemd-person could give more details about this, it would be nice.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
