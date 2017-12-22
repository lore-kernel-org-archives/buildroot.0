From: Nimai Mahajan <nimaim@gmail.com>
Date: Fri, 22 Dec 2017 18:50:50 -0500
Subject: [Buildroot] How to force mesa3d to use llvmpipe?
In-Reply-To: <20171223010843.GC26647@momiji>
References: <1513976018164-0.post@n4.nabble.com>
 <1513977748342-0.post@n4.nabble.com>
 <7829580e-0ae9-e063-5124-c4e2cde424da@gmail.com>
 <CALoSW666QZZCi=XMkir+UP=8N+dG6hbZQ0ZiFLM=nGKRxQRB-Q@mail.gmail.com>
 <20171223010843.GC26647@momiji>
Message-ID: <CALoSW6662VvbOMRJ6VhwsMw1nb=UD+WFB-5V6g6bRWYd-fLm5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 22, 2017 at 6:08 PM, Adrian Perez de Castro <aperez@igalia.com>
wrote:

> Hello Nimai,
>
> On Fri, 22 Dec 2017 17:10:49 -0500, Nimai Mahajan <nimaim@gmail.com>
> wrote:
> > On Fri, Dec 22, 2017 at 4:52 PM, Romain Naour <romain.naour@gmail.com>
> wrote:
> >
> > > Hi Nimai,
> > >
> > > Le 22/12/2017 ? 22:22, nimaim a ?crit :
> > > > Looks like BR may still not have llvmpipe support. Curious if this
> patch got
> > > > anywhere?
> > > >  http://lists.busybox.net/pipermail/buildroot/2017-July/195823.html
>
> I have made those patches as part of a proof-of-concept for a project. The
> people involved have decided to switch over to a GPU-accelerated solution,
> and
> that means that I have not been devoting time to polish the patch set for
> inclusion upstream. While I think it would be nice to have LLVM packages
> merged, so far I have been working on Buildroot using my laptop and it has
> been prohibitive to me to spend CPU time on side quests which don't help my
> daily work ? sorry about that!
>

No problem! That's understandable. I appreciate your efforts very much as I
wouldn't even know where to start with integrating LLVM into BR. I do think
getting a software rasterizer like llvmpipe working is pretty important as
many are using older deprecated or embedded systems where GPU accelerated
graphics are simply not an option. swrast / softpipe drivers work very
poorly.

>
> > > This patch series is still present in the patchwork [1] but this work
> need
> > > to be updated with the latest llvm/clang release (5.0.1).
>
> After Christmas I expect to have a powerful build machine and plenty of
> disk
> space, and then it will be more feasible for me to try do some additional
> contributions to Buildroot. Let's see then whether I can get it updated.
>

That would be great! Anything I propose would probably be a hack at best
and I can only test on x86 and I think BR's official solution for LLVM as
is being presented during their next meeting will take a while to
incorporate. So whatever you can propose would be greatly appreciated (as
your schedule allows of course!).

>
> > > However, you can still test this series and you should be able to use
> > > llvmpipe.
> >
> > Thanks! Sounds good, I will try to merge Adrian's llvm package and mesa3d
> > patches locally and rebuild mesa and see if I can get Qt to work with the
> > llvm OpenGL driver. By any chance, do you know if llvm v4.0.0 will work
> > with mesa 17.2.x or 17.3.x or will it have to be bumped to v5? Also, not
> > sure how familiar with Qt you are, but do you know if Qt will require
> > special hooks to be able to use this with xcb?
>
> Any Mesa 17.x should work fine with LLVM 4.x; it should not be needed to
> update the build recipes to LLVM 5. Quoting from the Mesa website:
>
>   ?Unless otherwise stated, LLVM version 3.4 is recommended; 3.3 or
>    later is required.?
>
> There is also this note regarding PowerPC support:
>
>   ?For ppc64le processors, use of the Altivec feature (the Vector
> Facility) is
>   recommended if supported; use of the VSX feature (the Vector-Scalar
>   Facility) is recommended if supported AND Mesa is built with LLVM version
>   4.0 or later.?
>
> (See https://www.mesa3d.org/llvmpipe.html for more details.)
>

Thanks! That's good news. I will give it a go with what you submitted so
far the and work from there.

>
> > > I have not announced it yet on the mailing list that there will be a
> > > student at Smile working on this subject. He will present his
> internship
> > > topic during the next Buildroot meeting [2].
> >
>
> Nice! I am considering going to FOSDEM, if I do so it could be nice to meet
> and maybe talk a bit about the topic  :-)
>
> > > Enabling llvmpipe support in mesa is not really difficult but packaging
> > > llvm/clang is a more difficult and time consuming task.
> >
> > Great! Agreed, something that definitely needs some work. Glad to see
> > someone will be working it.
>
> Indeed. It would be great to see full support for LLVM in Buildroot, as it
> would be a building block for many other things:
>
>  - Enabling ?llvmpipe? the and ?swr? rasterizers in Mesa3D. Also, the
> ?amdgpu?
>    can use (needs?) LLVM for some of the GPUs.
>
>  - As said, it's a requisite of Clang. And having Clang could open the
>    door to use Clang-based cross-compiler toolchains.
>
>  - Rust uses LLVM for code generation. There has been patches recently
> flying
>    by the mailing list which use prebuilt binaries (and that's already a
> great
>    first step), but it would be nice that Buildroot compiles its own Rust
>    toolchain, like it does for C/C++.
>
>  - Probably others.
>

Yes, proper llvm support could definitely open many doors for BR. Looking
forward to this! I'm sure the devs would love it if you could join them at
FOSDEM and help with this.

>
> > > You're welcome to work on this series and give some feedback.
> > >
> >
> > I'm merely a small time dev and still learning (as is probably evident by
> > all my questions :)), especially with embedded graphics, but will be
> happy
> > to test and contribute any way I can. Hopefully I can get this in a
> decent
> > enough state. Quite surprised that this hasn't made it to BR yet.
>
> We all had to learn at some point, that's all right! Well, I would even say
> that there's always one more thing to learn ;-)
>

That's for sure, haha. I've worked with BR for many years but still never
fully understood the infrastructure. At some point in the very near future,
I'll stop procrastinating and properly learn :)

>
> Best regards,
>
>
> --
>  Adri?n ?
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171222/9a2e2284/attachment.html>
