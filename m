From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 4 Sep 2013 18:09:39 -0500
Subject: [Buildroot] [PATCH 00/17] SELinux Buildroot Additions
Message-ID: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Submitting an initial patch set to add SELinux support to Buildroot.
This patch set adds packages required for an SELinux system along with
the packages needed to build them.

The next patch set will be a set to add flags into existing packages to
enable SELinux support in those packages. A final set of patches will
be submitted to give an example SELinux configuration that targets a
specific platform.

A couple of note on these packages.  The audit package contains a large patch
to add support for cross compiling.  This patch has been submitted to the 
audit developers for incorporation into their build structure. There are
several patches fixing the makefiles of packages to enable cross compiling.

Clayton Shotwell (17):
  libsepol: new package
  libselinux: new package
  ustr: new package
  libsemanage: new package
  checkpolicy: new package
  sepolgen: new package
  setools: new package
  libcgroup: new package
  policycoreutils: new package
  python-pyxml: new package
  refpolicy: new package
  python-pyparsing: Add host build option
  audit: new package
  shadow: new package
  pcre: Add host build support
  bzip2: Add host build shared library installation
  sqlite: Add host build support

 package/Config.in                                  |   18 +
 package/audit/Config.in                            |   26 +
 package/audit/S14auditd                            |  172 +++
 ...audit-2.3.1-crossCompileHeaderCreationFix.patch | 1388 ++++++++++++++++++++
 package/audit/audit-2.3.1-remove-zos-plugin.patch  |   31 +
 package/audit/audit.mk                             |   61 +
 package/bzip2/bzip2.mk                             |    2 +
 package/checkpolicy/Config.in                      |   11 +
 package/checkpolicy/checkpolicy.mk                 |   71 +
 package/libcgroup/Config.in                        |    4 +
 package/libcgroup/libcgroup.mk                     |   22 +
 package/libselinux/Config.in                       |   22 +
 package/libselinux/libselinux.mk                   |  128 ++
 package/libsemanage/Config.in                      |   21 +
 .../libsemanage-2.1.10-execptionLibPathFix.patch   |   10 +
 package/libsemanage/libsemanage.mk                 |  113 ++
 package/libsepol/Config.in                         |    7 +
 package/libsepol/libsepol.mk                       |   69 +
 package/pcre/pcre.mk                               |    1 +
 package/policycoreutils/Config.in                  |   64 +
 package/policycoreutils/S15restorecond             |   85 ++
 .../policycoreutils-crossCompileFixes.patch        |  328 +++++
 package/policycoreutils/policycoreutils.mk         |  200 +++
 package/python-pyparsing/python-pyparsing.mk       |   47 +-
 package/python-pyxml/Config.in                     |   11 +
 package/python-pyxml/python-xml.mk                 |   64 +
 package/refpolicy/Config.in                        |   87 ++
 package/refpolicy/S12selinux                       |  134 ++
 package/refpolicy/config                           |   10 +
 .../refpolicy-001-gentoo_hardened_fixes.patch      | 1250 ++++++++++++++++++
 package/refpolicy/refpolicy.mk                     |   84 ++
 package/sepolgen/Config.in                         |    7 +
 package/sepolgen/sepolgen.mk                       |   46 +
 package/setools/Config.in                          |   22 +
 .../setools/setools-0001-cross_compile_fixes.patch |  116 ++
 .../setools-0002-swig_typedef_python_fixes.patch   | 1010 ++++++++++++++
 package/setools/setools.mk                         |   91 ++
 package/shadow/Config.in                           |   13 +
 package/shadow/shadow.mk                           |   53 +
 package/sqlite/sqlite.mk                           |    1 +
 package/ustr/Config.in                             |    6 +
 .../ustr-1.0.4-crossCompileModifications.patch     |  104 ++
 package/ustr/ustr.mk                               |   68 +
 43 files changed, 6065 insertions(+), 13 deletions(-)
 create mode 100644 package/audit/Config.in
 create mode 100755 package/audit/S14auditd
 create mode 100644 package/audit/audit-2.3.1-crossCompileHeaderCreationFix.patch
 create mode 100644 package/audit/audit-2.3.1-remove-zos-plugin.patch
 create mode 100644 package/audit/audit.mk
 create mode 100644 package/checkpolicy/Config.in
 create mode 100644 package/checkpolicy/checkpolicy.mk
 create mode 100644 package/libcgroup/Config.in
 create mode 100644 package/libcgroup/libcgroup.mk
 create mode 100644 package/libselinux/Config.in
 create mode 100644 package/libselinux/libselinux.mk
 create mode 100644 package/libsemanage/Config.in
 create mode 100644 package/libsemanage/libsemanage-2.1.10-execptionLibPathFix.patch
 create mode 100644 package/libsemanage/libsemanage.mk
 create mode 100644 package/libsepol/Config.in
 create mode 100644 package/libsepol/libsepol.mk
 create mode 100644 package/policycoreutils/Config.in
 create mode 100755 package/policycoreutils/S15restorecond
 create mode 100644 package/policycoreutils/policycoreutils-crossCompileFixes.patch
 create mode 100644 package/policycoreutils/policycoreutils.mk
 create mode 100644 package/python-pyxml/Config.in
 create mode 100644 package/python-pyxml/python-xml.mk
 create mode 100644 package/refpolicy/Config.in
 create mode 100644 package/refpolicy/S12selinux
 create mode 100755 package/refpolicy/config
 create mode 100644 package/refpolicy/refpolicy-001-gentoo_hardened_fixes.patch
 create mode 100644 package/refpolicy/refpolicy.mk
 create mode 100644 package/sepolgen/Config.in
 create mode 100644 package/sepolgen/sepolgen.mk
 create mode 100644 package/setools/Config.in
 create mode 100644 package/setools/setools-0001-cross_compile_fixes.patch
 create mode 100644 package/setools/setools-0002-swig_typedef_python_fixes.patch
 create mode 100644 package/setools/setools.mk
 create mode 100644 package/shadow/Config.in
 create mode 100644 package/shadow/shadow.mk
 create mode 100644 package/ustr/Config.in
 create mode 100644 package/ustr/ustr-1.0.4-crossCompileModifications.patch
 create mode 100644 package/ustr/ustr.mk
