From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 15 Apr 2020 07:59:13 -0500
Subject: [Buildroot] [PATCH v4 0/8] Bump of SELinux related libs/tools to 3.0
Message-ID: <20200415125921.57648-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v4
 * Dropped proposed v3 date based version and switched back to x.y
 * Thomas P. has added a release-monitoring.org bug report on sematic
   vs date version ordering (https://github.com/fedora-infra/anitya/issues/897)
 * Set the version and site in each package to avoid variable expansion
   issues

v3
 * Switches to using the date (i.e. 20191204) abased release tagging
   for better alignment with https://release-monitoring.org/project/01717/
 * Sharing libselinux version and site across all related selinux pkgs
 * Added selinux-python which was missed in the v2 of this bump by
   Adam (http://patchwork.ozlabs.org/project/buildroot/list/?series=156673)

v1 / v2
 * Adam's series here:
    v2 - http://patchwork.ozlabs.org/project/buildroot/list/?series=156673
    v1 - http://patchwork.ozlabs.org/project/buildroot/list/?series=147113


Tested with the following reduced configuration for legal info and build.

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_POLICYCOREUTILS=y
BR2_PACKAGE_RESTORECOND=y
BR2_PACKAGE_SELINUX_PYTHON=y
BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW=y
BR2_PACKAGE_SETOOLS=y
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set

Adam Duskett (7):
  package/libselinux: bump version to 3.0
  package/libsemanage: bump version to 3.0
  package/libsepol: bump version to 3.0
  package/policycoreutils: bump version to 3.0
  package/restorecond: bump version to 3.0
  package/semodule-utils: bump version to 3.0
  package/checkpolicy: bump version to 3.0

Matt Weber (1):
  package/selinux-python: bump to version 3.0

 package/checkpolicy/checkpolicy.hash          |   2 +-
 package/checkpolicy/checkpolicy.mk            |   4 +-
 package/libselinux/0001-fix-musl-build.patch  |  22 +-
 ...-and-rely-on-the-installed-file-nam.patch} |   8 +-
 ...ng-against-musl-and-uclibc-libraries.patch |  32 +++
 ...ython-distutils-to-install-SELinux-p.patch | 207 ------------------
 ...-t-pass-bogus-I-and-L-to-python-setu.patch |  34 ---
 package/libselinux/libselinux.hash            |   2 +-
 package/libselinux/libselinux.mk              |  25 +--
 package/libsemanage/libsemanage.hash          |   2 +-
 package/libsemanage/libsemanage.mk            |  16 +-
 package/libsepol/Config.in                    |   3 +-
 package/libsepol/libsepol.hash                |   2 +-
 package/libsepol/libsepol.mk                  |   4 +-
 package/policycoreutils/policycoreutils.hash  |   2 +-
 package/policycoreutils/policycoreutils.mk    |   4 +-
 package/restorecond/restorecond.hash          |   2 +-
 package/restorecond/restorecond.mk            |   4 +-
 package/selinux-python/selinux-python.hash    |   2 +-
 package/selinux-python/selinux-python.mk      |   4 +-
 package/semodule-utils/semodule-utils.hash    |   2 +-
 package/semodule-utils/semodule-utils.mk      |   4 +-
 22 files changed, 84 insertions(+), 303 deletions(-)
 rename package/libselinux/{0006-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch => 0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch} (94%)
 create mode 100644 package/libselinux/0003-fix-building-against-musl-and-uclibc-libraries.patch
 delete mode 100644 package/libselinux/0003-libselinux-Use-Python-distutils-to-install-SELinux-p.patch
 delete mode 100644 package/libselinux/0004-src-Makefile-don-t-pass-bogus-I-and-L-to-python-setu.patch

-- 
2.17.1
