From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 22 Dec 2010 22:32:30 +0100
Subject: [Buildroot] [PATCH 3/4] Makefile: generate CMake toolchain file
 in $(O)
In-Reply-To: <AANLkTimy9OaB+LHAxLD4psmnewUntXfbr0rDUKywMZjG@mail.gmail.com>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
	<1292182155-29576-4-git-send-email-bjorn.forsman@gmail.com>
	<AANLkTi=R7C0yXPepZWz=Pj=-Vc2B62-qBPZ6L-GkjBpQ@mail.gmail.com>
	<AANLkTimy9OaB+LHAxLD4psmnewUntXfbr0rDUKywMZjG@mail.gmail.com>
Message-ID: <AANLkTikFyao3mPUg=cWm-D9YGM91DU6dBvJk84o7WjJ5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bj?rn,


> > In my version (not submitted), i also set the following

> variables: CMAKE_INCLUDE_PATH and CMAKE_LIBRARY_PATH


> I just read up on those variables (man cmake) and it seems to me that they

are used in addition to a default set of paths(?), which I presume are

relative to CMAKE_FIND_ROOT_PATH. So are they really needed? What paths

do you set them to?

You're right.

It might be an interesting point to add in the doc, but needs to be tested
and confirmed.
use case:
  You build a BR environment, then an external lib out of BR and develop a
project for the BR's target that use this external lib.
  In this case, there are 2 solutions at least:
    - add the external lib output directory path to the CMAKE_FIND_ROOT_PATH
variable (need to alter the toolchain file)
    - or set CMAKE_INCLUDE_PATH and CMAKE_LIBRARY_PATH pointed on the
corresponding sub-directories of the external lib output directory.


>> +       set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\

>

> Here is the main point of disagreement. Because in BR the cross-compiler
> and

> all tools around are located somewhere in a subdirectory of
> $(STAGING_DIR),

> i do set CMAKE_FIND_ROOT_PATH_MODE_PROGRAM to "ONLY".


> Is it completely safe to set it to "ONLY"? Couldn't host binaries be picked

up during cross-compilation? Or am I missing something?

When cross-compiling, you need to build the whole toolchain (ie. the
cross-compiler, assembler, linker, and all useful cross-tools) and the
sysroot for the target.
You have to do this and only refer to these tools and sysroot when building
binaries for the target to avoid building broken binaries that could
be linked with something from the host.
So, yes, for the target, i think it's safe to set it to "ONLY"


> The generated toolchain file does not seem to support external

>  cross-toolchain (btw, from my understanding, CTNG is installed in the

> staging, so no problem)

> To do that, I think CMAKE_FIND_ROOT_PATH is a list (so are

> CMAKE_INCLUDE_PATH and CMAKE_LIBRARY_PATH), so adjust them,
> CMAKE_C_COMPILER

> and CMAKE_CXX_COMPILER.


> Did you test external toolchain? Did it break? I haven't tested it (yet),

but AFAIK Buildroot copies external toolchain's sysroot into staging so

there should no need for multiple entries in CMAKE_FIND_ROOT_PATH

(or changes to CMAKE_{C,CXX}_COMPILER). Right?

I haven't test external toolchain nor crosstool-NG, but afaik, crosstool-NG
toolchain is copied in the BR staging,
but not external ones.

Btw, the toolchain is currently located in the staging, but if this change
[1] (or if you're using a external tc), then, there needs to append both the
staging directory and the toolchain directory to CMAKE_FIND_ROOT_PATH.


[1] http://lists.busybox.net/pipermail/buildroot/2010-December/039824.html


Cheers,

Samuel


2010/12/14 Bj?rn Forsman <bjorn.forsman@gmail.com>

> Hi Samuel,
>
> 2010/12/13 Samuel Martin <s.martin49@gmail.com>:
> > Hi Bj?rn,
> > Again, this reviews may refer to the other patch reviews of the set...
> >>
> >> +$(O)/toolchainfile.cmake:
> >>
> >> +       @echo -en "\
> >>
> >> +       set(CMAKE_SYSTEM_NAME Linux)\n\
> >>
> >> +       set(CMAKE_C_COMPILER $(CMAKE_TARGET_CC))\n\
> >>
> >> +       set(CMAKE_CXX_COMPILER $(CMAKE_TARGET_CXX))\n\
> >
> > In my version (not submitted), i also set the following
> > variables: CMAKE_INCLUDE_PATH and CMAKE_LIBRARY_PATH
>
> I just read up on those variables (man cmake) and it seems to me that they
> are used in addition to a default set of paths(?), which I presume are
> relative to CMAKE_FIND_ROOT_PATH. So are they really needed? What paths
> do you set them to?
>
> >>
> >> +       set(CMAKE_FIND_ROOT_PATH $(STAGING_DIR))\n\
> >>
> >> +       set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)\n\
> >
> > Here is the main point of disagreement. Because in BR the cross-compiler
> and
> > all tools around are located somewhere in a subdirectory
> of $(STAGING_DIR),
> > i do set CMAKE_FIND_ROOT_PATH_MODE_PROGRAM to "ONLY".
>
> Is it completely safe to set it to "ONLY"? Couldn't host binaries be picked
> up during cross-compilation? Or am I missing something?
>
> I haven't tested more than 'hello world' packages (no dependencies) with
> the toolchain-file, so if having "ONLY" is mandatory for more complex
> packages (like using pkg-config?) I'll change it.
>
> >> +       set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)\n\
> >>
> >> +       set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)\n\
> >>
> >> +       " > $@
> >
> > The generated toolchain file does not seem to support external
> >  cross-toolchain (btw, from my understanding, CTNG is installed in the
> > staging, so no problem)
> > To do that, I think CMAKE_FIND_ROOT_PATH is a list (so are
> > CMAKE_INCLUDE_PATH and CMAKE_LIBRARY_PATH), so adjust
> them, CMAKE_C_COMPILER
> > and CMAKE_CXX_COMPILER.
>
> Did you test external toolchain? Did it break? I haven't tested it (yet),
> but AFAIK Buildroot copies external toolchain's sysroot into staging so
> there should no need for multiple entries in CMAKE_FIND_ROOT_PATH
> (or changes to CMAKE_{C,CXX}_COMPILER). Right?
>
> Best regards,
> Bj?rn Forsman
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101222/a5d6b80f/attachment-0001.html>
