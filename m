From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Tue, 16 Oct 2018 17:54:48 +0200
Subject: [Buildroot] Update the current date using ntp.
In-Reply-To: <CANQCQpad-ZQYV-oWL2pv6qAeh1NK9=jBsHxxq3aasP6n77Hwmw@mail.gmail.com>
References: <CALtfCQaov7R68HfvZtNOse+SGu9Y8vihS=4xgixjtjE__VXkkQ@mail.gmail.com>
 <CANQCQpZA_Xgjx+pKvZXp97VYvwk4M0M=PhaEUQQqu40QjV4_iQ@mail.gmail.com>
 <4f85764f-4677-56bb-01f0-46def72c3d9b@mind.be>
 <871s8qo41u.fsf@dell.be.48ers.dk>
 <CALtfCQa-jdUYs+nN5weRwzLTe3-MX+U7ENDCPS0f4HkjJ38Dxw@mail.gmail.com>
 <87woqimcot.fsf@dell.be.48ers.dk>
 <CALtfCQYPhf4zuED_ukm5nA4E5+u28NmjV-bBKghgkp-3WLn4Kg@mail.gmail.com>
 <CANQCQpad-ZQYV-oWL2pv6qAeh1NK9=jBsHxxq3aasP6n77Hwmw@mail.gmail.com>
Message-ID: <CALtfCQYRPzjZqnwVeTA3nojAmP06Q3Hb0=03NNm-v==hm_xtag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

> > I don't know, but I think it should have a default  /etc/chrony.conf
> > because right now chrony is not working.

The script was made on my own and ff course, I don't care to
send a patch with this changes. I fixed some mistakes and
I added an option in case you don't have the package ntpdate
selected. The final S49ntp script is:

-------
#! /bin/sh

NAME=ntpd
NTPDATE=/usr/bin/ntpdate

# Read config file if it is present.
if [ -r /etc/default/$NAME ]; then
. /etc/default/$NAME
fi

case $1 in
start)
        printf "Starting $NAME: "
        if [ -f $NTPDATE ]
        then
                NUM_SERVER=0
                CURRENT_DATE=$(date | grep "1970")
                while [ "$NUM_SERVER" != "4" -a "$CURRENT_DATE" != "" ]
                do
                        $NTPDATE $NUM_SERVER.pool.ntp.org > /dev/null 2>&1
                        CURRENT_DATE=$(date | grep "1970")
                        NUM_SERVER=$(( $NUM_SERVER + 1 ))
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
-------

I've never sent a patch to buildroot, I expect to do it well.


Best regards.
