From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 30 Oct 2018 22:34:03 -0500
Subject: [Buildroot] [PATCH] package/ntp: use ntpd to set initial time
In-Reply-To: <3232b003-ae5e-43d1-b795-f73a0ed71624@mind.be>
References: <1540300218-59209-1-git-send-email-matthew.weber@rockwellcollins.com>
 <3c82f1ee-58b9-ef25-35d5-bd8fd25d4d48@mind.be>
 <CANQCQpYkLV-XJBVqRsQLdrxthZzkqctsBcxfX4mJQqFY16jk5Q@mail.gmail.com>
 <f544829d-68ed-abfc-306c-ce3cebb1de3b@mind.be>
 <CANQCQpYAjzXTQBDjKwbMPnQViP0=Qfpr6+pgs_3e7iGOYfo50g@mail.gmail.com>
 <3232b003-ae5e-43d1-b795-f73a0ed71624@mind.be>
Message-ID: <CANQCQpa-kkDU56c7vjVnw=EDFxVxda2PPNPWMPazzkdhJt1jCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Oscar,

On Wed, Oct 24, 2018 at 10:02 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 10/24/18 2:14 PM, Matthew Weber wrote:
>
> > Agree.  So if we do the one invocation we'll have to figure out how to
> > deal with the return value.  Sounds like that is desired, so I'll put
> > together a test and see.  For the -w value, from testing it looks like
> > the -w should probably be ~10-15sec as a sync on average was ~8-9sec.
>
>  8 seconds is not good. We want to get the same sync time as with ntpdate,
> otherwise we're doing something wrong. And I guess ntpdate does it in a second,
> right?
>
>  If I remember correctly (but it has been *years* since I used ntpd rather than
> chrony or systemd-timesyncd) ntpd had options for how fast it would converge on
> the first sync. Normally when a new peer is added, it waits for a couple of
> round trips before that peer is accepted as a healthy source. But I thought it
> was possible (and hopefully default) to just believe the first packet you
> receive during startup and sync on that.

All the research I've found and also inspection of the code leads me
to believe that the -w option can be used to wait for an initial sync
of "good time".  Not an initial step which is large and set to system
time right away.  I've submitted a v3 using the new sntp tool which I
believe has got some traction as the replacement for ntpdate.
https://patchwork.ozlabs.org/patch/991267/

Oscar, this new script should sync time quite fast ~1sec in my QEMU.

Matt
