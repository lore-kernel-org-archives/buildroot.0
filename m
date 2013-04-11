From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 21:46:32 +0200
Subject: [Buildroot] [git commit] gdb: convert to the package infrastructure
Message-ID: <20130411211021.ED5BE9B5A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0b6faaab4dcb7e372fe16ffb335e39b9e06a8fb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit converts gdb to the package infrastructure, and therefore
moves it from toolchain/gdb to package/gdb.

The target package is now visible in "Package selection for the
target" => "Debugging, profiling and benchmark". The main option,
"gdb", forcefully selects the "gdbserver" sub-option by
default. Another sub-option, "full debugger" allows to install the
complete gdb on the target. When this option is enabled, then
"gdbserver" is no longer forcefully selected. This ensures that at
least gdbserver or the full debugger gets built/installed, so that the
package is not a no-op.

The host debugger is still enabled through a configuration option in
"Toolchain". It is now visible regardless of the toolchain type (it
used to be hidden for External Toolchains). The configuration options
relative to the host debugger are now in package/gdb/Config.in.host,
similar to how we have package/binutils/Config.in.host.

Since gdb is now a proper package, it is no longer allowed to 'select
BR2_PTHREADS_DEBUG' to ensure thread debugging is available when
needed. Instead, it now 'depends on
BR2_TOOLCHAIN_HAS_THREADS_DEBUG'. This option, in turn, is selected by
the different toolchain backends when appropriate. The
'BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED' option is removed, since
we no longer need to know when it is allowed to 'select
BR2_PTHREADS_DEBUG'. Also, the 'BR2_PTHREADS_DEBUG' option is moved to
appear right below the thread implementation selection (in the case of
the Buildroot toolchain backend).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in.legacy                                   |    9 +
 package/Config.in                                  |    1 +
 .../gdb/6.6a/100-uclibc-conf.patch                 |    0
 .../gdb/6.6a/600-fix-compile-flag-mismatch.patch   |    0
 .../gdb/6.6a/gdb-6.6-bfin-gdbserver.patch          |    0
 .../gdb/7.4.1/00_all_ptrace_setsiginfo.patch       |    0
 .../gdb/7.4.1/05_all_readline-headers.patch        |    0
 .../gdb/7.4.1/xtensa-asm-ptrace-h.patch            |    0
 .../gdb/7.4.1/xtensa-gdb-regsize.patch             |    0
 package/gdb/Config.in                              |   41 ++++
 package/gdb/Config.in.host                         |   56 +++++
 package/gdb/gdb.mk                                 |  101 +++++++++
 toolchain/Config.in                                |    2 -
 toolchain/gdb/Config.in                            |   99 --------
 toolchain/gdb/gdb.mk                               |  234 --------------------
 toolchain/toolchain-buildroot.mk                   |    1 -
 toolchain/toolchain-buildroot/Config.in.2          |    7 +
 toolchain/toolchain-common.in                      |    7 +-
 toolchain/toolchain-crosstool-ng.mk                |    1 -
 toolchain/toolchain-crosstool-ng/Config.in         |    3 +
 toolchain/toolchain-external.mk                    |    1 -
 toolchain/toolchain-external/Config.in             |    7 +
 toolchain/uClibc/Config.in                         |    6 -
 23 files changed, 226 insertions(+), 350 deletions(-)

Patch is too large, so refusing to show it
