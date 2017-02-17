From: Andrey Yurovsky <yurovsky@gmail.com>
Date: Fri, 17 Feb 2017 09:54:46 -0800
Subject: [Buildroot] [RFC] optional automated unit-test execution with
 qemu user mode
In-Reply-To: <c9e34fda-65ac-47d3-39a9-3581b683108a@mind.be>
References: <CAAkeqgXY8Xok9uz=nUZOcaSehbcSESxqrfCa43FV+5ZyG-EU6g@mail.gmail.com>
 <c9e34fda-65ac-47d3-39a9-3581b683108a@mind.be>
Message-ID: <CAAkeqgWxbpPwQ+MRXvFHq9RU=nAeO0HWkLfWebq0FtuyjCbw-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Thu, Feb 16, 2017 at 11:02 PM, Arnout Vandecappelle <arnout@mind.be>
wrote:

>
>
> On 13-02-17 19:31, Andrey Yurovsky wrote:
> > I wanted to share something with the buildroot community in case it's
> > interesting. Basically, buildroot as it stands has all the
> infrastructure in
> > place to optionally execute cross-compiled unit tests for "customer"
> (external)
> > applications via qemu's user mode, this in turn may simplify and speed
> up your
> > continuous integration workflow (though obviously it's of little use for
> > packages that buildroot itself provides).
> >
> > I wrote up my approach in this blog
> > post: http://yurovsky.github.io/2017/01/20/qemu-unit-tests/ focusing on
> ARM only
> > (though anything will work, barring one more thing to overcome if
> endianness
> > doesn't match between host and target, but there's a good workaround)
> and I'm
> > successfully using this for my own projects.
> >
> > I think the implementation treads very lightly on the normal package
> recipe
> > process but basically:
> > - we add a trivial wrapper script that executes qemu-<cpu> with
> knowledge of the
> > staging directory
> > - recipes optionally add a hook to run, essentially, "make check" with
> that
> > wrapper. In my blog post I focused on automake which makes this easy via
> its
> > LOG_COMPILER but I'm sure other build systems can be integrated
> > - buildroot builds your package, runs "make check", and your unit tests
> are
> > executed as if they're native applications
>
>  I think this will fail as soon as you try to exec something, no? So if
> your
> tests are implemented as scripts that call into executables, it's not
> going to
> work...
>
>
Right, the idea is you run your C/C++ unit tests but not shell-script
functional tests. If your package provides both kinds of tests you can
choose to enable only the ones that are relevant / would work by setting
TESTS with "make -e" like the example I gave in the blog post.  I know that
seems very limiting but I found it's generally what the "customer" wanted
to begin with. To try things out I wrote an example program that has both a
set of libcheck tests and shell-based functional tests and then selected
only the test programs themselves to run as part of the normal buildroot
recipe.


>  A much more generic approach is to rely on binfmt-misc and chroot into the
> rootfs. Of course, this does require root access to set up.
>
>
Yeah, this was an attempt to do something streamlined that just works with
normal buildroot options and doesn't require any further setup.


>  Also, I don't think the overhead of qemu-system is that big for running
> unit
> tests, is it?
>
>
I think it is, you're then doing a special build/deploy or a dedicated
configuration and that's what I'm trying to get away from. This approach
means everything happens in one pass and your tests are treated as a normal
part of the build process (as they arguably should be), it's also very easy
from a CI standpoint. Some people may need additional or more exhaustive or
functional testing and they should definitely deploy to a qemu-system
machine for that but I think this provides another tool that probably meets
most people's needs (of course that's just my impression, I'd love to know
if anyone else thinks so!)


>  Regards,
>  Arnout
>
> >
> > I have a simple patch set implementing what's described in the blog post
> if
> > anyone is interested and I don't think it would take much work to make
> it more
> > generic (ie: not just ARM, not just automake) and I'd be happy to do
> that if
> > this is an (optional) feature that would be of interest to buildroot.
>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170217/375ef4e2/attachment.html>
