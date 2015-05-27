From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 27 May 2015 17:17:04 -0500
Subject: [Buildroot] [PATCH v6 00/22] SELinux Buildroot Additions
Message-ID: <1432765046-1223-1-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

### Highlevel updates in v6 of these patches
 * Reworked audit patches and startup script
 * Dropped a bash locale patch that was sent out by accident
 * Added help text to the Busybox SELinux additions
 * Reworked the setools make file, especially the Python variables
 * Fixed minor spelling errors in many packages
 * Dropped the sepolgen patch which has already been committed to
   master-next

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
could be used (target vs host) are not exposed. One example is
the audit2allow framework that requires python. This is currently
setup for "host only use" to post analyze audit service output. It
could also be setup for target use but it would require the target
to have python and other supporting libs present.
Another aspect that utilized known SELinux capable applications
was for init and logging. We choose to use sysvinit and rsyslog
instead of the busybox applet version. This simplified getting
this initial configuration pulled together.
Lastly, the building of libselinux was limited to a set of
architectures and libraries that have been tested. An area for
future work will be to enable broader use.

Some references to help with the review of this patchset.
Arch and Gentoo implementation and design details:
  https://wiki.archlinux.org/index.php/SELinux
  http://wiki.gentoo.org/wiki/SELinux
  http://wiki.gentoo.org/wiki/SELinux/Installation

### Details of changes from previous patchsets

This is a new round of patches based on the v5 patchset from
last year. The changes since v4 consist of:
 * The removal of on target policy debugging using audit2allow.
   The host tools have been setup to provide offline capability
   for analyzing audit output.
 * The example qemu configuration defaults to using full versions
   of applications instead of the busybox applets. This simplified
   the configuration but as a side effect grew the filesystem size.
   There is definitely opportunity to slim down the approach to
   just using busybox applets (I've still included the patches
   that enable the capability to create individual applets).
 * Added documentation of the qemu target to that targets readme
 * Updated for structural changes (OPTS vs OPT, patch naming,
   improvements to existing packages)
 * Autobuilder was modified to run against our upstreaming
   branch and has has logged a couple weeks of builds and almost
   all of the issues are resolved against the current upstream.

Since Refpolicy is heavily tailored for a projects use, the
package exposed options of using the provided version with
patches or a custom GIT repo. Here's a bit more detail on
those assumptions.
  * Refpolicy as the package defines with default patches
    plus possibly some global patches applied. Using a default
    modules config file provided in the package folder or
    provided by the user.
  * Refpolicy looking at specific git repo revisions. Using a
    modules config file from within that git repo.
  * Repolicy using src override which assumes the same as the
    git repo case for where the modules config file originates.

### What's next:

* Testing out support for using busybox applets instead of
  sysvinit/util-linux/etc.
* qemu targets for ARM and PPC

Clayton Shotwell (11):
  sqlite: Add host build support
  python-pyparsing: Add host build option
  audit: new package
  policycoreutils: new package
  refpolicy: new package
  busybox: applets as individual binaries
  busybox: selinux support
  qemu x86 selinux: base br defconfig
  squashfs: Add xattr support
  mtd: Add xattr support
  cpio: new package

