From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 26 Sep 2017 22:15:35 -0300 (BRT)
Subject: [Buildroot] [PATCH] radvd: improve startup script
In-Reply-To: <7d0f3151-bce7-8512-bae1-2c0d44717faf@mind.be>
References: <1506333475-4759-1-git-send-email-casantos@datacom.ind.br>
 <7d0f3151-bce7-8512-bae1-2c0d44717faf@mind.be>
Message-ID: <1633566626.11077703.1506474935557.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message -----
> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "Carlos Santos" <casantos@datacom.ind.br>, buildroot at buildroot.org
> Sent: Tuesday, September 26, 2017 7:26:20 PM
> Subject: Re: [Buildroot] [PATCH] radvd: improve startup script

> On 25-09-17 11:57, Carlos Santos wrote:
>> The previous script caused a failure if /etc/radvd.conf did not exist.
> 
> That's a good thing, no? If you select radvd but forget to install a
> configuration file, you'll want to have some kind of warning rather than
> silently not starting it.

Not exactly. There is no default configuration and the daemon may be
started later by other services using a configuration created at run-time.
In this particular I'm targeting libvirt, which uses both radvd and dnsmasq
this way.

>> 
>> This is a simple copy/paste/edit of package/dnsmasq/S80dnsmasq.
> 
> Perhaps not the best example...
> 
>> 
>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
>> ---
>>  package/radvd/S50radvd | 36 ++++++++++++++++++++++--------------
>>  1 file changed, 22 insertions(+), 14 deletions(-)
>> 
>> diff --git a/package/radvd/S50radvd b/package/radvd/S50radvd
>> index 9f1407c..dcc2af6 100755
>> --- a/package/radvd/S50radvd
>> +++ b/package/radvd/S50radvd
>> @@ -1,18 +1,26 @@
>>  #!/bin/sh
>>  
>> -RADVD=/usr/sbin/radvd
>> +[ -x /usr/sbin/radvd ] || exit 0
> 
> This we certainly don't want. If the executable is missing, we want to shout
> loudly, not silently skip it.
> 
>> +[ -f /etc/radvd.conf ] || exit 0
>>  
>> -echo "1" > /proc/sys/net/ipv6/conf/all/forwarding
> 
> Why remove this? It should of course move to the start stanza.

Correct.

>> +case "$1" in
>> +	start)
>> +		printf "Starting radvd: "
>> +		start-stop-daemon -S -x /usr/sbin/radvd
>> +		[ $? = 0 ] && echo "OK" || echo "FAI> +		;;
>> +	stop)
>> +		printf "Stopping radvd: "
>> +		start-stop-daemon -K -q -x /usr/sbin/radvd
>> +		[ $? = 0 ] && echo "OK" || echo "FAIL"
>> +		;;
>> +	restart|reload)
>> +		$0 stop
>> +		$0 start
>> +		;;
>> +	*)
>> +		echo "Usage: $0 {start|stop|restart}"
>> +		exit 1
>> +esac
> 
> This part looks good.
> 
> Regards,
> Arnout

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
