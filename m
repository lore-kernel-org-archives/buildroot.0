From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Aug 2020 10:09:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/iptraf-ng: bump to version 1.2.1
In-Reply-To: <1597833691-18154-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1597833691-18154-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <20200825100956.730252a5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jugurtha,

On Wed, 19 Aug 2020 12:41:31 +0200
Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:

> PTraf-ng is a console-based network monitoring program for Linux that
> displays information about IP traffic. It returns such information as:
> 
> - Current TCP connections
> - UDP, ICMP, OSPF, and other types of IP packets
> - Packet and byte counts on TCP connections
> - IP, TCP, UDP, ICMP, non-IP, and other packet and byte counts
> - TCP/UDP counts by ports
> - Packet counts by packet sizes
> - Packet and byte counts by IP address
> - Interface activity
> - Flag statuses on TCP packets
> - LAN station statistics
> 
> V1.2.1 fixed multiple issues in V1.1.4 like :
> - Introduce packet capturing abstraction: add recvmmsg(),
>   TPACKET_V2 and TPACKET_V3 to capture in multigigabit speeds.
> - Handling mlock() failures and carry on execution (without
>   crashing iptraf-ng).
> - Properly account non-IP packets.
> - Show dropped packet count.
> 
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>

I've applied to next, with a few changes, see below.

> -IPTRAF_NG_MAKE_ENV = \
> -	NCURSES_LDFLAGS="-lpanel -lncurses"

I had to keep NCURSES_LDFLAGS, otherwise the iptraf build system calls
the host ncurses5-config (or similar) script, and gets linker flags
suitable for the host ncurses, and not the target ncurses. In my case,
it caused the build to fail.

> +# HOME should be overwritten, otherwise it falls on the value of
> +# the cross compiling machine.
> +define IPTRAF_NG_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +			   HOME=$(TARGET_DIR)/usr install

Instead of overriding HOME, I've done it like this:

		prefix=/usr DESTDIR=$(TARGET_DIR)

which looks a bit more "standard".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
