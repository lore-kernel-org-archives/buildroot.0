From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Feb 2017 18:16:55 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-22
In-Reply-To: <20170223072850.D0F0B20BE0@mail.free-electrons.com>
References: <20170223072850.D0F0B20BE0@mail.free-electrons.com>
Message-ID: <20170223171655.GA3910@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2017-02-23 08:28 +0100, Thomas Petazzoni spake thusly:
> Detail of failures
>          arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/3d3036d40ddad71d872d910aae7a24975706d2e9

This one is a long-standing issue:

  - this is a static build,
  - son SDL libraries linked to by chocolate-doom ars C++ libs,
  - one library (indirectly) linked to by chocolate-doom needs libz
  - chocolate-doom itself is written in C

So, chocolate-doom uses gcc to link, instead of g++. In so doing, it
bring in neither libstdc++.a nor libz.a

I did a quick hack to verify this, and added -lstdc++ and -lz to the SDL
Libs.Privte in sdl.pc, and the build suceeded.

For the C++ dependency, SDL unconditionally checks for a C++ compiler:

    AC_PROG_CXX

so we should probably add a dependency on C++ to SDL.

As for the the -lz, I'm still investigating...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
