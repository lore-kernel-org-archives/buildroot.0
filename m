From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Aug 2020 23:38:10 +0200
Subject: [Buildroot] [PATCH v3 3/7] package/cups: fix cups service
In-Reply-To: <20200624204347.797088-4-angelo@amarulasolutions.com>
References: <20200624204347.797088-1-angelo@amarulasolutions.com>
 <20200624204347.797088-4-angelo@amarulasolutions.com>
Message-ID: <20200804233810.051372c5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

On Wed, 24 Jun 2020 22:43:43 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Cups service for systemv was erroneously installed in /etc/rcX.d and
> therefore not working.
> This patch adds also a buildroot style systemv init script instead of
> using the example provided by the package.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Thanks, I have applied, after some changes. See below.

> +start() {
> +	printf 'Starting %s: ' "$DAEMON"
> +	# shellcheck disable=SC2086 # we need the word splitting
> +	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \

I don't know how this was tested: cupsd is installed in /usr/sbin/, not
in /sbin/. Or perhaps you had a merged /usr and so you didn't notice ?

> +	--libdir=/usr/lib \
> +	--with-rcdir=no

Changed to:

	--without-rcdir

I looked at the code and tested it, and it works as expected.

> +define CUPS_INSTALL_INIT_SYSV
> +	$(RM) $(TARGET_DIR)/etc/init.d/cups

This is not needed: --without-rcdir ensures it is not installed. So I
dropped this line.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
