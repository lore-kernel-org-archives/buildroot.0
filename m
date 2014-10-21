From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Tue, 21 Oct 2014 10:23:56 +0200 (CEST)
Subject: [Buildroot] [PATCH v2] set simple network setup via the system
 configuration submenu
In-Reply-To: <CAGrucu1VtgvJBEN7Y-RV6o91BxKU7A+h3XcfqW9xguTAhgmupA@mail.gmail.com>
Message-ID: <1387207516.26811620.1413879836223.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Hey, thanks for the review, Bash and Makefile are the two programming
languages I was never able to really master

----- Mail original -----
> Hi,
> 
> 2014-10-20 16:14 GMT+02:00 J?r?my Rosen <jeremy.rosen@openwide.fr>:
> > This patch allows the setup of simple /etc/network/interfaces via
> > the
> > configuration menus instead of using an overlay
> >
> > * supports manual ipv4 configuration
> > * supports dhcp configuration
> >
> > Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
> >
> > ---
> >
> > This patch is here to avoid having to do an overlay for the most
> > common
> > cases (ipv4 with fixed IP or DHCP)
> >
> > It can be made more complex (second network if, support ipv6)
> > depending on
> > what people want/need, but I want to keep it simple. The point is
> > to avoid
> > having to tweak overlays to change stuff that everybody needs to
> > change for
> > prototyping
> >
> > When networkd is enabled, this option will be deactivated. Networkd
> > support
> > is tricky to get right on first approximation. It can be added
> > later if it
> > is deemed usefull
> 
> I'm willing to add networkd support once your work has been merged ;)
> 

I've already been working on it, it's indeed quite easy but there is 
a tricky question that needs resolving, so I didn't include it in this
patch. Basically I have a problem with dealing with default values with
static IP settings

* The script need to fail if no value is provided for address
* The script needs to build correctly with default values (autobuilder)
* There is no "correct" default values to use
* We should not let an unconfigured Adress on the network.

Right now, ADDRESS defaults to 0.0.0.0 which is interpreted by net-utils
as "incorrect address, don't configure the interface" (so it ends up
enabled but with no IP address) I'm happy with that, it's ok with my 
requirement

But I could not find an equivalent setting for networkd. 0.0.0.0 is 
interpreted as "automatically find an IP address" and I couldn't find
any documentation on how it does that (does it check the network for
collision ? It seems to use the netmask to choose the base address and
it makes sure there is no conflict with other interfaces on the same
machine, but that's all I could find)

So right now I'm open to suggestions on that particular problem, generating
the actual .network file shouldn't be very hard (I temptatively call it
busybox.networks rather than <name>.network to be sure to overwrite it 
on the next iteration of the script)


> Just for reference, my notes on what needs to be done:
> * no loopback setup, systemd does it on its own

yes, I found that out, it's simple to deal with since loopback is not a config
option for net-utils anymore

> * creation of a ".network" file - .ini file (equivalent to
> /etc/network/interfaces), requires conversion of the netmask to cidr
> format (255.255.255.0 => 24 a.s.o.)

I found how to do that in shell script somewher on stackoverflow, so
not a problem

> * -optionally- disable "predictable" network interface renaming
> ("eth0"=>"enp2s0") [0] so that one can actually rely on eth0's
> existence
> 

that's a good idea, but predicatable interface names seems to already
be disabled on buildroot builds. I wasn't able to find out why and I
didn't dig since I was dropping networkd support at that point. It
seems that there is something weird there...

> Did I miss something here?
> 
> 
> [0]
> http://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/
> 
> 
> > ---
> >
> > v1->v2 :
> > * moved to TARGET_FINALIZE
> > * removed support for lo. It should always be on.
> > * reworked default parameters
> > ---
> >  support/scripts/generate-interfaces-ifconfig.sh | 70
> >  +++++++++++++++++++++++++
> >  system/Config.in                                | 66
> >  +++++++++++++++++++++++
> >  system/system.mk                                |  5 ++
> >  3 files changed, 141 insertions(+)
> >  create mode 100755 support/scripts/generate-interfaces-ifconfig.sh
> >
> > diff --git a/support/scripts/generate-interfaces-ifconfig.sh
> > b/support/scripts/generate-interfaces-ifconfig.sh
> > new file mode 100755
> > index 0000000..873e824
> > --- /dev/null
> > +++ b/support/scripts/generate-interfaces-ifconfig.sh
> > @@ -0,0 +1,70 @@
> > +#!/bin/sh
> > +
> > [...]
> > +
> > +function do_generate_interfaces
> 
> That's a "bashism", which breaks the script when /bin/sh is linked to
> ash,dash,.... Either set the hashbang to "#!/bin/bash" or use
> "do_generate_interfaces ()" instead of "function
> do_generate_interfaces".
> 

