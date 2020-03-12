From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 12 Mar 2020 22:09:18 +0100
Subject: [Buildroot] [PATCH v4 1/2] package/linuxptp: make initscript
 options configurable
In-Reply-To: <CAJ4jsadW+nWLGJYdN7P6JbBR-ZuA0azHx6m=OLLWxyJ=3wSEwQ@mail.gmail.com>
References: <20200312190434.973-1-heiko.thiery@gmail.com>
 <20200312190434.973-2-heiko.thiery@gmail.com>
 <CAJ4jsadW+nWLGJYdN7P6JbBR-ZuA0azHx6m=OLLWxyJ=3wSEwQ@mail.gmail.com>
Message-ID: <CAEyMn7ZUjBn_3V2Lm917t1KvFqYCy_6b_4ou8gqEgpDq3XhWzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

Am Do., 12. M?rz 2020 um 21:40 Uhr schrieb Carlos Santos <unixmania@gmail.com>:
>
> On Thu, Mar 12, 2020 at 4:05 PM Heiko Thiery <heiko.thiery@gmail.com> wrote:
> >
> > The "package/busybox/S01sysklogd" is taken as template to change the
> > init script of the linuxptp daemon. The init script is split two parts
> > because there are 2 daemons (ptp4l and phc2sys).
> >
> > Let the user supply its own options in /etc/default/ptp4l and
> > /etc/default/phc2sys.
> >
> > This patch also fixes an issue with the creation of the pid file that is
> > needed to properly stop the daemon again.
> >
> > Signed-off-by: Michael Walle <michael@walle.cc>
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> > ---
> >  package/linuxptp/S65linuxptp | 46 ----------------------------
> >  package/linuxptp/S65ptp4l    | 59 ++++++++++++++++++++++++++++++++++++
> >  package/linuxptp/S66phc2sys  | 59 ++++++++++++++++++++++++++++++++++++
> >  package/linuxptp/linuxptp.mk |  6 ++--
> >  4 files changed, 122 insertions(+), 48 deletions(-)
> >  delete mode 100644 package/linuxptp/S65linuxptp
> >  create mode 100644 package/linuxptp/S65ptp4l
> >  create mode 100644 package/linuxptp/S66phc2sys
> >
> > diff --git a/package/linuxptp/S65linuxptp b/package/linuxptp/S65linuxptp
> > deleted file mode 100644
> > index 46b8921fdd..0000000000
> > --- a/package/linuxptp/S65linuxptp
> > +++ /dev/null
> > @@ -1,46 +0,0 @@
> > -#!/bin/sh
> > -#
> > -# Start linuxptp
> > -#
> > -
> > -start() {
> > -       printf "Starting linuxptp daemon: "
> > -       start-stop-daemon -S -b -q -p /var/run/linuxptp-ptp4l.pid \
> > -               -x /usr/sbin/ptp4l -- -f /etc/linuxptp.cfg
> > -       [ $? = 0 ] && echo "OK" || echo "FAIL"
> > -
> > -       printf "Starting linuxptp system clock synchronization: "
> > -       start-stop-daemon -S -b -q -p /var/run/linuxptp-phc2sys.pid \
> > -               -x /usr/sbin/phc2sys -- -s eth0 -c CLOCK_REALTIME -w -S 1.0
> > -       [ $? = 0 ] && echo "OK" || echo "FAIL"
> > -}
> > -
> > -stop() {
> > -       printf "Stopping linuxptp system clock synchronization: "
> > -       start-stop-daemon -K -q -p /var/run/linuxptp-phc2sys.pid \
> > -               -x /usr/sbin/phc2sys
> > -       echo "OK"
> > -
> > -       printf "Stopping linuxptp daemon: "
> > -       start-stop-daemon -K -q -p /var/run/linuxptp-ptp4l.pid \
> > -               -x /usr/sbin/ptp4l
> > -       echo "OK"
> > -}
> > -
> > -case "$1" in
> > -  start)
> > -       start
> > -       ;;
> > -  stop)
> > -       stop
> > -       ;;
> > -  restart|reload)
> > -       stop
> > -       start
> > -       ;;
> > -  *)
> > -       echo "Usage: $0 {start|stop|restart}"
> > -       exit 1
> > -esac
> > -
> > -exit $?
> > diff --git a/package/linuxptp/S65ptp4l b/package/linuxptp/S65ptp4l
> > new file mode 100644
> > index 0000000000..630c5e803b
> > --- /dev/null
> > +++ b/package/linuxptp/S65ptp4l
> > @@ -0,0 +1,59 @@
> > +#!/bin/sh
> > +#
> > +# Start linuxptp
> > +#
> > +
> > +DAEMON="ptp4l"
> > +
> > +PIDFILE="/var/run/$DAEMON.pid"
> > +
> > +PTP4L_ARGS="-f /etc/linuxptp.cfg"
> > +
> > +# shellcheck source=/dev/null
> > +[ -r "/etc/default/ptp4l" ] && . "/etc/default/ptp4l"
> > +
> > +# ptp4l does not create a pidfile, so pass "-n" in the command line
>
> There is no "-n" argument. Copy/past mistake. :-)

Damn .. you're right.  Copy/paste :-/

>
> But I'd not worry about those copy/paste errors. They can be fixed in
> a subsequent patch or by the submitter when committing this one.

Ok. will wait if the submitter will come with a feedback

>
> Tested-by: Carlos Santos <unixmania@gmail.com>
Thank you for testing

-- 
Heiko
