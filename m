From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Aug 2013 08:35:19 +0200
Subject: [Buildroot] [PATCH 00/12] Toolchain updates
Message-ID: <1377671731-28656-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of updates/improvements to the internal toolchain
backend (with some impacts on the external toolchain one). Mainly it:

 * Allows to build the toolchain with only two passes of gcc build as
   opposed to three. Of course, this is only possible in the
   appropriate situations. This patch had already been posted
   previously to the list, and was rebased on top of current master.

 * Fixes Fortran and Objective-C support, moves the C++ option close
   to the one for Fortran and Objective-C.

 * Adds support for glibc, in addition to eglibc. Note that as
   suggested by Arnout, I'm proposing a single package to handle both
   libraries.

 * Refactors the Stack Smashing Protection support.

 * Refactors the Mudflap support. Note however that I didn't manage to
   get a Busybox system with mudflap enabled to boot. I am personaly
   not that much interested in mudflap support, so unless someone
   steps up to look at the issue, I think I'll propose to remove
   Mudflap support entirely.

 * Makes a small number of related cleanups.

Thomas Petazzoni (12):
  package/Makefile.in: fix incorrect comment
  eglibc: libstdc++ is not part of the C library
  toolchain-internal: skip gcc-intermediate when possible
  gcc: fix Fortran support
  gcc: fix Objective-C support
  gcc: move C++ support option next to Fortran/Objective-C
  toolchain: add support for glibc
  gcc/gcc-final: use the common HOST_GCC_CONFIGURE_SYMLINK macro
  gcc: force symlink creation
  toolchain: refactor Stack Smashing Protection support
  toolchain: move elf2flt option inclusion to
    toolchain-buildroot/Config.in
  toolchain: improve mudflap support

 Config.in                                    | 37 +++++++++++++++
 package/Makefile.in                          | 17 +++++--
 package/gcc/Config.in.host                   | 53 ++++++++++++++++++---
 package/gcc/gcc-final/gcc-final.mk           | 31 ++++++++----
 package/gcc/gcc-initial/gcc-initial.mk       |  8 ++++
 package/gcc/gcc.mk                           |  8 +++-
 package/{eglibc/eglibc.mk => glibc/glibc.mk} | 70 ++++++++++++++++------------
 package/psmisc/psmisc.mk                     |  2 +-
 package/uclibc/Config.in                     | 11 +++++
 package/uclibc/uclibc.mk                     |  5 +-
 toolchain/Config.in                          | 11 ++++-
 toolchain/helpers.mk                         | 15 +++++-
 toolchain/toolchain-buildroot/Config.in      | 25 +++++++++-
 toolchain/toolchain-buildroot/Config.in.2    | 31 ------------
 toolchain/toolchain-common.in                |  6 +++
 toolchain/toolchain-external/Config.in       | 18 +++++++
 toolchain/toolchain-external/ext-tool.mk     | 11 +++++
 17 files changed, 270 insertions(+), 89 deletions(-)
 rename package/{eglibc/eglibc.mk => glibc/glibc.mk} (58%)
 delete mode 100644 toolchain/toolchain-buildroot/Config.in.2

-- 
1.8.1.2
