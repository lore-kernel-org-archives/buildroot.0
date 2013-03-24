From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 09:26:24 +0100
Subject: [Buildroot] [PATCH 00/22] Fixes, gcc 4.8 support,
	cleanup of dependencies
Message-ID: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of misc patches doing fixes, gcc version bump, cleanup
of mandatory dependencies.

In detail:

 package/connman: version bump to 1.12, and fix build with newer kernels headers
 gettext: fix tools build failure for uClibc toolchain with C++
 libgtk2: use non-host specific patch

   These are fixes that should be applied now. They fix real build
   issues. One patch comes from Gustavo, another patch comes from
   Yann.

 gcc: fix location of snapshots
 gcc: add support for gcc 4.8
 gcc: introduce BR2_GCC_NEEDS_MPC to reduce code duplication

   These add support for gcc 4.8.

 gcc: add missing $(Q)
 kernel-headers: add missing $(Q)
 uClibc: add missing $(Q)

   These are really simple fixes.

 gmp: requires host-m4
 libpcap: add missing flex/bison dependencies
 iproute2: add dependency on host-bison
 ncurses: enable shared library build on the host
 gettext: provide a host variant
 libglib2: add dependency on host-gettext
 at: needs host-flex and host-bison

   These are preparations patches for the cleanup of the mandatory
   dependencies. Since we are going to remove flex, bison and gettext
   from the mandatory dependencies, we need to add these to the
   dependencies of a certain number of packages.

   I did test some builds in a small chroot that have the new minimal
   set of Buildroot dependencies (as defined by the following patches)
   and fixed the issues that I found. However, since once host-flex
   and host-bison have been built by one package, a simple
   allyespackageconfig cannot find all the dependencies. I've done a
   few randpackageconfig builds, but for sure, only the autobuilders
   will help us finding the missing dependencies. Therefore, once the
   following patches are committed, I will change the autobuilders
   chroots to not have gettext, flex and bison installed.

 dependencies: remove a few useless mandatory dependencies
 dependencies: remove useless newlines
 dependencies: add details about which distro package to install
 dependencies: test all programs before bailing out
 dependencies: check that a full perl installation is available
 dependencies: check that SSL certificates are installed

   These are improvements to our dependency detection. The most
   important patch is obviously the first one, since it removes a
   certain number of dependencies that were in the past mandatory.

   The other ones are more minor improvements.

This series has been pushed to:

  http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=misc-improvements

Best regards,

Thomas

Gustavo Zacarias (1):
  gettext: fix tools build failure for uClibc toolchain with C++

Thomas Petazzoni (20):
  libgtk2: use non-host specific patch
  gcc: fix location of snapshots
  gcc: add support for gcc 4.8
  gcc: introduce BR2_GCC_NEEDS_MPC to reduce code duplication
  gcc: add missing $(Q)
  kernel-headers: add missing $(Q)
  uClibc: add missing $(Q)
  gmp: requires host-m4
  libpcap: add missing flex/bison dependencies
  iproute2: add dependency on host-bison
  ncurses: enable shared library build on the host
  gettext: provide a host variant
  libglib2: add dependency on host-gettext
  at: needs host-flex and host-bison
  dependencies: remove a few useless mandatory dependencies
  dependencies: remove useless newlines
  dependencies: add details about which distro package to install
  dependencies: test all programs before bailing out
  dependencies: check that a full perl installation is available
  dependencies: check that SSL certificates are installed

Yann E. MORIN (1):
  package/connman: version bump to 1.12, and fix build with newer
    kernels headers

 docs/manual/prerequisite.txt                       |    5 -
 package/at/at.mk                                   |    2 +-
 package/connman/connman-000-uclibc-backtrace.patch |   44 +++
 .../connman-001-fix-for-latest-headers-3.8+.patch  |   19 ++
 package/connman/connman-uclibc-backtrace.patch     |   44 ---
 package/connman/connman.mk                         |    2 +-
 package/gettext/gettext-fix_rpl_gettimeofday.patch |  282 ++++++++++++++++++++
 package/gettext/gettext.mk                         |    1 +
 package/gmp/gmp.mk                                 |    2 +
 package/iproute2/iproute2.mk                       |    7 +-
 package/libglib2/libglib2.mk                       |    4 +-
 .../libgtk2/host-libgtk2-reduce-dependencies.patch |  168 ------------
 package/libgtk2/libgtk2-reduce-dependencies.patch  |  117 ++++++++
 package/libgtk2/libgtk2.mk                         |    2 +
 package/libpcap/libpcap.mk                         |    2 +-
 package/ncurses/ncurses.mk                         |    2 +-
 support/dependencies/dependencies.sh               |   44 ++-
 toolchain/gcc/4.8.0/100-uclibc-conf.patch          |   37 +++
 toolchain/gcc/4.8.0/301-missing-execinfo_h.patch   |   13 +
 toolchain/gcc/4.8.0/302-c99-snprintf.patch         |   13 +
 .../gcc/4.8.0/305-libmudflap-susv3-legacy.patch    |   49 ++++
 toolchain/gcc/4.8.0/810-arm-softfloat-libgcc.patch |   30 +++
 toolchain/gcc/4.8.0/830-arm_unbreak_armv4t.patch   |   13 +
 .../powerpc-link-with-math-lib.patch.conditional   |  122 +++++++++
 toolchain/gcc/Config.in                            |   13 +
 toolchain/gcc/gcc-uclibc-4.x.mk                    |   38 +--
 toolchain/kernel-headers/kernel-headers.mk         |    2 +-
 toolchain/uClibc/uclibc.mk                         |    2 +-
 28 files changed, 806 insertions(+), 273 deletions(-)
 create mode 100644 package/connman/connman-000-uclibc-backtrace.patch
 create mode 100644 package/connman/connman-001-fix-for-latest-headers-3.8+.patch
 delete mode 100644 package/connman/connman-uclibc-backtrace.patch
 create mode 100644 package/gettext/gettext-fix_rpl_gettimeofday.patch
 delete mode 100644 package/libgtk2/host-libgtk2-reduce-dependencies.patch
 create mode 100644 package/libgtk2/libgtk2-reduce-dependencies.patch
 create mode 100644 toolchain/gcc/4.8.0/100-uclibc-conf.patch
 create mode 100644 toolchain/gcc/4.8.0/301-missing-execinfo_h.patch
 create mode 100644 toolchain/gcc/4.8.0/302-c99-snprintf.patch
 create mode 100644 toolchain/gcc/4.8.0/305-libmudflap-susv3-legacy.patch
 create mode 100644 toolchain/gcc/4.8.0/810-arm-softfloat-libgcc.patch
 create mode 100644 toolchain/gcc/4.8.0/830-arm_unbreak_armv4t.patch
 create mode 100644 toolchain/gcc/4.8.0/powerpc-link-with-math-lib.patch.conditional

-- 
1.7.9.5
