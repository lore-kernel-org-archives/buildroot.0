From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 15 Apr 2018 17:21:33 -0300 (BRT)
Subject: [Buildroot] [PATCH] network-manager: support a defaults file in
 the init script
In-Reply-To: <20180415215905.6ee11140@windsurf.numericable.fr>
References: <20180413160027.6089-1-casantos@datacom.ind.br>
 <20180415215905.6ee11140@windsurf.numericable.fr>
Message-ID: <2090427318.2803.1523823693523.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "buildroot" <buildroot@buildroot.org>
> Sent: Sunday, April 15, 2018 4:59:05 PM
> Subject: Re: [Buildroot] [PATCH] network-manager: support a defaults file in the init script

> Hello,
> 
> On Fri, 13 Apr 2018 13:00:27 -0300, Carlos Santos wrote:
>> Sometimes it is useful to pass some parameters to NetworkManager when it
>> starts (e.g. --log-level) instead of editting NetworkManager.conf. Allow
>> the user add a file with a NETWORKMANAGER_ARGS variable containing such
>> flags. This is simpler than overriding the whole startup script (e.g. by
>> means of a rootfs overlay).
>> 
>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> 
> I've applied to master. However, a few comments below.
> 
>> ---
>>  package/network-manager/S45network-manager | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>> 
>> diff --git a/package/network-manager/S45network-manager
>> b/package/network-manager/S45network-manager
>> index f39e20d73b..bb4bf164a5 100755
>> --- a/package/network-manager/S45network-manager
>> +++ b/package/network-manager/S45network-manager
>> @@ -1,5 +1,8 @@
>>  #!/bin/sh
>>  
>> +# Allow a few customizations from a config file
>> +test -r /etc/default/NetworkManager && . /etc/default/NetworkManager
>> +
>>  prefix=/usr
>>  exec_prefix=/usr
>>  sbindir=${exec_prefix}/sbin
> 
> Same as the modem-manager discussion: I don't think the
> NETWORKMANAGER_BIN variable, and testing that the binary file is
> executable really makes sense.
> 
>> @@ -14,7 +17,7 @@ case "$1" in
>>  		printf "Starting NetworkManager ... "
>>  		[ ! -d /var/run/NetworkManager ] && install -d /var/run/NetworkManager
>>  		if [ -z "$PID" ]; then
>> -			$NETWORKMANAGER_BIN
>> +			$NETWORKMANAGER_BIN $NETWORKMANAGER_ARGS
> 
> Any idea why start-stop-daemon is not used ?

No idea but I can investigate this later.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
