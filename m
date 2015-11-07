From: Trent Piepho <tpiepho@kymetacorp.com>
Date: Sat, 7 Nov 2015 01:44:49 +0000
Subject: [Buildroot] [PATCH] system: Fix for NFS booting with interface
 config via DHCP
In-Reply-To: <563D4BE4.2020105@mind.be>
References: <1446841557.4553.32.camel@rtred1test09.kymeta.local>
 <563D4BE4.2020105@mind.be>
Message-ID: <1446860689.4553.41.camel@rtred1test09.kymeta.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2015-11-07 at 01:55 +0100, Arnout Vandecappelle wrote:

> > Example when the interface is used for NFS:
> > # ifup eth0
> > Skipping eth0, used for NFS from 192.168.1.123
> > run-parts: /etc/network/if-pre-up.d/nfs_check: exit status 1
> > 
> > Example when the interface isn't used for NFS:
> > # ifup eth1
> > [brings interface up]
> > 
> > An alternative to putting the script in if-pre-up.d would be to add
> > pre-up lines to the interfaces file.  This would allow running the
> > script just for certain interfaces.  It also removes the "run-parts"
> > message to do it this way.
> 
>  But I think ifup would still report an error, no?
Not really, error exit status but no message:

# ifup eth0 ; echo $?
Skipping eth0, used for NFS from 192.168.1.123
1

The skipping message is from my script.

> > +
> > +nfsip=`awk '$3=="nfs" && $2=="/"{ sub(/:.*/,"",$1); print $1; }' /proc/mounts`
> 
>  sed is generally better-known so we prefer it if possible. Like
> 
> sed -n '/^\([0-9.]*\):[^ ]* \/ nfs .*/s//\1/p' /proc/mounts

Ok, that's simpler too.

> 
> 
>  However, why don't we just check if the interface is already up? Like
> ip link show $IFACE | cut -d ' ' -f 3 | grep -q UP

It's currently ok to call ifup on an interface that's already up.  It
will reconfigure it.  The interface, while up, might not have been
assigned an ip.

It wouldn't be tied to NFS at that point either.


>  I wonder if it is useful to have this optional. The overhead of running this
> extra script is minimal, and we know for sure that NFS-root will not boot
> without it. So I'd always install it if BR2_SYSTEM_DHCP. And people who don't
> want it can still get rid of it in an overlay.

I didn't think that being option was that useful either.  But it's
possible for NFS root to work without having this, if the NFS interface
is not the same one that is being configured with DHCP.
