From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 14:10:52 +0200
Subject: [Buildroot] [PATCH] darkhttpd: new package
In-Reply-To: <1474111899-5705-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1474111899-5705-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20160917141052.61d23a72@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Sep 2016 13:31:39 +0200, Eric Le Bihan wrote:
> This new package provides darkhttpd, a simple, fast HTTP 1.1 web server
> for static content.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Thanks for this patch. A few comments/questions below.

> diff --git a/package/darkhttpd/Config.in b/package/darkhttpd/Config.in
> new file mode 100644
> index 0000000..bd12588
> --- /dev/null
> +++ b/package/darkhttpd/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_DARKHTTPD
> +	bool "darkhttpd"

Did you validate the architecture/toolchain dependencies? MMU, C++,
wchar, etc. ?

> +	  Note: when Busybox or SysV init system is used, darkhttpd logs to
> +	  /var/log/darkhttpd.log, which may grow beyond the file system limits.
> +	  Please consider using a log rotating system such as logrotate or
> +	  change the path to the log file using the configuration file.

Is it really worth having such a comment here? I believe this applies
to many (all?) daemons.

> +# Allow a few customizations from a config file
> +test -r /etc/default/darkhttpd && . /etc/default/darkhttpd
> +
> +DARKHTTPD_PROG=/usr/sbin/darkhttpd
> +DARKHTTPD_PIDFILE=/var/run/darkhttpd.pid
> +DARKHTTPD_FLAGS="$DARKHTTPD_FLAGS --chroot --uid nobody --gid www-data"
> +DARKHTTPD_ARGS="${DARKHTTPD_ROOT:-/var/www} --log /var/log/darkhttpd.log $DARKHTTPD_FLAGS"

I don't understand why you have this construction of _ARGS in several
steps. What about:

DARKHTTPD_ARGS="${DARKHTTPD_ROOT:-/var/www} --log /var/log/darkhttpd.log $DARKHTTPD_ARGS --chroot --uid nobody --gid www-data"

instead (assuming the variable in the /etc/default file is
DARKHTTP_ARGS instead of DARKHTTP_FLAGS, the former being much more
common than the latter IMO).

> +DARKHTTPD_MAKE_OPTS = CC="$(TARGET_CC)"

Can you use $(TARGET_CONFIGURE_OPTS) instead ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
