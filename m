From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Dec 2012 00:44:20 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem-qemu v5
Message-ID: <1355183112-10735-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

This patch series adds qemu as a package to run on the target.

Although this may sound weird in a first place, I use it to build a
simple VM server.

I also use it to build statically-linked user-emulation to run foreign
chroots on my PC (eg. running an ARM chroot on my x86_64), because
using glibc for static-linking is not possible (it still requires some
shared libs that it dlopens at runtime).

In the future, I plan on adding libvirt to remotely manage the VM server.

Changes v4 -> v5:
  - drop autoreconf where not needed (Thomas)
  - explain autoreconf for slirp (Thomas)
  - fix host-qemu incorrect dependencies on target packages (Arnout)
  - fix vde2 description and URL (Arnout)
  - add missing dependencies in some Config.in (with help from Peter)
  - fix another SF URL

Changes v3 -> v4:
  - drop applied cURL fix (Peter)
  - fix some licenses infos (Thomas, Arnout)
  - rename DTC's make goals (Arnout) [*]
  - no longer autoreconf libiscsi (Thomas)
  - use autotools-package infra for qemu
  - drop bsd-user emulation, it does not build on Linux
  - move DTC to the end of the series, in case it is still a problem.

  [*] Not really using the names we discussed on the list, as Thomas said
      on IRC: "do not over-engineer", or "YAGNI". When/if the make-package
      infra is added, it will *then* be time to rename the variables, and
      nothing can guarantee that the names we choose *now* will still be
      relevant *then* .

Changes v2 -> v3:
  - act on Arnout's comments on v2:
    - cURL fix as a post-patch hook rather than post-install hook
    - dtc package name, install tools
    - usbredir cleanups
    - cegui06 package name
  - update to qemu 1.2.1

Thank you!

Regards,
Yann E. MORIN.

