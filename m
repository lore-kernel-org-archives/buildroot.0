From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 11 Dec 2018 20:45:18 -0600
Subject: [Buildroot] [PATCH v4] package/ntp: sntp time sync script
In-Reply-To: <3db07157-a33c-876b-9518-b868b1e38f2e@mind.be>
References: <1541127154-45957-1-git-send-email-matthew.weber@rockwellcollins.com>
 <3db07157-a33c-876b-9518-b868b1e38f2e@mind.be>
Message-ID: <CANQCQpZ9EEmtpQXJDN1njz-5nEF_4zvKeoSA1ihj2C7ovDCKkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Tue, Dec 11, 2018 at 7:12 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Hi Matt,
>
>  Sorry to come with some big comments only in v4...
>
> On 02/11/2018 03:52, Matt Weber wrote:
> > This patch adds the installation of a startup script if the sntp
> > utility is selected as an option. The utility is design to do a
> > one time step/slew adjustment of the system time (similar to the
> > ntpdate tool http://support.ntp.org/bin/view/Dev/DeprecatingNtpdate).
> > One nice benefit over ntpdate is that sntp can run while ntpd is still
> > running. However, ntpd may still need to be restarted if the time
> > step was large enough.
> >
> > The script provides the ability to override the arguments as part of a
> > /etc/defaults/sntp file.
> >
> > On a local LAN, the initial large step adjustment took less then
> > one second to be retrieved and system time updated. If a user already
> > has a RTC maintaining the time and the system was powered off for
> > a long period of time, the script assumes a slew adjustment when
> > +/- 128ms, rather then a time step(jump). This could be further
> > tuned by a user with the /etc/defaults/sntp configuration file.
> >
> > One NTP pool server is being set as sntp uses all of the servers
> > provided when the DNS is resolved as servers to attempt to retrieve
> > time from before timing out. It looks like currently that is 4 servers
> > per *pool.ntp.org hostname.
> >
> > Cc: Oscar Gomez Fuente <oscargomezf@gmail.com>
> > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> > ---
> >
> > Major design/observations
> > (v2) Originally an attempt was made to use the ntpd in one shot mode
> > but it required more complex logic to handle the cases of a timeout
> > where the app had to be killed before the actual ntpd was started.
> > Similarly bad server addreses or network connection being down had
> > to be handled with the timeout case as the app in one shot mode
> > wouldn't exit.
> > http://lists.ntp.org/pipermail/questions/2011-July/030041.html
>
>  So how does sntp behave when there is no network or the servers can't be reached?
>

When testing sntp it seemed to time out after a couple secs, displays
a network unreachable warning and then a return code results in the
script noting FAIL.  Then startup continues on. The tool didn't have a
blocking behavior for no IP/Gateway set, server not found, and/or
server didn't have good time.

I'll cleanup these other notes in v5 as they are now confusing since
we went between ntpdate, ntpd and settled on sntp.....  Each had their
own issues with blocking, non-ideal delays in startup, etc...  I feel
google captured that info well on the ntpdate deprecation/transition
page that's out there.

> >
>
> [snip]
> > diff --git a/package/ntp/S48sntp b/package/ntp/S48sntp
> > new file mode 100755
> > index 0000000..cc0948e
> > --- /dev/null
> > +++ b/package/ntp/S48sntp
> > @@ -0,0 +1,42 @@
> > +#! /bin/sh
> > +
> > +NAME=sntp
>
>  Could you make this script follow the convention that was initiated by Carlos
> (and now finally committed)? So this should be DAEMON rather than NAME.

Sure

>
> > +# sntp uses all the IPs resolved for the hostname (i.e. pool.ntp.org has 4).
> > +# It will try each until they either all timeout or time has been set. Thus
> > +# default to only providing one NTP pool host.
> > +SNTP_SERVERS="pool.ntp.org"
>
>  It would have been nice if this could have instead used /etc/ntp.conf. But
> that's pretty hard I guess, so OK.

Yeah formats weren't great to use that.  Luckily the sntp client will
use all server addresses returned when DNS is queried.  So
realistically we only need to set one.

>
>  Unrelated to this patch: we actually shouldn't do this. Instead, we should ask
> for a buildroot.pool.ntp.org domain and use that. Cfr. [1], "Get your vendor zone".
>

Maybe I'll start a new clean email to the list with the questions and
then someone can be picked to create the account to set it up?

> > +# Step if time delta is greater then 128ms, otherwise slew
> > +SNTP_ARGS="-Ss -M 128"
> > +SNTP_KEY_CACHE="/tmp/kod"
> > +
> > +# Read config file if it is present.
> > +if [ -r /etc/default/$NAME ]
> > +then
> > +     . /etc/default/$NAME
> > +fi
>
>  ... and this should be
>
> # shellcheck source=/dev/null
> [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
>
> and so on.

Sure.

>
> > +
> > +# Create key cache file to prevents warning that file is missing
> > +touch $SNTP_KEY_CACHE
>
>  I don't see why you need to do this in the stop path... (in other words, should
> be in the start() function).

Oh ic, sure.

>
> > +
> > +case "$1" in
> > +     start)
>
>  This should call a start() function.

I'll refresh to follow Carlos's latest script cleanup.

>
> > +             echo "Starting $NAME: "
> > +             $NAME $SNTP_ARGS -K $SNTP_KEY_CACHE $SNTP_SERVERS
>
>  Use full path to sntp.

Sure

>
> > +             [ $? = 0 ] && echo "OK" || echo "FAIL"> +               ;;
> > +     stop)
> > +             echo "Stopping $NAME: OK"
>
>  Move to stop() function, and add a comment that there is nothing to do since no
> daemon is started.

Sure

>
> > +             ;;
> > +     restart|reload)
> > +             echo "Restarting $NAME: "
> > +             $0 stop
> > +             sleep 1
> > +             $0 start> +             ;;
> > +     *)
> > +             echo "Usage: $0 {start|stop|restart|reload}" >&2
> > +             exit 1
> > +             ;;
> > +esac
> > +
> > +exit 0
> > diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
> > index af3c1aa..aad1cdd 100644
> > --- a/package/ntp/ntp.mk
> > +++ b/package/ntp/ntp.mk
> > @@ -93,9 +93,18 @@ define NTP_INSTALL_TARGET_CMDS
> >       $(INSTALL) -m 644 package/ntp/ntpd.etc.conf $(TARGET_DIR)/etc/ntp.conf
> >  endef
> >
> > +# This script will step the time if there is a large difference
> > +# before ntpd takes over the necessary slew adjustments
>
>  I think this should be put in the help text of BR2_PACKAGE_NTP_SNTP.

Sure.

Thanks for the feedback!
Matt
