From: Michael Walle <michael@walle.cc>
Date: Fri, 06 Mar 2020 12:53:47 +0100
Subject: [Buildroot] [PATCH] package/linuxptp: make initscript options
 configurable
In-Reply-To: <CAJ4jsacum5KhkSe269xw7PnTtSvTTqV97=gX2YnpVhmQbPn6ig@mail.gmail.com>
References: <20200306101950.23219-1-michael@walle.cc>
 <CAJ4jsacum5KhkSe269xw7PnTtSvTTqV97=gX2YnpVhmQbPn6ig@mail.gmail.com>
Message-ID: <facc7e1137b417dded449127f7f26dd3@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2020-03-06 12:40, schrieb Carlos Santos:
> On Fri, Mar 6, 2020 at 7:20 AM Michael Walle <michael@walle.cc> wrote:
>> 
>> Let the user supply its own options in /etc/default/linuxptp.
>> Additionally, let the user decide if he wants to start php2sys.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>> 
>> It might be better to have an own php2sys initscript. I'm not sure.
>> Thoughts?
>> 
>>  package/linuxptp/S65linuxptp | 30 +++++++++++++++++++++---------
>>  1 file changed, 21 insertions(+), 9 deletions(-)
>> 
>> diff --git a/package/linuxptp/S65linuxptp 
>> b/package/linuxptp/S65linuxptp
>> index 46b8921fdd..5f296a4651 100644
>> --- a/package/linuxptp/S65linuxptp
>> +++ b/package/linuxptp/S65linuxptp
>> @@ -3,23 +3,35 @@
>>  # Start linuxptp
>>  #
>> 
>> +# defaults
>> +PTP4L_OPTS="-f /etc/linuxptp.cfg"
>> +PHC2SYS_ENABLE="true"
> 
> This is not required. An "exit" line in /etc/default/linuxptp suffices.

Please note that this is about the phc2sys, it will still start the
ptp4l daemon. That being said.. I find it not really intuitive to have
a control flow statement in a "configration" file.

BTW. Heiko just found out that the pid file creating isnt working and
that killing the daemon doesn't work neither.

-michael

> 
>> +PHC2SYS_OPTS="-s eth0 -c CLOCK_REALTIME -w -S 1.0"
>> +
>> +# Read configuration variable file if it is present
>> +[ -r /etc/default/linuxptp ] && . /etc/default/linuxptp
>> +
>>  start() {
>>         printf "Starting linuxptp daemon: "
>>         start-stop-daemon -S -b -q -p /var/run/linuxptp-ptp4l.pid \
>> -               -x /usr/sbin/ptp4l -- -f /etc/linuxptp.cfg
>> +               -x /usr/sbin/ptp4l -- ${PTP4L_OPTS}
>>         [ $? = 0 ] && echo "OK" || echo "FAIL"
>> 
>> -       printf "Starting linuxptp system clock synchronization: "
>> -       start-stop-daemon -S -b -q -p /var/run/linuxptp-phc2sys.pid \
>> -               -x /usr/sbin/phc2sys -- -s eth0 -c CLOCK_REALTIME -w 
>> -S 1.0
>> -       [ $? = 0 ] && echo "OK" || echo "FAIL"
>> +       if [ "${PHC2SYS_ENABLE}" = "true" ]; then
>> +               printf "Starting linuxptp system clock 
>> synchronization: "
>> +               start-stop-daemon -S -b -q -p 
>> /var/run/linuxptp-phc2sys.pid \
>> +                       -x /usr/sbin/phc2sys -- ${PHC2SYS_OPTS}
>> +               [ $? = 0 ] && echo "OK" || echo "FAIL"
>> +       fi
>>  }
>> 
>>  stop() {
>> -       printf "Stopping linuxptp system clock synchronization: "
>> -       start-stop-daemon -K -q -p /var/run/linuxptp-phc2sys.pid \
>> -               -x /usr/sbin/phc2sys
>> -       echo "OK"
>> +       if [ "${PHC2SYS_ENABLE}" = "true" ]; then
>> +               printf "Stopping linuxptp system clock 
>> synchronization: "
>> +               start-stop-daemon -K -q -p 
>> /var/run/linuxptp-phc2sys.pid \
>> +                       -x /usr/sbin/phc2sys
>> +               echo "OK"
>> +       fi
>> 
>>         printf "Stopping linuxptp daemon: "
>>         start-stop-daemon -K -q -p /var/run/linuxptp-ptp4l.pid \
>> --
>> 2.20.1
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
