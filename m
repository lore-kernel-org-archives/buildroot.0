From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Sep 2014 19:17:21 +0200
Subject: [Buildroot] [PATCH v2 2/2] pkg-infra: make timing of steps
 optional
In-Reply-To: <CANxTyt5cSA56xLZLAwyg9kP3SZ0a+5Uyg2OaMgY_HVp3Nu5LrA@mail.gmail.com>
References: <1410744672-32698-1-git-send-email-danomimanchego123@gmail.com>
 <1410744672-32698-2-git-send-email-danomimanchego123@gmail.com>
 <20140921221358.GC28325@free.fr>
 <CANxTyt5cSA56xLZLAwyg9kP3SZ0a+5Uyg2OaMgY_HVp3Nu5LrA@mail.gmail.com>
Message-ID: <20140922171721.GB4358@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, All,

On 2014-09-21 22:18 -0400, Danomi Manchego spake thusly:
> On Sun, Sep 21, 2014 at 6:13 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Danomi, All,
> >
> > On 2014-09-14 21:31 -0400, Danomi Manchego spake thusly:
> >> Commit 17d4eb1e0261793a9f89e4a2253602c7ab926d2e added a hook to log timing
> >> of steps to a build-time.log file, which provides data for the "graph-build"
> >> target for examining build time stats.  If one uses buildroot on a daily
> >> basis as part of a build system, then its conceivable that there might be
> >> long periods of time between "make clean" ops.  So the log file continues
> >> to grow.  This patch makes the accumulation of the timing data optional, to
> >> avoid having a silent endlessly growing log in the build directory.
> >>
> >> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> >>
> >> ---
> >>
> >> Changes v1 -> v2:
> >> - Switch test to positive logic, per feedback from Yann Morin.
> >
> > Thanks.
> >
> > However, I'm still not convinced.
> >
> >   - if the problem is the size of that file: each step adds around 120
> >     bytes (~60 for start, same for end); so a 1MiB would hold around
> >     8000 steps, and most packages have less than 8 steps, so that is a
> >     *complete* build (download, extract, patch, configure, build,
> >     install-target, install-staging) of about 1000 packages. 1MiB is
> >     very small compared to the size of those 1000 packages, and even
> >     when compared to the smallest system (busybox based), that's still
> >     one order of magnitude less than the sources of busybox, and you'd
> >     get to build it 8000 times in a row...
> >
> >     Lets assume I made a mistake of one order of magnitude in those
> >     calculations, and 1MiB is only 800 steps; well, 10MiB are those
> >     8000 steps, is on-par with Buildroot source tree, and it is still
> >     very small for today's storage.
> >
> >   - if the problem is the accuracy of the content of that file:
> >     Buildroot never guaranteed (and will probably never guarantee) that
> >     a partial build is coherent. Only with a build from scratch do you
> >     get a coherent output. That's valid for target/ , staging/ and
> >     host/ . It is is also valid for graphs/ .
> >
> >   - the overhead of the tracing? Well, that's mere milliseconds at
> >     worse, for each step. Running:   date +%s.%N; date +%s.%N
> >     consistently gives me from 1.6ms to 2.5ms between the two dates.
> >     OK, after 8000 steps, that about 20 seconds...
> >
> > So, I wonder what problem this patch is trying to solve.
> 
> We use buildroot as the core or the build systems of our projects.
> While I personally have the habit of periodically doing a build from
> scratch, I have observed that most of my coworkers *never* do a build
> from scratch, for the entire 1-2 year project,

I was afraid you'd say that! ;-)

> unless a defconfig
> change breaks things so completely that it can't be ignored.  It's for
> their sake that I thought it would be good to patch away the file that
> grows forever.

What about: rm output/build/build-time.log   ? ;-]

> If there's not appetite for this change, I suppose that I could keep
> it as a local customization.

I'm not too fond of this. A maintainer may argue otherwise.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
