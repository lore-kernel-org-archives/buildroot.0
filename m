From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 15 Dec 2014 21:53:52 -0600
Subject: [Buildroot] [PATCH 00/29] SELinux Buildroot Additions
Message-ID: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

### What's SELinux?

Security-Enhanced Linux (SELinux) is a Linux feature that provides
a variety of security policies, including U.S. Department of Defense
style mandatory access controls (MAC), through the use of Linux
Security Modules (LSM) in the Linux kernel. It is not a Linux
distribution, but rather a set of modifications that can be applied
to Unix-like operating systems, such as Linux and BSD.

Running SELinux under a Linux distribution requires three things:
An SELinux enabled kernel, SELinux Userspace tools and libraries,
and SELinux Policies (mostly based on the Reference Policy). Some
common Linux programs will also need to be patched/compiled with
SELinux features. (Credit Archlinux wiki)

### What's in this patchset?

This patchset adds the required userspace tools, libraries, example
QEMU target, existing package modifications, and initial policy
to Buildroot.
The design approach took a minimalist view to the selinux capability.
The necessary packages have been added but all the ways in which they
could be used (target vs host) are not exposed.  One example is
the audit2allow framework that requires python.  This is currently
setup for "host only use" to post analyze audit service output.  It
could also be setup for target use but it would require the target
to have python and other supporting libs present.
Another aspect that utilized known SELinux capable applications
was for init and logging.  We choose to use sysvinit and rsyslog
instead of the busybox applet version.  This simplified getting
this initial configuration pulled together.  Use of busybox
applications is definitely an area where things could slim down
with more time and testing.
Lastly, the building of libselinux was limited to a set of
architectures and libraries that have been tested.  An area for
future work will be to enable broader use.

Some references to help with the review of this patchset.
Arch and Gentoo implementation and design details:
  https://wiki.archlinux.org/index.php/SELinux
  http://wiki.gentoo.org/wiki/SELinux
  http://wiki.gentoo.org/wiki/SELinux/Installation

### Details of changes from previous patchsets

This is a new round of patches based on the v5 patchset from
last year.  The changes since v5 consist of:
  * The removal of on target policy debugging using audit2allow.
    The host tools have been setup to provide a offline capability
    for analyzing audit output.
  * The example qemu configuration defaults to using full versions
    of applications instead of the busybox applets.  This simplified
    the configuration but as a side affect grew the filesystem size.
    There is definitely opportunity to slim down the approach to
    just using busybox applets (I've still included the patches
    that enable the capability to create individual applets).
  * Added documentation of the qemu target to that targets readme
  * Updated for structural changes (OPTS vs OPT, patch naming,
    improvements to existing packages)
  * Autobuilder was modified to run against our upstreaming
    branch (over 600 tests so far).  It identified the issues
    noted below.

