From: Steve deRosier <derosier@gmail.com>
Date: Fri, 28 Oct 2016 11:28:59 -0700
Subject: [Buildroot] Building comptable binaries for ARM for EABI and
	EABIhf
In-Reply-To: <28771874-ce9d-09aa-76b3-c759bdef45ac@mind.be>
References: <CALupW3Dj0FcbKvgdJ-SwrGTy6xOYaztZZM9gBi7bXNZK0So_Yg@mail.gmail.com>
 <28771874-ce9d-09aa-76b3-c759bdef45ac@mind.be>
Message-ID: <CALLGbR+uko1o+ROOvPRVUrsr0g9fpARvXkEaSxZ3aq07CVyovg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thanks for your reply!

On Thu, Oct 27, 2016 at 3:33 PM, Arnout Vandecappelle <arnout@mind.be>
wrote:

>
>
> On 27-10-16 20:34, Steve deRosier wrote:
> > Hi,
> >
> > I'm curious if anyone's run into issues with binaries built on EABI
> > not working on EABIhf images and how you might have solved the issue.
> > I know we're using buildroot here in a slightly odd way as I imagine
>
>  Yep :-)
>
> > most people build everything from scratch so don't care about the
> > EABI/EABIhf mismatch, but I could use some suggestions from anyone if
> > this has been encountered before.
> >
> > Full details:
> >
> > We use Buildroot to not only build our full system images for our
> > platform, but also to produce and help package binaries of some
> > closed-source software we distribute for other customers to use on
> > their platforms as necessary. With ARM, there's two ABI - EABI and
> > EABIhf. In documentation/files from ct-ng, buildroot and ARM's own
> > docs, basically the official line is "use EABI if you want to be
> > compatible with third-party binaries."  Well, we're that third-party
> > binary provider they're talking about.  So we build in EABI.
>
>  Well, I'm not so sure if that is really the official party line. EABIhf is
> becoming more of a standard. E.g. Linaro (i.e., the official ARM Linux)
> only
> offers EABIhf toolchains.
>
>
Fair enough. I'm quoting the config help text from BR's EABI and EABIhf
options:
"The EABI is currently the standard ARM ABI, which is used in
   most projects."

and

"If your processor has a floating point unit, and you don't
   depend on existing pre-compiled code, this option {EABIhf} is most
   likely the best choice.  "

I had found similar text in ct-ng but can't find it now. Also, the
procedure call standard, same one you quoted, implies EABI would be the
"least common denominator" and thus appropriate for pre-built binary
distribution.

There's certain cases where it is necessary to run prebuilt third-party
binaries. Doesn't really matter if we like it or not we still have to
embrace reality. So having one or more vendors arbitrarily switch the ABI
to something incompatible is sort of a problem.

I don't want to get into a philosophical argument (especially as I likely
agree with most of the comments that are coming to everyone's tongues), I'm
just looking for a practical solution to a rather inconvenient problem.


>
> > Problem is, many platforms are now using EABIhf as default and NXP has
> > even locked it in. No mater if right or wrong, it's not a good idea to
> > tell our customers that they're wrong and need to rebuild the entire
> > platform into EABI to run our binaries.
> >
> > After a Buildroot and toolchain upgrade we're finding our EABI
> > soft-float binaries won't run on a platform built as EABIhf. Note we
> > don't use floating point in our code. Oddly enough our old binaries
> > produced by our old toolchain and buildroot will successfully run on
> > an EABIhf image!  I don't think it should, but it does, so that's
> > that.
> >
> > So in doing a lot of research and experimentation, I've discovered
> > something very specific: the flags field in the ELF header specify the
> > floating point.  hf shows the field as 0x05000402.  soft shows
> > 0x05000202. And our old compiler puts in 0x05000002.  It's the bits
> > masked by 0x00000600 that count.  A 2 is soft, a 4 is hard and a "0"
> > is specified by the ARM specification to be the "default" which is
> > soft (and not the default for the platform, it seems specific on this
> > that "default" == soft, as near as I can tell).
>
>  Yeah, and readelf decodes that and tells you directly if it's soft or
> hard float.
>
>
> > In looking at the glibc's open_verify() in dl-load.c, there's checks
> > for these bits among other checks. This is relevant because the place
> > our programs fail to run is where they load our dynamically linked
> > library.
>
>  This is weird. It should already fail to link at compile time, because ld
> also
> verifies if the flags are compatible... Or do you dlopen()?
>
>  Second weird aspect: how is it possible that your program is EABIhf and
> the
> library EABI?
>
>
I can see how it sounds weird; I don't think I explained properly. I'll try
again:

