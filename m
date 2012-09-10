From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 10 Sep 2012 22:14:42 +0200
Subject: [Buildroot] Relocate uClibc toolchain question
In-Reply-To: <CAJbs9BEw+45qVbj_zcy_iFj3dGbHdN772upUXFg=pDiaR7WEsw@mail.gmail.com>
References: <CAJbs9BEw+45qVbj_zcy_iFj3dGbHdN772upUXFg=pDiaR7WEsw@mail.gmail.com>
Message-ID: <CAHXCMMJjd3tt2NLfu=O2uKF1-gHyWBdhEhpsbGCRzxRRrt=ATQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

2012/9/10 Rishi <rishid+mailman@gmail.com>:
> Hello,
>
> I have built a uClibc toolchain using Buildroot 2012.05.
> - uClibc 0.9.33
> - gcc 4.6.x
> - C++ support
>
> The toolchain works perfectly but I want to move it from my home
> directory to a directory that can be shared with the team, like
> /opt/arm_uClibc/..
>
> I performed a "cp -rf output/host/ /opt/arm_uClibc" and then attempted
> to use this compiler by passing the --sysroot option as suggested in
> Documentation.
> (http://buildroot.uclibc.org/downloads/manual/manual.html#_using_the_generated_toolchain_outside_buildroot)
Afaik, Buildroot toolchain are not yet fully relocatable (personally,
I would not trust the 3rd paragraph of the section).
However, both solutions (based on adding output/host/usr/bin to your
PATH or changing the host directory location) should works.
I'd suggest to not move the toolchain built by Buildroot since some
stuff (such as RPATH and so on) are set with absolute pathes.

>
> This seemed to be working but as soon as I performed a distclean in my
> buildroot area the toolchain broke; it could not find libmpc.so.2 as
> well as C standard include headers.
>
> Executing command:
> arm-linux-g++ -c -Wall --sysroot=/opt/arm_uClibc main.cpp
>
> 2 questions:
> 1. Any ideas on how to fix this?  Codesourcery toolchain does not have
> libmpc.so.2, so I was a bit puzzled.
Afaik, libmpc is not a mandatory for a toolchain (you don't need it
for building the toolchain itself).

> 2. Why doesn't CodeSourcery's toolchain require this sysroot thing?  I
> can move their compiler anywhere and it works perfectly fine.
Sourcery guys manage to build fully relocatable toolchains since
anything (from the toolchain) referring to other part of the toolchain
does use relative path or is able to resolve the absolute path from
the location where it is installed.
If you have a CodeSourcery's toolchain, try to run :
./ia32-2011.09/bin/i686-pc-linux-gnu-gcc -print-sysroot


Btw, this is on the Buildroot todo list:
http://elinux.org/Buildroot#Core_Buildroot_infrastructure


Cheers,

-- 
Sam