### Known issues:

  * libselinux/libsemanage/setools have been limited to just
    glibc and arm/ppc/x86 archs for now until QEMU targets
    are configured to test against additional configurations.
    * libselinux]
      - error: dlfcn.h: No such file or directory -
        (bfin-buildroot-uclinux-uclibc)
      - #error Sorry... uClibc was built without large file
        support - (powerpc-buildroot-linux-uclibc)
      - /crtbeginT.o: relocation R_MIPS_HI16 against `a local
        symbol' can not be used when making a shared object;
        recompile with -fPIC - (mipsel-buildroot-linux-uclibc)
    * setools]
      - configure: error: SETools requires a C99-compliant
        C compiler to build. - (i486-ctng-linux-uclibc-gcc)
    * shadow]
      - (configure: error: posix_spawn is needed for nscd
        support) (mipsel-ctng-linux-uclibc)

Since Refpolicy is heavily tailored for a projects use, the
package exposed options of using the provided version with
patches or a custom GIT repo. Here's a bit more detail on
those assumptions.
  * Refpolicy as the package defines with default patches
    plus possibly some global patches applied.  Using a default
    modules config file provided in the package folder or
    provided by the user.
  * Refpolicy looking at specific git repo revisions.  Using a
    modules config file from within that git repo.
  * Repolicy using src override which assumes the same as the
    git repo case for where the modules config file originates.

### What's next:

* Testing out support for using busybox applets instead of
  sysvinit/util-linux/etc.
* Updating the qemu example to use a auto generated busybox config
  based on package selections and selinux being enabled.
* qemu targets for ARM and PPC



Clayton Shotwell (14):
  libselinux: new package
  ustr: new package
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
  qemu_x86_selinux_defconfig: base SELinux QEMU image for x86

Matt Weber (15):
  repolicy: base policy modifications for embedded target
  refpolicy: custom git repo
  busybox: applets as individual binaries
  busybox: selinux support
  busybox: added linux-pam support
  busybox: default selinux config which disables init and uses sysvinit
  linux-pam: selinux support
  sysvinit: added libselinux dependency
  dbus: selinux file context support
  logrotate: selinux support
  openssh: selinux and pam support
  util-linux: selinux, audit, and pam support
  vim: selinux support
  rsyslog: fix config file comment style
  qemu x86 readme: documented selinux target

 board/qemu/x86/busybox-selinux.config              | 1038 ++++++++++++++
 board/qemu/x86/linux-3.12-selinux.config           |   77 ++
 board/qemu/x86/readme.txt                          |   18 +
 configs/qemu_x86_selinux_defconfig                 |   53 +
 package/Config.in                                  |   20 +
 package/Config.in.host                             |    1 +
 .../0001-cross-compile-header-creation-fix.patch   | 1424 ++++++++++++++++++++
 package/audit/0002-remove-zos-plugin.patch         |   35 +
 package/audit/Config.in                            |   14 +
 package/audit/S01auditd                            |  172 +++
 package/audit/audit.mk                             |   57 +
 package/busybox/Config.in                          |   10 +
 ...s-Add-installation-of-individual-binaries.patch |  103 ++
 ...ags-strip-non-l-arguments-returned-by-pkg.patch |   28 +
 package/busybox/busybox.mk                         |   52 +
 package/checkpolicy/Config.in.host                 |   10 +
 package/checkpolicy/checkpolicy.mk                 |   26 +
 package/dbus/S30dbus                               |    4 +
 package/dbus/dbus.mk                               |   14 +
 package/libselinux/Config.in                       |   19 +
 package/libselinux/libselinux.mk                   |   70 +
 .../libsemanage/0001-execption-lib-path-fix.patch  |   14 +
 package/libsemanage/Config.in                      |   30 +
 package/libsemanage/libsemanage.mk                 |   72 +
 .../linux-pam-08-audit-log-acct_message_ret.patch  |   16 +
 package/linux-pam/linux-pam.mk                     |   58 +-
 package/linux-pam/system-auth.pamd                 |   15 +
 package/logrotate/logrotate.mk                     |   11 +-
 package/openssh/openssh.mk                         |   12 +
 .../policycoreutils/0001-cross-compile-fixes.patch |  332 +++++
 package/policycoreutils/Config.in                  |   73 +
 package/policycoreutils/S15restorecond             |   85 ++
 package/policycoreutils/policycoreutils.mk         |  224 +++
 package/python-pyparsing/python-pyparsing.mk       |    1 +
 package/python-pyxml/Config.in                     |   11 +
 package/python-pyxml/python-xml.mk                 |   50 +
 package/refpolicy-contrib/Config.in                |   20 +
 package/refpolicy-contrib/refpolicy-contrib.mk     |   19 +
 package/refpolicy/0001-gentoo-hardened-fixes.patch | 1250 +++++++++++++++++
 package/refpolicy/0002-baseDirectoryChanges.patch  |   39 +
 package/refpolicy/0003-filesChanges.patch          |   69 +
 package/refpolicy/0004-initChanges.patch           |   20 +
 package/refpolicy/0005-selinuxutilChanges.patch    |  103 ++
 package/refpolicy/0006-sshChanges.patch            |   22 +
 package/refpolicy/0007-loggingChanges.patch        |   87 ++
 package/refpolicy/0008-mountChanges.patch          |   11 +
 package/refpolicy/0009-sysadmChanges.patch         |   24 +
 package/refpolicy/0010-authloginChanges.patch      |   14 +
 package/refpolicy/0011-localloginChanges.patch     |   20 +
 package/refpolicy/0012-udevChanges.patch           |   21 +
 package/refpolicy/0013-netutilsChanges.patch       |   20 +
 package/refpolicy/0014-devicesChanges.patch        |   55 +
 package/refpolicy/0015-awk-fix.patch               |   37 +
 .../refpolicy/0016-enablePolyinstantiation.patch   |   11 +
 package/refpolicy/Config.in                        |   94 ++
 package/refpolicy/S12selinux                       |  137 ++
 package/refpolicy/config                           |    8 +
 package/refpolicy/modules.conf                     |  406 ++++++
 package/refpolicy/refpolicy.mk                     |  109 ++
 package/rsyslog/rsyslog.mk                         |    4 +
 package/sepolgen/Config.in                         |   15 +
 package/sepolgen/sepolgen.mk                       |   25 +
 package/setools/0001-cross-compile-fixes.patch     |  121 ++
 .../setools/0002-swig-typedef-python-fixes.patch   | 1014 ++++++++++++++
 package/setools/Config.in                          |   23 +
 package/setools/setools.mk                         |   69 +
 package/shadow/Config.in                           |   13 +
 package/shadow/shadow.mk                           |   50 +
 package/sqlite/sqlite.mk                           |    1 +
 .../sysvinit-0010-fix-WITH-SELINUX-define.patch    |   24 +
 package/sysvinit/sysvinit.mk                       |   11 +-
 .../ustr/0001-cross-compile-modifications.patch    |  144 ++
 package/ustr/Config.in                             |   11 +
 package/ustr/ustr.mk                               |   48 +
 package/util-linux/util-linux.mk                   |   21 +
 package/vim/vim.mk                                 |    7 +
 76 files changed, 8443 insertions(+), 3 deletions(-)
 create mode 100644 board/qemu/x86/busybox-selinux.config
 create mode 100644 board/qemu/x86/linux-3.12-selinux.config
 create mode 100644 configs/qemu_x86_selinux_defconfig
 create mode 100644 package/audit/0001-cross-compile-header-creation-fix.patch
 create mode 100644 package/audit/0002-remove-zos-plugin.patch
 create mode 100644 package/audit/Config.in
 create mode 100644 package/audit/S01auditd
 create mode 100644 package/audit/audit.mk
 create mode 100644 package/busybox/busybox-0007-applets-Add-installation-of-individual-binaries.patch
 create mode 100644 package/busybox/busybox-0008-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
 create mode 100644 package/checkpolicy/Config.in.host
 create mode 100644 package/checkpolicy/checkpolicy.mk
 mode change 100755 => 100644 package/dbus/S30dbus
 create mode 100644 package/libselinux/Config.in
 create mode 100644 package/libselinux/libselinux.mk
 create mode 100644 package/libsemanage/0001-execption-lib-path-fix.patch
 create mode 100644 package/libsemanage/Config.in
 create mode 100644 package/libsemanage/libsemanage.mk
 create mode 100644 package/linux-pam/linux-pam-08-audit-log-acct_message_ret.patch
 create mode 100644 package/linux-pam/system-auth.pamd
 create mode 100644 package/policycoreutils/0001-cross-compile-fixes.patch
 create mode 100644 package/policycoreutils/Config.in
 create mode 100644 package/policycoreutils/S15restorecond
 create mode 100644 package/policycoreutils/policycoreutils.mk
 create mode 100644 package/python-pyxml/Config.in
 create mode 100644 package/python-pyxml/python-xml.mk
 create mode 100644 package/refpolicy-contrib/Config.in
 create mode 100644 package/refpolicy-contrib/refpolicy-contrib.mk
 create mode 100644 package/refpolicy/0001-gentoo-hardened-fixes.patch
 create mode 100644 package/refpolicy/0002-baseDirectoryChanges.patch
 create mode 100644 package/refpolicy/0003-filesChanges.patch
 create mode 100644 package/refpolicy/0004-initChanges.patch
 create mode 100644 package/refpolicy/0005-selinuxutilChanges.patch
 create mode 100644 package/refpolicy/0006-sshChanges.patch
 create mode 100644 package/refpolicy/0007-loggingChanges.patch
 create mode 100644 package/refpolicy/0008-mountChanges.patch
 create mode 100644 package/refpolicy/0009-sysadmChanges.patch
 create mode 100644 package/refpolicy/0010-authloginChanges.patch
 create mode 100644 package/refpolicy/0011-localloginChanges.patch
 create mode 100644 package/refpolicy/0012-udevChanges.patch
 create mode 100644 package/refpolicy/0013-netutilsChanges.patch
 create mode 100644 package/refpolicy/0014-devicesChanges.patch
 create mode 100644 package/refpolicy/0015-awk-fix.patch
 create mode 100644 package/refpolicy/0016-enablePolyinstantiation.patch
 create mode 100644 package/refpolicy/Config.in
 create mode 100644 package/refpolicy/S12selinux
 create mode 100644 package/refpolicy/config
 create mode 100644 package/refpolicy/modules.conf
 create mode 100644 package/refpolicy/refpolicy.mk
 create mode 100644 package/sepolgen/Config.in
 create mode 100644 package/sepolgen/sepolgen.mk
 create mode 100644 package/setools/0001-cross-compile-fixes.patch
 create mode 100644 package/setools/0002-swig-typedef-python-fixes.patch
 create mode 100644 package/setools/Config.in
 create mode 100644 package/setools/setools.mk
 create mode 100644 package/shadow/Config.in
 create mode 100644 package/shadow/shadow.mk
 create mode 100644 package/sysvinit/sysvinit-0010-fix-WITH-SELINUX-define.patch
 create mode 100644 package/ustr/0001-cross-compile-modifications.patch
 create mode 100644 package/ustr/Config.in
 create mode 100644 package/ustr/ustr.mk

-- 
1.9.1
