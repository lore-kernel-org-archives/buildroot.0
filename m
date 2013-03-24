From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 10:37:35 +0100
Subject: [Buildroot] [PATCH v3 0/3] gdb support improvements
Message-ID: <1364117858-6626-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patch series makes a number of improvements to gdb handling.

The first patch converts gdb to the package infrastructure and has
already been sent to the list in two successive versions. There is no
additional change to this patch in this version 3.

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

Thomas Petazzoni (3):
  gdb: convert to the package infrastructure
  gdb: do not allow gdbserver/cross-gdb build in some cases
  gdb: install gdbserver into the SDK

 Config.in.legacy                                   |    9 +
 package/Config.in                                  |    1 +
 package/gdb/6.6a/100-uclibc-conf.patch             |   82 +++++
 .../gdb/6.6a/600-fix-compile-flag-mismatch.patch   |   69 +++++
 package/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch      |  238 +++++++++++++++
 package/gdb/7.4.1/00_all_ptrace_setsiginfo.patch   |  314 ++++++++++++++++++++
 package/gdb/7.4.1/05_all_readline-headers.patch    |   42 +++
 package/gdb/7.4.1/xtensa-asm-ptrace-h.patch        |   22 ++
 package/gdb/7.4.1/xtensa-gdb-regsize.patch         |   19 ++
 package/gdb/Config.in                              |   46 +++
 package/gdb/Config.in.host                         |   60 ++++
 package/gdb/gdb.mk                                 |  115 +++++++
 toolchain/Config.in                                |    2 -
 toolchain/gdb/6.6a/100-uclibc-conf.patch           |   82 -----
 .../gdb/6.6a/600-fix-compile-flag-mismatch.patch   |   69 -----
 toolchain/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch    |  238 ---------------
 toolchain/gdb/7.4.1/00_all_ptrace_setsiginfo.patch |  314 --------------------
 toolchain/gdb/7.4.1/05_all_readline-headers.patch  |   42 ---
 toolchain/gdb/7.4.1/xtensa-asm-ptrace-h.patch      |   22 --
 toolchain/gdb/7.4.1/xtensa-gdb-regsize.patch       |   19 --
 toolchain/gdb/Config.in                            |   99 ------
 toolchain/gdb/gdb.mk                               |  234 ---------------
 toolchain/toolchain-buildroot.mk                   |    1 -
 toolchain/toolchain-buildroot/Config.in.2          |    7 +
 toolchain/toolchain-common.in                      |    7 +-
 toolchain/toolchain-crosstool-ng.mk                |    1 -
 toolchain/toolchain-crosstool-ng/Config.in         |    3 +
 toolchain/toolchain-external.mk                    |    1 -
 toolchain/toolchain-external/Config.in             |    7 +
 toolchain/uClibc/Config.in                         |    6 -
 30 files changed, 1035 insertions(+), 1136 deletions(-)
 create mode 100644 package/gdb/6.6a/100-uclibc-conf.patch
 create mode 100644 package/gdb/6.6a/600-fix-compile-flag-mismatch.patch
 create mode 100644 package/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch
 create mode 100644 package/gdb/7.4.1/00_all_ptrace_setsiginfo.patch
 create mode 100644 package/gdb/7.4.1/05_all_readline-headers.patch
 create mode 100644 package/gdb/7.4.1/xtensa-asm-ptrace-h.patch
 create mode 100644 package/gdb/7.4.1/xtensa-gdb-regsize.patch
 create mode 100644 package/gdb/Config.in
 create mode 100644 package/gdb/Config.in.host
 create mode 100644 package/gdb/gdb.mk
 delete mode 100644 toolchain/gdb/6.6a/100-uclibc-conf.patch
 delete mode 100644 toolchain/gdb/6.6a/600-fix-compile-flag-mismatch.patch
 delete mode 100644 toolchain/gdb/6.6a/gdb-6.6-bfin-gdbserver.patch
 delete mode 100644 toolchain/gdb/7.4.1/00_all_ptrace_setsiginfo.patch
 delete mode 100644 toolchain/gdb/7.4.1/05_all_readline-headers.patch
 delete mode 100644 toolchain/gdb/7.4.1/xtensa-asm-ptrace-h.patch
 delete mode 100644 toolchain/gdb/7.4.1/xtensa-gdb-regsize.patch
 delete mode 100644 toolchain/gdb/Config.in
 delete mode 100644 toolchain/gdb/gdb.mk

-- 
1.7.9.5
