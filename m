From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Feb 2017 09:59:38 +0100
Subject: [Buildroot] [PATCH 0/4] package/cmake: revert the bump to 3.7
In-Reply-To: <1488098694.10882.1.camel@embedded.rocks>
References: <cover.1488048682.git.yann.morin.1998@free.fr>
 <1488098694.10882.1.camel@embedded.rocks>
Message-ID: <20170226085938.GA4043@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2017-02-26 09:44 +0100, J?rg Krause spake thusly:
> On Sat, 2017-02-25 at 19:51 +0100, Yann E. MORIN wrote:
> > Hello All!
> > 
> > cmake 3.7 causes serious regressions in some cmake-based packages,
> > related to how RPATH is handled.
> 
> For an explanation what's going wrong please have a look at [1].
> [1] http://lists.busybox.net/pipermail/buildroot/2017-February/183579.html

Are you sure this is related? The code you point to in this mail should
not be executed in cross-compilation:

    if(NOT CMAKE_CROSSCOMPILING AND EXISTS "/etc/debian_version")
      set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB32_PATHS FALSE)
      set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB64_PATHS FALSE)
    endif()

So, if this code is indeed the culprit, then it eans that
CMAKE_CROSSCOMPILING is not set, and that in turn is probably the real
issue.

(But I only had one coffee since I woke up, so I may have missed
something...)

Regards,
Yann E. MORIN.

> > See for example:
> > 
> > ? - domoticz : http://autobuild.buildroot.org/results/fd0/fd0ba54c7ab
> > f973691b39a0ca1bb4e07d749593a/
> > ? - freerdp??: http://autobuild.buildroot.org/results/5d4/5d429d0e288
> > 754a541ee5d8be515454c5fccd28b/
> > ? - libcec???: http://autobuild.buildroot.org/results/3f3/3f3593bab77
> > 34dd274faf5b5690895e9424cbb89/
> > 
> > (and many others)
> 
> For example bctoolbox. Although the build errors are fixed, CMake does
> not find the optionally mbedTLS package if zlib is available as it
> links against the host zlib when using `check_symbol_exists()`.
> 
> > All causes the link to be attemped against host libraries, which is
> > definitely not appropriate...
> > 
> > Properly fixing this so close to the release is problematic; we'd
> > risk
> > having to hunt down packages one by one.
> 
> A fix which worked for me was to remove the line `set(CMAKE_SYSTEM_NAME
> Linux)` from the toolchainfile to be able to set the flag
> `FIND_LIBRARY_USE_LIB32_PATHS` property to `FALSE`. Of course, we also
> have to set the necessary flags which are set depending on
> `CMAKE_SYSTEM_NAME`. However, reverting CMake is probably much cleaner.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2017-February/183579.h
> tml
> [2] https://git.buildroot.net/buildroot/tree/support/misc/toolchainfile
> .cmake.in#n13

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
