From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 24 Oct 2018 08:14:47 -0500
Subject: [Buildroot] [PATCH] package/ntp: use ntpd to set initial time
In-Reply-To: <f544829d-68ed-abfc-306c-ce3cebb1de3b@mind.be>
References: <1540300218-59209-1-git-send-email-matthew.weber@rockwellcollins.com>
 <3c82f1ee-58b9-ef25-35d5-bd8fd25d4d48@mind.be>
 <CANQCQpYkLV-XJBVqRsQLdrxthZzkqctsBcxfX4mJQqFY16jk5Q@mail.gmail.com>
 <f544829d-68ed-abfc-306c-ce3cebb1de3b@mind.be>
Message-ID: <CANQCQpYAjzXTQBDjKwbMPnQViP0=Qfpr6+pgs_3e7iGOYfo50g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Wed, Oct 24, 2018 at 8:10 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 10/24/18 4:26 AM, Matthew Weber wrote:
> > Arnout,
> >
> > On Tue, Oct 23, 2018 at 3:31 PM Arnout Vandecappelle <arnout@mind.be> wrote:
> [snip]
> >>  However, is there any reason to not just add the "-w $NTP_WAIT_DELAY" option to
> >> the normal invocation of ntpd, below? I haven't tried it, I just thought that
> >> that is what is supposed to be the replacement of the initial ntpdate command.
> >>
> >
> > From what I can tell and tested, it just waits until the first time is
> > sync'd correctly.  It doesn't do the one shot setting of the initial
> > time (must -g and should do -q so it exits).  So since we have the
> > case of the time possibly not being valid, I'm not sure we'd want to
> > add the -w to our actual ntpd service start so that it would wait for
> > the other ntpd -g to get time.  We already handle this with the
> > NTP_WAIT_DELAY that manages the ntpd -gq process state.
> > http://lists.ntp.org/pipermail/questions/2011-July/030041.html
> >
> >>  So my proposal would be:
> >>
> >>         NTPD_WAIT_ARG=""
> >>         CURRENT_UNIX_TIME="$(date +%s)"
> >>         if [ $CURRENT_UNIX_TIME -lt 1000000000 ]; then
> >>                 NTPD_WAIT_ARG="-w ${NTP_WAIT_DELAY}"
> >>         fi
> >>         start-stop-daemon -S -q -x /usr/sbin/ntpd -- -g $NTPD_WAIT_ARG
> >>
> >>  It would actually even make sense to set the wait delay to a low value (say,
> >> 1). I've had quite a few boards where the RTC is wildly inaccurate, off by a few
> >> seconds after a day or so. But maybe that is a bit too board-specific. And would
> >> anyway be a separate patch.
> >>
> >>  Note that with -w, ntpd returns ETIMEDOUT if it times out, and unfortunately
> >> that value is platform-dependent (145 on mips, 60 on sparc, 110 on others). So
> >> it's a bit tricky to handle that properly. Without handling, the init script
> >> will return FAIL while the daemon is actually running.
> >
> > Yeah, I was sort of thinking of keeping it simple by not changing the
> > existing ntpd behavior at all and just adding the one shot support in
> > a reliable manner above it.   -w feels like something that would need
> > to be tuned and we'd still need the code to kill the -gq process.
>
>  Just to be clear: the idea is to NOT do the -gq process, so it doesn't need to
> be killed. Instead, you do just ONE invocation of ntpd with the -g option (so
> the first time it gets a time, it does a big jump; we may want to add -G as well
> for smaller jumps in case of an inaccurate RTC). As far as I understand, this
> should do the same as what we attempt to do here: wait for one clock adjustment
> to finish before continuing, but time out and continue with the wrong time if
> that clock adjustment doesn't happen within 15 seconds.
>

Agree.  So if we do the one invocation we'll have to figure out how to
deal with the return value.  Sounds like that is desired, so I'll put
together a test and see.  For the -w value, from testing it looks like
the -w should probably be ~10-15sec as a sync on average was ~8-9sec.

Matt