Matt Weber (11):
  setools: new package
  linux-pam: selinux support
  busybox: added linux-pam support
  sysvinit: added libselinux dependency
  dbus: selinux file context support
  openssh: selinux and pam support
  util-linux: selinux, audit, and pam support
  vim: selinux support
  rsyslog: fix config file comment style
  qemu x86 selinux: added common selinux support files
  libsemanage: cleanup python use and license definition

 board/common_selinux/busybox-selinux.config        | 1058 ++++++++++++++++++++
 board/common_selinux/post_build.sh                 |   30 +
 .../common_selinux/skeleton/etc/audit/auditd.conf  |   32 +
 .../skeleton/etc/audit/rules.d/audit.rules         |    3 +
 board/common_selinux/skeleton/etc/fstab            |   15 +
 board/common_selinux/skeleton/etc/inittab          |   29 +
 board/common_selinux/skeleton_permissions.txt      |   26 +
 board/qemu/x86/linux-4.0-selinux.config            |   77 ++
 board/qemu/x86/readme.txt                          |   17 +
 configs/qemu_x86_selinux_defconfig                 |   67 ++
 package/Config.in                                  |    9 +
 package/Config.in.host                             |    1 +
 package/audit/0001-Enable-cross-compiling.patch    |  773 ++++++++++++++
 .../0002-Make-zos-remote-plugin-optional.patch     |   56 ++
 ...03-Default-ADDR_NO_RANDOMIZE-if-not-found.patch |   44 +
 ...o-not-call-posix_fallocate-if-unavailable.patch |   47 +
 ...Fix-header-detection-when-cross-compiling.patch |   46 +
 package/audit/Config.in                            |   18 +
 package/audit/S01auditd                            |   99 ++
 package/audit/audit.hash                           |    2 +
 package/audit/audit.mk                             |   43 +
 ...s-Add-installation-of-individual-binaries.patch |  103 ++
 ...ags-strip-non-l-arguments-returned-by-pkg.patch |   28 +
 package/busybox/Config.in                          |   26 +
 package/busybox/busybox.mk                         |   58 ++
 package/cpio/0001-stdio.in.patch                   |   19 +
 package/cpio/0002-CVE-2014-9112.patch              |  218 ++++
 package/cpio/0003-testsuite-CVE-2014-9112.patch    |   36 +
 .../0004-check_for_symlinks-CVE-2015-1197.patch    |  158 +++
 package/cpio/0005-stat.patch                       |   31 +
 package/cpio/Config.in                             |    6 +
 package/cpio/Config.in.host                        |    6 +
 package/cpio/cpio.mk                               |   13 +
 package/dbus/S30dbus                               |    4 +
 package/dbus/dbus.mk                               |   14 +
 package/libsemanage/Config.in                      |   10 -
 package/libsemanage/libsemanage.mk                 |   54 +-
 package/linux-pam/linux-pam.mk                     |   58 +-
 package/linux-pam/system-auth.pamd                 |   15 +
 package/mtd/mtd.mk                                 |   15 +-
 package/openssh/openssh.mk                         |   16 +
 .../policycoreutils/0001-cross-compile-fixes.patch |  332 ++++++
 package/policycoreutils/Config.in                  |   53 +
 package/policycoreutils/policycoreutils.hash       |    2 +
 package/policycoreutils/policycoreutils.mk         |  107 ++
 package/python-pyparsing/python-pyparsing.mk       |    1 +
 package/refpolicy-contrib/Config.in                |   19 +
 package/refpolicy-contrib/refpolicy-contrib.mk     |   18 +
 .../0001-Fix-awk-references-to-use-variable.patch  |   42 +
 package/refpolicy/Config.in                        |   91 ++
 package/refpolicy/S00selinux                       |  136 +++
 package/refpolicy/config                           |    8 +
 package/refpolicy/modules.conf                     |  406 ++++++++
 package/refpolicy/refpolicy.hash                   |    2 +
 package/refpolicy/refpolicy.mk                     |  117 +++
 package/rsyslog/rsyslog.mk                         |    4 +
 package/setools/0001-cross-compile-fixes.patch     |  125 +++
 package/setools/Config.in                          |   25 +
 package/setools/setools.hash                       |    4 +
 package/setools/setools.mk                         |   84 ++
 package/sqlite/sqlite.mk                           |    1 +
 package/squashfs/squashfs.mk                       |   12 +-
 ...1-Fix-SELinux-compile-flags-and-libraries.patch |   44 +
 package/sysvinit/sysvinit.mk                       |    5 +
 package/util-linux/util-linux.mk                   |   27 +
 package/vim/vim.mk                                 |    7 +
 66 files changed, 5003 insertions(+), 49 deletions(-)
 create mode 100644 board/common_selinux/busybox-selinux.config
 create mode 100755 board/common_selinux/post_build.sh
 create mode 100644 board/common_selinux/skeleton/etc/audit/auditd.conf
 create mode 100644 board/common_selinux/skeleton/etc/audit/rules.d/audit.rules
 create mode 100755 board/common_selinux/skeleton/etc/fstab
 create mode 100755 board/common_selinux/skeleton/etc/inittab
 create mode 100755 board/common_selinux/skeleton_permissions.txt
 create mode 100644 board/qemu/x86/linux-4.0-selinux.config
 create mode 100644 configs/qemu_x86_selinux_defconfig
 create mode 100644 package/audit/0001-Enable-cross-compiling.patch
 create mode 100644 package/audit/0002-Make-zos-remote-plugin-optional.patch
 create mode 100644 package/audit/0003-Default-ADDR_NO_RANDOMIZE-if-not-found.patch
 create mode 100644 package/audit/0004-Do-not-call-posix_fallocate-if-unavailable.patch
 create mode 100644 package/audit/0005-Fix-header-detection-when-cross-compiling.patch
 create mode 100644 package/audit/Config.in
 create mode 100644 package/audit/S01auditd
 create mode 100644 package/audit/audit.hash
 create mode 100644 package/audit/audit.mk
 create mode 100644 package/busybox/0002-applets-Add-installation-of-individual-binaries.patch
 create mode 100644 package/busybox/0008-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
 create mode 100644 package/cpio/0001-stdio.in.patch
 create mode 100644 package/cpio/0002-CVE-2014-9112.patch
 create mode 100644 package/cpio/0003-testsuite-CVE-2014-9112.patch
 create mode 100644 package/cpio/0004-check_for_symlinks-CVE-2015-1197.patch
 create mode 100644 package/cpio/0005-stat.patch
 create mode 100644 package/cpio/Config.in
 create mode 100644 package/cpio/Config.in.host
 create mode 100644 package/cpio/cpio.mk
 mode change 100755 => 100644 package/dbus/S30dbus
 create mode 100644 package/linux-pam/system-auth.pamd
 create mode 100644 package/policycoreutils/0001-cross-compile-fixes.patch
 create mode 100644 package/policycoreutils/Config.in
 create mode 100644 package/policycoreutils/policycoreutils.hash
 create mode 100644 package/policycoreutils/policycoreutils.mk
 create mode 100644 package/refpolicy-contrib/Config.in
 create mode 100644 package/refpolicy-contrib/refpolicy-contrib.mk
 create mode 100644 package/refpolicy/0001-Fix-awk-references-to-use-variable.patch
 create mode 100644 package/refpolicy/Config.in
 create mode 100644 package/refpolicy/S00selinux
 create mode 100644 package/refpolicy/config
 create mode 100644 package/refpolicy/modules.conf
 create mode 100644 package/refpolicy/refpolicy.hash
 create mode 100644 package/refpolicy/refpolicy.mk
 create mode 100644 package/setools/0001-cross-compile-fixes.patch
 create mode 100644 package/setools/Config.in
 create mode 100644 package/setools/setools.hash
 create mode 100644 package/setools/setools.mk
 create mode 100644 package/sysvinit/0001-Fix-SELinux-compile-flags-and-libraries.patch

-- 
1.9.1
