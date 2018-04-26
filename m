From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 25 Apr 2018 21:08:19 -0300 (BRT)
Subject: [Buildroot] [PATCH v3] radvd: improve startup script
In-Reply-To: <20180425232512.081aa142@windsurf>
References: <1506478569-8657-1-git-send-email-casantos@datacom.ind.br>
 <20180416021037.13345-1-casantos@datacom.ind.br>
 <20180425232512.081aa142@windsurf>
Message-ID: <1735406129.182527.1524701299831.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "buildroot" <buildroot@buildroot.org>
> Sent: Wednesday, April 25, 2018 6:25:12 PM
> Subject: Re: [Buildroot] [PATCH v3] radvd: improve startup script

> Hello,
> 
> On Sun, 15 Apr 2018 23:10:37 -0300, Carlos Santos wrote:
> 
>> -RADVD=/usr/sbin/radvd
>> +test -f /etc/radvd.conf || exit 0
> 
> I'm still not impressed by silent exit cases. Shouldn't we let radvd
> fail to start and complain about the lack of radvd.conf ?

Hum, yes, but as already discussed in a different thread there is no
standard regarding these cases.

So far I'm just following the example existing in other start-up scripts:

    $ grep 'test -f .* || exit' package/*/S[0-9]*
    package/dhcp/S80dhcp-relay:test -f /usr/sbin/dhcrelay || exit 0
    package/dhcp/S80dhcp-server:test -f /usr/sbin/dhcpd || exit 0
    package/dhcp/S80dhcp-server:test -f /etc/dhcp/dhcpd.conf || exit 0
    package/mpd/S95mpd:test -f /etc/mpd.conf || exit 0

>> +start() {
>> +	printf "Starting radvd: "
>> +	echo "1" > /proc/sys/net/ipv6/conf/all/forwarding
>> +	start-stop-daemon -S -x /usr/sbin/radvd || {
>> +		echo "FAIL"
>> +		exit 1
>> +	}
> 
> Can we use the
> 
>	[ $? = 0 ] && echo "OK" || echo "FAIL"
> 
> syntax that we use in almost all other init scripts ?

No, because the echo "FAIL" command succeeds, masking the error result:

    $ (false; [ $? = 0 ] && echo "OK" || echo "FAIL";); echo $?
    FAIL
    0

instead of

    $ (false || { echo "FAIL"; exit 1; }; echo "OK";); echo $?
    FAIL
    1

Moreover shellcheck complains that it is bad syntax:

    $ shellcheck package/radvd/S50radvd 

    In package/radvd/S50radvd line 14:
            [ $? = 0 ] && echo "OK" || echo "FAIL"
              ^-- SC2181: Check exit code directly with e.g. 'if mycmd;', not indirectly with $?.

In fact many Buildroot start-up scripts make shellcheck have heart
attacks. :-)

> 
>> +	echo "OK"
>> +}
>> +
>> +stop() {
>> +	printf "Stopping radvd: "
>> +	start-stop-daemon -K -q -x /usr/sbin/radvd || {
>> +		echo "FAIL"
>> +		exit 1
>> +	}
> 
> Ditto here.
> 
> Also, can we use a pid file managed by start-stop-daemon, like
> S50dropbear is doing (and many other init scripts) ?

Yes, but I'd prefer make this change in a different patch if you don't
mind, since it requires additional testing.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
