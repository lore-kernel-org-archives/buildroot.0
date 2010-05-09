From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 10 May 2010 01:10:54 +0200
Subject: [Buildroot] [PATCH 0/6] [WIP] Add crostool-NG as backend to
	generate toolchain
Message-ID: <20100509230759.16258.48956.stgit@roazhon.bzh.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series is a snapshot of my attempt at using crosstool-NG as a backend
to generate the toolchain.

The series is two-fold:
- patch 1..5 are cleanups to lay down a proper base to add a new backend
- patch 6 is the actual addition of crosstool-NG as a new backend

This series is not final! It is *not* intended to be included as is.
It is posted for preliminary review, so as to make it ready for early
inclusion in the next release cycle.

Of particular interest:
- patch 1..4 appear to be complete, but have been lightly tested, as my
  primary goal is to first add crosstool-NG as a backend, and then fix the
  broken stuff in a generic way.

- patch 5:
  I have not thoroughly checked that the renaming was complete. There might
  be some packages that still depend on the old target, especially gdb,
  which has a dependency on 'uClibc', and I haven't checked that one (yet).

- patch 6:
  The toolchain is only built, not installed, and a lot of options from BR
  are not yet pushed into crosstool-NG's .config.

---

Yann E. MORIN (6):
      toolchain: move helper functions from external toolchain
      toolchain: rename external toolchain dir
      toolchain: move makefile includes
      toolchain: move buildroot config files
      toolchain: rename base target for external toolchains
      toolchain: add new toolchain backend: crosstool-NG


 Makefile                                           |   22 -
 toolchain/Config.in                                |   20 +
 toolchain/Config.in.1                              |    9 -
 toolchain/Config.in.2                              |  185 ----------
 toolchain/external-toolchain/Config.in             |   22 -
 toolchain/external-toolchain/Config.in.2           |   17 -
 toolchain/external-toolchain/ext-tool.mk           |  303 -----------------
 toolchain/helpers.mk                               |  208 ++++++++++++
 toolchain/toolchain-buildroot.mk                   |   15 +
 toolchain/toolchain-buildroot/Config.in            |    9 +
 toolchain/toolchain-buildroot/Config.in.2          |   37 ++
 toolchain/toolchain-common.in                      |  157 +++++++++
 toolchain/toolchain-crosstool-NG.mk                |   16 +
 toolchain/toolchain-crosstool-NG/Config.in         |   53 +++
 .../toolchain-crosstool-NG/crosstool-NG.config     |  360 ++++++++++++++++++++
 toolchain/toolchain-crosstool-NG/crosstool-NG.mk   |  118 +++++++
 toolchain/toolchain-external.mk                    |   16 +
 toolchain/toolchain-external/Config.in             |   22 +
 toolchain/toolchain-external/Config.in.2           |   17 +
 toolchain/toolchain-external/ext-tool.mk           |   98 +++++
 20 files changed, 1141 insertions(+), 563 deletions(-)
 delete mode 100644 toolchain/Config.in.1
 delete mode 100644 toolchain/Config.in.2
 delete mode 100644 toolchain/external-toolchain/Config.in
 delete mode 100644 toolchain/external-toolchain/Config.in.2
 delete mode 100644 toolchain/external-toolchain/ext-tool.mk
 create mode 100644 toolchain/helpers.mk
 create mode 100644 toolchain/toolchain-buildroot.mk
 create mode 100644 toolchain/toolchain-buildroot/Config.in
 create mode 100644 toolchain/toolchain-buildroot/Config.in.2
 create mode 100644 toolchain/toolchain-common.in
 create mode 100644 toolchain/toolchain-crosstool-NG.mk
 create mode 100644 toolchain/toolchain-crosstool-NG/Config.in
 create mode 100644 toolchain/toolchain-crosstool-NG/crosstool-NG.config
 create mode 100644 toolchain/toolchain-crosstool-NG/crosstool-NG.mk
 create mode 100644 toolchain/toolchain-external.mk
 create mode 100644 toolchain/toolchain-external/Config.in
 create mode 100644 toolchain/toolchain-external/Config.in.2
 create mode 100644 toolchain/toolchain-external/ext-tool.mk

-- 
Signature
