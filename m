From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 13:46:33 +0100
Subject: [Buildroot] [PATCH v3 2/5] package/mender: adding systemv init
 file
In-Reply-To: <1549363799-30840-3-git-send-email-angelo@amarulasolutions.com>
 (Angelo Compagnucci's message of "Tue, 5 Feb 2019 11:49:56 +0100")
References: <1549363799-30840-1-git-send-email-angelo@amarulasolutions.com>
 <1549363799-30840-3-git-send-email-angelo@amarulasolutions.com>
Message-ID: <871s4mpfme.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > This patch adds a service file for the init system v.
 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 > Acked-by: <aduskett@gmail.com>
 > ---
 > [v2 -> v3]:
 > * Moved the service to s42 to have the network ready before running
 >   Mender as pointed out by Titouan

 >  package/mender/S42mender | 56 ++++++++++++++++++++++++++++++++++++++++++++++++
 >  package/mender/mender.mk |  5 +++++
 >  2 files changed, 61 insertions(+)
 >  create mode 100644 package/mender/S42mender

 > diff --git a/package/mender/S42mender b/package/mender/S42mender
 > new file mode 100644
 > index 0000000..d5266aa
 > --- /dev/null
 > +++ b/package/mender/S42mender
 > @@ -0,0 +1,56 @@
 > +#!/bin/sh
 > +#
 > +# Starts mender service.
 > +#
 > +
 > +start() {
 > +	# If /var/lib/mender is a symlink to /var/run/mender, and
 > +	#   - the filesystem is RO (i.e. we can not rm the symlink),
 > +	#     create the directory pointed to by the symlink.
 > +	#   - the filesystem is RW (i.e. we can rm the symlink),
 > +	#     replace the symlink with an actual directory
 > +	if [ -L /var/lib/mender \
 > +	     -a "$(readlink /var/lib/mender)" = "/var/run/mender" ]
 > +	then
 > +		if rm -f /var/lib/mender >/dev/null 2>&1; then
 > +			mkdir -p /var/lib/mender
 > +		else
 > +			echo "No persistent location to store mender data. Data will be lost"
 > +			echo "at reboot. Are you sure this is what you want to do?"
 > +			mkdir -p "$(readlink /var/lib/mender)"
 > +		fi
 > +	fi
 > +
 > +	printf "Starting mender service: "
 > +	umask 077
 > +
 > +	start-stop-daemon -S -q -p /var/run/mender.pid \
 > +		--exec /usr/bin/mender -- -daemon
 > +	[ $? = 0 ] && echo "OK" || echo "FAIL"
 > +}
 > +stop() {
 > +	printf "Stopping mender mender: "

Typo, s/mender mender/mender service/

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
