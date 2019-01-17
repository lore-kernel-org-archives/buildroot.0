From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Thu, 17 Jan 2019 18:43:55 +0100
Subject: [Buildroot] [PATCH v5] package/ntp: sntp time sync script
In-Reply-To: <CALtfCQa8MBxbXtp21cqjA7PDCbuRg+yp4dB2o6f44iaSrpA7yg@mail.gmail.com>
References: <1544586337-7888-1-git-send-email-matthew.weber@rockwellcollins.com>
 <CANQCQpbaxHc6+T7sA-mZs_zobb_ALcgyPafuYq0MexQDFmmbAA@mail.gmail.com>
 <CALtfCQa8MBxbXtp21cqjA7PDCbuRg+yp4dB2o6f44iaSrpA7yg@mail.gmail.com>
Message-ID: <CALtfCQbJsMuPEd0DCew4ov8M=bi5FbyzzFbTH+vXA8=Xwt7vWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested-by: Oscar Gomez Fuente <oscargomezf@gmail.com>

?scar G?mez Fuente
Electronic Engineer & Degree in Physical Sciences
Mobile: 659.28.97.90
Email: oscargomezf at gmail.com
Website: www.oscargomezf.com



On Wed, 16 Jan 2019 at 13:23, Oscar Gomez Fuente <oscargomezf@gmail.com> wrote:
>
> Hi everyone,
>
> Do you want me to check again on my raspberry pi 3B+?
>
> Best regards.
>
> Oscar Gomez Fuente
> TST Sistemas
> www.tst-sistemas.es
>
> ?scar G?mez Fuente
> Electronic Engineer & Degree in Physical Sciences
> Mobile: 659.28.97.90
> Email: oscargomezf at gmail.com
> Website: www.oscargomezf.com
>
>
>
> On Wed, 16 Jan 2019 at 13:43, Matthew Weber <matthew.weber@collins.com> wrote:
> >
> > Arnout / Oscar,
> >
> >
> > On Tue, Dec 11, 2018 at 9:45 PM Matt Weber
> > <matthew.weber@rockwellcollins.com> wrote:
> > >
> > > This patch adds the installation of a startup script if the sntp
> > > utility is selected as an option. The utility is design to do a
> > > one time step/slew adjustment of the system time (similar to the
> > > ntpdate tool http://support.ntp.org/bin/view/Dev/DeprecatingNtpdate).
> > > One nice benefit over ntpdate is that sntp can run while ntpd is still
> > > running. However, ntpd may still need to be restarted if the time
> > > step was large enough.
> > >
> > > The script provides the ability to override the arguments as part of a
> > > /etc/defaults/sntp file.
> > >
> > > On a local LAN, the initial large step adjustment took less then
> > > one second to be retrieved and system time updated. If a user already
> > > has a RTC maintaining the time and the system was powered off for
> > > a long period of time, the script assumes a slew adjustment when
> > > +/- 128ms, rather then a time step(jump). This could be further
> > > tuned by a user with the /etc/defaults/sntp configuration file.
> > >
> > > One NTP pool server is being set as sntp uses all of the servers
> > > provided when the DNS is resolved as servers to attempt to retrieve
> > > time from before timing out. It looks like currently that is 4 servers
> > > per *pool.ntp.org hostname.
> > >
> > > Cc: Oscar Gomez Fuente <oscargomezf@gmail.com>
> > > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> >
> > Arnout, merge?  Oscar tested the v4 before I did the changes for
> > Carlos's style of script so I didn't carry over his reviewed-by as
> > enough was touched....
> >
> > > ---
> > > Changes
> > > v4 -> v5
> > >  - Fixed permissions on S48sntp and S49ntp scripts
> > >
> > > [Arnout
> > >  - Updated script to follow Carlos's recently merged syslog script
> > >    refresh
> > >  - Added kconfig help comment about the script
> > >  - Added notes in S49sntp about behavior of the tool
> > >  - shellcheck fixes
> > >  - Moved touch of key database file into start function
> > >
> > > v3 -> v4
> > >  - Updated S48sntp script to just use a single pool host which provides
> > >    4 NTP servers sntp will query before timing out
> > >
> > > v2 -> v3
> > >  - Moved initial time set to a S48sntp script as originally suggested
> > >    by Oscar and preferred by Arnout
> > >  - Switched to sntp tool as it simplified the logic around when and
> > >    how do we call the tool to perform this time sync (it handles
> > >    when to slew/step and multiple servers at once)
> > >
> > > v1 -> v2
> > > [Arnout
> > >  - Moved NTP_WAIT_DELAY above sourcing of configuration file
> > >  - Switched to using unix time for current time check
> > >  - Added comment on why redirection of stdout and stderr
> > >  - Attempted to use the pid file but found it added more calls
> > >    to the shell then using a variable, so switched back
> > >  - Adjusted printout so the actual ntpd service start was aligned
> > >    with the respecting Ok/Fail.
> > >  - Dropped -g from the main service call as the "big" time jump
> > >    should have already occurred with the one-shot ntpd -gq.
> > >
> > > v1
> > > Based on Oscar's v1 patch to add a ntpdate startup script.
> > > http://patchwork.ozlabs.org/patch/986852/
> > > ---
> > >  package/ntp/Config.in |  7 ++++++-
> > >  package/ntp/S48sntp   | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++
> > >  package/ntp/S49ntp    |  0
> > >  package/ntp/ntp.mk    |  9 +++++++++
> > >  4 files changed, 70 insertions(+), 1 deletion(-)
> > >  create mode 100644 package/ntp/S48sntp
> > >  mode change 100755 => 100644 package/ntp/S49ntp
> > >
> > > diff --git a/package/ntp/Config.in b/package/ntp/Config.in
> > > index efd47e1..97d933b 100644
> > > --- a/package/ntp/Config.in
> > > +++ b/package/ntp/Config.in
> > > @@ -12,7 +12,12 @@ if BR2_PACKAGE_NTP
> > >  config BR2_PACKAGE_NTP_SNTP
> > >         bool "sntp"
> > >         help
> > > -         Simple network time protocol program
> > > +         Simple network time protocol program (a replacement
> > > +         for the ntpdate tool)
> > > +
> > > +         A script is installed as S48sntp which will retrieve and
> > > +         step the time if there is a large difference before ntpd
> > > +         takes over the necessary slew adjustments in S49ntp.
> > >
> > >  config BR2_PACKAGE_NTP_NTP_KEYGEN
> > >         bool "ntp-keygen"
> > > diff --git a/package/ntp/S48sntp b/package/ntp/S48sntp
> > > new file mode 100644
> > > index 0000000..96d8d50
> > > --- /dev/null
> > > +++ b/package/ntp/S48sntp
> > > @@ -0,0 +1,55 @@
> > > +#!/bin/sh
> > > +
> > > +DAEMON="sntp"
> > > +# sntp uses all the IPs resolved for the hostname (i.e. pool.ntp.org has 4).
> > > +# It will try each until they either all timeout or time has been set. Thus
> > > +# default to only providing one NTP pool host.
> > > +SNTP_SERVERS="pool.ntp.org"
> > > +# Step if time delta is greater then 128ms, otherwise slew
> > > +SNTP_ARGS="-Ss -M 128"
> > > +SNTP_KEY_CACHE="/tmp/kod"
> > > +
> > > +# shellcheck source=/dev/null
> > > +[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
> > > +
> > > +start() {
> > > +       printf 'Starting %s: ' "$DAEMON"
> > > +       # Create key cache file to prevents warning that file is missing
> > > +       touch $SNTP_KEY_CACHE
> > > +       # shellcheck disable=SC2086 # we need the word splitting
> > > +       /usr/bin/$DAEMON $SNTP_ARGS -K $SNTP_KEY_CACHE $SNTP_SERVERS
> > > +       # sntp behavior
> > > +       # - Does not background
> > > +       # - Does not infinitely block
> > > +       # - Time-out w/o network = ~2 sec
> > > +       # - Time-out w/ network = ~5sec * # of servers
> > > +       status=$?
> > > +       if [ "$status" -eq 0 ]; then
> > > +               echo "OK"
> > > +       else
> > > +               echo "FAIL"
> > > +       fi
> > > +       return "$status"
> > > +}
> > > +
> > > +stop() {
> > > +       echo "Nothing to do, $DAEMON is not a daemon."
> > > +}
> > > +
> > > +restart() {
> > > +       stop
> > > +       sleep 1
> > > +       start
> > > +}
> > > +
> > > +reload() {
> > > +       echo "Nothing to do, $DAEMON does not support reload."
> > > +}
> > > +
> > > +case "$1" in
> > > +       start|stop|restart|reload)
> > > +               "$1";;
> > > +       *)
> > > +               echo "Usage: $0 {start|stop|restart|reload}"
> > > +               exit 1
> > > +esac
> > > diff --git a/package/ntp/S49ntp b/package/ntp/S49ntp
> > > old mode 100755
> > > new mode 100644
> > > diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
> > > index af3c1aa..aad1cdd 100644
> > > --- a/package/ntp/ntp.mk
> > > +++ b/package/ntp/ntp.mk
> > > @@ -93,9 +93,18 @@ define NTP_INSTALL_TARGET_CMDS
> > >         $(INSTALL) -m 644 package/ntp/ntpd.etc.conf $(TARGET_DIR)/etc/ntp.conf
> > >  endef
> > >
> > > +# This script will step the time if there is a large difference
> > > +# before ntpd takes over the necessary slew adjustments
> > > +ifeq ($(BR2_PACKAGE_NTP_SNTP),y)
> > > +define NTP_INSTALL_INIT_SYSV_SNTP
> > > +       $(INSTALL) -D -m 755 package/ntp/S48sntp $(TARGET_DIR)/etc/init.d/S48sntp
> > > +endef
> > > +endif
> > > +
> > >  ifeq ($(BR2_PACKAGE_NTP_NTPD),y)
> > >  define NTP_INSTALL_INIT_SYSV
> > >         $(INSTALL) -D -m 755 package/ntp/S49ntp $(TARGET_DIR)/etc/init.d/S49ntp
> > > +       $(NTP_INSTALL_INIT_SYSV_SNTP)
> > >  endef
> > >
> > >  define NTP_INSTALL_INIT_SYSTEMD
> > > --
> > > 1.9.1
> > >
