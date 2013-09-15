From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Sep 2013 21:20:31 +0200
Subject: [Buildroot] [PATCHv2 00/14] Toolchain updates and improvements
In-Reply-To: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20130915212031.3fd92bbd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

I haven't received any comments on the v2 of this patch series, and it
still applies cleanly on current master. Would it be possible to apply
it?

It's some toolchain stuff, so as usual it's pretty 'dangerous', so I'd
prefer to have it merged sooner rather than later, and also because I'd
like after that one to get the patch set that fixes the toolchain
'make source' merged.

Thanks!

Thomas

On Mon,  2 Sep 2013 18:06:26 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> Here is a set of updates/improvements to the internal toolchain
> backend (with some impacts on the external toolchain one). Mainly it:
> 
>  * Allows to build the toolchain with only two passes of gcc build as
>    opposed to three. Of course, this is only possible in the
>    appropriate situations. This patch had already been posted
>    previously to the list, and was rebased on top of current master.
> 
>  * Fixes Fortran and Objective-C support, moves the C++ option close
>    to the one for Fortran and Objective-C.
> 
>  * Adds support for glibc, in addition to eglibc. Note that as
>    suggested by Arnout, I'm proposing a single package to handle both
>    libraries.
> 
>  * Refactors the Stack Smashing Protection support.
> 
>  * Refactors the Mudflap support in the internal toolchain backend, by
>    providing a Config.in option to enable it. It is now disabled by
>    default.
> 
>  * Update the Linaro ARM and AArchr64 toolchains.
> 
>  * Makes a small number of related cleanups.
> 
> Changes since v1:
> 
>  * Use psmisc --disable-harden-flags only when BR2_TOOLCHAIN_HAS_SSP
>    is false, as suggested by Arnout.
> 
>  * Simplify the mudflap stuff by only providing an option in the
>    internal gcc backend to enable or disable it. We no longer provide
>    a global "Build options" to add -fmudflap when building all
>    packages as it is too complicated and probably not that useful.
> 
>  * Add updates to Linaro toolchains.
> 
> Thomas
> 
> Thomas Petazzoni (14):
>   package/Makefile.in: fix incorrect comment
>   eglibc: libstdc++ is not part of the C library
>   toolchain-internal: skip gcc-intermediate when possible
>   gcc: fix Fortran support
>   gcc: fix Objective-C support
>   gcc: move C++ support option next to Fortran/Objective-C
>   toolchain: add support for glibc
>   gcc/gcc-final: use the common HOST_GCC_CONFIGURE_SYMLINK macro
>   gcc: force symlink creation
>   toolchain: refactor Stack Smashing Protection support
>   toolchain: move elf2flt option inclusion to
>     toolchain-buildroot/Config.in
>   gcc: provide option to enable mudflap support
>   toolchain: update Linaro ARM external toolchains
>   toolchain: update Linaro AArch64 external toolchains
> 
>  Config.in                                    | 17 +++++++
>  package/Makefile.in                          |  5 +-
>  package/gcc/Config.in.host                   | 55 ++++++++++++++++++---
>  package/gcc/gcc-final/gcc-final.mk           | 31 ++++++++----
>  package/gcc/gcc-initial/gcc-initial.mk       |  8 ++++
>  package/gcc/gcc.mk                           | 26 ++++------
>  package/{eglibc/eglibc.mk => glibc/glibc.mk} | 70 +++++++++++++++------------
>  package/psmisc/psmisc.mk                     |  4 +-
>  package/uclibc/Config.in                     | 11 +++++
>  package/uclibc/uclibc.mk                     |  5 +-
>  toolchain/Config.in                          | 11 ++++-
>  toolchain/helpers.mk                         |  3 +-
>  toolchain/toolchain-buildroot/Config.in      | 25 +++++++++-
>  toolchain/toolchain-buildroot/Config.in.2    | 31 ------------
>  toolchain/toolchain-common.in                |  3 ++
>  toolchain/toolchain-external/Config.in       | 72 ++++++++++++++++------------
>  toolchain/toolchain-external/ext-tool.mk     | 24 +++++-----
>  17 files changed, 252 insertions(+), 149 deletions(-)
>  rename package/{eglibc/eglibc.mk => glibc/glibc.mk} (58%)
>  delete mode 100644 toolchain/toolchain-buildroot/Config.in.2
> 



-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
