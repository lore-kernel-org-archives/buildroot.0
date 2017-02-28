From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Feb 2017 21:58:38 +0100
Subject: [Buildroot] [PATCH 1/5] core/pkg-cmake: provide our own
	platform description
In-Reply-To: <1488314513.5877.3.camel@embedded.rocks>
References: <cover.1488305206.git.yann.morin.1998@free.fr>
 <f25e9ff7873418c0b323528d6a9c2482c752cd31.1488305206.git.yann.morin.1998@free.fr>
 <1488314513.5877.3.camel@embedded.rocks>
Message-ID: <20170228205838.GC3533@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2017-02-28 21:41 +0100, J?rg Krause spake thusly:
> On Tue, 2017-02-28 at 19:07 +0100, Yann E. MORIN wrote:
> > The handling of RPATH in cmake-3.7 has changed drastically, causing a
> > slew of build failures dues to libraries from the host being pulled
> > in:
> > 
> > ? - domoticz : http://autobuild.buildroot.org/results/fd0/fd0ba54c7ab
> > f973691b39a0ca1bb4e07d749593a/
> > ? - freerdp??: http://autobuild.buildroot.org/results/5d4/5d429d0e288
> > 754a541ee5d8be515454c5fccd28b/
> > ? - libcec???: http://autobuild.buildroot.org/results/3f3/3f3593bab77
> > 34dd274faf5b5690895e9424cbb89/
> > ? - and so on...
> > 
> > The bug was reported upstream [0], which dismissed it altogether [1]
> > as
> > being expected behaviour, quoting:
> > 
> > ????I don't think there is anything wrong with that change on its
> > own.
> > ????It merely exposed some existing behavior in a new case.
> > 
> > Instead, upstream suggested in that same message that a platform
> > definition be used instead, quoting:
> > 
> > ????If a toolchain file specifies CMAKE_SYSTEM_NAME such that a
> > custom
> > ????`Platform/MySystem.cmake` file is loaded then the latter can set
> > ????them as needed for the target platform.
> 
> Upstream has opened an issue [1] about this and is already working on a
> fix [2] for version 3.7 and 3.8. It fixes the behavior of how
> FIND_LIBRARY_USE_LIB32_PATHS handle symlinks.?As 'lib32' is just just a
> symlink to 'lib' in Buildroot, 'find_library()' will skip 'lib32' as a
> runtime search path and as a consequence 'lib32' will not be used as
> rpath anymore.
> 
> > So here we are doing so:
> > 
> > ? - we add a new platfom definitions that inherits from the Linux
> > one,
> > ????then overrides the problematic settings;
> > 
> > ? - we change our toolchain file to use that platform instead;
> > 
> > ? - we tell cmake where to find additional modules, so that it can
> > find
> > ????our custom platform file.
> 
> As the issue might be fixed at some point, do we want to keep the
> custom platform file?

Well, what bad would it do to have our own platform file? We could even
use it for yet more options if need be.

And in the meantime, there is no release of cmake with a fix. I'll
believe they've fixed it when I see it! ;-)

Regards,
Yann E. MORIN.

> > This has been tested to work in the following conditions:
> > 
> > ?- pre-installed host cmake, versions 3.5.1 (Ubuntu 16.04) and 3.7.2
> > ???(manually built)
> > 
> > ? - internal cmake, versions 3.6.3 (the current version as of this
> > ????patch) and 3.7.2 (with the followup patches).
> > 
> > Thanks to J?rg, Ben and Baruch for the help investigating the issue.
> > Special thanks to J?rg for handling the discussion with upstream and
> > pointing to the relevant messages! :-)
> 
> You are welcome!
> 
> [1] https://gitlab.kitware.com/cmake/cmake/issues/16682
> [2] https://gitlab.kitware.com/cmake/cmake/merge_requests/534
> 
> J?rg

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