will fix

> > +{
> > +       echo "# interface file auto-generated by buildroot"
> > +       echo
> > +       echo "auto lo"
> > +       echo "iface lo inet loopback"
> > +       echo
> > +
> > +       if [ $BR2_SIMPLE_NETWORK ] ; then
> > +               if [ -z $BR2_SIMPLE_NETWORK_NAME ] ; then
> 
> It's been already discussed a bit in the v1 thread, but I'd recommend
> to quote variables that are string-type in kconfig.
> 

will do

> The shell expands the expression here (word-splitting, globbing) and
> the effective command might be unexpected. It'd usually be caused by
> misconfiguration (*), which I wouldn't care about in this script, but
> why let the shell expand a value that you want to use as-is?
> 
> (*): Example: BR2_SIMPLE_NETWORK_NAME="-a 2" => "[ -z -a 2 ]",
> returns
> 0 in bash, but 2 in [d]ash...
> 
> As a not-so-simple corner case, for systemd-networkd, it would be
> legal to set BR2_SIMPLE_NETWORK_NAME="eth*", which is just a matter
> of
> finding the right directory to break the "[]"-statement. Just talking
> about the "[]" here, overall it would still work in your script,
> because "[ -z ... ]" returns nonzero on syntax error (and screams to
> stderr!) and you're checking for 0.
> 
> > +                       echo ERROR no name specified for first
> > network interface
> > +                       exit 1
> > +               fi
> > +               echo "auto  $BR2_SIMPLE_NETWORK_NAME"
> > +               if [ $BR2_SIMPLE_NETWORK_IPV4_DHCP ] ; then
> > +                       echo "iface $BR2_SIMPLE_NETWORK_NAME inet
> > dhcp"
> > +               elif [ $BR2_SIMPLE_NETWORK_IPV4_MANUAL ] ; then
> > +                       echo "iface $BR2_SIMPLE_NETWORK_NAME inet
> > static"
> > +
> > +                       if [ -z $BR2_SIMPLE_NETWORK_IPV4_ADDRESS ]
> > ; then
> > +                               echo ERROR
> > BR2_SIMPLE_NETWORK_IPV4_ADDRESS not set 1>&2
> > +                               exit 1
> > +                       fi
> > +                       echo "  address
> > $BR2_SIMPLE_NETWORK_IPV4_ADDRESS"
> > +
> > +
> > +                       if [ -z $BR2_SIMPLE_NETWORK_IPV4_NETMASK ]
> > ; then
> > +                               echo ERROR
> > BR2_SIMPLE_NETWORK_IPV4_NETMASK not set 1>&2
> > +                               exit 1
> > +                       fi
> > +                       echo "  netmask
> > $BR2_SIMPLE_NETWORK_IPV4_NETMASK"
> > +
> > +                       if [ $BR2_SIMPLE_NETWORK_IPV4_BROADCAST ] ;
> > then
> > +                               echo "  broadcast
> > $BR2_SIMPLE_NETWORK_IPV4_BROADCAST"
> > +                       fi
> > +                       if [ $BR2_SIMPLE_NETWORK_IPV4_GATEWAY ] ;
> > then
> > +                               echo "  gateway
> > $BR2_SIMPLE_NETWORK_IPV4_GATEWAY"
> > +                       fi
> > +               fi
> > +       fi
> > +}
> 
> Please consider splitting up data validation (basically everything
> that leads to "exit 1") and output generation. It adds a few
> duplicated checks, but it'll be easier to add support for networkd.
> 

I support networkd with a separate generation script at this point,
but merging the two might be a good idea, i'll look into that...



Thx for the review, i'll wait a couple of days for more feedback as
usual, then i'll respin

> > +
> > +mkdir -p $TARGET_DIR/etc/network/
> > +do_generate_interfaces > $TARGET_DIR/etc/network/interfaces
> >
> > [snip]
> 
> --
> Andr?
> 
