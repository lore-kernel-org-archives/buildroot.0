From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jun 2018 09:57:18 +0200
Subject: [Buildroot] [PATCH v2] busybox: Update udhcpc.script for DHCPv6
In-Reply-To: <20180619005233.10531-1-sam@mendozajonas.com> (Samuel
 Mendoza-Jonas's message of "Tue, 19 Jun 2018 10:52:33 +1000")
References: <20180619005233.10531-1-sam@mendozajonas.com>
Message-ID: <87zhzri4yp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Mendoza-Jonas <sam@mendozajonas.com> writes:

Hi,

 > udhcpc6 will call the default script with the address set in the "ipv6"
 > variable. Set "ip" to this address if present.

 > Also from Rob, if handling a DHCPv6 address wait a moment for the IPv6
 > route to be configured; this doesn't come from DHCPv6 but rather the
 > IPv6 Router Advertisement (RA).

 > (wait for IPv6 route)
 > From: Robert Lippert <rlippert@google.com>
 > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
 > ---
 > v2: Avoid bashisms

 >  package/busybox/udhcpc.script | 14 ++++++++++++++
 >  1 file changed, 14 insertions(+)

 > diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script

You are sending this to the busybox list, but it looks to be a Buildroot
patch?

> index ad110d3a7f..65114b6cd0 100755
 > --- a/package/busybox/udhcpc.script
 > +++ b/package/busybox/udhcpc.script
 > @@ -8,6 +8,16 @@ RESOLV_CONF="/etc/resolv.conf"
 >  [ -e $RESOLV_CONF ] || touch $RESOLV_CONF
 >  [ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
 >  [ -n "$subnet" ] && NETMASK="netmask $subnet"
 > +[ -n "$ipv6" ] && ip="$ipv6/128"

Why /128?

I'm far from an IPv6 expert, but I take it this is for stateful DHCPv6,
right? Please mention that in the commit message.

> +
 > +wait_for_ipv6_default_route() {
 > +	attempts=10
 > +	while [ $attempts != 0 ] && [ -z "$(ip -6 route list | grep default)" ] ; do
 > +		sleep 1
 > +		attempts=$(($attempts-1))
 > +	done
 > +	[ $attempts = 0 ] && echo "failed to get default ipv6 route"
 > +}
 
 >  case "$1" in
 >  	deconfig)
 > @@ -37,6 +47,10 @@ case "$1" in
 >  			/usr/sbin/avahi-autoipd -k $interface
 >  		fi
 >  		/sbin/ifconfig $interface $ip $BROADCAST $NETMASK
 > +		if [ -n "$ipv6" ] ; then
 > +			echo "waiting for default ipv6 route set"
 > +			wait_for_ipv6_default_route
 > +		fi
 
 >  		if [ -n "$router" ] ; then
 >  			echo "deleting routers"
 > -- 
 > 2.17.1

 > _______________________________________________
 > busybox mailing list
 > busybox at busybox.net
 > http://lists.busybox.net/mailman/listinfo/busybox

-- 
Bye, Peter Korsgaard