1. I build my software via Buildroot. It's built and linked as EABI with
soft.  We use shared libraries, not static. The platform we have and are
targeting in this case is soft.  Build and link works fine as everything
matches. Running on our platform works fine because we build the whole
thing and everything matches.
2. I package up a subset of that software, a few closed-source executables
(sdc_cli) and libraries (libsdc_sdk.so) and distribute those for use with a
different hardware part that gets integrated into customer's platforms.
3. Certain customers happen to have platforms with EABIhf.  When they take
our EABI-soft executable (sdc_cli) and attempt to run it, the ld.so on
their platform errors out when it goes to load the library (libsdc_sdk.so)
which doesn't match the platform's ld.so & glibc libraries.

We do do some dlopen() calls, but the failure in this case is standard
built-in shared library loading where it was already setup by the linker at
build time.  The difference is we've moved platforms so it will be a
physically different (but compatible, if it weren't for the EABIhf issue)
glibc.

We'd been doing this for ages and it works fine.  We use a fairly old and
generic ARM target architecture for this code as a "least common
denominator". We've only started running into this problem recently after
upgrading our toolchain.

We noticed the old toolchain doesn't set the bit, but the new toolchain
does.  So it's possible that we had EABIhf customers all along and we just
never noticed an issue as the bit wasn't being checked.  Or maybe EABIhf
customers are just now showing up.  Hard to say, it never occurred to us
track that data.



>
> > If the bit is set it checks if it's set to match. If no bit
> > is set, it seems to take that as a don't-care.  So, this seems to be
> > why our programs run if they were built with the older compiler
> > (verified by hacking the header with a hex editor), but won't run on
> > the new systems because it explicitly sets the bits.
> >
> > So I'm looking for options on how to create one binary that will run
> > on both EABI and EABIhf, and to do so without hacking the bits. I do
> > not want to have to build two different versions as that exponentially
> > grows our QA space.
>
>  Well, as you noticed, the toolchain won't allow it. Even though the EABI
> (=
> "Base") and EABIhf (= "VFP") calling conventions are compatible [1, section
> 6.4.1], that is only the case when no floating point arguments are passed
> anywhere. Because it is difficult to be sure, the standard specifies [1,
> introduction 6.4] "whether a toolchain must accept compatible objects
> compiled
> to different base standards, or correctly reject incompatible objects, is
> implementation defined". So binutils and ld.so take the safe approach and
> say NO.
>
>  I think your best option is to fiddle with the bits if that works, and if
> you're darn sure that no floating point arguments are passed anywhere.
>
>
So interestingly, hacking the bit post-build kinda works: it fixes it for
one of my test cases, but not a different one.  When I build our platform
as EABIhf, I can't run our EABI library as it fails the bit check.  If I
clear the bit, it will run it.  So great.  BUT - on one of our customer's
platforms, it passes that check (and I think it was doing so earlier) and
moves on to a later check where it silently fails.  Trying to correlate the
strace with the open_verify() code has been tricky, but it looks like it
reads the attributes section and chokes on something in there. But I can't
seem to find the code that is choking so I'm unsure which attribute it
hates.  So not out of the woods yet.




>  Alternatively, you should distribute a fully self-contained set of
> binaries,
> including libc and ld.so. If you don't rely on anything from the
> environment, it
> doesn't matter if said environment is EABI or EABIhf. It is a bit tricky
> to do
> that, however, because you have to make sure that /lib:/usr/lib is not in
> the
> standard library search path, and that the requested program interpreter
> is your
> personal ld.so. You're probably better off linking statically :-)
>
>
OK, so that was something I wasn't sure of. If I understand you right, if I
do a full static link of my code, so it links in what it needs from our
libraries, glibc and everything it depends on, our binary, which is EABI,
will run on their EABIhf system?  So the EABIhf only affects the calling
conventions within the program (and it's libraries) but the fact that the
kernel and the shell was built differently won't affect it?

If that's the case then I might have a way out. But changing the build up
this way is a significant change so I don't want to go to that effort if it
won't work.

So, if I fully statically link everything, it'll run?

Thanks,
- Steve
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161028/dd55f60d/attachment.html>
