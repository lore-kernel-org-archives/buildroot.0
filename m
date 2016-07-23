From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 15:39:07 +0200
Subject: [Buildroot] [PATCH] ser2net: add SYSV init script
In-Reply-To: <1469200138-56632-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1469200138-56632-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160723153907.633fe6e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 22 Jul 2016 16:08:58 +0100, Vicente Olivert Riera wrote:

> +# Startup script for ser2net
> +#
> +
> +[ -f /usr/sbin/ser2net ] || exit 0

This check is pretty useless: the init script is installed along with
the ser2net binary. So I've removed this check.

> +
> +start() {
> +    echo -n  "Starting ser2net: "

We normally use printf instead of echo -n.

Also, starting the daemon fails if there's no config file, with no
error message whatsoever. So I've added a check here to see if there's
a configuration file or not, and show a clear message where there's
none.

> +    start-stop-daemon -S -q --exec /usr/sbin/ser2net -- -P /var/run/ser2net.pid
> +    [ $? = 0 ] && echo "OK" || echo "FAIL"
> +}
> +
> +stop() {
> +    echo -n "Shutting down ser2net "
> +    start-stop-daemon -K -q -p /var/run/ser2net.pid
> +    [ $? = 0 ] && echo "OK" || echo "FAIL"
> +}
> +
> +restart() {
> +	stop
> +	start

Indentation here was done with one tab, while it was done with 4 spaces
above. So I've changed that to 4 spaces everywhere, since it seems to
be what we do in most init scripts.

Applied with those changes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
