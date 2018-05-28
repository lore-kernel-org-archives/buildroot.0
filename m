From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 28 May 2018 14:50:05 -0500
Subject: [Buildroot] [PATCH v2] toolchain: GCC bug 85180
In-Reply-To: <20180528212932.297eadf7@windsurf.home>
References: <1527521710-3889-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20180528212932.297eadf7@windsurf.home>
Message-ID: <CANQCQpZCxiHy34M-V3Suf+N+C=EgAYPTwSYd7RBRVCc11hZssg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, May 28, 2018 at 2:29 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Mon, 28 May 2018 10:35:10 -0500, Matt Weber wrote:
> > Works around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
> > which is an issue where the Microblaze archtecture had code that
> > caused a infinite recursion while optimizing in versions of GCC
> > less then 8.x.  More BR discussion can be found on this thread.
> > http://buildroot-busybox.2317881.n4.nabble.com/autobuild-buildroot-net-Build-results-for-2018-04-25-td192721.html
> >
> > Resolves:
> > http://autobuild.buildroot.net/results/b42d68c66d8ea035845a28c5530ef0682fd95713 (boost)
> > http://autobuild.buildroot.net/results/af976a4805fb8b3f0c17a8e3a1f901b2255caa0b (flare-engine)
> > http://autobuild.buildroot.net/results/d20/d20700bd538ba1e9d45ab8a61ecbbba1a320ef38 (gst-ffmpeg)
> >
> > CC: Romain Naour <romain.naour@gmail.com>
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>
> Thanks for your work on this!
>
> So, only boost-fiber is affected inside the boost package ?

Correct, I dissected it back to parts of boost would fail but when
built without fiber enabled they were fine.

>
> And passing -O0 or -O2 instead of -Os doesn't work around the problem ?
>

I tried O0/1/2 without luck.  I just checked though that they were
actually being used in the verbose boost output and turns out boost is
forcing a O3 as the last O value in the flags.  So there's a bug....
I'll see if I can reasonably fix that  and retest.

Matt
