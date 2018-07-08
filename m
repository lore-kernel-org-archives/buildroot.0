From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Jul 2018 16:07:27 +0200
Subject: [Buildroot] One package with more than one CMakeLists.txt (dlib)
In-Reply-To: <20180708154350.225b3f7f4c1c0bcdc0a52195@windows3.de>
References: <20180708154350.225b3f7f4c1c0bcdc0a52195@windows3.de>
Message-ID: <20180708140727.GC7163@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dennis, All,

On 2018-07-08 15:43 +0200, Dennis Schulmeister-Zimolong spake thusly:
> I'm currently trying to create a buildroot package for libdlib.
> (http://dlib.net/). As dlib uses CMake the package definition itself is
> straight-forward. However the source tree also contains a few utility
> applications as well as python bindings which each come with their own
> CMakeLists.txt.

What's even worse (I think), is that each individual tool includes the
dlib directory in their CMakeLists.txt, thus triggering a private,
static build of the library and using that static version... :-(

> What's the best way to deal with this?

The best would be to change upstream's code to use a single
CMakeList.txt, which would optionally build and install the tools...

> Right now my Config.in looks
> like this:
> 
> config BR2_PACKAGE_LIBDLIB
> 	bool "libdlib"
> 	...
> 
> if BR2_PACKAGE_LIBDLIB
> 
> config BR2_PACKAGE_LIBDLIB_TOOLS_ARCHIVED
> 	bool "archived tools"
> 	help
> 	  Archived tools from the tools/archive directory inside
> 	  the dlib source tree
> 
> config BR2_PACKAGE_LIBDLIB_TOOLS_HTMLIFY
> 	bool "htmlify"
> 	help
> 	  Utility program htmlify from the tools/htmlify directory
> 	  inside the dlib source tree
> 
> ...
> endif
> 
> Is this even feasible? How can I execute CMake more than once with the
> cmake-package infrastructure without reinventing the wheel. Or is it
> better to define separate packages for each tool although they all live
> in the same source tree?

Well, do you actually need to the tools, or do you just need the lib?
If you don't need the tools, then don't even bother...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
