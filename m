From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 10:25:27 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.02/toolchain-improvements
Message-ID: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of patches that mainly improves the toolchain
configuration and support, with two majors directions :

 * Turn BR2_LARGEFILE, BR2_INET_RPC, BR2_INET_RPC and similar options
   into hidden options, and let the toolchain backends present them as
   they wish. For example for RPC, xthe Buildroot backend says "Do you
   want RPC ?" while the external toolchain backend doesn't show the
   option when glibc is used, or present an option "Does your
   toolchain has RPC ?" when uclibc is used.

   So really those options should now be called
   BR2_TOOLCHAIN_HAS_LARGEFILE, BR2_TOOLCHAIN_HAS_INET_RPC, etc, but
   we kept the old names in this patch series because changing them
   impacts all packages. This will be done later.

   A first commit handles largefile, rpc, ipv6, locale and program
   invocation options, and some later commits handle the C++ option
   and thread options.

 * Extend external toolchain with "profiles", i.e well-known external
   toolchains. For those toolchains, Buildroot can automatically
   download and install them and will automatically select the
   appropriate configuration options (C library used, RPC, IPv6,
   locale, etc.). So an user can know tell Buildroot to use a
   CodeSourcery toolchain, and Buildroot will do all the job. Such
   toolchains are extracted in $(O)/external-toolchain, but my intent
   is to move it to $(O)/toolchain once Gustavoz's toolchain cleanup
   work is done.

   This work keeps the ability of doing some more manual things with
   external toolchains:

     - For an external toolchain profile, you can tell Buildroot *not*
       to download it, and in that case, you must provide Buildroot
       with the location of the external toolchain.

     - You keep the ability to specify a custom profile, where you
       will have to tell Buildroot everything: location of the
       toolchain, toolchain prefix, C library used, etc.

In my opinion, those two directions really make the external
toolchains easier and simpler to use. One topic left is the gdb
options, but I decided not to change it, in order to not conflict too
much with Gustavoz's work.

The rest of the changes are more minor modifications, related to these
toolchain improvements.

Regards,

Thomas

The following changes since commit 7e9c3a387820154fd1355f23c2669072c0c3a5f7:
  Peter Korsgaard (1):
        docs/news.html: add 2010.11 announce link

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2011.02/toolchain-improvements

Thomas Petazzoni (15):
      toolchain: Improve C library option selection
      toolchain: remove ending semi-colon in helpers
      toolchain: add support for external toolchain profiles and download
      toolchain: remove toolchain-specific stripping
      toolchain: rework C++ options
      toolchain: move Stack Protection Support option
      ltp-testsuite: bump version and use autotargets
      toolchain: rework thread options
      toolchain: check that the thread option selection is correct
      gcc: disable libgomp when thread support is disabled
      uclibc: add patch for uClibc snapshot to fix build issue
      toolchain: BR2_NEEDS_GETTEXT must be y when uClibc is used
      toolchain: expose thread options in the Crosstool-NG backend
      toolchain: more verbose in crosstool-ng backend
      package: pass TARGET_MAKE_ENV at install/clean/uninstall steps

 Makefile                                           |    3 +-
 package/Makefile.autotools.in                      |   10 +-
 package/Makefile.in                                |   12 +-
 package/dmalloc/dmalloc.mk                         |    6 +-
 package/ltp-testsuite/Config.in                    |   15 +-
 ...tp-testsuite-20101031-disable-controllers.patch |   25 ++
 .../ltp-testsuite-disable-ipv6-tests.patch         |  123 ----------
 .../ltp-testsuite-enable-openposix-for-nptl.patch  |   33 ---
 .../ltp-testsuite-generate-needs-bash.patch        |    8 -
 .../ltp-testsuite-sched-getaffinity.patch          |   11 -
 .../ltp-testsuite-uclibc-syscalls.patch            |   11 -
 package/ltp-testsuite/ltp-testsuite.mk             |   68 +------
 package/lzma/Config.in                             |    4 +-
 package/multimedia/ffmpeg/ffmpeg.mk                |    6 +-
 package/openvpn/openvpn.mk                         |    6 +-
 package/rpm/Config.in                              |    4 +-
 toolchain/Config.in                                |    5 +-
 toolchain/Makefile.in                              |    6 -
 toolchain/gcc/gcc-uclibc-4.x.mk                    |    8 +-
 toolchain/helpers.mk                               |   16 +-
 toolchain/toolchain-buildroot/Config.in.2          |  101 ++++++++
 toolchain/toolchain-common.in                      |  121 ++---------
 toolchain/toolchain-crosstool-ng/Config.in         |   95 ++++++++-
 .../toolchain-crosstool-ng/crosstool-ng.config     |    8 +-
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |   25 ++-
 toolchain/toolchain-external/Config.in             |  240 +++++++++++++++++++-
 toolchain/toolchain-external/Config.in.2           |   17 --
 toolchain/toolchain-external/ext-tool.mk           |  212 ++++++++++++------
 ...tconf-only-use-specs-names-when-available.patch |  131 +++++++++++
 toolchain/uClibc/uclibc.mk                         |    2 +-
 30 files changed, 827 insertions(+), 505 deletions(-)
 create mode 100644 package/ltp-testsuite/ltp-testsuite-20101031-disable-controllers.patch
 delete mode 100644 package/ltp-testsuite/ltp-testsuite-disable-ipv6-tests.patch
 delete mode 100644 package/ltp-testsuite/ltp-testsuite-enable-openposix-for-nptl.patch
 delete mode 100644 package/ltp-testsuite/ltp-testsuite-generate-needs-bash.patch
 delete mode 100644 package/ltp-testsuite/ltp-testsuite-sched-getaffinity.patch
 delete mode 100644 package/ltp-testsuite/ltp-testsuite-uclibc-syscalls.patch
 delete mode 100644 toolchain/toolchain-external/Config.in.2
 create mode 100644 toolchain/uClibc/uClibc.snapshot.getconf-only-use-specs-names-when-available.patch

Thanks,
-- 
Thomas Petazzoni
