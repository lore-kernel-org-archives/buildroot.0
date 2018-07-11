From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Wed, 11 Jul 2018 10:58:32 +1000
Subject: [Buildroot] [PATCH v3] busybox: Update udhcpc.script for
 stateful DHCPv6
In-Reply-To: <75fcc9ab-ac24-6e5f-b2a0-efe361fa7ccf@mind.be>
References: <20180702010817.3711-1-sam@mendozajonas.com>
 <75fcc9ab-ac24-6e5f-b2a0-efe361fa7ccf@mind.be>
Message-ID: <7353d956f0d5ff42bc6985d32c6ae495253a8f0e.camel@mendozajonas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2018-07-10 at 23:54 +0200, Arnout Vandecappelle wrote:
> 
> On 02-07-18 03:08, Samuel Mendoza-Jonas wrote:
> > udhcpc6 will call the default script with the address set in the "ipv6"
> > variable. Set "ip" to this address if present.
> > 
> > Also from Rob, if handling a DHCPv6 address wait a moment for the IPv6
> > route to be configured; this doesn't come from DHCPv6 but rather the
> > IPv6 Router Advertisement (RA).
> 
>  Point being that you want to *delete* the route coming from the RA, and keep
> only the DHCPv6 route, correct? That's not entirely clear from the commit
> message. Then, you would only need to do that if the DHCPv6 actually announces a
> router, no?

No the aim is to check if we've received a route from the RA, since
DHCPv6 does not advertise any route. Rob can correct me if needed but the
goal here is to have udhcpc6 behave as much like udhcpc as possible in
that once it configures an address you would usually expect the network
to also be routable. We can't determine that from the DHCPv6 response so
we check to see if the RA has set one before setting the address.

> 
> > 
> > (wait for IPv6 route)
> > From: Robert Lippert <rlippert@google.com>
> > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> > ---
> > v3: Point out 'stateful' DHCPv6 in commit, send to the correct list...
> 
>  I don't see 'stateful' in the commit message :-)

Message, title... :)

> 
> > v2: Avoid bashisms
> > 
> >  package/busybox/udhcpc.script | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
> > index ad110d3a7f..65114b6cd0 100755
> > --- a/package/busybox/udhcpc.script
> > +++ b/package/busybox/udhcpc.script
> > @@ -8,6 +8,16 @@ RESOLV_CONF="/etc/resolv.conf"
> >  [ -e $RESOLV_CONF ] || touch $RESOLV_CONF
> >  [ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
> >  [ -n "$subnet" ] && NETMASK="netmask $subnet"
> > +[ -n "$ipv6" ] && ip="$ipv6/128"
> > +
> > +wait_for_ipv6_default_route() {
> > +	attempts=10
> > +	while [ $attempts != 0 ] && [ -z "$(ip -6 route list | grep default)" ] ; do
> > +		sleep 1
> > +		attempts=$(($attempts-1))
> > +	done
> > +	[ $attempts = 0 ] && echo "failed to get default ipv6 route"
> > +}
> >  
> >  case "$1" in
> >  	deconfig)
> > @@ -37,6 +47,10 @@ case "$1" in
> >  			/usr/sbin/avahi-autoipd -k $interface
> >  		fi
> >  		/sbin/ifconfig $interface $ip $BROADCAST $NETMASK
> > +		if [ -n "$ipv6" ] ; then
> 
>  So I would move this bit...
> 
> > +			echo "waiting for default ipv6 route set"
> > +			wait_for_ipv6_default_route
> > +		fi
> >  
> >  		if [ -n "$router" ] ; then
> 
>  ... here, so it only happens if routers are present.
> 
>  Regards,
>  Arnout
> 
> >  			echo "deleting routers"
> > 
> 
> 
