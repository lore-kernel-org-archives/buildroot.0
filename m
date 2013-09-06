From: eric.le.bihan.dev at free.fr <eric.le.bihan.dev@free.fr>
Date: Fri,  6 Sep 2013 16:01:07 +0200
Subject: [Buildroot] [PATCH 1/1] package: udev is now provided by systemd or
	eudev.
Message-ID: <1378476068-25300-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Udev is now a virtual package, which can be provided by either Systemd or Eudev.

eudev is the Gentoo fork of git://anongit.freedesktop.org/systemd/systemd
with the aim of isolating udev from any particular flavor of system
initialization. In this case, the isolation is from systemd.

From now on, if you choose to manage the device table with udev, you will have
to choose between two providers: systemd and eudev.

These providers are mutually exclusive:

 - if systemd is chosen, the other methods (static, mdev) are not available.
 - eudev is not available if systemd is chosen as the init system.

Systemd has been updated to version 206. Eudev v1.2 is forked from this
version.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in                                  |    1 +
 package/eudev/Config.in                            |   36 ++
 package/{udev => eudev}/S10udev                    |    2 +-
 package/eudev/eudev.mk                             |   41 ++
 package/systemd/Config.in                          |   48 ++-
 ...tenv-instead-of-secure_getenv-when-using-.patch |   26 ++
 ...ed-posix_fallocate-calls-when-using-uClib.patch |   85 ++++
 ...ed-pwritev-preadv-calls-when-using-uClibc.patch |   32 ++
 ...fer-getty-to-agetty-in-console-setup-unit.patch |   39 ++
 ...ms-sscanf-modifier-not-being-available-in.patch |  417 ++++++++++++++++++++
 ...-mknod-capability-to-kmod-static-nodes.se.patch |   26 ++
 package/systemd/systemd-fix-getty-unit.patch       |   34 --
 package/systemd/systemd-fix-page-size.patch        |   43 --
 package/systemd/systemd-uclibc-fix.patch           |   59 ---
 package/systemd/systemd.mk                         |   76 +++-
 package/udev/Config.in                             |   44 +--
 package/udev/udev.mk                               |   58 +--
 system/Config.in                                   |   13 +-
 18 files changed, 857 insertions(+), 223 deletions(-)
 create mode 100644 package/eudev/Config.in
 rename package/{udev => eudev}/S10udev (98%)
 mode change 100755 => 100644
 create mode 100644 package/eudev/eudev.mk
 create mode 100644 package/systemd/systemd-0001-core-use-getenv-instead-of-secure_getenv-when-using-.patch
 create mode 100644 package/systemd/systemd-0002-journal-fixed-posix_fallocate-calls-when-using-uClib.patch
 create mode 100644 package/systemd/systemd-0003-bus-fixed-pwritev-preadv-calls-when-using-uClibc.patch
 create mode 100644 package/systemd/systemd-0004-units-prefer-getty-to-agetty-in-console-setup-unit.patch
 create mode 100644 package/systemd/systemd-0005-core-fixed-ms-sscanf-modifier-not-being-available-in.patch
 create mode 100644 package/systemd/systemd-0006-units-Added-mknod-capability-to-kmod-static-nodes.se.patch
 delete mode 100644 package/systemd/systemd-fix-getty-unit.patch
 delete mode 100644 package/systemd/systemd-fix-page-size.patch
 delete mode 100644 package/systemd/systemd-uclibc-fix.patch

diff --git a/package/Config.in b/package/Config.in
index a94cb62..1f834b8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -249,6 +249,7 @@ source "package/dmraid/Config.in"
 source "package/dvb-apps/Config.in"
 source "package/dvbsnoop/Config.in"
 source "package/eeprog/Config.in"
+source "package/eudev/Config.in"
 source "package/evtest/Config.in"
 source "package/fan-ctrl/Config.in"
 source "package/flashrom/Config.in"
diff --git a/package/eudev/Config.in b/package/eudev/Config.in
new file mode 100644
index 0000000..40108ed
--- /dev/null
+++ b/package/eudev/Config.in
@@ -0,0 +1,36 @@
+config BR2_PACKAGE_EUDEV
+	bool "eudev"
+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	depends on BR2_LARGEFILE # util-linux
+	depends on BR2_USE_WCHAR # util-linux
+	depends on !BR2_PACKAGE_SYSTEMD
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_KMOD
+	help
+	  Userspace device daemon (Gentoo version)
+
+	  eudev requires a Linux kernel >= 2.6.34: it relies on devtmpfs.
+
+	  http://github.com/gentoo/eudev/
+
+if BR2_PACKAGE_EUDEV
+
+config BR2_PACKAGE_EUDEV_ALL_EXTRAS
+	bool "enable all extras"
+	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	help
+	  Enable all extras with external dependencies like libglib2
+
+comment "enabling all extras requires a toolchain with WCHAR and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+endif
+
+comment "eudev requires /dev mgmnt set to udev under System configuration"
+	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+
+comment "eudev not available with Systemd as init system"
+	depends on BR2_PACKAGE_SYSTEMD
diff --git a/package/udev/S10udev b/package/eudev/S10udev
old mode 100755
new mode 100644
similarity index 98%
rename from package/udev/S10udev
rename to package/eudev/S10udev
index 2c7b7e9..e4d28a2
--- a/package/udev/S10udev
+++ b/package/eudev/S10udev
@@ -17,7 +17,7 @@
 #
 
 # Check for missing binaries
-UDEV_BIN=/lib/udev/udevd
+UDEV_BIN=/sbin/udevd
 test -x $UDEV_BIN || exit 5
 
 # Check for config file and read it
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
new file mode 100644
index 0000000..f1952d4
--- /dev/null
+++ b/package/eudev/eudev.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# eudev
+#
+################################################################################
+
+EUDEV_VERSION         = v1.2
+EUDEV_SITE            = https://github.com/gentoo/eudev.git
+EUDEV_SITE_METHOD     = git
+EUDEV_LICENSE         = GPLv2
+EUDEV_LICENSE_FILES   = COPYING
+EUDEV_INSTALL_STAGING = YES
+EUDEV_AUTORECONF      = YES
+
+# mq_getattr is in librt
+EUDEV_CONF_ENV += LIBS=-lrt
+
+EUDEV_CONF_OPT =		\
+	--sbindir=/sbin		\
+	--with-rootlibdir=/lib	\
+	--libexecdir=/lib	\
+	--with-firmware-path=/lib/firmware	\
+	--disable-introspection			\
+	--enable-split-usr
+
+EUDEV_DEPENDENCIES = host-pkgconf util-linux kmod
+
+ifeq ($(BR2_PACKAGE_EUDEV_ALL_EXTRAS),y)
+EUDEV_DEPENDENCIES += libglib2
+EUDEV_CONF_OPT += --enable-gudev
+else
+EUDEV_CONF_OPT += --disable-gudev
+endif
+
+define EUDEV_INSTALL_INITSCRIPT
+	$(INSTALL) -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
+endef
+
+EUDEV_POST_INSTALL_TARGET_HOOKS += EUDEV_INSTALL_INITSCRIPT
+
+$(eval $(autotools-package))
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 86ab2cf..f346aa3 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -1,11 +1,17 @@
 config BR2_PACKAGE_SYSTEMD
 	bool "systemd"
