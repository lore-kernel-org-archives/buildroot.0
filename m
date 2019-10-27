From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2019 20:23:23 +0100
Subject: [Buildroot] [PATCH v5 1/2] busybox: Update udhcpc.script for
 stateful DHCPv6
In-Reply-To: <20190521025428.9409-1-sam@mendozajonas.com> (Samuel
 Mendoza-Jonas's message of "Tue, 21 May 2019 12:54:27 +1000")
References: <20190521025428.9409-1-sam@mendozajonas.com>
Message-ID: <8736fej8lw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Mendoza-Jonas <sam@mendozajonas.com> writes:

First of all, sorry for the slow response.

 > udhcpc6 will call the default script with the address set in the "ipv6"
 > variable. Set "ip" to this address if present.

 > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
 > ---
 > v5: Split into two patches and added comment about stateful DHCPv6

 >  package/busybox/udhcpc.script | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
 > index ad110d3a7f..90cc6b62ba 100755
 > --- a/package/busybox/udhcpc.script
 > +++ b/package/busybox/udhcpc.script
 > @@ -8,6 +8,8 @@ RESOLV_CONF="/etc/resolv.conf"
 >  [ -e $RESOLV_CONF ] || touch $RESOLV_CONF
 >  [ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
 >  [ -n "$subnet" ] && NETMASK="netmask $subnet"
 > +# Busybox's udhcpc only supports stateful DHCPv6 for now
 > +[ -n "$ipv6" ] && ip="$ipv6/128"

busybox git actually has stateless support (which will then not set
$ipv6), so I changed the comment to state:

# Handle stateful DHCPv6 like DHCPv4

And extended the commit message to explain that the /128 comes from the
stateful DHCPv6 spec, and how we can reuse the existing DHCPv4
renew/bound logic with this.

And committed, thanks.

-- 
Bye, Peter Korsgaard
