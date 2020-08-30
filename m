From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 30 Aug 2020 16:18:44 +0200
Subject: [Buildroot] [git commit] package/util-linux: build programs and
 libraries in separate packages
Message-ID: <20200902161639.C3B8985EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8bafc6dc8ad13000a58af980650ff59a78399ae2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The different tools and libraries in util-linux have a lot of optional
dependencies. When we want to support those optional dependencies, we
can easily generate dependency cycles. For instance, findmount and lsblk
need udev to work correctly, but eudev and systemd both depend libblkid,
which comes from util-linux.

Normal distros (e.g. Debian) solve this by first building a minimal
package that has no dependencies at all, then build the packages that
depend on util-linux, and finally rebuild util-linux with all bells and
whistles. Solve it in Buildroot by means of the following changes:

- Split util-linux into two packages:
  - util-linux-libs, providing lib{blkid,fdisk,mount,smartcols,uuid}.
  - util-linux, providing both the aforementioned libs and the programs.
- Add a blind selection for util-linux-libs, i.e. it is indirectly
  selected according to the util-linux options.
- Make host and target util-linux have a build dependencies on the -libs
  packages.
- Make eudev and systemd have build dependencies on util-linux-libs.
  This can be extended to other packages in the future but is not needed
  right now because the configuration options are backward-compatible.
- Make util-linux have an optional build dependency on the package that
  provides libudev (either eudev or systemd), if it is selected.

Installing util-linux overrides files installed by util-linux-libs but
this is not a problem: it's allowed for a package to overwrite files
from another package, as long as there is a dependency between the two.

util-linux-libs has a Config.in symbol for the package as a whole, but
not for the individual libraries: it simply reuses the symbols of the
full package.

The build dependency of util-linux on util-linux-libs ensures that
util-linux overwrites the files installed by util-linux-libs and not
vice versa. In practice this dependency shouldn't be needed: the only
reason for util-linux-libs to be built is to break a circular
dependency. In that case, there is already a transitive dependency of
util-linux on util-linux-libs, so adding it explicitly is redundant.
Still, better safe than sorry.

host-util-linux-libs is not needed at the moment. It can be added if we
have a dependency cycle problem later.

With this approach we don't need to patch configuration files neither
change packages other than eudev and systemd.

Other packages that require util-linux libraries and whose libraries may
be used by util-linux programs can be updated later. We also don't need
to change any existing defconfig, since all configuration options are
kept in the util-linux package.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=11811

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/eudev/Config.in                            |  1 +
 package/eudev/eudev.mk                             |  3 +-
 package/systemd/Config.in                          |  1 +
 package/systemd/systemd.mk                         |  2 +-
 package/util-linux/Config.in                       |  3 +
 .../util-linux-libs/util-linux-libs.hash           |  1 +
 .../util-linux/util-linux-libs/util-linux-libs.mk  | 86 ++++++++++++++++++++++
 package/util-linux/util-linux.mk                   | 32 ++++++--
 8 files changed, 120 insertions(+), 9 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index b0ce76171a..0e5bd0cee9 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_EUDEV
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_UDEV_GENTOO_SCRIPTS if BR2_INIT_OPENRC
 	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_KMOD
 	help
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 8b677e76b6..9cf4361956 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -18,7 +18,8 @@ EUDEV_CONF_OPTS = \
 	--enable-kmod \
 	--enable-blkid
 
-EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
+# eudev requires only the util-linux libraries at build time
+EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux-libs kmod
 EUDEV_PROVIDES = udev
 
 ifeq ($(BR2_ROOTFS_MERGED_USR),)
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index f21c8d32dd..74029aff05 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -28,6 +28,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_DBUS # runtime dependency only
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_UTIL_LINUX_AGETTY
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e356cb1add..e0e1dd1a3f 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -15,7 +15,7 @@ SYSTEMD_DEPENDENCIES = \
 	host-gperf \
 	kmod \
 	libcap \
-	util-linux \
+	util-linux-libs \
 	$(TARGET_NLS_DEPENDENCIES)
 
 SYSTEMD_PROVIDES = udev
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index aa3c1a5f76..1f33eb5514 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -9,6 +9,9 @@ menuconfig BR2_PACKAGE_UTIL_LINUX
 
 if BR2_PACKAGE_UTIL_LINUX
 
+config BR2_PACKAGE_UTIL_LINUX_LIBS
+	bool
+
 config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	bool "libblkid"
 	depends on BR2_USE_MMU # fork()
