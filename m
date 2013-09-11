From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 11 Sep 2013 16:59:20 -0500
Subject: [Buildroot] [PATCH v2 00/17] SELinux Buildroot Additions
Message-ID: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is Round 2 for the SELinux package additions.
General changes in this version
  - General formatting cleanup on all files to match the buildroot standard.
  - Reworked the Python selects and dependencies to be a little simpler.
    Now, when Python is enabled, all Python bindings are built for the
    SELinux packages.
  - Moved all of the SELinux libraries to a Libraries -> Security folder.
  - More information on SELinux and how to enable it (see below).

Per Thomas Petazzoni's <thomas.petazzoni@free-electrons.com> email, here is
a brief overview of SELinux and how I have implemented it in buildroot.

SELinux is made up of several packages and Linux kernel configurations.
The best reference, at least the most complete, is probably the SELinux
Notebook at the link below.  The notebook details how SELinux works and
gives very good examples on how to implement SELinux policies.

http://www.freetechbooks.com/the-selinux-notebook-the-foundations-t785.html

Packages:
   libsepol
   libselinux
   libsemanage
   checkpolicy
   sepolgen
   setools
   policycoreutils
   refpolicy

For this implementation, I have added a package hierarchy that will allow
for both a debugging and a paired down release version.  The debugging
version required Python support, and is therefore much larger while the
release version does not.  To enable the release version, simply select
the refpolicy package (BR2_PACKAGE_REFPOLICY) and it selects all of the 
necessary packages to enable SELinux. For the debugging version, select
the policycoreutils debugging configure option
(BR2_PACKAGE_POLICYCOREUTILS_POLICY_DEBUGGING).  This will pull in Python
and a bunch of other packages into the build to debug the SELinux policy 
on target.  

Caveats:
   1. The Linux kernel config will need to be changed to enable SELinux
      support and extended attribute support on the file systems
   2. The busybox config will need to be changed to remove some packages
      or to build each executable as a stand-alone package. The busybox
      symlinks don't work well with the default refpolicy.
   3. The audit package will need to be enabled to log issues with the
      SELinux policy, especially if it is in enforcing mode.
   4. If a modular SELinux policy is selected, 
      BR2_PACKAGE_REFPOLICY_MONOLITHIC = n, then the policy will be compiled
      on target during the first boot which will take a long time (about
      a half hour on a pandaboard).

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

 package/Config.in                                  |   20 +
 package/Config.in.host                             |    1 +
 package/audit/Config.in                            |   10 +
 package/audit/S14auditd                            |  172 +++
 .../audit-0001-crossCompileHeaderCreationFix.patch | 1420 ++++++++++++++++++++
 package/audit/audit-0002-remove-zos-plugin.patch   |   35 +
 package/audit/audit.mk                             |   58 +
 package/bzip2/bzip2.mk                             |    2 +
 package/checkpolicy/Config.in.host                 |   10 +
 package/checkpolicy/checkpolicy.mk                 |   30 +
 package/libcgroup/Config.in                        |    4 +
 package/libcgroup/libcgroup.mk                     |   38 +
 package/libselinux/Config.in                       |   13 +
 package/libselinux/libselinux.mk                   |   93 ++
 package/libsemanage/Config.in                      |   14 +
 .../libsemanage-0001-execptionLibPathFix.patch     |   14 +
 package/libsemanage/libsemanage.mk                 |   80 ++
 package/libsepol/Config.in                         |    7 +
 package/libsepol/libsepol.mk                       |   48 +
 package/pcre/pcre.mk                               |    1 +
 package/policycoreutils/Config.in                  |   69 +
 package/policycoreutils/S15restorecond             |   85 ++
 .../policycoreutils-0001-crossCompileFixes.patch   |  332 +++++
 package/policycoreutils/policycoreutils.mk         |  230 ++++
 package/python-pyparsing/python-pyparsing.mk       |   47 +-
 package/python-pyxml/Config.in                     |   11 +
 package/python-pyxml/python-xml.mk                 |   58 +
 package/refpolicy/Config.in                        |   88 ++
 package/refpolicy/S12selinux                       |  134 ++
 package/refpolicy/config                           |   10 +
 .../refpolicy-0001-gentoo_hardened_fixes.patch     | 1250 +++++++++++++++++
 package/refpolicy/refpolicy.mk                     |   86 ++
 package/sepolgen/Config.in                         |    8 +
 package/sepolgen/sepolgen.mk                       |   35 +
 package/setools/Config.in                          |   16 +
 .../setools/setools-0001-cross_compile_fixes.patch |  121 ++
 .../setools-0002-swig_typedef_python_fixes.patch   | 1014 ++++++++++++++
 package/setools/setools.mk                         |   85 ++
 package/shadow/Config.in                           |   13 +
 package/shadow/shadow.mk                           |   49 +
 package/sqlite/sqlite.mk                           |    1 +
 package/ustr/Config.in                             |    6 +
 .../ustr/ustr-0001-crossCompileModifications.patch |  144 ++
 package/ustr/ustr.mk                               |   55 +
 44 files changed, 6004 insertions(+), 13 deletions(-)
 create mode 100644 package/audit/Config.in
 create mode 100755 package/audit/S14auditd
 create mode 100644 package/audit/audit-0001-crossCompileHeaderCreationFix.patch
 create mode 100644 package/audit/audit-0002-remove-zos-plugin.patch
 create mode 100644 package/audit/audit.mk
 create mode 100644 package/checkpolicy/Config.in.host
 create mode 100644 package/checkpolicy/checkpolicy.mk
 create mode 100644 package/libcgroup/Config.in
 create mode 100644 package/libcgroup/libcgroup.mk
 create mode 100644 package/libselinux/Config.in
 create mode 100644 package/libselinux/libselinux.mk
 create mode 100644 package/libsemanage/Config.in
 create mode 100644 package/libsemanage/libsemanage-0001-execptionLibPathFix.patch
 create mode 100644 package/libsemanage/libsemanage.mk
 create mode 100644 package/libsepol/Config.in
 create mode 100644 package/libsepol/libsepol.mk
 create mode 100644 package/policycoreutils/Config.in
 create mode 100755 package/policycoreutils/S15restorecond
 create mode 100644 package/policycoreutils/policycoreutils-0001-crossCompileFixes.patch
 create mode 100644 package/policycoreutils/policycoreutils.mk
 create mode 100644 package/python-pyxml/Config.in
 create mode 100644 package/python-pyxml/python-xml.mk
 create mode 100644 package/refpolicy/Config.in
 create mode 100644 package/refpolicy/S12selinux
 create mode 100755 package/refpolicy/config
 create mode 100644 package/refpolicy/refpolicy-0001-gentoo_hardened_fixes.patch
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
 create mode 100644 package/ustr/ustr-0001-crossCompileModifications.patch
 create mode 100644 package/ustr/ustr.mk
