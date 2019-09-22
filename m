From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 11:06:16 +0200
Subject: [Buildroot] [PATCH 00/30] SELinux improvements
Message-ID: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

While working on SELinux support in OpenWRT, I re-did the packaging of
a number of SELinux components, and found that a few things could be
improved in Buildroot. Most notably, OpenWRT uses musl as the C
library, and I was able to make the SELinux stack working on musl
without too much effort, while libselinux (and consequently the rest
of the SELinux stack) in Buildroot currently depends on glibc.

So, this patch series:

 - Drops a number of dependencies of host-policycoreutils that are no
   longer needed, and drops passing the ARCH and DESTDIR variables
   when they are not needed

 - Drops the ustr depends from libsemanage (it is no longer used) and
   remove the ustr package as it was only used by libsemanage.

 - Introduces the musl-fts package, which is a replacement fts
   implementation that can be used when the C library is musl or
   uClibc-ng with FTS support disabled (which is our case). Then
   libselinux is modified to use musl-fts, and the glibc dependency is
   dropped from libselinux and all its reverse dependencies.

 - Re-enables libselinux on ARC (it was disabled on this architecture
   back in 2015, due to toolchain issues, but they are resolved): the
   !BR2_arc dependency is dropped from libselinux and all its reverse
   dependencies

This patch series has been tested with the following defconfigs:

* An ARM uClibc defconfig, with all affected packages enabled:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.05.1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_CHECKPOLICY=y
BR2_PACKAGE_REFPOLICY=y
BR2_PACKAGE_RESTORECOND=y
BR2_PACKAGE_SELINUX_PYTHON=y
BR2_PACKAGE_SEMODULE_UTILS=y
BR2_PACKAGE_SETOOLS=y
BR2_PACKAGE_ANDROID_TOOLS=y
BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT=y
BR2_PACKAGE_ANDROID_TOOLS_ADB=y
BR2_PACKAGE_ANDROID_TOOLS_ADBD=y
# BR2_TARGET_ROOTFS_TAR is not set

* An ARM musl defconfig, with all affected packages enabled:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2019.05.1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_CHECKPOLICY=y
BR2_PACKAGE_REFPOLICY=y
BR2_PACKAGE_RESTORECOND=y
BR2_PACKAGE_SELINUX_PYTHON=y
BR2_PACKAGE_SEMODULE_UTILS=y
BR2_PACKAGE_SETOOLS=y
BR2_PACKAGE_ANDROID_TOOLS=y
BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT=y
BR2_PACKAGE_ANDROID_TOOLS_ADB=y
BR2_PACKAGE_ANDROID_TOOLS_ADBD=y
# BR2_TARGET_ROOTFS_TAR is not set

* An ARC defconfig, with all affected packages enabled, which can be
  enabled on ARC (indeed 'audit' is still not available on ARC)

BR2_arcle=y
BR2_archs38=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arcle-hs38-full-2019.05.1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_RESTORECOND=y
BR2_PACKAGE_SELINUX_PYTHON=y
BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW=y
BR2_PACKAGE_SETOOLS=y
BR2_PACKAGE_ANDROID_TOOLS=y
BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT=y
BR2_PACKAGE_ANDROID_TOOLS_ADB=y
BR2_PACKAGE_ANDROID_TOOLS_ADBD=y
# BR2_TARGET_ROOTFS_TAR is not set

Best regards,

Thomas Petazzoni

Thomas Petazzoni (30):
  package/policycoreutils: drop host-dbus-glib dependency from
    host-policycoreutils
  package/policycoreutils: drop host-python(3) dependency for
    host-policycoreutils
  package/policycoreutils: drop host-setools dependency from
    host-policycoreutils
  package/policycoreutils: drop ARCH variable
  package/policycoreutils: don't pass DESTDIR when building host variant
  package/libsemanage: drop dependency on ustr
  package/ustr: remove package
  package/libsemanage: reformat HOST_LIBSEMANAGE_DEPENDENCIES
  package/musl-fts: new package
  package/libselinux: allow building on !glibc using musl-fts
  package/busybox: selinux support now available on !glibc configs
  package/checkpolicy: now available on !glibc configs
  package/audit: re-enable on musl
  package/selinux-python: now available on !glibc configs
  package/setools: now available on !glibc configs
  package/android-tools: fastboot now available on !glibc toolchains
  package/restorecond: now available on !glibc configs
  package/libsemanage: now available on !glibc configs
  package/policycoreutils: now available on !glibc configs
  package/refpolicy: now available on !glibc configs
  package/libselinux: re-enable on ARC
  package/setools: re-enable on ARC
  package/checkpolicy: re-enable on ARC
  package/selinux-python: re-enable audit2allow on ARC
  package/busybox: re-enable SELinux support on ARC
  package/restorecond: re-enable on ARC
  package/libsemanage: drop !BR2_arc dependency
  package/policycoreutils: drop !BR2_arc dependency
  package/refpolicy: drop !BR2_arc dependency
  package/android-tools: re-enable fastboot on ARC

 Config.in.legacy                              |   8 ++
 DEVELOPERS                                    |   2 +-
 package/Config.in                             |   2 +-
 package/android-tools/Config.in               |   8 +-
 ...tue-functions-for-strndupa-rawmemchr.patch | 133 ++++++++++++++++++
 package/audit/Config.in                       |   6 +-
 package/audit/audit.mk                        |   2 +
 package/busybox/Config.in                     |   2 -
 package/checkpolicy/Config.in                 |   8 +-
 package/libselinux/Config.in                  |  11 +-
 package/libselinux/libselinux.mk              |   5 +
 package/libsemanage/Config.in                 |  12 +-
 package/libsemanage/libsemanage.mk            |  11 +-
 package/musl-fts/Config.in                    |   7 +
 package/musl-fts/musl-fts.hash                |   3 +
 package/musl-fts/musl-fts.mk                  |  21 +++
 package/policycoreutils/Config.in             |   8 +-
 package/policycoreutils/policycoreutils.mk    |  26 +---
 package/refpolicy/Config.in                   |   8 +-
 package/restorecond/Config.in                 |   5 +-
 package/selinux-python/Config.in              |   5 +-
 package/setools/Config.in                     |   9 +-
 package/ustr/Config.in                        |  13 --
 package/ustr/ustr.hash                        |   9 --
 package/ustr/ustr.mk                          |  39 -----
 25 files changed, 214 insertions(+), 149 deletions(-)
 create mode 100644 package/audit/0002-Add-substitue-functions-for-strndupa-rawmemchr.patch
 create mode 100644 package/musl-fts/Config.in
 create mode 100644 package/musl-fts/musl-fts.hash
 create mode 100644 package/musl-fts/musl-fts.mk
 delete mode 100644 package/ustr/Config.in
 delete mode 100644 package/ustr/ustr.hash
 delete mode 100644 package/ustr/ustr.mk

-- 
2.21.0
