From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Jul 2012 22:16:53 +0200
Subject: [Buildroot] Buildroot and top-level parallel make
In-Reply-To: <CA+wH297K1Fh6cgFaHo2dd=ihgujo_nMkyicJLnOvAm9jnonBcQ@mail.gmail.com>
References: <CA+wH296drhV6yie5+79Y38qLmo_5cE1=3qaOrw5jbyCJ5mEMog@mail.gmail.com>
 <CA+wH296VRn4UY+cLAZUPjcprVcuZY9AHNw5QsEscvJ0oSszunw@mail.gmail.com>
 <CA+wH297K1Fh6cgFaHo2dd=ihgujo_nMkyicJLnOvAm9jnonBcQ@mail.gmail.com>
Message-ID: <20120715221653.0374b001@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 13 Jul 2012 11:34:58 +0100,
Alex Bradbury <asb@asbradbury.org> a ?crit :

> On 4 July 2012 13:20, Alex Bradbury <asb@asbradbury.org> wrote:
> > On 28 June 2012 13:34, Alex Bradbury <asb@asbradbury.org> wrote:
> >> I was wondering what the outcome of experiments to allow top-level
> >> parallelism were? What are the major barriers to allowing this? Is it
> >> still something seen as feasible to add to buildroot, or is it looking
> >> like it would add too much complexity?
> >
> > Thomas, I was wondering if you'd been able to recall what issues your
> > initial experiments with top-level parallel make faced?
> 
> I hate to be a pain...but ping?

Sorry, I've been way too busy last week. As Arnout said, I don't
remember the details, but here are some elements:

 * Adding top-level parallel build would introduce a lot of
   "randomness" in builds, making them harder to reproduce. If one
   package lacks a dependency on another package, but can optionally
   rely on it, then with top-level parallel build, sometimes the
   package will use this optional library, sometimes not. Of course,
   it's a bug in the package, that should have expressed this optional
   dependency in its .mk file, but still it's a problem. I think this
   non-reproducibility was the major issue we were having, because it
   would cause problems to users that may be hard to reproduce.

 * Adding top-level parallel build requires changing how the logging is
   done. At the moment, all the build details are logged on stdout.
   With top-level parallel build, we would need to redirect the build
   log of each package to a separate log file.

 * The current package infrastructure uses phony targets for
   sequencing, and we use phony targets in many other places, and phony
   targets don't play well with parallel build, they would have to be
   replaced with real targets (based on stamp files for example).

Of course, none of these make it impossible, but when we had the
discussion, I think we said that there were tasks with higher
priorities than this one. Don't hesitate to start experimenting and
prototyping around that if you're interested. However, we don't
guarantee that it will be integrated, it will depends on how much
complexity this adds.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
