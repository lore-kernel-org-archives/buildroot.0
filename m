From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 22 Apr 2018 21:37:20 +0200
Subject: [Buildroot] [PATCH v2] modem-manager: support a defaults file
 in the init script
In-Reply-To: <752037619.956994.1524350939007.JavaMail.zimbra@datacom.ind.br>
References: <20180421130010.7702-1-casantos@datacom.ind.br>
 <20180421131939.GA13287@x230>
 <752037619.956994.1524350939007.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20180422193719.GB11030@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

> >> Sometimes it is useful to pass some parameters to ModemManager when it
> >> starts (e.g. --log-level). Allow the user add a file with such flags in
> >> a MODEMMANAGER_ARGS variable. This is simpler than overriding the whole
> >> startup script (e.g. by means of a rootfs overlay).

> >> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> >> ---
> >> Changes v1->v2
> >>   - Rebase after commit ef0b7e7521 (modem-manager: don't test if the
> >>     binary exists in the init script).
> >> ---
> >>  package/modem-manager/S44modem-manager | 5 ++++-
> >>  1 file changed, 4 insertions(+), 1 deletion(-)

> >> diff --git a/package/modem-manager/S44modem-manager
> >> b/package/modem-manager/S44modem-manager
> >> index a3f5003aa1..416c1e2ee6 100755
> >> --- a/package/modem-manager/S44modem-manager
> >> +++ b/package/modem-manager/S44modem-manager
> >> @@ -3,13 +3,16 @@
> >>  # Starts ModemManager


> >> +# Allow a few customizations from a config file
> >> +test -r /etc/default/ModemManager && . /etc/default/ModemManager
> >> +
> > Out of curiosity, what is supposed to be in /etc/default/ModemManager ?

> MODEMMANAGER_ARGS="--log-level=DEBUG" is a useful option, possibly
> along with --log-file.
Thanks for info, make sense.

Acked-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr

> >>  PIDFILE=/var/run/ModemManager.pid

> >>  start() {
> >>  	printf "Starting ModemManager: "
> >>  	umask 077
> >>  	start-stop-daemon -S -q -b -m -p $PIDFILE \
> >> -		--exec /usr/sbin/ModemManager
> >> +		--exec /usr/sbin/ModemManager -- $MODEMMANAGER_ARGS
> > LGTM.

> >>  	[ $? = 0 ] && echo "OK" || echo "FAIL"
> >>  }
> >>  stop() {