+	depends on BR2_INIT_SYSTEMD
+	depends on BR2_LARGEFILE
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_KMOD
 	help
 	  systemd is a system and service manager for Linux, compatible with
 	  SysV and LSB init scripts. systemd provides aggressive parallelization
@@ -18,6 +24,42 @@ config BR2_PACKAGE_SYSTEMD
 
 	  http://freedesktop.org/wiki/Software/systemd
 
-comment "systemd not available (depends on /dev management with udev and ipv6 support, and thread support in toolchain)"
-	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || !BR2_INET_IPV6 || \\
-		!BR2_TOOLCHAIN_HAS_THREADS
+if BR2_PACKAGE_SYSTEMD
+
+config BR2_PACKAGE_SYSTEMD_ACL
+	bool "Enable ACL"
+	default n
+	select BR2_PACKAGE_ACL
+	help
+	  Enable ACL support
+
+config BR2_PACKAGE_SYSTEMD_GUDEV
+	bool "Build Gudev"
+	default n
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  Build GLib bindings for udev
+
+config BR2_PACKAGE_SYSTEMD_COMPRESS_JOURNAL
+	bool "Compress journal"
+	default n
+	select BR2_PACKAGE_XZ
+	help
+	  Compress the journal
+
+config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
+	bool "HTTP server for journal events"
+	default n
+	select BR2_PACKAGE_LIBMICROHTTPD
+	help
+	  systemd-journal-gatewayd serves journal events over the network.
+	  Clients must connect using HTTP. The server listens on port 19531 by
+	  default.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-journal-gatewayd.service.html
+
+endif
+
+comment "systemd not available (depends on ipv6 support and thread support in toolchain)"
+	depends on (!BR2_LARGEFILE || !BR2_INET_IPV6 || \
+	!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INIT_SYSTEMD)
diff --git a/package/systemd/systemd-0001-core-use-getenv-instead-of-secure_getenv-when-using-.patch b/package/systemd/systemd-0001-core-use-getenv-instead-of-secure_getenv-when-using-.patch
new file mode 100644
index 0000000..f0e955f
--- /dev/null
+++ b/package/systemd/systemd-0001-core-use-getenv-instead-of-secure_getenv-when-using-.patch
@@ -0,0 +1,26 @@
+From c6e94fd5b8f39fd09f703e25a226e2bd52df1f4f Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Thu, 29 Aug 2013 15:34:49 +0200
+Subject: [PATCH 1/6] core: use getenv() instead of secure_getenv() when using
+ uClibc
+
+---
+ src/shared/missing.h |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/shared/missing.h b/src/shared/missing.h
+index 534b3cc..48280c1 100644
+--- a/src/shared/missing.h
++++ b/src/shared/missing.h
+@@ -254,6 +254,8 @@ static inline int name_to_handle_at(int fd, const char *name, struct file_handle
+ #ifndef HAVE_SECURE_GETENV
+ #  ifdef HAVE___SECURE_GETENV
+ #    define secure_getenv __secure_getenv
++#  elif defined __UCLIBC__
++#    define secure_getenv getenv
+ #  else
+ #    error neither secure_getenv nor __secure_getenv are available
+ #  endif
+-- 
+1.7.9.5
+
diff --git a/package/systemd/systemd-0002-journal-fixed-posix_fallocate-calls-when-using-uClib.patch b/package/systemd/systemd-0002-journal-fixed-posix_fallocate-calls-when-using-uClib.patch
new file mode 100644
index 0000000..2acdcca
--- /dev/null
+++ b/package/systemd/systemd-0002-journal-fixed-posix_fallocate-calls-when-using-uClib.patch
@@ -0,0 +1,85 @@
+From 0714f43ca1f423e7adb4e868f717f0b923a54b63 Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Thu, 29 Aug 2013 15:37:06 +0200
+Subject: [PATCH 2/6] journal: fixed posix_fallocate() calls when using uClibc
+
+---
+ src/journal/journal-file.c  |   18 ++++++++++++++++--
+ src/journal/journald-kmsg.c |   15 ++++++++++++++-
+ 2 files changed, 30 insertions(+), 3 deletions(-)
+
+diff --git a/src/journal/journal-file.c b/src/journal/journal-file.c
+index 1236403..c2a4d64 100644
+--- a/src/journal/journal-file.c
++++ b/src/journal/journal-file.c
+@@ -314,7 +314,7 @@ static int journal_file_verify_header(JournalFile *f) {
+ 
+ static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size) {
+         uint64_t old_size, new_size;
+-        int r;
++        int r = 0;
+ 
+         assert(f);
+ 
+@@ -359,10 +359,24 @@ static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size)
+         /* Note that the glibc fallocate() fallback is very
+            inefficient, hence we try to minimize the allocation area
+            as we can. */
++#ifdef HAVE_POSIX_ALLOCATE
+         r = posix_fallocate(f->fd, old_size, new_size - old_size);
+         if (r != 0)
+                 return -r;
+-
++#else
++	/* Use good old method to write zeros into the journal file
++	   perhaps very inefficient yet working. */
++	if (new_size > old_size) {
++		char *buf = alloca(new_size - old_size);
++		off_t oldpos = lseek(f->fd, 0, SEEK_CUR);
++		bzero(buf, new_size - old_size);
++		lseek(f->fd, old_size, SEEK_SET);
++		r = write(f->fd, buf, new_size - old_size);
++		lseek(f->fd, oldpos, SEEK_SET);
++	}
++	if (r < 0)
++		return -errno;
++#endif /* HAVE_POSIX_FALLOCATE */
+         if (fstat(f->fd, &f->last_stat) < 0)
+                 return -errno;
+ 
+diff --git a/src/journal/journald-kmsg.c b/src/journal/journald-kmsg.c
+index 21649d0..744d3bc 100644
+--- a/src/journal/journald-kmsg.c
++++ b/src/journal/journald-kmsg.c
+@@ -408,6 +408,7 @@ int server_open_dev_kmsg(Server *s) {
+ int server_open_kernel_seqnum(Server *s) {
+         int fd;
+         uint64_t *p;
++	int r = 0;
+ 
+         assert(s);
+ 
+@@ -421,7 +422,19 @@ int server_open_kernel_seqnum(Server *s) {
+                 return 0;
+         }
+ 
+-        if (posix_fallocate(fd, 0, sizeof(uint64_t)) < 0) {
++#ifdef HAVE_POSIX_ALLOCATE
++	r = posix_fallocate(fd, 0, sizeof(uint64_t));
++#else
++	/* Use good old method to write zeros into the journal file
++	    perhaps very inefficient yet working. */
++	char *buf = alloca(sizeof(uint64_t));
++	off_t oldpos = lseek(fd, 0, SEEK_CUR);
++	bzero(buf, sizeof(uint64_t));
++	lseek(fd, 0, SEEK_SET);
++	r = write(fd, buf, sizeof(uint64_t));
++	lseek(fd, oldpos, SEEK_SET);
++#endif /* HAVE_POSIX_FALLOCATE */
++	if (r < 0) {
+                 log_error("Failed to allocate sequential number file, ignoring: %m");
+                 close_nointr_nofail(fd);
+                 return 0;
+-- 
+1.7.9.5
+
diff --git a/package/systemd/systemd-0003-bus-fixed-pwritev-preadv-calls-when-using-uClibc.patch b/package/systemd/systemd-0003-bus-fixed-pwritev-preadv-calls-when-using-uClibc.patch
new file mode 100644
index 0000000..c023924
--- /dev/null
+++ b/package/systemd/systemd-0003-bus-fixed-pwritev-preadv-calls-when-using-uClibc.patch
@@ -0,0 +1,32 @@
+From 884323ac0c242e12f5dc7c4bcc487cd6b64e1069 Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Thu, 29 Aug 2013 15:38:31 +0200
+Subject: [PATCH 3/6] bus: fixed pwritev/preadv calls when using uClibc
+
+---
+ src/libsystemd-bus/test-bus-memfd.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/libsystemd-bus/test-bus-memfd.c b/src/libsystemd-bus/test-bus-memfd.c
+index 05ef555..91a9556 100644
+--- a/src/libsystemd-bus/test-bus-memfd.c
++++ b/src/libsystemd-bus/test-bus-memfd.c
+@@ -146,6 +146,7 @@ int main(int argc, char *argv[]) {
+         assert_se(memcmp(buf, "ll", 2) == 0);
+ 
+         /* writev it out*/
++#ifndef __UCLIBC__
+         iov[0].iov_base = (char *)"ABC";
+         iov[0].iov_len = 3;
+         iov[1].iov_base = (char *)"DEF";
+@@ -167,6 +168,7 @@ int main(int argc, char *argv[]) {
+         assert_se(memcmp(bufv[0], "ABC", 3) == 0);
+         assert_se(memcmp(bufv[1], "DEF", 3) == 0);
+         assert_se(memcmp(bufv[2], "GHI", 3) == 0);
++#endif /* __UCLIBC__ */
+ 
+         sd_memfd_free(m);
+ 
+-- 
+1.7.9.5
+
diff --git a/package/systemd/systemd-0004-units-prefer-getty-to-agetty-in-console-setup-unit.patch b/package/systemd/systemd-0004-units-prefer-getty-to-agetty-in-console-setup-unit.patch
new file mode 100644
index 0000000..77ed365
--- /dev/null
+++ b/package/systemd/systemd-0004-units-prefer-getty-to-agetty-in-console-setup-unit.patch
@@ -0,0 +1,39 @@
+From a39d2ab91dbad209e6f35658327e10733fe910f0 Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Thu, 29 Aug 2013 15:40:10 +0200
+Subject: [PATCH 4/6] units: prefer getty to agetty in console setup unit
+
+---
+ units/getty at .service.m4        |    2 +-
+ units/serial-getty at .service.m4 |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/units/getty at .service.m4 b/units/getty at .service.m4
+index 7853652..34cdf11 100644
+--- a/units/getty at .service.m4
++++ b/units/getty at .service.m4
+@@ -27,7 +27,7 @@ ConditionPathExists=/dev/tty0
+ 
+ [Service]
+ # the VT is cleared by TTYVTDisallocate
+-ExecStart=-/sbin/agetty --noclear %I
++ExecStart=-/sbin/getty -L %I
+ Type=idle
+ Restart=always
+ RestartSec=0
+diff --git a/units/serial-getty at .service.m4 b/units/serial-getty at .service.m4
+index 5e16963..9657800 100644
+--- a/units/serial-getty at .service.m4
++++ b/units/serial-getty at .service.m4
+@@ -22,7 +22,7 @@ Before=getty.target
+ IgnoreOnIsolate=yes
+ 
+ [Service]
+-ExecStart=-/sbin/agetty --keep-baud %I 115200,38400,9600
++ExecStart=-/sbin/getty -L %I 115200
+ Type=idle
+ Restart=always
+ RestartSec=0
+-- 
+1.7.9.5
+
diff --git a/package/systemd/systemd-0005-core-fixed-ms-sscanf-modifier-not-being-available-in.patch b/package/systemd/systemd-0005-core-fixed-ms-sscanf-modifier-not-being-available-in.patch
new file mode 100644
index 0000000..2e22944
--- /dev/null
+++ b/package/systemd/systemd-0005-core-fixed-ms-sscanf-modifier-not-being-available-in.patch
@@ -0,0 +1,417 @@
+From acddfb947d61a21fb4146ae91b17d0e0f6c0fdd3 Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Thu, 29 Aug 2013 15:44:20 +0200
+Subject: [PATCH 5/6] core: fixed %ms sscanf() modifier not being available in
+ uClibc
+
+---
+ configure.ac                          |   17 +++++++++++++
+ src/core/mount-setup.c                |   10 ++++++--
+ src/core/mount.c                      |   30 +++++++++++++++++++++--
+ src/core/swap.c                       |   13 ++++++++++
+ src/core/umount.c                     |   34 +++++++++++++++++++++++---
+ src/cryptsetup/cryptsetup-generator.c |   11 +++++++++
+ src/fsck/fsck.c                       |   13 ++++++++--
+ src/shared/socket-util.c              |   10 ++++++++
+ src/tmpfiles/tmpfiles.c               |   42 +++++++++++++++++++++++++++++++++
+ 9 files changed, 171 insertions(+), 9 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 759073a..09a9cb6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -78,6 +78,23 @@ AC_PATH_PROG([KMOD], [kmod], [/usr/bin/kmod])
+ 
+ AC_PATH_PROG([KEXEC], [kexec], [/usr/sbin/kexec])
+ 
++# check for few functions not implemented in uClibc
++
++AC_CHECK_FUNCS_ONCE(mkostemp execvpe posix_fallocate)
++
++# check for %ms modifier support - assume always no if cross compiling
++
++AC_MSG_CHECKING([whether %ms modifier is supported by *scanf])
++
++AC_RUN_IFELSE(
++	[AC_LANG_PROGRAM([[ include <stdio.h> ]],
++			[[ char *buf1, *buf2, *buf3, str="1 2.3 abcde" ;
++			   int rc = sscanf(str, "%ms %ms %ms", &buf1, &buf2, &buf3) ;
++			   return (rc == 3)? 0: 1;]])],
++	[AC_DEFINE([HAVE_SCANF_MS], [1], [Define if %ms modifier is supported by *scanf.])],
++	[AC_MSG_RESULT([no])],
++	[AC_MSG_RESULT([no])])
++
+ # gtkdocize greps for '^GTK_DOC_CHECK', so it needs to be on its own line
+ m4_ifdef([GTK_DOC_CHECK], [
+ GTK_DOC_CHECK([1.18],[--flavour no-tmpl])],
+diff --git a/src/core/mount-setup.c b/src/core/mount-setup.c
+index 4359f59..16ce39a 100644
+--- a/src/core/mount-setup.c
++++ b/src/core/mount-setup.c
+@@ -28,6 +28,7 @@
+ #include <assert.h>
+ #include <unistd.h>
+ #include <ftw.h>
++#include <linux/fs.h>
+ 
+ #include "mount-setup.h"
+ #include "dev-setup.h"
+@@ -43,6 +44,8 @@
+ #include "virt.h"
+ #include "efivars.h"
+ 
++#include "config.h"
++
+ #ifndef TTY_GID
+ #define TTY_GID 5
+ #endif
+@@ -233,9 +236,12 @@ int mount_cgroup_controllers(char ***join_controllers) {
+         for (;;) {
+                 char *controller;
+                 int enabled = 0;
+-
++#ifdef HAVE_SCANF_MS
+                 if (fscanf(f, "%ms %*i %*i %i", &controller, &enabled) != 2) {
+-
++#else
++		controller = malloc(257);
++                if (fscanf(f, "%256s %*i %*i %i", controller, &enabled) != 2) {
++#endif /* HAVE_SCANF_MS */
+                         if (feof(f))
+                                 break;
+ 
+diff --git a/src/core/mount.c b/src/core/mount.c
+index c7d29b0..b76d91c 100644
+--- a/src/core/mount.c
++++ b/src/core/mount.c
+@@ -43,6 +43,8 @@
+ #include "exit-status.h"
+ #include "def.h"
+ 
++#include "config.h"
++
+ static const UnitActiveState state_translation_table[_MOUNT_STATE_MAX] = {
+         [MOUNT_DEAD] = UNIT_INACTIVE,
+         [MOUNT_MOUNTING] = UNIT_ACTIVATING,
+@@ -1634,7 +1636,7 @@ static int mount_load_proc_self_mountinfo(Manager *m, bool set_flags) {
+                 int k;
+ 
+                 device = path = options = options2 = fstype = d = p = o = NULL;
+-
++#ifdef HAVE_SCANF_MS
+                 if ((k = fscanf(m->proc_self_mountinfo,
+                                 "%*s "       /* (1) mount id */
+                                 "%*s "       /* (2) parent id */
+@@ -1653,7 +1655,31 @@ static int mount_load_proc_self_mountinfo(Manager *m, bool set_flags) {
+                                 &fstype,
+                                 &device,
+                                 &options2)) != 5) {
+-
++#else
++		path = malloc(257);
++		options = malloc(257);
++		fstype = malloc(257);
++		device = malloc(257);
++		options2 = malloc(257);
++                if ((k = fscanf(m->proc_self_mountinfo,
++                                "%*s "       /* (1) mount id */
++                                "%*s "       /* (2) parent id */
++                                "%*s "       /* (3) major:minor */
++                                "%*s "       /* (4) root */
++                                "%256s "     /* (5) mount point */
++                                "%256s"      /* (6) mount options */
++                                "%*[^-]"     /* (7) optional fields */
++                                "- "         /* (8) separator */
++                                "%256s "     /* (9) file system type */
++                                "%256s"      /* (10) mount source */
++                                "%256s"      /* (11) mount options 2 */
++                                "%*[^\n]",   /* some rubbish at the end */
++                                path,
++                                options,
++                                fstype,
++                                device,
++                                options2)) != 5) {
++#endif /* HAVE_SCANF_MS */
+                         if (k == EOF)
+                                 break;
+ 
+diff --git a/src/core/swap.c b/src/core/swap.c
+index 825503f..9886edc 100644
+--- a/src/core/swap.c
++++ b/src/core/swap.c
+@@ -41,6 +41,8 @@
+ #include "path-util.h"
+ #include "virt.h"
+ 
++#include "config.h"
++
+ static const UnitActiveState state_translation_table[_SWAP_STATE_MAX] = {
+         [SWAP_DEAD] = UNIT_INACTIVE,
+         [SWAP_ACTIVATING] = UNIT_ACTIVATING,
+@@ -1059,6 +1061,7 @@ static int swap_load_proc_swaps(Manager *m, bool set_flags) {
+                 char *dev = NULL, *d;
+                 int prio = 0, k;
+ 
++#ifdef HAVE_SCANF_MS
+                 k = fscanf(m->proc_swaps,
+                            "%ms "  /* device/file */
+                            "%*s "  /* type of swap */
+@@ -1066,6 +1069,16 @@ static int swap_load_proc_swaps(Manager *m, bool set_flags) {
+                            "%*s "  /* used */
+                            "%i\n", /* priority */
+                            &dev, &prio);
++#else
++                dev = malloc(257);
++                k = fscanf(m->proc_swaps,
++                           "%256s "/* device/file */
++                           "%*s "  /* type of swap */
++                           "%*s "  /* swap size */
++                           "%*s "  /* used */
++                           "%i\n", /* priority */
++                           dev, &prio);
++#endif /* HAVE_SCANF_MS */
+                 if (k != 2) {
+                         if (k == EOF)
+                                 break;
+diff --git a/src/core/umount.c b/src/core/umount.c
+index 1e95ad7..fb48236 100644
+--- a/src/core/umount.c
++++ b/src/core/umount.c
+@@ -36,6 +36,8 @@
+ #include "util.h"
+ #include "virt.h"
+ 
++#include "config.h"
++
+ typedef struct MountPoint {
+         char *path;
+         dev_t devnum;
+@@ -75,7 +77,7 @@ static int mount_points_list_get(MountPoint **head) {
+                 MountPoint *m;
+ 
+                 path = p = NULL;
+-
++#ifdef HAVE_SCANF_MS
+                 if ((k = fscanf(proc_self_mountinfo,
+                                 "%*s "       /* (1) mount id */
+                                 "%*s "       /* (2) parent id */
+@@ -90,6 +92,23 @@ static int mount_points_list_get(MountPoint **head) {
+                                 "%*s"        /* (11) mount options 2 */
+                                 "%*[^\n]",   /* some rubbish at the end */
+                                 &path)) != 1) {
++#else
++		path = malloc(257);
++                if ((k = fscanf(proc_self_mountinfo,
++                                "%*s "       /* (1) mount id */
++                                "%*s "       /* (2) parent id */
++                                "%*s "       /* (3) major:minor */
++                                "%*s "       /* (4) root */
++                                "%256s "     /* (5) mount point */
++                                "%*s"        /* (6) mount options */
++                                "%*[^-]"     /* (7) optional fields */
++                                "- "         /* (8) separator */
++                                "%*s "       /* (9) file system type */
++                                "%*s"        /* (10) mount source */
++                                "%*s"        /* (11) mount options 2 */
++                                "%*[^\n]",   /* some rubbish at the end */
++                                path)) != 1) {
++#endif /* HAVE_SCANF_MS */
+                         if (k == EOF)
+                                 break;
+ 
+@@ -151,7 +170,7 @@ static int swap_list_get(MountPoint **head) {
+                 MountPoint *swap;
+                 char *dev = NULL, *d;
+                 int k;
+-
++#ifdef HAVE_SCANF_MS
+                 if ((k = fscanf(proc_swaps,
+                                 "%ms " /* device/file */
+                                 "%*s " /* type of swap */
+@@ -159,7 +178,16 @@ static int swap_list_get(MountPoint **head) {
+                                 "%*s " /* used */
+                                 "%*s\n", /* priority */
+                                 &dev)) != 1) {
+-
++#else
++		dev = malloc(257);
++                if ((k = fscanf(proc_swaps,
++                                "%256s " /* device/file */
++                                "%*s " /* type of swap */
++                                "%*s " /* swap size */
++                                "%*s " /* used */
++                                "%*s\n", /* priority */
++                                dev)) != 1) {
++#endif /* HAVE_SCANF_MS */
+                         if (k == EOF)
+                                 break;
+ 
+diff --git a/src/cryptsetup/cryptsetup-generator.c b/src/cryptsetup/cryptsetup-generator.c
+index 81b7708..7d379ec 100644
+--- a/src/cryptsetup/cryptsetup-generator.c
++++ b/src/cryptsetup/cryptsetup-generator.c
+@@ -31,6 +31,8 @@
+ #include "strv.h"
+ #include "fileio.h"
+ 
++#include "config.h"
++
+ static const char *arg_dest = "/tmp";
+ static bool arg_enabled = true;
+ static bool arg_read_crypttab = true;
+@@ -398,7 +400,16 @@ int main(int argc, char *argv[]) {
+                         if (*l == '#' || *l == 0)
+                                 continue;
+ 
++#ifdef HAVE_SCANF_MS
+                         k = sscanf(l, "%ms %ms %ms %ms", &name, &device, &password, &options);
++#else
++                        name = malloc(257);
++                        device = malloc(257);
++                        password = malloc(257);
++                        options = malloc(257);
++                        k = sscanf(l, "%256s %256s %256s %256s", name, device, password, options);
++#endif /* HAVE_SCANF_MS */
++
+                         if (k < 2 || k > 4) {
+                                 log_error("Failed to parse /etc/crypttab:%u, ignoring.", n);
+                                 r = EXIT_FAILURE;
+diff --git a/src/fsck/fsck.c b/src/fsck/fsck.c
+index f298cf7..d485f0d 100644
+--- a/src/fsck/fsck.c
++++ b/src/fsck/fsck.c
+@@ -37,6 +37,8 @@
+ #include "virt.h"
+ #include "fileio.h"
+ 
++#include "config.h"
++
+ static bool arg_skip = false;
+ static bool arg_force = false;
+ static bool arg_show_progress = false;
+@@ -198,9 +200,16 @@ static int process_progress(int fd) {
+                 char *device;
+                 double p;
+                 usec_t t;
+-
++#ifdef HAVE_SCANF_MS
+                 if (fscanf(f, "%i %lu %lu %ms", &pass, &cur, &max, &device) != 4)
+-                        break;
++#else
++		device = malloc(257);
++		if (fscanf(f, "%i %lu %lu %256s", &pass, &cur, &max, device) != 4) {
++			free(device);
++		}
++
++#endif /* HAVE_SCANF_MS */
++			break;
+ 
+                 /* Only show one progress counter at max */
+                 if (!locked) {
+diff --git a/src/shared/socket-util.c b/src/shared/socket-util.c
+index c583d3d..a09bb2d 100644
+--- a/src/shared/socket-util.c
++++ b/src/shared/socket-util.c
+@@ -40,6 +40,8 @@
+ #include "missing.h"
+ #include "fileio.h"
+ 
++#include "config.h"
++
+ int socket_address_parse(SocketAddress *a, const char *s) {
+         int r;
+         char *e, *n;
+@@ -203,8 +205,16 @@ int socket_address_parse_netlink(SocketAddress *a, const char *s) {
+         a->type = SOCK_RAW;
+ 
+         errno = 0;
++#ifdef HAVE_SCANF_MS
+         if (sscanf(s, "%ms %u", &sfamily, &group) < 1)
+                 return errno > 0 ? -errno : -EINVAL;
++#else
++        sfamily = malloc(257);
++        if (sscanf(s, "%256s %u", sfamily, &group) < 1) {
++                 free(sfamily);
++                 return errno ? -errno : -EINVAL;
++        }
++#endif /* HAVE_SCANF_MS */
+ 
+         family = netlink_family_from_string(sfamily);
+         if (family < 0)
+diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
+index eae993e..ef490f9 100644
+--- a/src/tmpfiles/tmpfiles.c
++++ b/src/tmpfiles/tmpfiles.c
+@@ -52,6 +52,8 @@
+ #include "conf-files.h"
+ #include "capability.h"
+ 
++#include "config.h"
++
+ /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
+  * them in the file system. This is intended to be used to create
+  * properly owned directories beneath /tmp, /var/tmp, /run, which are
+@@ -1018,6 +1020,12 @@ static bool item_equal(Item *a, Item *b) {
+         return true;
+ }
+ 
++#define FREE_EMPTY_STR(p) \
++	if (*p == '\0') { \
++		free(p); \
++		p = 0; \
++	}
++
+ static int parse_line(const char *fname, unsigned line, const char *buffer) {
+         _cleanup_item_free_ Item *i = NULL;
+         Item *existing;
+@@ -1035,6 +1043,7 @@ static int parse_line(const char *fname, unsigned line, const char *buffer) {
+         if (!i)
+                 return log_oom();
+ 
++#ifdef HAVE_SCANF_MS
+         r = sscanf(buffer,
+                    "%c %ms %ms %ms %ms %ms %n",
+                    &type,
+@@ -1044,6 +1053,39 @@ static int parse_line(const char *fname, unsigned line, const char *buffer) {
+                    &group,
+                    &age,
+                    &n);
++#else
++        i->path = calloc(257, sizeof(char));
++        mode = calloc(257, sizeof(char));
++        user = calloc(257, sizeof(char));
++        group = calloc(257, sizeof(char));
++        age = calloc(257, sizeof(char));
++
++	if (!i->path || !mode || !user || !group || !age)
++		return log_oom();
++
++        r = sscanf(buffer,
++                   "%c "
++                   "%256s "
++                   "%256s "
++                   "%256s "
++                   "%256s "
++                   "%256s "
++                   "%n",
++                   &type,
++                   i->path,
++                   mode,
++                   user,
++                   group,
++                   age,
++                   &n);
++
++	FREE_EMPTY_STR(user);
++	FREE_EMPTY_STR(mode);
++	FREE_EMPTY_STR(group);
++	FREE_EMPTY_STR(age);
++
++#endif /* HAVE_SCANF_MS */
++
+         if (r < 2) {
+                 log_error("[%s:%u] Syntax error.", fname, line);
+                 return -EIO;
+-- 
+1.7.9.5
+
diff --git a/package/systemd/systemd-0006-units-Added-mknod-capability-to-kmod-static-nodes.se.patch b/package/systemd/systemd-0006-units-Added-mknod-capability-to-kmod-static-nodes.se.patch
new file mode 100644
index 0000000..642f51e
--- /dev/null
+++ b/package/systemd/systemd-0006-units-Added-mknod-capability-to-kmod-static-nodes.se.patch
@@ -0,0 +1,26 @@
+From 3739505ce24e690a6d18ecc88abe9570eba27f67 Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Thu, 29 Aug 2013 15:46:25 +0200
+Subject: [PATCH 6/6] units: Added mknod capability to
+ kmod-static-nodes.service.
+
+Fixes errors seen when booting VMs on QEMU.
+---
+ units/kmod-static-nodes.service.in |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/units/kmod-static-nodes.service.in b/units/kmod-static-nodes.service.in
+index cdfc6e5..d8a8420 100644
+--- a/units/kmod-static-nodes.service.in
++++ b/units/kmod-static-nodes.service.in
+@@ -9,6 +9,7 @@
+ Description=Create list of required static device nodes for the current kernel
+ DefaultDependencies=no
+ Before=sysinit.target systemd-tmpfiles-setup-dev.service
++ConditionCapability=CAP_MKNOD
+ 
+ [Service]
+ Type=oneshot
+-- 
+1.7.9.5
+
diff --git a/package/systemd/systemd-fix-getty-unit.patch b/package/systemd/systemd-fix-getty-unit.patch
deleted file mode 100644
index 6df54b1..0000000
--- a/package/systemd/systemd-fix-getty-unit.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Prefer getty to agetty in console setup systemd units
-
-Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
----
- units/getty at .service.m4        |    2 +-
- units/serial-getty at .service.m4 |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: systemd-37/units/getty at .service.m4
-===================================================================
---- systemd-37.orig/units/getty at .service.m4
-+++ systemd-37/units/getty at .service.m4
-@@ -32,7 +32,7 @@
- 
- [Service]
- Environment=TERM=linux
--ExecStart=-/sbin/agetty %I 38400
-+ExecStart=-/sbin/getty -L %I 115200 vt100
- Restart=always
- RestartSec=0
- UtmpIdentifier=%I
-Index: systemd-37/units/serial-getty at .service.m4
-===================================================================
---- systemd-37.orig/units/serial-getty at .service.m4
-+++ systemd-37/units/serial-getty at .service.m4
-@@ -32,7 +32,7 @@
- 
- [Service]
- Environment=TERM=vt100
--ExecStart=-/sbin/agetty -s %I 115200,38400,9600
-+ExecStart=-/sbin/getty -L %I 115200 vt100
- Restart=always
- RestartSec=0
- UtmpIdentifier=%I
diff --git a/package/systemd/systemd-fix-page-size.patch b/package/systemd/systemd-fix-page-size.patch
deleted file mode 100644
index 241ceb8..0000000
--- a/package/systemd/systemd-fix-page-size.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-commit 7264278fbbdc1dc6c30fedc902d1337594aa6ff6
-Author: Lennart Poettering <lennart@poettering.net>
-Date:   Wed Mar 21 23:47:44 2012 +0100
-
-    journal: PAGE_SIZE is not known on ppc and other archs
-    
-    Let's use NAME_MAX, as suggested by Dan Walsh
-
-diff --git a/src/journal/journald.c b/src/journal/journald.c
-index d27cb60..87390bd 100644
---- a/src/journal/journald.c
-+++ b/src/journal/journald.c
-@@ -29,7 +29,6 @@
- #include <sys/ioctl.h>
- #include <linux/sockios.h>
- #include <sys/statvfs.h>
--#include <sys/user.h>
- 
- #include <systemd/sd-journal.h>
- #include <systemd/sd-login.h>
-@@ -2149,10 +2148,20 @@ static int process_event(Server *s, struct epoll_event *ev) {
-                         size_t label_len = 0;
-                         union {
-                                 struct cmsghdr cmsghdr;
-+
-+                                /* We use NAME_MAX space for the
-+                                 * SELinux label here. The kernel
-+                                 * currently enforces no limit, but
-+                                 * according to suggestions from the
-+                                 * SELinux people this will change and
-+                                 * it will probably be identical to
-+                                 * NAME_MAX. For now we use that, but
-+                                 * this should be updated one day when
-+                                 * the final limit is known.*/
-                                 uint8_t buf[CMSG_SPACE(sizeof(struct ucred)) +
-                                             CMSG_SPACE(sizeof(struct timeval)) +
--                                            CMSG_SPACE(sizeof(int)) +
--                                            CMSG_SPACE(PAGE_SIZE)]; /* selinux label */
-+                                            CMSG_SPACE(sizeof(int)) + /* fd */
-+                                            CMSG_SPACE(NAME_MAX)]; /* selinux label */
-                         } control;
-                         ssize_t n;
-                         int v;
diff --git a/package/systemd/systemd-uclibc-fix.patch b/package/systemd/systemd-uclibc-fix.patch
deleted file mode 100644
index 9a20845..0000000
--- a/package/systemd/systemd-uclibc-fix.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-[PATCH] fix build with uClibc
-
-Based on OE patch from Khem Raj:
-
-http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch
-
-But extended to also cover execvpe (OE carries a patch adding execvpe
-support to uClibc).
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/journal/journal-file.c |    2 ++
- src/macro.h                |   15 +++++++++++++++
- 2 files changed, 17 insertions(+)
-
-Index: systemd-44/src/macro.h
-===================================================================
---- systemd-44.orig/src/macro.h
-+++ systemd-44/src/macro.h
-@@ -28,6 +28,21 @@
- #include <sys/uio.h>
- #include <inttypes.h>
- 
-+#ifdef __UCLIBC__
-+/* uclibc does not implement mkostemp GNU extension */
-+#define mkostemp(x,y) mkstemp(x)
-+/* uclibc does not implement execvpe GNU extension */
-+#ifndef _GNU_SOURCE
-+#define _GNU_SOURCE
-+#endif
-+#include <unistd.h>
-+static inline int execvpe(const char *file, char *const argv[],
-+                          char *const envp[])
-+{
-+        environ = (char **)envp;
-+        return execvp(file, argv);
-+}
-+#endif
- #define _printf_attr_(a,b) __attribute__ ((format (printf, a, b)))
- #define _sentinel_ __attribute__ ((sentinel))
- #define _noreturn_ __attribute__((noreturn))
-Index: systemd-44/src/journal/journal-file.c
-===================================================================
---- systemd-44.orig/src/journal/journal-file.c
-+++ systemd-44/src/journal/journal-file.c
-@@ -229,11 +229,13 @@
-                 }
-         }
- 
-+#ifndef __UCLIBC__
-         /* Note that the glibc fallocate() fallback is very
-            inefficient, hence we try to minimize the allocation area
-            as we can. */
-         if (posix_fallocate(f->fd, old_size, new_size - old_size) < 0)
-                 return -errno;
-+#endif
- 
-         if (fstat(f->fd, &f->last_stat) < 0)
-                 return -errno;
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1bb429c..d5b5785 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,15 +4,20 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 44
+SYSTEMD_VERSION = 206
 SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
 SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
 SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
 	host-intltool \
+	host-pkgconf \
 	libcap \
-	udev \
-	dbus
+	dbus \
+	libgcrypt \
+	util-linux \
+	kmod
+
+SYSTEMD_AUTORECONF = YES
 
 # Make sure that systemd will always be built after busybox so that we have
 # a consistent init setup between two builds
@@ -21,31 +26,52 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 endif
 
 SYSTEMD_CONF_OPT += \
-	--with-distro=other \
+	--with-rootprefix= \
+	--with-rootlibdir=/lib \
+	--localstatedir=/var \
+	--enable-static=no \
+	--disable-manpages \
 	--disable-selinux \
 	--disable-pam \
 	--disable-libcryptsetup \
-	--disable-gtk \
-	--disable-plymouth \
-	--with-rootdir=/ \
+	--enable-gcrypt \
+	--with-libgcrypt-prefix=$(STAGING_DIR)/usr \
 	--with-dbuspolicydir=/etc/dbus-1/system.d \
 	--with-dbussessionservicedir=/usr/share/dbus-1/services \
 	--with-dbussystemservicedir=/usr/share/dbus-1/system-services \
 	--with-dbusinterfacedir=/usr/share/dbus-1/interfaces \
-	--with-udevrulesdir=/etc/udev/rules.d \
-	--with-sysvinit-path=/etc/init.d/ \
-	--without-sysvrcd-path \
-	--enable-split-usr
+	--enable-split-usr \
+	--enable-introspection=no \
+	--disable-efi \
+	--disable-myhostname \
+	--disable-tcpwrap \
+	--without-python
 
-ifeq ($(BR2_PACKAGE_ACL),y)
+ifeq ($(BR2_PACKAGE_SYSTEMD_ACL),y)
 	SYSTEMD_CONF_OPT += --enable-acl
 	SYSTEMD_DEPENDENCIES += acl
 else
 	SYSTEMD_CONF_OPT += --disable-acl
 endif
 
-ifneq ($(BR2_LARGEFILE),y)
-	SYSTEMD_CONF_OPT += --disable-largefile
+ifeq ($(BR2_PACKAGE_SYSTEMD_GUDEV),y)
+	SYSTEMD_CONF_OPT += --enable-gudev
+	SYSTEMD_DEPENDENCIES += libglib2
+else
+	SYSTEMD_CONF_OPT += --disable-gudev
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD_COMPRESS_JOURNAL),y)
+	SYSTEMD_DEPENDENCIES += xz
+	SYSTEMD_CONF_OPT += --enable-xz
+else
+	SYSTEMD_CONF_OPT += --disable-xz
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY),y)
+	SYSTEMD_DEPENDENCIES += libmicrohttpd
+else
+	SYSTEMD_CONF_OPT += --disable-microhttpd
 endif
 
 # mq_getattr needs -lrt
@@ -53,21 +79,31 @@ SYSTEMD_MAKE_OPT += LIBS=-lrt
 SYSTEMD_MAKE_OPT += LDFLAGS+=-ldl
 
 define SYSTEMD_INSTALL_INIT_HOOK
-	ln -fs ../usr/lib/systemd/systemd $(TARGET_DIR)/sbin/init
-	ln -fs ../usr/bin/systemctl $(TARGET_DIR)/sbin/halt
-	ln -fs ../usr/bin/systemctl $(TARGET_DIR)/sbin/poweroff
-	ln -fs ../usr/bin/systemctl $(TARGET_DIR)/sbin/reboot
+	ln -fs ../lib/systemd/systemd $(TARGET_DIR)/sbin/init
+	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/halt
+	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/poweroff
+	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/reboot
 
-	ln -fs ../../../usr/lib/systemd/system/multi-user.target $(TARGET_DIR)/etc/systemd/system/default.target
+	ln -fs ../../../lib/systemd/system/multi-user.target $(TARGET_DIR)/etc/systemd/system/default.target
 endef
 
 define SYSTEMD_INSTALL_TTY_HOOK
 	rm -f $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty at tty1.service
-	ln -fs ../../../../usr/lib/systemd/system/serial-getty at .service $(TARGET_DIR)/etc/systemd/system/getty.target.wants/serial-getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
+	ln -fs ../../../../lib/systemd/system/serial-getty@.service $(TARGET_DIR)/etc/systemd/system/getty.target.wants/serial-getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
+endef
+
+define SYSTEMD_INSTALL_MACHINEID_HOOK
+	touch $(TARGET_DIR)/etc/machine-id
 endef
 
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 	SYSTEMD_INSTALL_INIT_HOOK \
 	SYSTEMD_INSTALL_TTY_HOOK \
+	SYSTEMD_INSTALL_MACHINEID_HOOK
+
+define SYSTEMD_USERS
+	systemd-journal -1 systemd-journal -1 * /var/log/journal - - Journal
+	systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
+endef
 
 $(eval $(autotools-package))
diff --git a/package/udev/Config.in b/package/udev/Config.in
index d4d97c1..7aa4483 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -1,39 +1,33 @@
 config BR2_PACKAGE_UDEV
 	bool "udev"
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
-	depends on BR2_LARGEFILE # util-linux
-	depends on BR2_USE_WCHAR # util-linux
-	depends on !BR2_PREFER_STATIC_LIB # kmod
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_KMOD
 	help
 	  Userspace device daemon.
 
 	  udev requires a Linux kernel >= 2.6.34: it relies on devtmpfs.
 
-	  ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/
-
 if BR2_PACKAGE_UDEV
 
-config BR2_PACKAGE_UDEV_RULES_GEN
-	bool "enable rules generator"
-	help
-	  Enable persistant rules generator
-
-config BR2_PACKAGE_UDEV_ALL_EXTRAS
-	bool "enable all extras"
-	select BR2_PACKAGE_ACL
-	select BR2_PACKAGE_HWDATA
-	select BR2_PACKAGE_LIBGLIB2
-	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	help
-	  Enable all extras with external dependencies like
-	  libacl, hwdata and libglib2
+choice
+	prompt "udev provider"
+	default BR2_PACKAGE_UDEV_PROVIDER_EUDEV
+
+config BR2_PACKAGE_UDEV_PROVIDER_EUDEV
+	bool "Use udev from eudev"
+	select BR2_PACKAGE_EUDEV
+	depends on !BR2_PACKAGE_SYSTEMD
+
+comment "eudev not available with Systemd init system"
+	depends on BR2_PACKAGE_SYSTEMD
+
+config BR2_PACKAGE_UDEV_PROVIDER_SYSTEMD
+	bool "Use udev from Systemd"
+	depends on BR2_PACKAGE_SYSTEMD
+
+comment "Original udev only available with Systemd init system"
+	depends on !BR2_PACKAGE_SYSTEMD
 
-comment "enabling all extras requires a toolchain with WCHAR and threading support"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+endchoice
 
 endif
 
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 69f011f..39dc014 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -4,48 +4,32 @@
 #
 ################################################################################
 
-UDEV_VERSION = 182
-UDEV_SOURCE = udev-$(UDEV_VERSION).tar.bz2
-UDEV_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
-UDEV_LICENSE = GPLv2+
-UDEV_LICENSE_FILES = COPYING
-UDEV_INSTALL_STAGING = YES
-
-# mq_getattr is in librt
-UDEV_CONF_ENV += LIBS=-lrt
-
-UDEV_CONF_OPT =			\
-	--sbindir=/sbin		\
-	--with-rootlibdir=/lib	\
-	--libexecdir=/lib	\
-	--with-usb-ids-path=/usr/share/hwdata/usb.ids	\
-	--with-pci-ids-path=/usr/share/hwdata/pci.ids	\
-	--with-firmware-path=/lib/firmware		\
-	--disable-introspection
-
-UDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
-
-ifeq ($(BR2_PACKAGE_UDEV_RULES_GEN),y)
-UDEV_CONF_OPT += --enable-rule_generator
-endif
+UDEV_VERSION      = 206
+UDEV_SITE         = http://www.freedesktop.org/software/systemd/
+UDEV_SOURCE       = systemd-$(UDEV_VERSION).tar.xz
 
-ifeq ($(BR2_PACKAGE_UDEV_ALL_EXTRAS),y)
-UDEV_DEPENDENCIES += acl hwdata libglib2
-UDEV_CONF_OPT +=		\
-	--enable-udev_acl
-else
-UDEV_CONF_OPT +=		\
-	--disable-gudev
+ifeq ($(BR2_PACKAGE_UDEV_PROVIDER_EUDEV),y)
+UDEV_DEPENDENCIES = eudev
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-	UDEV_CONF_OPT += --with-systemdsystemunitdir=/lib/systemd/system/
+ifeq ($(BR2_PACKAGE_UDEV_PROVIDER_SYSTEMD),y)
+UDEV_DEPENDENCIES = systemd
 endif
 
-define UDEV_INSTALL_INITSCRIPT
-	$(INSTALL) -m 0755 package/udev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
+define UDEV_EXTRACT_CMDS
+	@echo "Dummy package: nothing to extract"
+endef
+
+define UDEV_CONFIGURE_CMDS
+	@echo "Dummy package: nothing to configure"
 endef
 
-UDEV_POST_INSTALL_TARGET_HOOKS += UDEV_INSTALL_INITSCRIPT
+define UDEV_BUILD_CMDS
+	@echo "Dummy package: nothing to build"
+endef
+
+define UDEV_CLEAN_CMDS
+	@echo "Dummy package: nothing to clean"
+endef
 
-$(eval $(autotools-package))
+$(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index 401285b..17ec532 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -72,14 +72,26 @@ choice
 
 config BR2_ROOTFS_DEVICE_CREATION_STATIC
 	bool "Static using device table"
+	depends on !BR2_INIT_SYSTEMD
+
+comment "Static using device table not available with Systemd as init system"
+	depends on BR2_INIT_SYSTEMD
 
 config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
 	bool "Dynamic using devtmpfs only"
+	depends on !BR2_INIT_SYSTEMD
+
+comment "Dynamic using devtmpfs not available with Systemd as init system"
+	depends on BR2_INIT_SYSTEMD
 
 config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
 	bool "Dynamic using mdev"
+	depends on !BR2_INIT_SYSTEMD
 	select BR2_PACKAGE_BUSYBOX
 
+comment "Dynamic using mdev not available with Systemd as init system"
+	depends on BR2_INIT_SYSTEMD
+
 config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	bool "Dynamic using udev"
 	depends on BR2_LARGEFILE # udev
@@ -112,7 +124,6 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	depends on BR2_INET_IPV6
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_DBUS
-- 
1.7.9.5
