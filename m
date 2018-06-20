From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Wed, 20 Jun 2018 10:24:04 +1000
Subject: [Buildroot] [PATCH v2] busybox: Update udhcpc.script for DHCPv6
In-Reply-To: <87zhzri4yp.fsf@dell.be.48ers.dk>
References: <20180619005233.10531-1-sam@mendozajonas.com>
 <87zhzri4yp.fsf@dell.be.48ers.dk>
Message-ID: <5f973c1a12654942311215bebafcd6e7047886f7.camel@mendozajonas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2018-06-19 at 09:57 +0200, Peter Korsgaard wrote:
> > > > > > "Samuel" == Samuel Mendoza-Jonas <sam@mendozajonas.com> writes:
> 
> Hi,
> 
>  > udhcpc6 will call the default script with the address set in the "ipv6"
>  > variable. Set "ip" to this address if present.
> 
>  > Also from Rob, if handling a DHCPv6 address wait a moment for the IPv6
>  > route to be configured; this doesn't come from DHCPv6 but rather the
>  > IPv6 Router Advertisement (RA).
> 
>  > (wait for IPv6 route)
>  > From: Robert Lippert <rlippert@google.com>
>  > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
>  > ---
>  > v2: Avoid bashisms
> 
>  >  package/busybox/udhcpc.script | 14 ++++++++++++++
>  >  1 file changed, 14 insertions(+)
> 
>  > diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
> 
> You are sending this to the busybox list, but it looks to be a Buildroot
> patch?

Ugh, thank you for noticing - must have fat-fingered the --to option.

> 
> > index ad110d3a7f..65114b6cd0 100755
> 
>  > --- a/package/busybox/udhcpc.script
>  > +++ b/package/busybox/udhcpc.script
>  > @@ -8,6 +8,16 @@ RESOLV_CONF="/etc/resolv.conf"
>  >  [ -e $RESOLV_CONF ] || touch $RESOLV_CONF
>  >  [ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
>  >  [ -n "$subnet" ] && NETMASK="netmask $subnet"
>  > +[ -n "$ipv6" ] && ip="$ipv6/128"
> 
> Why /128?
> 
> I'm far from an IPv6 expert, but I take it this is for stateful DHCPv6,
> right? Please mention that in the commit message.

Yes this is stateful DHCPv6 - I'll update the commit message since I need to
send it to the correct list anyway :)
I can hardly claim the title of IPv6 expert either, but my understanding is
that a DHCPv6 server will not supply a subnet mask like a DHCPv4 server would,
but rather the address is implicitly a global '/128' address (and indeed udhcpc6
does not supply a subnet variable).

Cheers,
Sam

> 
> > +
> 
>  > +wait_for_ipv6_default_route() {
>  > +	attempts=10
>  > +	while [ $attempts != 0 ] && [ -z "$(ip -6 route list | grep default)" ] ; do
>  > +		sleep 1
>  > +		attempts=$(($attempts-1))
>  > +	done
>  > +	[ $attempts = 0 ] && echo "failed to get default ipv6 route"
>  > +}
>  
>  >  case "$1" in
>  >  	deconfig)
>  > @@ -37,6 +47,10 @@ case "$1" in
>  >  			/usr/sbin/avahi-autoipd -k $interface
>  >  		fi
>  >  		/sbin/ifconfig $interface $ip $BROADCAST $NETMASK
>  > +		if [ -n "$ipv6" ] ; then
>  > +			echo "waiting for default ipv6 route set"
>  > +			wait_for_ipv6_default_route
>  > +		fi
>  
>  >  		if [ -n "$router" ] ; then
>  >  			echo "deleting routers"
>  > -- 
>  > 2.17.1
> 
>  > _______________________________________________
>  > busybox mailing list
>  > busybox at busybox.net
>  > http://lists.busybox.net/mailman/listinfo/busybox
> 
