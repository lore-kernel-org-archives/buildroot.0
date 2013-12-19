From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Thu, 19 Dec 2013 14:37:49 -0600
Subject: [Buildroot] [PATCH v5 00/20] SELinux Buildroot Additions
Message-ID: <1387485489-4186-1-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is round 5 for the SELinux additions.

Changes in this round are mainly centered around a cleanup
of the Busybox patches. This should have been completed before
the last revision of the patches was submitted (sorry Thomas)
but it is done now. See below for some detailed information.

Patch overview:
Patches 1-14 add in the SELinux packages and required host
	dependencies.
Patch 15 adds in the shadow package
Patches 16-19 add in support for SELinux into busybox (see below
	for more details).
Patch 20 adds in a minimal x86 qemu image with SELinux support.

Busybox Additions Notes:
The busybox patches first enable the "individual binaries"
festure of busybox. This feature makes busybox build individual
binaries that link against a shared busybox library. The install
for these individual binaries is broken so the patch corrects
the issue. This patch will be submitted to the busybox mailing
list shortly.

The SELinux feature of busybox is also being enabled. This does
not enable any of the SELinux centric applets, which are also
provided by the SELinux packages, rather it just enables init to
install the SELinux policy at startup. There was discussion on whether
or not to have this be a menuconfig option or just a variable so I
left it as a menuconfig option for now.

Clayton Shotwell (17):
  pcre: Add host build support
  libselinux: new package
  ustr: new package
  bzip2: Add host build shared library installation
  libsemanage: new package
  checkpolicy: new package
  sepolgen: new package
  sqlite: Add host build support
  setools: new package
  python-pyparsing: Add host build option
  audit: new package
  policycoreutils: new package
  python-pyxml: new package
  refpolicy: new package
  shadow: new package
  refpolicy: Add busybox selections
  configs: Add SELinux x86 qemu config

Thomas Petazzoni (3):
  busybox: add option to install individual binaries
  busybox: add option to enable SELinux support
  busybox: ensure it finds pkg-config by setting PATH

 board/qemu/x86/linux-3.12-selinux.config           |   72 +
 configs/qemu_x86_selinux_defconfig                 |   28 +
 package/Config.in                                  |   15 +
 package/Config.in.host                             |    1 +
 package/audit/Config.in                            |   24 +
 package/audit/S01auditd                            |  172 +++
 ...it-0001-cross-compile-header-creation-fix.patch | 1424 ++++++++++++++++++++
 package/audit/audit-0002-remove-zos-plugin.patch   |   35 +
 package/audit/audit.mk                             |   61 +
 ...ags-strip-non-l-arguments-returned-by-pkg.patch |   28 +
 ...s-Add-installation-of-individual-binaries.patch |  103 ++
 package/busybox/Config.in                          |   10 +
 package/busybox/busybox.mk                         |   43 +
 package/bzip2/bzip2.mk                             |    2 +
 package/checkpolicy/Config.in.host                 |   10 +
 package/checkpolicy/checkpolicy.mk                 |   26 +
 package/libselinux/Config.in                       |   29 +
 package/libselinux/libselinux.mk                   |   88 ++
 package/libsemanage/Config.in                      |   30 +
 .../libsemanage-0001-execption-lib-path-fix.patch  |   14 +
 package/libsemanage/libsemanage.mk                 |   72 +
 package/pcre/pcre.mk                               |    1 +
 package/policycoreutils/Config.in                  |   88 ++
 package/policycoreutils/S15restorecond             |   85 ++
 .../policycoreutils-0001-cross-compile-fixes.patch |  332 +++++
 package/policycoreutils/policycoreutils.mk         |  231 ++++
 package/python-pyparsing/python-pyparsing.mk       |    1 +
 package/python-pyxml/Config.in                     |   11 +
 package/python-pyxml/python-xml.mk                 |   50 +
 package/refpolicy/Config.in                        |   74 +
 package/refpolicy/S12selinux                       |  137 ++
 package/refpolicy/config                           |    8 +
 package/refpolicy/modules.conf                     |  406 ++++++
 .../refpolicy-0001-gentoo-hardened-fixes.patch     | 1250 +++++++++++++++++
 package/refpolicy/refpolicy-0002-awk-fix.patch     |   37 +
 package/refpolicy/refpolicy.mk                     |   82 ++
 package/sepolgen/Config.in                         |   14 +
 package/sepolgen/sepolgen.mk                       |   31 +
 package/setools/Config.in                          |   33 +
 .../setools/setools-0001-cross-compile-fixes.patch |  121 ++
 .../setools-0002-swig-typedef-python-fixes.patch   | 1014 ++++++++++++++
 package/setools/setools.mk                         |   85 ++
 package/shadow/Config.in                           |   13 +
 package/shadow/shadow.mk                           |   50 +
 package/sqlite/sqlite.mk                           |    1 +
 package/ustr/Config.in                             |   11 +
 .../ustr-0001-cross-compile-modifications.patch    |  144 ++
 package/ustr/ustr.mk                               |   48 +
 48 files changed, 6645 insertions(+), 0 deletions(-)
 create mode 100644 board/qemu/x86/linux-3.12-selinux.config
 create mode 100644 configs/qemu_x86_selinux_defconfig
 create mode 100644 package/audit/Config.in
 create mode 100755 package/audit/S01auditd
 create mode 100644 package/audit/audit-0001-cross-compile-header-creation-fix.patch
 create mode 100644 package/audit/audit-0002-remove-zos-plugin.patch
 create mode 100644 package/audit/audit.mk
 create mode 100644 package/busybox/1.21.1/0004-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
 create mode 100644 package/busybox/1.21.1/0005-applets-Add-installation-of-individual-binaries.patch
 create mode 100644 package/checkpolicy/Config.in.host
 create mode 100644 package/checkpolicy/checkpolicy.mk
 create mode 100644 package/libselinux/Config.in
 create mode 100644 package/libselinux/libselinux.mk
 create mode 100644 package/libsemanage/Config.in
 create mode 100644 package/libsemanage/libsemanage-0001-execption-lib-path-fix.patch
 create mode 100644 package/libsemanage/libsemanage.mk
 create mode 100644 package/policycoreutils/Config.in
 create mode 100755 package/policycoreutils/S15restorecond
 create mode 100644 package/policycoreutils/policycoreutils-0001-cross-compile-fixes.patch
 create mode 100644 package/policycoreutils/policycoreutils.mk
 create mode 100644 package/python-pyxml/Config.in
 create mode 100644 package/python-pyxml/python-xml.mk
 create mode 100644 package/refpolicy/Config.in
 create mode 100644 package/refpolicy/S12selinux
 create mode 100755 package/refpolicy/config
 create mode 100644 package/refpolicy/modules.conf
 create mode 100644 package/refpolicy/refpolicy-0001-gentoo-hardened-fixes.patch
 create mode 100644 package/refpolicy/refpolicy-0002-awk-fix.patch
 create mode 100644 package/refpolicy/refpolicy.mk
 create mode 100644 package/sepolgen/Config.in
 create mode 100644 package/sepolgen/sepolgen.mk
 create mode 100644 package/setools/Config.in
 create mode 100644 package/setools/setools-0001-cross-compile-fixes.patch
 create mode 100644 package/setools/setools-0002-swig-typedef-python-fixes.patch
 create mode 100644 package/setools/setools.mk
 create mode 100644 package/shadow/Config.in
 create mode 100644 package/shadow/shadow.mk
 create mode 100644 package/ustr/Config.in
 create mode 100644 package/ustr/ustr-0001-cross-compile-modifications.patch
 create mode 100644 package/ustr/ustr.mk
