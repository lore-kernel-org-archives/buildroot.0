From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Nov 2013 23:20:24 +0100
Subject: [Buildroot] [PATCH 2/5] package/ser2net: add startup script and
	template config file
In-Reply-To: <c6a85755fde5fe01c692d627c05eaa83544dbccf.1383693880.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 6 Nov 2013 00:28:17 +0100")
References: <cover.1383693880.git.yann.morin.1998@free.fr>
 <c6a85755fde5fe01c692d627c05eaa83544dbccf.1383693880.git.yann.morin.1998@free.fr>
Message-ID: <87wqkljhp3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > The default config file we install is intentionally limited, but given
 > the number of possible configurations (port number, method, serial
 > port...) it is not posible to provide a simple one-fits-all config file.

 > Instead, just provide a minimalistic one, that the user may customise
 > with a post-build script, or a rootfs overlay.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  package/ser2net/S50ser2net   | 48 ++++++++++++++++++++++++++++++++++++++++++++
 >  package/ser2net/ser2net.conf |  3 +++
 >  package/ser2net/ser2net.mk   |  9 +++++++++
 >  3 files changed, 60 insertions(+)
 >  create mode 100644 package/ser2net/S50ser2net
 >  create mode 100644 package/ser2net/ser2net.conf

 > diff --git a/package/ser2net/S50ser2net b/package/ser2net/S50ser2net
 > new file mode 100644
 > index 0000000..58a98fc
 > --- /dev/null
 > +++ b/package/ser2net/S50ser2net
 > @@ -0,0 +1,48 @@
 > +#! /bin/sh
 > +# ser2net startup script
 > +
 > +# Author: Yann E. MORIN <yann.morin.1998@free.fr>
 > +
 > +PATH=/usr/sbin:/usr/bin:/sbin:/bin
 > +NAME=ser2net
 > +DAEMON=/usr/bin/$NAME
 > +PIDFILE=/var/run/$NAME.pid
 > +
 > +[ -f "${DAEMON}" -a -x "${DAEMON}" ] || exit 0
 > +
 > +# Read configuration variable file if it is present
 > +[ -r "/etc/default/${NAME}" ] && . "/etc/default/${NAME}"
 > +
 > +ARGS="-c /etc/ser2net.conf -P ${PIDFILE}"

What are people supposed to put in /etc/default/ser2net? CONTROLPORT=..?
How about just letting people specify ARGS=..?

Looking at the man page, /etc/ser2net.conf seems to be default, so that
can be dropped. You're using start-stop-daemon below, so I'm not quite
sure what you are doing here with PIDFILE?

 > +[ -z "${CONTROLPORT}" ] || ARGS="${ARGS} -p ${CONTROLPORT}"
 > +
 > +case "$1" in
 > +    start)
 > +        printf "Starting ser2net daemon: "
 > +        if start-stop-daemon -S -q -p ${PIDFILE} -m --exec "${DAEMON}" -- ${ARGS}; then

I believe you need to pass '-n' to ser2net to not get it to background
itself (and get the correct pid in PIDFILE).

 > +            printf "OK\n"
 > +        else
 > +            printf "failed\n"
 > +        fi
 > +        ;;
 > +    stop)
 > +        printf "Stoping ser2net daemon: "
 > +        start-stop-daemon -K -q -p ${PIDFILE} -s TERM
 > +        sleep 2
 > +        if start-stop-daemon -K -q -p ${PIDFILE} -t; then
 > +            printf "failed, killing: "
 > +            start-stop-daemon -K -q -p ${PIDFILE} -s KILL -o
 > +        fi

Any particular reason why this is needed? A quick
git grep 'start-stop-daemon.*-K' shows that we're not doing anything
like this anywhere else.


 > +        rm -f "${PIDFILE}"
 > +        printf "OK\n"
 > +        ;;
 > +    restart|force-reload)
 > +        "${0}" stop
 > +        sleep 2
 > +        "${0}" start

Why the sleep?
 > +        ;;
 > +    *)
 > +        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2

Where does $SCRIPTNAME come from? Why not just $0?
 > +        exit 1
 > +        ;;
 > +esac
 > diff --git a/package/ser2net/ser2net.conf b/package/ser2net/ser2net.conf
 > new file mode 100644
 > index 0000000..ba6fd43
 > --- /dev/null
 > +++ b/package/ser2net/ser2net.conf
 > @@ -0,0 +1,3 @@
 > +#CONTROLPORT:1000
 > +BANNER:buildroot:Welcome to ser2net, running on Buildroot\r\n
 > +2000:raw:600:/dev/ttyS1:9600 8DATABITS NONE 1STOPBIT buildroot

CONTROLPORT doesn't seem to be valid in the configuration file according
to the man page.

-- 
Bye, Peter Korsgaard