The following changes since commit 7ffda3e241c4d57394d9f5eeb19e41a3546c0495:

  tcllib: new package (2012-12-10 22:36:03 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-qemu

Yann E. MORIN (52):
      package/qemu: add license information
      package/qemu: fix host-qemu variable names
      package/qemu: fix host dependencies
      package/qemu: use autotools-package infrastructure
      package/qemu: bump version
      package/vde2: new package
      package/libiscsi: new package
      package/usbredir: new package
      package/celt051: new package
      package/python-pyparsing: new package
      package/spice-protocol: new package
      package/cegui06: new package
      package/slirp: new package
      package/spice: new package
      package/spice: enable client
      package/spice: enable GUI
      package/spice: enable slirp support
      package/libseccomp: new package
      package/keyutils: new package
      package/pmake: add host pmake
      package/libbsd: new package
      package/libedit2: new package
      package/ceph: new package
      package/qemu: build for the target (i386 or x86_64 only)
      package/qemu: add basic target selection
      package/qemu: add fine-grained target selection
      package/qemu: add SDL frontends
      package/qemu: add option to enable/disable the VNC frontend
      package/qemu: add VNC jpeg and png compression
      package/qemu: add VNC TLS-encryption
      package/qemu: add option to not install blobs
      package/qemu: add option to remove unwanted keymaps
      package/qemu: add uuid support
      package/qemu: add support for capabilities
      package/qemu: add attr/xattr option
      package/qemu: add support for virtfs
      package/qemu: add support for cURL
      package/qemu: enable use of the curses frontend
      package/qemu: add BlueZ connectivity
      package/qemu: add AIO support
      package/qemu: add support for VDE switches
      package/qemu: add iSCSI support
      package/qemu: add support for USB redirection
      package/qemu: add support for Spice
      package/qemu: enable sound
      package/qemu: add support for libseccomp
      package/qemu: option to build the docs
      package/qemu: move sub-options into a sub-menu
      package/qemu: enable a static build
      package/dtc: new package
      package/dtc: add option to install programs
      package/qemu: add support for FDT

 package/Config.in                                  |   15 +
 package/cegui06/Config.in                          |   15 +
 package/cegui06/cegui06-stddef.h.patch             |   26 +
 package/cegui06/cegui06.mk                         |   36 +
 package/ceph/Config.in                             |   18 +
 package/ceph/ceph-no-envz.patch                    |   63 +
 package/ceph/ceph-no-getloadavg.patch              |   61 +
 package/ceph/ceph-no-posix_fallocate.patch         |   50 +
 package/ceph/ceph.mk                               |   53 +
 package/dtc/Config.in                              |   29 +
 package/dtc/dtc-extra_cflags.patch                 |   27 +
 package/dtc/dtc-separate-lib-install.patch         |   28 +
 package/dtc/dtc.mk                                 |   51 +
 package/keyutils/Config.in                         |    7 +
 .../keyutils-01-memleak-from-realloc.patch         |   51 +
 package/keyutils/keyutils-02-another-memleak.patch |   32 +
 package/keyutils/keyutils-03-cifs.patch            |   15 +
 .../keyutils-04-Makefile-for-buildroot.patch       |   65 +
 .../keyutils/keyutils-05-fix-install-rule.patch    |   19 +
 package/keyutils/keyutils.mk                       |   32 +
 package/libbsd/Config.in                           |   10 +
 package/libbsd/libbsd.mk                           |   21 +
 package/libedit2/Config.in                         |    9 +
 package/libedit2/libedit2-01-Makefile.patch        |   25 +
 package/libedit2/libedit2-02-el.c-issetugid.patch  |   24 +
 package/libedit2/libedit2-03-el.c-MAXPATHLEN.patch |   40 +
 .../libedit2/libedit2-04-readline.h-stdio.patch    |   17 +
 .../libedit2/libedit2-08-readline-history.h.patch  |   20 +
 .../libedit2/libedit2-10-define_SIZE_T_MAX.patch   |   18 +
 .../libedit2/libedit2-12-libedit-Makefile.patch    |   54 +
 package/libedit2/libedit2-20-fortify.patch         |   23 +
 package/libedit2/libedit2.mk                       |   75 +
 package/libedit2/libedit2.pc                       |   13 +
 package/libiscsi/Config.in                         |   12 +
 package/libiscsi/libiscsi.mk                       |   15 +
 package/libseccomp/Config.in                       |   13 +
 ...ibseccomp-use-system-headers-from-sysroot.patch |   17 +
 package/libseccomp/libseccomp.mk                   |   22 +
 package/multimedia/Config.in                       |    1 +
 package/multimedia/celt051/Config.in               |   15 +
 package/multimedia/celt051/celt.mk                 |   30 +
 package/pmake/pmake-100_mk.patch                   | 2624 ++++++++++++++++++++
 package/pmake/pmake-110_mkdep.patch                |  230 ++
 package/pmake/pmake-120_fixes.patch                |  266 ++
 package/pmake/pmake-130_maxpathlen.patch           |   39 +
 package/pmake/pmake-140_multiarch.patch            |  354 +++
 package/pmake/pmake-150_mktemp.patch               |   31 +
 package/pmake/pmake.mk                             |   46 +
 package/python-pyparsing/Config.in                 |   11 +
 package/python-pyparsing/python-pyparsing.mk       |   38 +
 package/qemu/Config.in                             |  338 +++
 package/qemu/qemu-static-curl.patch                |   72 +
 package/qemu/qemu-static-sdl.patch                 |   54 +
 package/qemu/qemu.mk                               |  331 +++-
 package/slirp/Config.in                            |   25 +
 package/slirp/slirp.mk                             |   21 +
 package/spice-protocol/Config.in                   |   12 +
 package/spice-protocol/spice-protocol.mk           |   14 +
 package/spice/Config.in                            |   51 +
 package/spice/spice.mk                             |   80 +
 package/usbredir/Config.in                         |   28 +
 package/usbredir/usbredir.mk                       |   31 +
 package/vde2/Config.in                             |   10 +
 package/vde2/vde2.mk                               |   36 +
 64 files changed, 5888 insertions(+), 21 deletions(-)
 create mode 100644 package/cegui06/Config.in
 create mode 100644 package/cegui06/cegui06-stddef.h.patch
 create mode 100644 package/cegui06/cegui06.mk
 create mode 100644 package/ceph/Config.in
 create mode 100644 package/ceph/ceph-no-envz.patch
 create mode 100644 package/ceph/ceph-no-getloadavg.patch
 create mode 100644 package/ceph/ceph-no-posix_fallocate.patch
 create mode 100644 package/ceph/ceph.mk
 create mode 100644 package/dtc/Config.in
 create mode 100644 package/dtc/dtc-extra_cflags.patch
 create mode 100644 package/dtc/dtc-separate-lib-install.patch
 create mode 100644 package/dtc/dtc.mk
 create mode 100644 package/keyutils/Config.in
 create mode 100644 package/keyutils/keyutils-01-memleak-from-realloc.patch
 create mode 100644 package/keyutils/keyutils-02-another-memleak.patch
 create mode 100644 package/keyutils/keyutils-03-cifs.patch
 create mode 100644 package/keyutils/keyutils-04-Makefile-for-buildroot.patch
 create mode 100644 package/keyutils/keyutils-05-fix-install-rule.patch
 create mode 100644 package/keyutils/keyutils.mk
 create mode 100644 package/libbsd/Config.in
 create mode 100644 package/libbsd/libbsd.mk
 create mode 100644 package/libedit2/Config.in
 create mode 100644 package/libedit2/libedit2-01-Makefile.patch
 create mode 100644 package/libedit2/libedit2-02-el.c-issetugid.patch
 create mode 100644 package/libedit2/libedit2-03-el.c-MAXPATHLEN.patch
 create mode 100644 package/libedit2/libedit2-04-readline.h-stdio.patch
 create mode 100644 package/libedit2/libedit2-08-readline-history.h.patch
 create mode 100644 package/libedit2/libedit2-10-define_SIZE_T_MAX.patch
 create mode 100644 package/libedit2/libedit2-12-libedit-Makefile.patch
 create mode 100644 package/libedit2/libedit2-20-fortify.patch
 create mode 100644 package/libedit2/libedit2.mk
 create mode 100644 package/libedit2/libedit2.pc
 create mode 100644 package/libiscsi/Config.in
 create mode 100644 package/libiscsi/libiscsi.mk
 create mode 100644 package/libseccomp/Config.in
 create mode 100644 package/libseccomp/libseccomp-use-system-headers-from-sysroot.patch
 create mode 100644 package/libseccomp/libseccomp.mk
 create mode 100644 package/multimedia/celt051/Config.in
 create mode 100644 package/multimedia/celt051/celt.mk
 create mode 100644 package/pmake/pmake-100_mk.patch
 create mode 100644 package/pmake/pmake-110_mkdep.patch
 create mode 100644 package/pmake/pmake-120_fixes.patch
 create mode 100644 package/pmake/pmake-130_maxpathlen.patch
 create mode 100644 package/pmake/pmake-140_multiarch.patch
 create mode 100644 package/pmake/pmake-150_mktemp.patch
 create mode 100644 package/pmake/pmake.mk
 create mode 100644 package/python-pyparsing/Config.in
 create mode 100644 package/python-pyparsing/python-pyparsing.mk
 create mode 100644 package/qemu/Config.in
 create mode 100644 package/qemu/qemu-static-curl.patch
 create mode 100644 package/qemu/qemu-static-sdl.patch
 create mode 100644 package/slirp/Config.in
 create mode 100644 package/slirp/slirp.mk
 create mode 100644 package/spice-protocol/Config.in
 create mode 100644 package/spice-protocol/spice-protocol.mk
 create mode 100644 package/spice/Config.in
 create mode 100644 package/spice/spice.mk
 create mode 100644 package/usbredir/Config.in
 create mode 100644 package/usbredir/usbredir.mk
 create mode 100644 package/vde2/Config.in
 create mode 100644 package/vde2/vde2.mk
