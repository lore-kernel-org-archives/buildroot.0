From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 17 Oct 2018 15:09:06 -0500
Subject: [Buildroot] [PATCH 1/1] ntp: added ntpdate support to the
 S49ntp script
In-Reply-To: <CALtfCQaMWrgEo9MF+d1o6P-mVU-RsrkiNQHrvuch6EwNpchKaQ@mail.gmail.com>
References: <1539708282-23077-1-git-send-email-oscargomezf@gmail.com>
 <CANQCQpa+VmoqqvrH079_TZmbi4y4gUAVxO3Sba0kR--027rWYg@mail.gmail.com>
 <CALtfCQZFn4CJwtphnpgwHaL=LG4E7G_CR=CbHcr8xRFVUN3t_A@mail.gmail.com>
 <CALtfCQaMWrgEo9MF+d1o6P-mVU-RsrkiNQHrvuch6EwNpchKaQ@mail.gmail.com>
Message-ID: <CANQCQpZX9vDt_YmXr_83MgRdTLZ199OLvVDvY6Ae=ctw1fUO_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oscar,

On Wed, Oct 17, 2018 at 2:49 PM Oscar Gomez Fuente
<oscargomezf@gmail.com> wrote:
>
> Hi everyone,
>
> I made some improvements. If everyone thinks it is ok I will send a patch:
> ----->
> #! /bin/sh
>
> NAME=ntpd
> NTPDATE=/usr/bin/ntpdate

Do you need to try more then one server?

I'd suggest the following instead which handles the default NTP_SERVER
without a conditional and removes the loop.

NTP_SERVER=0.pool.ntp.org

>
> # Read config file if it is present.
> if [ -r /etc/default/$NAME ]; then
> . /etc/default/$NAME
> fi
>
> case $1 in
> start)
>     printf "Starting $NAME: "
>     CURRENT_DATE=$(date | grep "1970")
>     if [ -f $NTPDATE -a "$CURRENT_DATE" != "" ]; then
            $NTPDATE $NTP_SERVER > /dev/null 2>&1
            [ $?  = 1 ] && echo -n "(No initial time set)"
>     fi
>     start-stop-daemon -S -q -x /usr/sbin/ntpd -- -g
>     [ $? = 0 ] && echo "OK" || echo "FAIL"
>     ;;
> stop)
>     printf "Stopping $NAME: "
>     start-stop-daemon -K -q -n $NAME
>     [ $? = 0 ] && echo "OK" || echo "FAIL"
>     ;;
> restart|reload)
>     echo "Restarting $NAME: "
>     $0 stop
>     sleep 1
>     $0 start
>     ;;
> *)
>     echo "Usage: $0 {start|stop|restart|reload}" >&2
>     exit 1
>     ;;
> esac
>
> exit 0
>
> ----->
>
> Best regards.



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / RC Linux Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
