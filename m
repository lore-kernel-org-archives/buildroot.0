From: Philipp Skadorov <philipp.skadorov@savoirfairelinux.com>
Date: Wed, 8 Mar 2017 13:44:12 -0500 (EST)
Subject: [Buildroot] [PATCH 1/1] lighttpd: source default file from
 startup script
In-Reply-To: <20170308173420.525msvchrmgpajia@tarshish>
References: <20170308152114.14851-1-philipp.skadorov@savoirfairelinux.com>
 <20170308173420.525msvchrmgpajia@tarshish>
Message-ID: <1980559102.275301.1488998652295.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

----- Original Message -----
> From: "Baruch Siach" <baruch@tkos.co.il>
> To: "Philipp Skadorov" <philipp.skadorov@savoirfairelinux.com>
> Cc: buildroot at buildroot.org
> Sent: Wednesday, March 8, 2017 12:34:20 PM
> Subject: Re: [Buildroot] [PATCH 1/1] lighttpd: source default file from startup script

> Hi Philipp,
> 
> On Wed, Mar 08, 2017 at 10:21:14AM -0500, Philipp Skadorov wrote:
>> lighttpd server runs cgi application that has no way to get environment
>> variables that are set up for it.
>> 
>> S50lighttpd is changed to source /etc/default/lighttpd file where these
>> environment variables can be set up.
>> 
>> Signed-off-by: Philipp Skadorov <philipp.skadorov@savoirfairelinux.com>
>> ---
>>  package/lighttpd/S50lighttpd | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>> 
>> diff --git a/package/lighttpd/S50lighttpd b/package/lighttpd/S50lighttpd
>> index 44ac257c1..b3518cd27 100644
>> --- a/package/lighttpd/S50lighttpd
>> +++ b/package/lighttpd/S50lighttpd
>> @@ -2,15 +2,21 @@
>>  #
>>  # Starts lighttpd.
>>  #
>> +NAME=lighttpd
>> +DAEMON=/usr/sbin/$NAME
>> +PID_FILE="/var/run/$NAME.pid"
>> +CONF_FILE="/etc/$NAME/$NAME.conf"
> 
> Should be
> 
>  CONF_FILE="/etc/default/$NAME.conf"
> 
> to mach the commit log text.
> 

You are referring to the package original config file, /etc/lighttpd/lighttpd.conf.
It has gone nowhere from /etc/lighttpd dir.

Before the daemon is run with it, the new file /etc/default/lighttpd
is sourced (if present) to set up the custom environment.


Regards,
Philipp


>> +
>> +[ -r /etc/default/$NAME ] && . /etc/default/$NAME
>>  
>>  start() {
>>  	printf "Starting lighttpd: "
>> -	start-stop-daemon -S -q -p /var/run/lighttpd.pid --exec /usr/sbin/lighttpd --
>> -f /etc/lighttpd/lighttpd.conf
>> +	start-stop-daemon -S -q -p $PID_FILE --exec $DAEMON -- -f $CONF_FILE
>>  	echo "OK"
>>  }
>>  stop() {
>>  	printf "Stopping lighttpd: "
>> -	start-stop-daemon -K -q -p /var/run/lighttpd.pid
>> +	start-stop-daemon -K -q -p $PID_FILE
>>  	echo "OK"
>>  }
>>  restart() {
> 
> baruch
> 
> --
>     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
