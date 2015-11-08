From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 9 Nov 2015 00:44:02 +0100
Subject: [Buildroot] [PATCH] system: Fix for NFS booting with interface
 config via DHCP
In-Reply-To: <1446860689.4553.41.camel@rtred1test09.kymeta.local>
References: <1446841557.4553.32.camel@rtred1test09.kymeta.local>
 <563D4BE4.2020105@mind.be>
 <1446860689.4553.41.camel@rtred1test09.kymeta.local>
Message-ID: <563FDE42.5000709@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07-11-15 02:44, Trent Piepho wrote:
> On Sat, 2015-11-07 at 01:55 +0100, Arnout Vandecappelle wrote:
> 
>>> Example when the interface is used for NFS:
>>> # ifup eth0
>>> Skipping eth0, used for NFS from 192.168.1.123
>>> run-parts: /etc/network/if-pre-up.d/nfs_check: exit status 1
>>>
>>> Example when the interface isn't used for NFS:
>>> # ifup eth1
>>> [brings interface up]
>>>
>>> An alternative to putting the script in if-pre-up.d would be to add
>>> pre-up lines to the interfaces file.  This would allow running the
>>> script just for certain interfaces.  It also removes the "run-parts"
>>> message to do it this way.
>>
>>  But I think ifup would still report an error, no?
> Not really, error exit status but no message:
> 
> # ifup eth0 ; echo $?
> Skipping eth0, used for NFS from 192.168.1.123
> 1
> 
> The skipping message is from my script.

 In that case, a pre-up line seems better to me.


>>> +
>>> +nfsip=`awk '$3=="nfs" && $2=="/"{ sub(/:.*/,"",$1); print $1; }' /proc/mounts`
>>
>>  sed is generally better-known so we prefer it if possible. Like
>>
>> sed -n '/^\([0-9.]*\):[^ ]* \/ nfs .*/s//\1/p' /proc/mounts
> 
> Ok, that's simpler too.
> 
>>
>>
>>  However, why don't we just check if the interface is already up? Like
>> ip link show $IFACE | cut -d ' ' -f 3 | grep -q UP
> 
> It's currently ok to call ifup on an interface that's already up.  It
> will reconfigure it.  The interface, while up, might not have been
> assigned an ip.
> 
> It wouldn't be tied to NFS at that point either.

 Right, so your approach is better then.

 BTW are we sure that /proc/mounts contains the IP address and not the host name?


 Regards,
 Arnout


>>  I wonder if it is useful to have this optional. The overhead of running this
>> extra script is minimal, and we know for sure that NFS-root will not boot
>> without it. So I'd always install it if BR2_SYSTEM_DHCP. And people who don't
>> want it can still get rid of it in an overlay.
> 
> I didn't think that being option was that useful either.  But it's
> possible for NFS root to work without having this, if the NFS interface
> is not the same one that is being configured with DHCP.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