diff --git a/package/util-linux/util-linux-libs/util-linux-libs.hash b/package/util-linux/util-linux-libs/util-linux-libs.hash
new file mode 120000
index 0000000000..dc1b2f866a
--- /dev/null
+++ b/package/util-linux/util-linux-libs/util-linux-libs.hash
@@ -0,0 +1 @@
+../util-linux.hash
\ No newline at end of file
diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
new file mode 100644
index 0000000000..a0ec153bfb
--- /dev/null
+++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
@@ -0,0 +1,86 @@
+################################################################################
+#
+# util-linux-libs
+#
+################################################################################
+
+# Please keep this file as similar as possible to util-linux.mk
+
+UTIL_LINUX_LIBS_VERSION = $(UTIL_LINUX_VERSION)
+UTIL_LINUX_LIBS_SOURCE = $(UTIL_LINUX_SOURCE)
+UTIL_LINUX_LIBS_SITE = $(UTIL_LINUX_SITE)
+UTIL_LINUX_LIBS_DL_SUBDIR = $(UTIL_LINUX_DL_SUBDIR)
+
+# README.licensing claims that some files are GPL-2.0 only, but this is not
+# true. Some files are GPL-3.0+ but only in tests and optionally in hwclock
+# (but we disable that option). rfkill uses an ISC-style license.
+UTIL_LINUX_LIBS_LICENSE = LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3-Clause (libuuid)
+UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
+	Documentation/licenses/COPYING.BSD-3-Clause \
+	Documentation/licenses/COPYING.LGPL-2.1-or-later
+
+UTIL_LINUX_LIBS_INSTALL_STAGING = YES
+UTIL_LINUX_LIBS_DEPENDENCIES = \
+	host-pkgconf \
+	$(TARGET_NLS_DEPENDENCIES)
+UTIL_LINUX_LIBS_CONF_OPTS += \
+	--disable-rpath \
+	--disable-makeinstall-chown
+
+UTIL_LINUX_LIBS_LINK_LIBS = $(TARGET_NLS_LIBS)
+
+# Prevent the installation from attempting to move shared libraries from
+# ${usrlib_execdir} (/usr/lib) to ${libdir} (/lib), since both paths are
+# the same when merged usr is in use.
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+UTIL_LINUX_LIBS_CONF_OPTS += --bindir=/usr/bin --sbindir=/usr/sbin --libdir=/usr/lib
+endif
+
+# systemd depends on util-linux-libs so we disable systemd support
+UTIL_LINUX_LIBS_CONF_OPTS += \
+	--without-systemd \
+	--with-systemdsystemunitdir=no
+
+# systemd/eudev depend on util-linux-libs so we disable udev support
+UTIL_LINUX_LIBS_CONF_OPTS += --without-udev
+
+# No libs use wchar
+UTIL_LINUX_LIBS_CONF_OPTS += --disable-widechar
+
+# No libs use ncurses
+UTIL_LINUX_LIBS_CONF_OPTS += --without-ncursesw --without-ncurses
+
+# Unfortunately, the util-linux does LIBS="" at the end of its
+# configure script. So we have to pass the proper LIBS value when
+# calling the configure script to make configure tests pass properly,
+# and then pass it again at build time.
+UTIL_LINUX_LIBS_CONF_ENV += LIBS="$(UTIL_LINUX_LIBS_LINK_LIBS)"
+UTIL_LINUX_LIBS_MAKE_OPTS += LIBS="$(UTIL_LINUX_LIBS_LINK_LIBS)"
+
+# libmount optionally uses selinux
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT)$(BR2_PACKAGE_LIBSELINUX),yy)
+UTIL_LINUX_LIBS_DEPENDENCIES += libselinux
+UTIL_LINUX_LIBS_CONF_OPTS += --with-selinux
+else
+UTIL_LINUX_LIBS_CONF_OPTS += --without-selinux
+endif
+
+# Disable utilities
+UTIL_LINUX_LIBS_CONF_OPTS += \
+	--disable-all-programs \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),--enable-libblkid,--disable-libblkid) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBFDISK),--enable-libfdisk,--disable-libfdisk) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),--enable-libmount,--disable-libmount) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS),--enable-libsmartcols,--disable-libsmartcols) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBUUID),--enable-libuuid,--disable-libuuid)
+
+# libmount python bindings are separate, will be installed by full util-linux
+UTIL_LINUX_LIBS_CONF_OPTS += --without-python --disable-pylibmount
+
+# No libs use readline
+UTIL_LINUX_LIBS_CONF_OPTS += --without-readline
+
+# No libs use audit
+UTIL_LINUX_LIBS_CONF_OPTS += --without-audit
+
+$(eval $(autotools-package))
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 6c8f295eed..4fa7ae58e3 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -4,6 +4,9 @@
 #
 ################################################################################
 
+# When making changes to this file, please check if
+# util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
+
 UTIL_LINUX_VERSION_MAJOR = 2.35
 UTIL_LINUX_VERSION_MINOR = 2
 UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).$(UTIL_LINUX_VERSION_MINOR)
@@ -22,19 +25,16 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
 	Documentation/licenses/COPYING.LGPL-2.1-or-later
 
 UTIL_LINUX_INSTALL_STAGING = YES
-UTIL_LINUX_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
+UTIL_LINUX_DEPENDENCIES = \
+	host-pkgconf \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs) \
+	$(TARGET_NLS_DEPENDENCIES)
 UTIL_LINUX_CONF_OPTS += \
 	--disable-rpath \
 	--disable-makeinstall-chown
 
 UTIL_LINUX_LIBS = $(TARGET_NLS_LIBS)
 
-# system depends on util-linux so we enable systemd support
-# (which needs systemd to be installed)
-UTIL_LINUX_CONF_OPTS += \
-	--without-systemd \
-	--with-systemdsystemunitdir=no
-
 HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
 
 # We also don't want the host-python dependency
@@ -50,6 +50,20 @@ ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 UTIL_LINUX_CONF_OPTS += --bindir=/usr/bin --sbindir=/usr/sbin --libdir=/usr/lib
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+UTIL_LINUX_CONF_OPTS += --with-systemd --with-systemdsystemunitdir=/usr/lib/systemd/system
+UTIL_LINUX_DEPENDENCIES += systemd
+else
+UTIL_LINUX_CONF_OPTS += --without-systemd --with-systemdsystemunitdir=no
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+UTIL_LINUX_CONF_OPTS += --with-udev
+UTIL_LINUX_DEPENDENCIES += udev
+else
+UTIL_LINUX_CONF_OPTS += --without-udev
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 UTIL_LINUX_DEPENDENCIES += ncurses
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
@@ -266,3 +280,7 @@ UTIL_LINUX_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_GETTY_SYMLINK
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
+
+# Must be included after the autotools-package call, to make sure all variables
+# are available
+include package/util-linux/util-linux-libs/util-linux-libs.mk
