From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Tue, 19 Feb 2019 10:15:56 +1100
Subject: [Buildroot] [PATCH v4] busybox: Update udhcpc.script for
 stateful DHCPv6
In-Reply-To: <abe85708486429bcf5e46a41bc221f244fd7c81e.camel@mendozajonas.com>
References: <20180726013919.31268-1-sam@mendozajonas.com>
 <abe85708486429bcf5e46a41bc221f244fd7c81e.camel@mendozajonas.com>
Message-ID: <44d55f2a5eeac70c603acfc2c1e1e59b78a85aaa.camel@mendozajonas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2018-08-21 at 13:20 +1000, Samuel Mendoza-Jonas wrote:
> On Thu, 2018-07-26 at 11:39 +1000, Samuel Mendoza-Jonas wrote:
> > udhcpc6 will call the default script with the address set in the "ipv6"
> > variable. Set "ip" to this address if present.
> > 
> > udhcpc6 implements "stateful" DHCPv6 for explicitly requesting an address
> > and other configuration information. A major difference between DHCPv4
> > and DHCPv6 is that DHCPv6 does *not* advertise a default route; this is
> > determined by normal IPv6 autoconfiguration.
> > Included is a change from Rob, which if handling a DHCPv6 address waits
> > a moment for the IPv6 route to be configured; as above this doesn't come
> > from DHCPv6 but rather the IPv6 Router Advertisement (RA) which happens
> > independently from udhcpc6. The intent here is to try and ensure that
> > the interface is route-able upon the script's completion as it would be
> > if called from udhcpc.
> > 
> > (wait for IPv6 route)
> > From: Robert Lippert <rlippert@google.com>
> > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> > ---
> > v4: Expand description of stateful DHCPv6 in commit message
> > v3: Point out 'stateful' DHCPv6 in commit, send to the correct list...
> > v2: Avoid bashisms
> 
> Hi all, any more thoughts on this?

Even I nearly forgot about this one so bumping it again.

Any issues with the patch? Would it be worth splitting out the 
> [ -n "$ipv6" ] && ip="$ipv6/128"
bit from the waiting section so at least IPv6 addresses will be properly
added?

Cheers,
Sam

> 
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
> > +			echo "waiting for default ipv6 route set"
> > +			wait_for_ipv6_default_route
> > +		fi
> >  
> >  		if [ -n "$router" ] ; then
> >  			echo "deleting routers"
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
