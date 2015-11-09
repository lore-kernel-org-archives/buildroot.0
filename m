From: Trent Piepho <tpiepho@kymetacorp.com>
Date: Mon, 9 Nov 2015 21:29:38 +0000
Subject: [Buildroot] [PATCH] system: Fix for NFS booting with interface
 config via DHCP
In-Reply-To: <563FDE42.5000709@mind.be>
References: <1446841557.4553.32.camel@rtred1test09.kymeta.local>
 <563D4BE4.2020105@mind.be>
 <1446860689.4553.41.camel@rtred1test09.kymeta.local>
 <563FDE42.5000709@mind.be>
Message-ID: <1447104580.4553.74.camel@rtred1test09.kymeta.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2015-11-09 at 00:44 +0100, Arnout Vandecappelle wrote:
> >>
> >>  However, why don't we just check if the interface is already up? Like
> >> ip link show $IFACE | cut -d ' ' -f 3 | grep -q UP
> > 
> > It's currently ok to call ifup on an interface that's already up.  It
> > will reconfigure it.  The interface, while up, might not have been
> > assigned an ip.
> > 
> > It wouldn't be tied to NFS at that point either.
> 
>  Right, so your approach is better then.
> 
>  BTW are we sure that /proc/mounts contains the IP address and not the host name?

I believe the nfsroot mount option only allows IP addresses and not
hostnames.  Since the kernel would have to do the DNS lookup.  And the
kernel docs say "<server-ip>", which seems to imply only an IP will
work.  It didn't work when I tried it.  And the busybox mount command
appears to only accept an IP ("mount: bad address 'hostname'").

But the util linux mount does accept a hostname and it does show up
in /proc/mounts as a hostname.

So you can get a hostname, but I don't think it's possible in a NFS root
case.  The mount options also in /proc/mounts will have addr=<ip>, which
is a way to get the numeric ip even if the hostname is present.  It does
make the sed parsing harder to get the value from there.
