From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu, 12 Sep 2019 22:38:11 -0300
Subject: [Buildroot] [PATH RFC,
 v4] package/util-linux: build programs and libraries in separate
 packages
Message-ID: <20190913013811.7963-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

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

The build dependency of util-linux on util-linux-libs ensures that
util-linux overwrites the files installed by util-linux-libs and not
vice versa. In practice this dependency shouldn't be needed: the only
reason for util-linux-libs to be built is to break a circular
dependency. In that case, there is already a transitive dependency of
util-linux on util-linux-libs, so adding it explicitly is redundant.
Still, better safe than sorry.

We can't do the same for host-util-linux-libs, since there is no config
symbol for it. However, host-util-linux-libs is not used at the moment,
so we can ignore that issue for the time being.

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
CC: Yann E. MORIN <yann.morin.1998@free.fr>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Pete Morici <pmorici@dev295.com>
---
Changes v1->v2:
- Prevent double installation of the libraries.
- Drop the intrusive patches and AUTORECONF
- Move the the programs to a separate package
- Convert util-linux into a dummy package that drives the other ones.
- Keep configurations and dependencies backward-compatible, except for
  eudev and systemd.
- Make BR2_PACKAGE_UTIL_LINUX_LIBS a blind option
Changes v2->v3:
- Fix typos that ruined the conditional installations on TARGET_DIR and
  STAGING_DIR, as pointed by Yann E. Morin.
Changes v3->v4:
- Rebase after upgrading util-linux to version 2.34.
- Merge util-linux-programs back into util-linux.
- Make eudev and systemd depend on util-linux-libs.
- Build util-linux with systemd support.
---
 package/eudev/Config.in                       |  1 +
 package/eudev/eudev.mk                        |  3 +-
 package/systemd/Config.in                     |  1 +
 package/systemd/systemd.mk                    |  2 +-
 package/util-linux/Config.in                  |  3 +
 .../util-linux-libs/util-linux-libs.hash      |  1 +
 .../util-linux-libs/util-linux-libs.mk        | 90 +++++++++++++++++++
 package/util-linux/util-linux.mk              | 29 ++++--
 8 files changed, 121 insertions(+), 9 deletions(-)
 create mode 120000 package/util-linux/util-linux-libs/util-linux-libs.hash
 create mode 100644 package/util-linux/util-linux-libs/util-linux-libs.mk

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 2220265a55..2df94fb68c 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_EUDEV
 	depends on !BR2_STATIC_LIBS # kmod
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_KMOD
 	help
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 78d0ea670e..21860643ae 100644
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
index ad72a269ef..e8444e4e0b 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -23,6 +23,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_DBUS # runtime dependency only
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_UTIL_LINUX_BINARIES
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b6aac6dc53..7ff96e6b67 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -14,7 +14,7 @@ SYSTEMD_DEPENDENCIES = \
 	host-gperf \
 	kmod \
 	libcap \
-	util-linux \
+	util-linux-libs \
 	$(TARGET_NLS_DEPENDENCIES)
 
 SYSTEMD_PROVIDES = udev
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 39eb2c03a0..8049603fae 100644
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
index 0000000000..4aa6780cec
--- /dev/null
+++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
@@ -0,0 +1,90 @@
+################################################################################
+#
+# util-linux-libs
+#
+################################################################################
+
+UTIL_LINUX_LIBS_VERSION = $(UTIL_LINUX_VERSION)
+UTIL_LINUX_LIBS_SOURCE = $(UTIL_LINUX_SOURCE)
+UTIL_LINUX_LIBS_SITE = $(UTIL_LINUX_SITE)
+UTIL_LINUX_LIBS_DL_SUBDIR = $(UTIL_LINUX_DL_SUBDIR)
+
+# README.licensing claims that some files are GPL-2.0 only, but this is not true.
+# Some files are GPL-3.0+ but only in tests. rfkill uses an ISC-style license.
+UTIL_LINUX_LIBS_LICENSE = LGPL-2.1+ (libblkid, libfdisk, libmount, libsmartcols), BSD-3-Clause (libuuid)
+UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
+	Documentation/licenses/COPYING.BSD-3-Clause \
+	Documentation/licenses/COPYING.LGPL-2.1-or-later
+UTIL_LINUX_LIBS_INSTALL_STAGING = YES
+
+UTIL_LINUX_LIBS_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
+UTIL_LINUX_LIBS_CONF_OPTS += \
+	--disable-rpath \
+	--disable-makeinstall-chown
+UTIL_LINUX_LIBS_LINK_LIBS = $(TARGET_NLS_LIBS)
+
+# systemd depends on util-linux so we enable systemd support
+# (which needs systemd to be installed)
+UTIL_LINUX_LIBS_CONF_OPTS += \
+	--without-systemd \
+	--with-systemdsystemunitdir=no
+
+HOST_UTIL_LINUX_LIBS_DEPENDENCIES = host-pkgconf
+HOST_UTIL_LINUX_LIBS_CONF_OPTS = --disable-makeinstall-chown
+
+# We also don't want the host-python dependency
+HOST_UTIL_LINUX_LIBS_CONF_OPTS += --without-python
+
+# Prevent the installation from attempting to move shared libraries from
+# ${usrlib_execdir} (/usr/lib) to ${libdir} (/lib), since both paths are
+# the same when merged usr is in use.
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+UTIL_LINUX_LIBS_CONF_OPTS += --bindir=/usr/bin --sbindir=/usr/sbin --libdir=/usr/lib
+endif
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
+# In the host version of util-linux-libs, we only require libuuid and libmount
+# (plus libblkid as an indirect dependency of libmount). So disable libfdisk
+# and libsmartcols, unless BR2_PACKAGE_HOST_UTIL_LINUX is set.
+HOST_UTIL_LINUX_LIBS_CONF_OPTS += \
+	--enable-libblkid \
+	$(if $(BR2_PACKAGE_HOST_UTIL_LINUX),--enable-libfdisk,--disable-libfdisk) \
+	--enable-libmount \
+	$(if $(BR2_PACKAGE_HOST_UTIL_LINUX),--enable-libsmartcols,--disable-libsmartcols) \
+	--enable-libuuid \
+	--without-ncurses \
+	--without-ncursesw \
+	--without-tinfo
+
+# Install libmount Python bindings
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT)$(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),yy)
+UTIL_LINUX_LIBS_CONF_OPTS += --with-python --enable-pylibmount
+UTIL_LINUX_LIBS_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
+UTIL_LINUX_LIBS_CONF_OPTS += --without-python --disable-pylibmount
+endif
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 99ec39467f..a3f4b95552 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -19,18 +19,15 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
 	Documentation/licenses/COPYING.ISC \
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
@@ -43,6 +40,20 @@ ifeq ($(BR2_ROOTFS_MERGED_USR),y)
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
@@ -258,3 +269,7 @@ UTIL_LINUX_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_GETTY_SYMLINK
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
+
+# Must be included after the autotools-package call, to make sure all variables
+# are available
+include package/util-linux/util-linux-libs/util-linux-libs.mk
-- 
2.18.1
