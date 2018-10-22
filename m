From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 22 Oct 2018 03:49:13 -0500
Subject: [Buildroot] [PATCH 1/1] ntp: added S48ntpdate script
In-Reply-To: <CALtfCQZiF0jhNwSUXS+qgEN2oHhqkxwF56V31Ymp-_5LzcWD=Q@mail.gmail.com>
References: <1539964343-10526-1-git-send-email-oscargomezf@gmail.com>
 <CANQCQpZcDx+fdZmh6MZypVDCWU8JJbqR0XqqBDbC4T8HnNopXw@mail.gmail.com>
 <CALtfCQZiF0jhNwSUXS+qgEN2oHhqkxwF56V31Ymp-_5LzcWD=Q@mail.gmail.com>
Message-ID: <CANQCQpZQy=58rDrKgPP7yN_X3gCLRS4gLDneEcuPVDrVQH0AFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oscar,

On Mon, Oct 22, 2018 at 2:25 AM Oscar Gomez Fuente
<oscargomezf@gmail.com> wrote:
>
> Hi Matthew,
>
>
> Thank you very much for your help.
>
> I was checking If the script is working fine:
> ----->
> #! /bin/sh
>
> NAME=ntpd
>
> # Read config file if it is present.
> if [ -r /etc/default/$NAME ]
> then
>         . /etc/default/$NAME
> fi
>
> case "$1" in
>         start)
>                 printf "Starting $NAME: "
>                 CURRENT_DATE=$(date | grep "1970")
>                 if [ "$CURRENT_DATE" != "" ]; then
>                         /usr/sbin/ntpd -q -x
>                         [ $?  != 0 ] && echo -n "(No initial time set) - "
>                 fi
>                 start-stop-daemon -S -q -x /usr/sbin/ntpd -- -g
>                 [ $? = 0 ] && echo "OK" || echo "FAIL"
>                 ;;
>         stop)
>                 printf "Stopping $NAME: "
>                 start-stop-daemon -K -q -n $NAME
>                 [ $? = 0 ] && echo "OK" || echo "FAIL"
>                 ;;
>         restart|reload)
>                 echo "Restarting $NAME: "
>                 $0 stop
>                 sleep 1
>                 $0 start
>                 ;;
>         *)
>                 echo "Usage: $0 {start|stop|restart|reload}" >&2
>                 exit 1
>                 ;;
> esac
>
> exit 0
> ----->
>
> But it seems to be that the command "/usr/sbin/ntpd -q -x" is not
> working properly:
>
> # date --set "1970-01-10 10:10:00"
> Sat Jan 10 10:10:00 UTC 1970
> # /etc/init.d/S49ntp restart
> Restarting ntpd:
> Stopping ntpd: OK
> Starting ntpd: 10 Jan 10:10:04 ntpd[1859]: ntpd 4.2.8p12 at 1.3728-o Thu
> Oct 18 16:16:56 UTC 2018 (1): Starting
> 10 Jan 10:10:04 ntpd[1859]: Command line: /usr/sbin/ntpd -q -x
> 10 Jan 10:10:04 ntpd[1859]: proto: precision = 1.718 usec (-19)
> 10 Jan 10:10:04 ntpd[1859]: Listen and drop on 0 v6wildcard [::]:123
> 10 Jan 10:10:04 ntpd[1859]: Listen and drop on 1 v4wildcard 0.0.0.0:123
> 10 Jan 10:10:04 ntpd[1859]: Listen normally on 2 lo 127.0.0.1:123
> 10 Jan 10:10:04 ntpd[1859]: Listen normally on 3 eth0 192.168.20.226:123
> 10 Jan 10:10:04 ntpd[1859]: Listen normally on 4 ppp0 172.21.39.120:123
> 10 Jan 10:10:04 ntpd[1859]: Listen normally on 5 lo [::1]:123
> 10 Jan 10:10:04 ntpd[1859]: Listen normally on 6 eth0
> [xxxx::xxxx:xxxx:xxxx:xxxx%2]:123
> 10 Jan 10:10:04 ntpd[1859]: Listening on routing socket on fd #23 for
> interface updates
> (No initial time set) - OK
>
> Notice that I checking the script forcing the date to 1970 with this
> command. Does anyone any suggestion?
>

I'll give it a try today and let you know.

Matt
