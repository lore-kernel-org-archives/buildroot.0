From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Oct 2013 16:19:10 +0200
Subject: [Buildroot] [PATCHv2 00/21] Toolchain updates: package infra,
	musl support, Linaro updates
Message-ID: <1381069171-29748-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patch set has now turned into a collection of toolchain-related
updates:

 * Switching the toolchain infrastructure to packages, so that 'make
   source', 'make external-deps' and 'make legal-info' work properly
   with the various toolchain backends.

 * Support for the musl C library in external toolchains.

 * Updates and fixes for the Linaro ARM and Aarch64 toolchains.

Thanks,

Thomas

Changes since RFCv1:

 * Remove remaining references to the Crosstool-NG backend in the
   source code, noticed by Thomas De Schampheleire.

 * Update the manual after Crosstool-NG backend removal

 * Added Acked-by on the relevant patches.

 * Ensure 'helpers.mk' is properly include from the right place after
   being moved into toolchain-external. Noticed by Luca Ceresoli.

 * Fixed a few typos in comments, noticed by Thomas De Schampheleire.

 * Renamed <pkg>_SOURCE_ADDONS to <pkg>_EXTRA_DOWNLOADS as suggested
   by Luca Ceresoli, and added documentation for this new variable in
   the Buildroot manual.

 * The support for musl-based external toolchains has been integrated
   in this patch set, together with the fix for the hardcoded
   ld-linux-arm.so problem that was noticed in the v1 of the musl
   patch set.

 * Updates for the Linaro ARM and AArch64 toolchains have been added.

 * A fix for the Linaro ARM related bug #6452 has been added.

Thomas Petazzoni (21):
  toolchain-crosstool-ng: remove support
  docs: update manual after Crosstool-NG backend removal
  toolchain-external: make ext-tool.mk includable in all cases
  toolchain: move helpers.mk into toolchain-external/
  toolchain: introduce a virtual package
  toolchain-buildroot: convert to the package infrastructure
  toolchain: intermediate .mk files no longer needed
  package: package-based implementation of source, external-deps and
    legal-info
  package: remove useless SHOW_EXTERNAL_DEPS support
  package: add a <pkg>_EXTRA_DOWNLOADS variable
  toolchain-external: convert to the package infrastructure
  dependencies: remove useless targets
  toolchain-external: conditionalize the installation of libraries
  toolchain-external: modify the wildcard logic for shared libraries
    copying
  toolchain-external: add support for musl C library
  toolchain-external: improve help text of some options
  busybox: add patches to fix build with the musl C library
  toolchain-external: update Linaro ARM toolchain
  toolchain-external: update Linaro AArch64 toolchain
  toolchain-external: improve target library copy logic
  toolchain-external: fix Linaro ARM toolchain support

 Makefile                                           |  76 +---
 docs/manual/adding-packages-generic.txt            |   6 +
 docs/manual/configure.txt                          |  60 +--
 docs/manual/customize-store.txt                    |  20 +-
 docs/manual/customize-toolchain.txt                |  12 -
 docs/manual/make-tips.txt                          |   2 -
 docs/manual/rebuilding-packages.txt                |   2 -
 package/Makefile.in                                |   2 +-
 ...01-libbb-use-poll.h-instead-of-sys-poll.h.patch |  32 ++
 ...onfig-include-linux-if_slip.h-instead-of-.patch |  33 ++
 ...libiproute-use-linux-if_packet.h-instead-.patch |  36 ++
 package/libglib2/libglib2.mk                       |   2 +-
 package/pkg-download.mk                            |  44 +-
 package/pkg-generic.mk                             |  22 +-
 support/dependencies/dependencies.mk               |   8 -
 toolchain/Config.in                                |  22 +-
 toolchain/toolchain-buildroot.mk                   |   9 -
 .../toolchain-buildroot/toolchain-buildroot.mk     |  17 +
 toolchain/toolchain-common.in                      |   4 -
 toolchain/toolchain-crosstool-ng.mk                |   5 -
 toolchain/toolchain-crosstool-ng/Config.in         | 133 ------
 .../crosstool-ng.config-eglibc                     | 502 ---------------------
 .../crosstool-ng.config-glibc                      | 491 --------------------
 .../crosstool-ng.config-uClibc                     | 473 -------------------
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   | 396 ----------------
 toolchain/toolchain-external.mk                    |   4 -
 toolchain/toolchain-external/Config.in             |  61 ++-
 toolchain/{ => toolchain-external}/helpers.mk      |  34 +-
 .../{ext-tool.mk => toolchain-external.mk}         | 221 ++++-----
 toolchain/toolchain/toolchain.mk                   |  18 +
 30 files changed, 384 insertions(+), 2363 deletions(-)
 create mode 100644 package/busybox/1.21.1/0001-libbb-use-poll.h-instead-of-sys-poll.h.patch
 create mode 100644 package/busybox/1.21.1/0002-network-ifconfig-include-linux-if_slip.h-instead-of-.patch
 create mode 100644 package/busybox/1.21.1/0003-networking-libiproute-use-linux-if_packet.h-instead-.patch
 delete mode 100644 toolchain/toolchain-buildroot.mk
 create mode 100644 toolchain/toolchain-buildroot/toolchain-buildroot.mk
 delete mode 100644 toolchain/toolchain-crosstool-ng.mk
 delete mode 100644 toolchain/toolchain-crosstool-ng/Config.in
 delete mode 100644 toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc
 delete mode 100644 toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc
 delete mode 100644 toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc
 delete mode 100644 toolchain/toolchain-crosstool-ng/crosstool-ng.mk
 delete mode 100644 toolchain/toolchain-external.mk
 rename toolchain/{ => toolchain-external}/helpers.mk (94%)
 rename toolchain/toolchain-external/{ext-tool.mk => toolchain-external.mk} (82%)
 create mode 100644 toolchain/toolchain/toolchain.mk

-- 
1.8.1.2
