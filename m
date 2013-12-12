From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Thu, 12 Dec 2013 12:27:00 -0600
Subject: [Buildroot] [ PATCH v4 00/20] SELinux Buildroot Additions
Message-ID: <1386872840-22051-1-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is round 4 for the SELinux package additions.
General changes for this round include:
  - Incorporating many changes from Thomas Petazzoni (Thank again!).
  - Removal of clean make options.
  - Cleanup of the refpolicy build to rename the generated policy
    and limit the number of package policies that get built. More
    can be added in later.
  - Changed the audit startup script to launch before the logging
    script.
  - Cleaned up the dependencies on several packages.
  - Added busybox SELinux configuration options to enable SELinux
    support and also make all of the busybox applications stand-
    alone binaries rather than symlinks (work done by Thomas).
  - Added a basic x86 configuration that has SELinux enabled.

This round of change enables SELinux to be built by enabling
the BR2_PACKAGE_REFPOLICY and enabling the following kernel config
options. 
	CONFIG_AUDIT
	CONFIG_SECURITY
	CONFIG_SECURITY_NETWORK
	CONFIG_SECURITY_SELINUX
	CONFIG_SECURITY_SELINUX_BOOTPARAM
	CONFIG_EXT2_FS_XATTR
	CONFIG_EXT2_FS_SECURITY

I have tested this version of the patches using a buildroot glibc
toolchain. The SELinux policy does not currently support most of
Buildroot system but it is definitely a start. There will need to
be more customization work done in the future to get packages fully
supported.

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
 configs/qemu_x86_selinux_defconfig                 |   27 +
 package/Config.in                                  |   15 +
 package/Config.in.host                             |    1 +
 package/audit/Config.in                            |   24 +
 package/audit/S01auditd                            |  172 +++
 ...it-0001-cross-compile-header-creation-fix.patch | 1424 ++++++++++++++++++++
 package/audit/audit-0002-remove-zos-plugin.patch   |   35 +
 package/audit/audit.mk                             |   61 +
 ...ags-strip-non-l-arguments-returned-by-pkg.patch |   28 +
 package/busybox/Config.in                          |    6 +
 package/busybox/busybox.mk                         |   33 +
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
 package/python-pyparsing/python-pyparsing.mk       |   47 +-
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
 package/ustr/ustr.mk                               |   47 +
 47 files changed, 6559 insertions(+), 13 deletions(-)
 create mode 100644 board/qemu/x86/linux-3.12-selinux.config
 create mode 100644 configs/qemu_x86_selinux_defconfig
 create mode 100644 package/audit/Config.in
 create mode 100755 package/audit/S01auditd
 create mode 100644 package/audit/audit-0001-cross-compile-header-creation-fix.patch
 create mode 100644 package/audit/audit-0002-remove-zos-plugin.patch
 create mode 100644 package/audit/audit.mk
 create mode 100644 package/busybox/1.21.1/0004-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
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
