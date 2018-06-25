From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Mon, 25 Jun 2018 11:30:16 +1000
Subject: [Buildroot] [PATCH v2] busybox: Update udhcpc.script for DHCPv6
In-Reply-To: <CAK1hOcN68edmb_n53YhR5ZMShgGo0W9UWzPi=p3nHDFosNEQ+g@mail.gmail.com>
References: <20180619005233.10531-1-sam@mendozajonas.com>
 <CAK1hOcN68edmb_n53YhR5ZMShgGo0W9UWzPi=p3nHDFosNEQ+g@mail.gmail.com>
Message-ID: <cb7c311d08b26082f2cdfb63e8704245134fe325.camel@mendozajonas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2018-06-24 at 21:32 +0200, Denys Vlasenko wrote:
> On Tue, Jun 19, 2018 at 2:52 AM, Samuel Mendoza-Jonas
> <sam@mendozajonas.com> wrote:
> > udhcpc6 will call the default script with the address set in the "ipv6"
> > variable. Set "ip" to this address if present.
> > 
> > Also from Rob, if handling a DHCPv6 address wait a moment for the IPv6
> > route to be configured; this doesn't come from DHCPv6 but rather the
> > IPv6 Router Advertisement (RA).
> > 
> > (wait for IPv6 route)
> > From: Robert Lippert <rlippert@google.com>
> > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> > ---
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
> > +       attempts=10
> > +       while [ $attempts != 0 ] && [ -z "$(ip -6 route list | grep default)" ] ; do
> > +               sleep 1
> > +               attempts=$(($attempts-1))
> > +       done
> > +       [ $attempts = 0 ] && echo "failed to get default ipv6 route"
> > +}
> > 
> >  case "$1" in
> >         deconfig)
> > @@ -37,6 +47,10 @@ case "$1" in
> >                         /usr/sbin/avahi-autoipd -k $interface
> >                 fi
> >                 /sbin/ifconfig $interface $ip $BROADCAST $NETMASK
> > +               if [ -n "$ipv6" ] ; then
> > +                       echo "waiting for default ipv6 route set"
> > +                       wait_for_ipv6_default_route
> > +               fi
> 
> Please explain "wait_for_ipv6_default_route" logic.

I believe Rob's aim here was to be as close to DHCPv4 behaviour as
possible, ie. once this script completes the interface is set up and able
to route packets. Since routing information doesn't come from the DHCPv6
response this waits a moment to make sure the routing information from
the IPv6 RA has arrived, which happens automatically.
