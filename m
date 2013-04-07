From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Apr 2013 12:04:32 +0200
Subject: [Buildroot] [PATCHv4 0/4] gdb support improvements
Message-ID: <1365329076-19853-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patch series makes a number of improvements to gdb handling.

The first patch converts gdb to the package infrastructure and has
already been sent to the list in two successive versions.

The second patch implements a suggestion from Yann E. Morin that we
should allow to build gdbserver/cross-gdb if the external toolchain
gdbserver is copied to the target. The idea is that if the user
chooses to copy the external toolchain gdbserver to the target, then
(s)he should be using the cross-gdb of the external toolchain in order
to avoid any incompatibility.

The third patch makes sure that we install the gdbserver binary
somewhere in the SDK, so that the Buildroot toolchain can later be
used as an external toolchain. It replaces the patch proposed by Kevin
Worth at http://patchwork.ozlabs.org/patch/229438/.

The fourth patch is a patch I had already sent some time ago, but
which was lost. It ensures the external toolchain logic finds
gdbserver for certain Sourcery CodeBench toolchains.

Changes since v3:

 * Added the fourth patch

 * Regenerate patches with rename detection, to make the first patch
   much smaller and easier to review.

 * Fix the thread dependency on the first patch. Not only the full gdb
   depends on thread support, but even gdbserver itself depends on
   it. So the gdb package as a whole now depends on threads &&
   threads_debug. The full gdb for the target additionally requires
   wchar support, but gdbserver itself does not.

Thanks.

Thomas Petazzoni (4):
  gdb: convert to the package infrastructure
  gdb: do not allow gdbserver/cross-gdb build in some cases
  gdb: install gdbserver into the SDK
  toolchain-external: support more gdbserver locations

 Config.in.legacy                                   |    9 +
 package/Config.in                                  |    1 +
 .../gdb/6.6a/100-uclibc-conf.patch                 |    0
 .../gdb/6.6a/600-fix-compile-flag-mismatch.patch   |    0
 .../gdb/6.6a/gdb-6.6-bfin-gdbserver.patch          |    0
 .../gdb/7.4.1/00_all_ptrace_setsiginfo.patch       |    0
 .../gdb/7.4.1/05_all_readline-headers.patch        |    0
 .../gdb/7.4.1/xtensa-asm-ptrace-h.patch            |    0
 .../gdb/7.4.1/xtensa-gdb-regsize.patch             |    0
 package/gdb/Config.in                              |   46 ++++
 package/gdb/Config.in.host                         |   60 +++++
 package/gdb/gdb.mk                                 |  115 ++++++++++
 toolchain/Config.in                                |    2 -
 toolchain/gdb/Config.in                            |   99 ---------
 toolchain/gdb/gdb.mk                               |  234 --------------------
 toolchain/toolchain-buildroot.mk                   |    1 -
 toolchain/toolchain-buildroot/Config.in.2          |    7 +
 toolchain/toolchain-common.in                      |    7 +-
 toolchain/toolchain-crosstool-ng.mk                |    1 -
 toolchain/toolchain-crosstool-ng/Config.in         |    3 +
 toolchain/toolchain-external.mk                    |    1 -
 toolchain/toolchain-external/Config.in             |    7 +
 toolchain/toolchain-external/ext-tool.mk           |    6 +-
 toolchain/uClibc/Config.in                         |    6 -
 24 files changed, 252 insertions(+), 353 deletions(-)
 rename {toolchain => package}/gdb/6.6a/100-uclibc-conf.patch (100%)
 rename {toolchain => package}/gdb/6.6a/600-fix-compile-flag-mismatch.patch (100%)
 rename {toolchain => package}/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch (100%)
 rename {toolchain => package}/gdb/7.4.1/00_all_ptrace_setsiginfo.patch (100%)
 rename {toolchain => package}/gdb/7.4.1/05_all_readline-headers.patch (100%)
 rename {toolchain => package}/gdb/7.4.1/xtensa-asm-ptrace-h.patch (100%)
 rename {toolchain => package}/gdb/7.4.1/xtensa-gdb-regsize.patch (100%)
 create mode 100644 package/gdb/Config.in
 create mode 100644 package/gdb/Config.in.host
 create mode 100644 package/gdb/gdb.mk
 delete mode 100644 toolchain/gdb/Config.in
 delete mode 100644 toolchain/gdb/gdb.mk

-- 
1.7.9.5
