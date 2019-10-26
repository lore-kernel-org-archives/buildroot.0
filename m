From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 09:23:01 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/collectd: add init script
 for SysV
In-Reply-To: <20191026071905.23036-1-asafka7@gmail.com>
References: <20191026071905.23036-1-asafka7@gmail.com>
Message-ID: <20191026092301.4254482d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Asaf,

On Sat, 26 Oct 2019 10:19:04 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
> v1->v2: use start-stop-daemon
> ---
>  package/collectd/S90collectd | 36 ++++++++++++++++++++++++++++++++++++
>  package/collectd/collectd.mk |  5 +++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 package/collectd/S90collectd
> 
> diff --git a/package/collectd/S90collectd b/package/collectd/S90collectd
> new file mode 100644
> index 0000000000..3c5af17674
> --- /dev/null
> +++ b/package/collectd/S90collectd
> @@ -0,0 +1,36 @@
> +#!/bin/sh
> +
> +DAEMON="collectd"
> +PIDFILE="/var/run/$DAEMON.pid"
> +
> +start() {
> +	printf "Starting collectd... "
> +	start-stop-daemon -b -m -S -q -p $PIDFILE -x "/usr/sbin/$DAEMON"

Does this actually works? In your v1, you were just starting the
collectd daemon, without anything to put it in the background, so it
suppose it would automatically fork itself and go in the background.
This would not play very well with start-stop-daemon, so I was assuming
you would need to pass some collectd option to keep it in the
foreground, and let start-stop-daemon do the daemonization.

Did you test your v2 on the target ? Does the pidfile really contains
the PID of the daemon that is running ? Does the stop action actually
works ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
