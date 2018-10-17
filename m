From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Wed, 17 Oct 2018 21:49:01 +0200
Subject: [Buildroot] [PATCH 1/1] ntp: added ntpdate support to the
 S49ntp script
In-Reply-To: <CALtfCQZFn4CJwtphnpgwHaL=LG4E7G_CR=CbHcr8xRFVUN3t_A@mail.gmail.com>
References: <1539708282-23077-1-git-send-email-oscargomezf@gmail.com>
 <CANQCQpa+VmoqqvrH079_TZmbi4y4gUAVxO3Sba0kR--027rWYg@mail.gmail.com>
 <CALtfCQZFn4CJwtphnpgwHaL=LG4E7G_CR=CbHcr8xRFVUN3t_A@mail.gmail.com>
Message-ID: <CALtfCQaMWrgEo9MF+d1o6P-mVU-RsrkiNQHrvuch6EwNpchKaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I made some improvements. If everyone thinks it is ok I will send a patch:
----->
#! /bin/sh

NAME=ntpd
NTPDATE=/usr/bin/ntpdate
MAX_NUM_SERVERS=3
NTP_NAME_SERVER=pool.ntp.org

# Read config file if it is present.
if [ -r /etc/default/$NAME ]; then
. /etc/default/$NAME
fi

case $1 in
start)
    printf "Starting $NAME: "
    CURRENT_DATE=$(date | grep "1970")
    if [ -f $NTPDATE -a "$CURRENT_DATE" != "" ]; then
        if [ "$NTP_SERVER" != "" ]; then
            $NTPDATE $NTP_SERVER > /dev/null 2>&1
            CURRENT_DATE=$(date | grep "1970")
        fi
        NUM_SERVER=0
        while [ $NUM_SERVER -le $MAX_NUM_SERVERS -a "$CURRENT_DATE" != "" ]
        do
            $NTPDATE $NUM_SERVER.$NTP_NAME_SERVER > /dev/null 2>&1
            NUM_SERVER=$(( $NUM_SERVER + 1 ))
            CURRENT_DATE=$(date | grep "1970")
        done
    fi
    start-stop-daemon -S -q -x /usr/sbin/ntpd -- -g
    [ $? = 0 ] && echo "OK" || echo "FAIL"
    ;;
stop)
    printf "Stopping $NAME: "
    start-stop-daemon -K -q -n $NAME
    [ $? = 0 ] && echo "OK" || echo "FAIL"
    ;;
restart|reload)
    echo "Restarting $NAME: "
    $0 stop
    sleep 1
    $0 start
    ;;
*)
    echo "Usage: $0 {start|stop|restart|reload}" >&2
    exit 1
    ;;
esac

exit 0

----->

Best regards.
