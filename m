From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 23 Oct 2018 22:26:41 -0500
Subject: [Buildroot] [PATCH] package/ntp: use ntpd to set initial time
In-Reply-To: <3c82f1ee-58b9-ef25-35d5-bd8fd25d4d48@mind.be>
References: <1540300218-59209-1-git-send-email-matthew.weber@rockwellcollins.com>
 <3c82f1ee-58b9-ef25-35d5-bd8fd25d4d48@mind.be>
Message-ID: <CANQCQpYkLV-XJBVqRsQLdrxthZzkqctsBcxfX4mJQqFY16jk5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Tue, Oct 23, 2018 at 3:31 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 10/23/18 2:10 PM, Matt Weber wrote:
> > The ntpdate program has been in the process of being deprecated for
> > some time. (http://support.ntp.org/bin/view/Dev/DeprecatingNtpdate)
> >
> > This patch updates the existing ntpd script to handle setting initial
> > time using the new ntpd "one time set and exit" approach.
>
>  I still think this should be a separate script, e.g. S48ntpdate. But OK, I'm
> not going to block the patch for that.
>
> >
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > Signed-off-by: Oscar Gomez Fuente <oscargomezf@gmail.com>
> > ---
> > Based on Oscar's v1 patch to add a ntpdate startup script.
> > http://patchwork.ozlabs.org/patch/986852/
> > ---
> >  package/ntp/Config.in |  5 +++++
> >  package/ntp/S49ntp    | 17 +++++++++++++++++
> >  2 files changed, 22 insertions(+)
> >
> > diff --git a/package/ntp/Config.in b/package/ntp/Config.in
> > index efd47e1..5cc78ce 100644
> > --- a/package/ntp/Config.in
> > +++ b/package/ntp/Config.in
> > @@ -54,6 +54,11 @@ config BR2_PACKAGE_NTP_NTPDATE
> >         The ntpdate utility program is used to set the local date
> >         and time from an NTP server given as an argument.
> >
> > +       This option is deprecated by upstream and replaced with the
> > +       -gq options of ntpd. The package/ntp/S49ntp script has an
> > +       example implementation.
> > +       (http://support.ntp.org/bin/view/Dev/DeprecatingNtpdate)
> > +
> >  config BR2_PACKAGE_NTP_NTPDC
> >       bool "ntpdc"
> >       help
> > diff --git a/package/ntp/S49ntp b/package/ntp/S49ntp
> > index 35e5874..9851747 100755
> > --- a/package/ntp/S49ntp
> > +++ b/package/ntp/S49ntp
> > @@ -11,6 +11,23 @@ fi
> >  case "$1" in
> >    start)
> >      printf "Starting $NAME: "
>
>  This should be done after the ntpdate run.

Sure, do you think it is still good to have the information prints
about checking and if set or not?

>
> > +    NTP_WAIT_DELAY=15 #sec
>
>  This should be done before sourcing the defaults file, so it can be overridden.

Sure.

>
> > +    CURRENT_DATE=$(date | grep "1970")
>
>  So, you didn't like my proposal to use the Unix timestamp (to avoid any
> possible issue with localtime):

I'll switch to unix.

>
> CURRENT_UNIX_TIME="$(date +%s)"
> if [ $CURRENT_UNIX_TIME -lt 1000000000 ]; then
>
> > +    if [ "$CURRENT_DATE" != "" ]; then
> > +        printf "checking for time"
> > +        /usr/sbin/ntpd -g -q > /dev/null 2>&1 &
>
>  Why redirect stderr and stdout?

Habit, I'll see if just stdout keeps it clean for the basic output.
Err I guess would be good to see.

>
> > +        NTP_PID=$!
> > +        while [ ${NTP_WAIT_DELAY} -gt 0 ]; do
> > +            [ ! -e /proc/$NTP_PID ] && break
> > +            sleep 1
> > +            printf "."
> > +            : $((NTP_WAIT_DELAY -= 1))
> > +        done
>
>  This is horribly ugly, but there is no better way because the timeout applet is
> not enabled in our busybox config. One small improvement could be to use the -p
> option to save it in a PID file.
>

True.

>  However, is there any reason to not just add the "-w $NTP_WAIT_DELAY" option to
> the normal invocation of ntpd, below? I haven't tried it, I just thought that
> that is what is supposed to be the replacement of the initial ntpdate command.
>

From what I can tell and tested, it just waits until the first time is
sync'd correctly.  It doesn't do the one shot setting of the initial
time (must -g and should do -q so it exits).  So since we have the
case of the time possibly not being valid, I'm not sure we'd want to
add the -w to our actual ntpd service start so that it would wait for
the other ntpd -g to get time.  We already handle this with the
NTP_WAIT_DELAY that manages the ntpd -gq process state.
http://lists.ntp.org/pipermail/questions/2011-July/030041.html

>  So my proposal would be:
>
>         NTPD_WAIT_ARG=""
>         CURRENT_UNIX_TIME="$(date +%s)"
>         if [ $CURRENT_UNIX_TIME -lt 1000000000 ]; then
>                 NTPD_WAIT_ARG="-w ${NTP_WAIT_DELAY}"
>         fi
>         start-stop-daemon -S -q -x /usr/sbin/ntpd -- -g $NTPD_WAIT_ARG
>
>  It would actually even make sense to set the wait delay to a low value (say,
> 1). I've had quite a few boards where the RTC is wildly inaccurate, off by a few
> seconds after a day or so. But maybe that is a bit too board-specific. And would
> anyway be a separate patch.
>
>  Note that with -w, ntpd returns ETIMEDOUT if it times out, and unfortunately
> that value is platform-dependent (145 on mips, 60 on sparc, 110 on others). So
> it's a bit tricky to handle that properly. Without handling, the init script
> will return FAIL while the daemon is actually running.

Yeah, I was sort of thinking of keeping it simple by not changing the
existing ntpd behavior at all and just adding the one shot support in
a reliable manner above it.   -w feels like something that would need
to be tuned and we'd still need the code to kill the -gq process.

Matt
