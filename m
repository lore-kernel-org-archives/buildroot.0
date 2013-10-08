From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Oct 2013 20:16:57 +0200
Subject: [Buildroot] [PATCHv3 00/20] Toolchain updates: package infra,
	musl support, Linaro updates, glibc fixes
Message-ID: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a new version of the toolchain fixes and updates. Careful
review of patches 19 and 20 would be appreciated.

Peter, the other patches (before 19 and 20) can be merged even if
there is still ongoing discussion on patches 19 and 20.

Changes since v2:

 * Different order for the patches: the intrusive modification of the
   package infrastructure to support package-based 'make
   external-deps' is pushed at the end of the series, since it's most
   likely to be the commit causing the biggest amount of
   discussion/testing.

 * Two fixes for the internal glibc build logic have been added.

 * The helpers.mk is no longer moved into
   toolchain/toolchain-external/. Even though moving it in this
   location is not causing any problem, it is not very logical, since
   it's also used by the package/glibc/glibc.mk file, part of the
   internal toolchain backend.

 * Some minor cleanup of the helpers.mk file.

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

Thanks,

Thomas

Thomas Petazzoni (20):
  glibc: both eglibc and glibc need host-gawk
  glibc: fix glibc build by creating an empty gnu/stubs.h
  package: add a <pkg>_EXTRA_DOWNLOADS variable
  toolchain: introduce a virtual package
  toolchain-buildroot: convert to the package infrastructure
  toolchain-external: convert to the package infrastructure
  dependencies: remove useless targets
  toolchain-external: conditionalize the installation of libraries
  toolchain: modify the wildcard logic for shared libraries copying
  toolchain: fix the helpers.mk comment
  toolchain: do not check largefile, wchar, IPv6 and locale for glibc
    toolchains
  toolchain-external: add support for musl C library
  toolchain-external: improve help text of some options
  busybox: add patches to fix build with the musl C library
  toolchain-external: update Linaro ARM toolchain
  toolchain-external: update Linaro AArch64 toolchain
  toolchain-external: improve target library copy logic
  toolchain-external: fix Linaro ARM toolchain support
  package: package-based implementation of source, external-deps and
    legal-info
  package: remove useless SHOW_EXTERNAL_DEPS support

 Makefile                                           |  70 ++-----
 docs/manual/adding-packages-generic.txt            |   6 +
 ...01-libbb-use-poll.h-instead-of-sys-poll.h.patch |  32 +++
 ...onfig-include-linux-if_slip.h-instead-of-.patch |  33 ++++
 ...libiproute-use-linux-if_packet.h-instead-.patch |  36 ++++
 package/glibc/glibc.mk                             |  27 ++-
 package/pkg-download.mk                            |  44 +----
 package/pkg-generic.mk                             |  22 ++-
 support/dependencies/dependencies.mk               |   8 -
 toolchain/Config.in                                |   9 +
 toolchain/helpers.mk                               |  46 +++--
 toolchain/toolchain-buildroot.mk                   |   9 -
 .../toolchain-buildroot/toolchain-buildroot.mk     |  17 ++
 toolchain/toolchain-external.mk                    |   4 -
 toolchain/toolchain-external/Config.in             |  61 ++++--
 .../{ext-tool.mk => toolchain-external.mk}         | 220 +++++++++++----------
 toolchain/toolchain/toolchain.mk                   |  18 ++
 17 files changed, 391 insertions(+), 271 deletions(-)
 create mode 100644 package/busybox/1.21.1/0001-libbb-use-poll.h-instead-of-sys-poll.h.patch
 create mode 100644 package/busybox/1.21.1/0002-network-ifconfig-include-linux-if_slip.h-instead-of-.patch
 create mode 100644 package/busybox/1.21.1/0003-networking-libiproute-use-linux-if_packet.h-instead-.patch
 delete mode 100644 toolchain/toolchain-buildroot.mk
 create mode 100644 toolchain/toolchain-buildroot/toolchain-buildroot.mk
 delete mode 100644 toolchain/toolchain-external.mk
 rename toolchain/toolchain-external/{ext-tool.mk => toolchain-external.mk} (82%)
 create mode 100644 toolchain/toolchain/toolchain.mk

-- 
1.8.1.2
