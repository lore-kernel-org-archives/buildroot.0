From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Oct 2015 09:56:26 +0200
Subject: [Buildroot] [PATCHv2] inadyn: fix init script and default
	config file
In-Reply-To: <1445090722-4297-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 17 Oct 2015 16:05:22 +0200")
References: <1445090722-4297-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k2qj8f6d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > Changes since v1:

 >  * Store PID file in /var/run/inadyn.pid instead of
 >    /var/run/inadyn/inadyn.pid.

 >  * Use the background functionality of start-stop-daemon instead of
 >    the one of inadyn itself (suggested by Gustavo)

Didn't Gustavoz suggest the opposite? E.G. to use the inadyn option to
force the background mode on, independently of what the config file
states?

I also see that you are not passing the --syslog option to inadyn, so
log messages go to stdout (which start-stop-daemon redirects to
/dev/null) :/

> +++ b/package/inadyn/inadyn.conf
 > @@ -1,11 +1,11 @@
 >  # Basic configuration file for inadyn
 >  #
 >  # /etc/inadyn.conf
 > -background
 > +pidfile /var/run/inadyn.pid

We should instead use the --pidfile inadyn command line option to
force this as we _REQUIRE_ this for start-stop-daemon.

-- 
Bye, Peter Korsgaard
