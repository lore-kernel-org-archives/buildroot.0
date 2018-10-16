From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 16 Oct 2018 10:24:51 -0500
Subject: [Buildroot] Update the current date using ntp.
In-Reply-To: <CALtfCQYPhf4zuED_ukm5nA4E5+u28NmjV-bBKghgkp-3WLn4Kg@mail.gmail.com>
References: <CALtfCQaov7R68HfvZtNOse+SGu9Y8vihS=4xgixjtjE__VXkkQ@mail.gmail.com>
 <CANQCQpZA_Xgjx+pKvZXp97VYvwk4M0M=PhaEUQQqu40QjV4_iQ@mail.gmail.com>
 <4f85764f-4677-56bb-01f0-46def72c3d9b@mind.be>
 <871s8qo41u.fsf@dell.be.48ers.dk>
 <CALtfCQa-jdUYs+nN5weRwzLTe3-MX+U7ENDCPS0f4HkjJ38Dxw@mail.gmail.com>
 <87woqimcot.fsf@dell.be.48ers.dk>
 <CALtfCQYPhf4zuED_ukm5nA4E5+u28NmjV-bBKghgkp-3WLn4Kg@mail.gmail.com>
Message-ID: <CANQCQpad-ZQYV-oWL2pv6qAeh1NK9=jBsHxxq3aasP6n77Hwmw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oscar,

On Tue, Oct 16, 2018 at 5:28 AM Oscar Gomez Fuente
<oscargomezf@gmail.com> wrote:
>
> Hi Peter
>
> > Well, the question is what should the default configuration be exactly?
> > We have a lot of packages that do not provide any default configuration.
>
> I don't know, but I think it should have a default  /etc/chrony.conf
> because right now chrony is not working.
>
> Finally, I'm using ntpd and I made this change in the script S49ntp in
> order to execute ntpdate before running the ntpd demon:
>
> #! /bin/sh
>
> NAME=ntpd
>
> # Read config file if it is present.
> if [ -r /etc/default/$NAME ]; then
> . /etc/default/$NAME
> fi
>
> case $1 in
> start)
>         printf "Starting $NAME: "
>         NUM_SERVER=0
>         CURRENT_DATE=$(date | grep "1970")
>         while [ "$NUM_SERVER" != "3" -a "$CURRENT_DATE" = "1970" ];
>         do
>                 /usr/bin/ntpdate $NUM_SERVER.pool.ntp.org > /dev/null 2>&1
>                 CURRENT_DATE=$(date | grep "1970")
>                 NUM_SERVER=$(( $NUM_SERVER + 1 ))
>         done

Care to submit a patch with this?  If it was pulled as an example from
another distro, be sure to cite that in the description.

>         start-stop-daemon -S -q -x /usr/sbin/ntpd -- -g
>         [ $? = 0 ] && echo "OK" || echo "FAIL"
>         ;;
> stop)
>         printf "Stopping $NAME: "
>         start-stop-daemon -K -q -n $NAME
>         [ $? = 0 ] && echo "OK" || echo "FAIL"
>         ;;
> restart|reload)
>         echo "Restarting $NAME: "
>         $0 stop
>         sleep 1
>         $0 start
>         ;;
> *)
>         echo "Usage: $0 {start|stop|restart|reload}" >&2
>         exit 1
>         ;;
> esac
>
> exit 0
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
