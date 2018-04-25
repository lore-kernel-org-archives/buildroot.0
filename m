From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 23:25:12 +0200
Subject: [Buildroot] [PATCH v3] radvd: improve startup script
In-Reply-To: <20180416021037.13345-1-casantos@datacom.ind.br>
References: <1506478569-8657-1-git-send-email-casantos@datacom.ind.br>
 <20180416021037.13345-1-casantos@datacom.ind.br>
Message-ID: <20180425232512.081aa142@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 15 Apr 2018 23:10:37 -0300, Carlos Santos wrote:

> -RADVD=/usr/sbin/radvd
> +test -f /etc/radvd.conf || exit 0

I'm still not impressed by silent exit cases. Shouldn't we let radvd
fail to start and complain about the lack of radvd.conf ?

> +start() {
> +	printf "Starting radvd: "
> +	echo "1" > /proc/sys/net/ipv6/conf/all/forwarding
> +	start-stop-daemon -S -x /usr/sbin/radvd || {
> +		echo "FAIL"
> +		exit 1
> +	}

Can we use the

	[ $? = 0 ] && echo "OK" || echo "FAIL"

syntax that we use in almost all other init scripts ?

> +	echo "OK"
> +}
> +
> +stop() {
> +	printf "Stopping radvd: "
> +	start-stop-daemon -K -q -x /usr/sbin/radvd || {
> +		echo "FAIL"
> +		exit 1
> +	}

Ditto here.

Also, can we use a pid file managed by start-stop-daemon, like
S50dropbear is doing (and many other init scripts) ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
