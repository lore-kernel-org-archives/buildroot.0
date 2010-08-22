From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Aug 2010 12:51:52 +0200
Subject: [Buildroot] [pull request] Pull request for branch for-2010.08
Message-ID: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter, hello all,

Here is the stack of patches I've accumulated for the 2010.08
release. They either fix bugs reported by users, fix various build
issues, or deprecate things such as the Cris architecture.

There are a few remaining issues that I think should be fixed before
2010.08 is released:

 * The ldconfig problem on Fedora 13. I've been able to reproduce it
   after installing Fedora 13 in a VM, but I haven't had the time to
   figure out the correct solution for it.

 * Several configuration cache related issues. It seems to me that
   sharing the configuration cache between different packages is in
   fact hard to achieve in a reliable way. Maybe we should revert back
   to the configuration cache disabled by default.

 * The gcc 4.2 build problem. gcc 4.2 used to build properly, but has
   been broken by the new gcc build process introduced to support NPTL
   in uClibc. Khem has sent a patch that fixes this problem by adding
   a couple of #ifndef inhibit_libc ... #endif, but I'm not sure about
   it, so I preferred to get your opinion.

 * The uClibc 0.9.31 / C++ / locale problem, for which Khem has also
   sent a patch.

Regards,

Thomas

The following changes since commit 2ef83b42b97e7a098c9bef34109c5a8896a17b76:
  Peter Korsgaard (1):
        update for 2010.08-rc1

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2010.08

Francois Perrad (2):
      Add new patches Lua upstream patches rename old ones
      luafilesystem: remove LARGE_FILE constraint

Gustavo Zacarias (3):
      Update busybox 1.17.1 fixes
      Bump stable kernel headers
      Security bump php to 5.2.14

Thomas Petazzoni (15):
      Fix util-linux build on MIPS
      Add dependency from util-linux on ncurses
      Make uClibc gen_wc8bit shows an error when no locale support available
      Detect early if an UTF-8 locale is needed
      Add the traditional powerpc-link-with-math-lib patch to gcc 4.4.4
      Mark CRIS architecture as deprecated
      Prevent C++ + locale + uClibc 0.9.31 + gcc 4.2 to be selected
      imagemagick: don't create useless debugging file
      libglib2: add patch to rework clock_gettime() test
      lzo: fix host-lzo build failure when config cache is filled
      netcat: prevent build system from adding a prefix to binaries
      libxml-parser-perl/intltool: mark as host only packages
      lua: make sure that CFLAGS are passed
      sysvinit: make sure to link against libcrypt
      sysvinit: remove unneeded dependency on ncurses

 .../busybox-1.17.1/busybox-1.17.1-sed.patch        |   66 ++++
 .../busybox-1.17.1/busybox-1.17.1-shell.patch      |   19 +
 package/cgilua/Config.in                           |    4 -
 package/imagemagick/imagemagick.mk                 |    1 -
 package/intltool/Config.in                         |    3 +
 .../libglib2-fix-clock-gettime-check.patch         |   24 ++
 package/libglib2/libglib2.mk                       |    2 +-
 package/libxml-parser-perl/Config.in               |    3 +
 ...ion.patch => lua-bug3-boolean_expression.patch} |    0
 .../lua/{lua-table.patch => lua-bug4-table.patch}  |    0
 ..._getfenv.patch => lua-bug5-debug_getfenv.patch} |    0
 ...ormance.patch => lua-bug6-gc_performance.patch} |    0
 package/lua/lua-bug7-string_format.patch           |   20 +
 package/lua/lua-bug8-io_read.patch                 |   14 +
 package/lua/lua.mk                                 |    4 +-
 package/luafilesystem/Config.in                    |    6 +-
 .../luafilesystem-without_large_file.patch         |   20 +
 package/luafilesystem/luafilesystem.mk             |    6 +-
 package/lzo/lzo-2.03-acinclude-m4.patch            |  377 ++++++++++++++++++++
 package/lzo/lzo-2.03-fix-configure-ac.patch        |   21 ++
 package/lzo/lzo-2.03-fix-makefile-am.patch         |   24 ++
 package/lzo/lzo.mk                                 |    6 +
 package/netcat/netcat.mk                           |    1 +
 package/php/php.mk                                 |    2 +-
 package/sysvinit/Config.in                         |    1 -
 package/sysvinit/sysvinit.mk                       |    6 +-
 ...linux-2.13-pre17-hardcode-a-out-constants.patch |   41 +++
 package/util-linux/util-linux.mk                   |    4 +
 package/wsapi/Config.in                            |    4 -
 package/xavante/Config.in                          |    4 -
 target/Config.in.arch                              |    5 +
 toolchain/dependencies/dependencies.mk             |    1 +
 toolchain/dependencies/dependencies.sh             |   12 +
 .../powerpc-link-with-math-lib.patch.conditional   |  137 +++++++
 toolchain/kernel-headers/Config.in                 |    8 +-
 ...types-for-headers-exported-to-user-space.patch} |    0
 ...types-for-headers-exported-to-user-space.patch} |    0
 ...types-for-headers-exported-to-user-space.patch} |    0
 toolchain/toolchain-common.in                      |    6 +-
 .../uClibc-0.9.30.3-fix-error-locale-utf-8.patch   |   17 +
 .../uClibc-0.9.31-fix-error-locale-utf-8.patch     |   17 +
 41 files changed, 854 insertions(+), 32 deletions(-)
 create mode 100644 package/busybox/busybox-1.17.1/busybox-1.17.1-sed.patch
 create mode 100644 package/libglib2/libglib2-fix-clock-gettime-check.patch
 rename package/lua/{lua-boolean_expression.patch => lua-bug3-boolean_expression.patch} (100%)
 rename package/lua/{lua-table.patch => lua-bug4-table.patch} (100%)
 rename package/lua/{lua-debug_getfenv.patch => lua-bug5-debug_getfenv.patch} (100%)
 rename package/lua/{lua-gc_performance.patch => lua-bug6-gc_performance.patch} (100%)
 create mode 100644 package/lua/lua-bug7-string_format.patch
 create mode 100644 package/lua/lua-bug8-io_read.patch
 create mode 100644 package/luafilesystem/luafilesystem-without_large_file.patch
 create mode 100644 package/lzo/lzo-2.03-acinclude-m4.patch
 create mode 100644 package/lzo/lzo-2.03-fix-configure-ac.patch
 create mode 100644 package/lzo/lzo-2.03-fix-makefile-am.patch
 create mode 100644 package/util-linux/util-linux-2.13-pre17-hardcode-a-out-constants.patch
 create mode 100644 toolchain/gcc/4.4.4/powerpc-link-with-math-lib.patch.conditional
 rename toolchain/kernel-headers/{linux-2.6.32.16-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.32.18-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)
 rename toolchain/kernel-headers/{linux-2.6.33.6-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.33.7-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)
 rename toolchain/kernel-headers/{linux-2.6.34.1-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.34.3-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)
 create mode 100644 toolchain/uClibc/uClibc-0.9.30.3-fix-error-locale-utf-8.patch
 create mode 100644 toolchain/uClibc/uClibc-0.9.31-fix-error-locale-utf-8.patch

Thanks,
-- 
Thomas Petazzoni
