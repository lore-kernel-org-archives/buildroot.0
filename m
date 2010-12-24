From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 24 Dec 2010 13:26:05 +0100
Subject: [Buildroot] [PATCH 3/4] Makefile: generate CMake toolchain file
 in $(O)
In-Reply-To: <AANLkTi=7CxPqcF3Mr9SYNghbJ1ymmLUnniU70wCKKnts@mail.gmail.com>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
	<1292182155-29576-4-git-send-email-bjorn.forsman@gmail.com>
	<AANLkTi=R7C0yXPepZWz=Pj=-Vc2B62-qBPZ6L-GkjBpQ@mail.gmail.com>
	<AANLkTimy9OaB+LHAxLD4psmnewUntXfbr0rDUKywMZjG@mail.gmail.com>
	<AANLkTikFyao3mPUg=cWm-D9YGM91DU6dBvJk84o7WjJ5@mail.gmail.com>
	<AANLkTi=7CxPqcF3Mr9SYNghbJ1ymmLUnniU70wCKKnts@mail.gmail.com>
Message-ID: <AANLkTinqTj=20jTGNfxw8JA5EEL7rt=U56P3qHyHJEeW@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Yes. Also, the toolchain file can be copied out of buildroot and

modified (if desired).

Agree.


> > So, yes, for the target, i think it's safe to set it to "ONLY"


> But is it necessary? Wouldn't "NEVER" suffice? I don't mean to be

difficult, but I'd like to see a real world example of when it is needed

and not just add it because it "also works".

Instead of being so strict with "ONLY" or "NEVER", maybe "FIRST" or "LAST"
[1] can solve this issue.
Months ago, I had some trouble with CMAKE_FIND_ROOT_PATH set to "NEVER"
while cross-compiling OpenCV, and I fixed this setting it to "ONLY". I hope
having some freetime during Xmas break to (re)run some tests about that.
That's a tricky point that certainly needs some tests to get the right
solution.

Cheers,

[1]
http://www.cmake.org/cmake/help/cmake-2-8-docs.html#command:find_program

Samuel

2010/12/23 Bj?rn Forsman <bjorn.forsman@gmail.com>

> Hi,
>
> 2010/12/22 Samuel Martin <s.martin49@gmail.com>:
> > Hi Bj?rn,
> >
> >>
> >> > In my version (not submitted), i also set the following
> >>
> >> > variables: CMAKE_INCLUDE_PATH and CMAKE_LIBRARY_PATH
> >>
> >> I just read up on those variables (man cmake) and it seems to me that
> they
> >>
> >> are used in addition to a default set of paths(?), which I presume are
> >>
> >> relative to CMAKE_FIND_ROOT_PATH. So are they really needed? What paths
> >>
> >> do you set them to?
> >
> > You're right.
> > It might be an interesting point to add in the doc, but needs to be
> tested
> > and confirmed.
> > use case:
> >   You build a BR environment, then an external lib out of BR and develop
> a
> > project for the BR's target that use this external lib.
> >   In this case, there are 2 solutions at least:
> >     - add the external lib output directory path to
> the CMAKE_FIND_ROOT_PATH
> > variable (need to alter the toolchain file)
> >     - or set CMAKE_INCLUDE_PATH and CMAKE_LIBRARY_PATH pointed on the
> > corresponding sub-directories of the external lib output directory.
>
> Yes. Also, the toolchain file can be copied out of buildroot and
> modified (if desired).
>
> >> >> +       set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
> >>
> >> >
> >>
> >> > Here is the main point of disagreement. Because in BR the
> cross-compiler
> >> > and
> >>
> >> > all tools around are located somewhere in a subdirectory of
> >> > $(STAGING_DIR),
> >>
> >> > i do set CMAKE_FIND_ROOT_PATH_MODE_PROGRAM to "ONLY".
> >>
> >> Is it completely safe to set it to "ONLY"? Couldn't host binaries be
> >> picked
> >>
> >> up during cross-compilation? Or am I missing something?
> >
> > When cross-compiling, you need to build the whole toolchain (ie. the
> > cross-compiler, assembler, linker, and all useful cross-tools) and the
> > sysroot for the target.
> > You have to do this and only refer to these tools and sysroot when
> building
> > binaries for the target to avoid building broken binaries that could
> > be linked with something from the host.
> > So, yes, for the target, i think it's safe to set it to "ONLY"
>
> But is it necessary? Wouldn't "NEVER" suffice? I don't mean to be
> difficult, but I'd like to see a real world example of when it is needed
> and not just add it because it "also works".
>
> Best regards,
> Bj?rn Forsman
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101224/b4098878/attachment.html>
