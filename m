From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 26 Feb 2019 08:21:14 -0600
Subject: [Buildroot] [PATCH v4] busybox: Update udhcpc.script for
 stateful DHCPv6
In-Reply-To: <44d55f2a5eeac70c603acfc2c1e1e59b78a85aaa.camel@mendozajonas.com>
References: <20180726013919.31268-1-sam@mendozajonas.com>
 <abe85708486429bcf5e46a41bc221f244fd7c81e.camel@mendozajonas.com>
 <44d55f2a5eeac70c603acfc2c1e1e59b78a85aaa.camel@mendozajonas.com>
Message-ID: <CANQCQpZpRDSuFSAbrYstQp2kMc5SiEsAoL67HUzBvsafHT00Ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sam,

On Mon, Feb 18, 2019 at 5:24 PM Samuel Mendoza-Jonas
<sam@mendozajonas.com> wrote:
>
> On Tue, 2018-08-21 at 13:20 +1000, Samuel Mendoza-Jonas wrote:
> > On Thu, 2018-07-26 at 11:39 +1000, Samuel Mendoza-Jonas wrote:
> > > udhcpc6 will call the default script with the address set in the "ipv6"
> > > variable. Set "ip" to this address if present.
> > >
> > > udhcpc6 implements "stateful" DHCPv6 for explicitly requesting an address
> > > and other configuration information. A major difference between DHCPv4
> > > and DHCPv6 is that DHCPv6 does *not* advertise a default route; this is
> > > determined by normal IPv6 autoconfiguration.
> > > Included is a change from Rob, which if handling a DHCPv6 address waits
> > > a moment for the IPv6 route to be configured; as above this doesn't come
> > > from DHCPv6 but rather the IPv6 Router Advertisement (RA) which happens
> > > independently from udhcpc6. The intent here is to try and ensure that
> > > the interface is route-able upon the script's completion as it would be
> > > if called from udhcpc.

Based on what I understand of IPv6 this patch functionally looks correct.

I'd add a comment above the "[ -n "$ipv6" ] && ip="$ipv6/128"" line
stating that udhcpc only supports stateful.  Hopefully that would be
enough for a user to then know they should install "odhcp6c" or
another client for full RFC support.

In the "wait_for_ipv6_default_route()", do you know if the busybox
"ip" tool supports the "$(ip -6 route list | grep default)"
command/expected output or are you dependent on the full iproute2
package?

Also in that wait loop, I'd suggest mimic'n the loop and output
behavior of this USB Nic wait script
(package/ifupdown-scripts/network/if-pre-up.d/wait_iface).

> > >
> > > (wait for IPv6 route)
> > > From: Robert Lippert <rlippert@google.com>
> > > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> > > ---
> > > v4: Expand description of stateful DHCPv6 in commit message
> > > v3: Point out 'stateful' DHCPv6 in commit, send to the correct list...
> > > v2: Avoid bashisms
> >
> > Hi all, any more thoughts on this?
>
> Even I nearly forgot about this one so bumping it again.
>
> Any issues with the patch? Would it be worth splitting out the
> > [ -n "$ipv6" ] && ip="$ipv6/128"
> bit from the waiting section so at least IPv6 addresses will be properly
> added?

Sure, it would probably be good to have the changes broken into a
initial stateful  ip= fix and a second which adds the RA wait loop.

Thanks for the patch!

Matt
