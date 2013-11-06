From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed,  6 Nov 2013 16:34:38 +0100
Subject: [Buildroot] [PATCH v3 5/5] systemd: bump to v207.
In-Reply-To: <1383752078-25315-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1383752078-25315-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1383752078-25315-6-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps systemd to v207 but also declares it as a provider for the
udev virtual package.

Starting with systemd 183, udev has been merged into
systemd. The udev daemon is now installed as /lib/systemd/systemd-udevd.
This means that /dev management using udev is only available if systemd
is chosen as init system.

When configuring systemd, the following options are available:

- activation of systemd-journal-gatewayd, to access the journal via
  HTTP.
- activation of extra features like journal compression and sealing.

Support for uClibc has also been removed because:

- upstream has no interest in supporting uClibc.
- using a shrinked libc brings no advantage, given the size of all the
  programs included in Systemd. So using glibc does not matter.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/systemd/Config.in                    |   43 +++++++++++--
 package/systemd/systemd-fix-getty-unit.patch |   36 ++++++-----
 package/systemd/systemd-fix-page-size.patch  |   43 -------------
 package/systemd/systemd-uclibc-fix.patch     |   59 ------------------
 package/systemd/systemd.mk                   |   85 ++++++++++++++++++++------
 package/udev/udev.mk                         |    4 ++
 system/Config.in                             |   25 ++++++--
 7 files changed, 143 insertions(+), 152 deletions(-)
 delete mode 100644 package/systemd/systemd-fix-page-size.patch
 delete mode 100644 package/systemd/systemd-uclibc-fix.patch

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 0ab10b6..e4b31fe 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -1,11 +1,15 @@
 config BR2_PACKAGE_SYSTEMD
 	bool "systemd"
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
-	depends on BR2_INET_IPV6
+	depends on BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
+	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_KMOD
+	select BR2_PACKAGE_KMOD_TOOLS
 	help
 	  systemd is a system and service manager for Linux, compatible with
 	  SysV and LSB init scripts. systemd provides aggressive parallelization
@@ -16,8 +20,37 @@ config BR2_PACKAGE_SYSTEMD
 	  elaborate transactional dependency-based service control logic.
 	  It can work as a drop-in replacement for sysvinit.
 
+	  Systemd also provides udev, the userspace device daemon.
+
+	  The selection of other packages will enable some features:
+
+	  - libglib2 package will add support for gudev.
+	  - acl package will add support for multi-seat.
+
 	  http://freedesktop.org/wiki/Software/systemd
 
-comment "systemd needs udev /dev management and a toolchain w/ IPv6, threads"
-	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV || !BR2_INET_IPV6 || \\
-		!BR2_TOOLCHAIN_HAS_THREADS
+comment "systemd needs an (e)glibc toolchain w/ threads"
+	depends on (!BR2_INIT_SYSTEMD || !BR2_TOOLCHAIN_HAS_THREADS || \\
+		    !BR2_USE_MMU)
+
+if BR2_PACKAGE_SYSTEMD
+
+config BR2_PACKAGE_SYSTEMD_ALL_EXTRAS
+	bool "enable all extras"
+	select BR2_PACKAGE_XZ
+	select BR2_PACKAGE_LIBGCRYPT
+	help
+	  Enable extra features for Systemd: journal compression and
+	  signing.
+
+config BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY
+        bool "HTTP server for journal events"
+	select BR2_PACKAGE_LIBMICROHTTPD
+	help
+	  systemd-journal-gatewayd serves journal events over the
+	  network. Clients must connect using HTTP. The server
+	  listens on port 19531 by default.
+
+	  http://www.freedesktop.org/software/systemd/man/systemd-journal-gatewayd.service.html
+
+endif
diff --git a/package/systemd/systemd-fix-getty-unit.patch b/package/systemd/systemd-fix-getty-unit.patch
index 6df54b1..166a2e5 100644
--- a/package/systemd/systemd-fix-getty-unit.patch
+++ b/package/systemd/systemd-fix-getty-unit.patch
@@ -1,34 +1,32 @@
 Prefer getty to agetty in console setup systemd units
 
 Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 ---
- units/getty at .service.m4        |    2 +-
- units/serial-getty at .service.m4 |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
 
-Index: systemd-37/units/getty at .service.m4
+Index: systemd-206/units/getty at .service.m4
 ===================================================================
---- systemd-37.orig/units/getty at .service.m4
-+++ systemd-37/units/getty at .service.m4
-@@ -32,7 +32,7 @@
- 
+--- systemd-206.orig/units/getty at .service.m4	2013-07-22 00:43:28.000000000 +0200
++++ systemd-206/units/getty at .service.m4	2013-09-18 10:20:17.000000000 +0200
+@@ -27,7 +27,7 @@
+
  [Service]
- Environment=TERM=linux
--ExecStart=-/sbin/agetty %I 38400
+ # the VT is cleared by TTYVTDisallocate
+-ExecStart=-/sbin/agetty --noclear %I
 +ExecStart=-/sbin/getty -L %I 115200 vt100
+ Type=idle
  Restart=always
  RestartSec=0
- UtmpIdentifier=%I
-Index: systemd-37/units/serial-getty at .service.m4
+Index: systemd-206/units/serial-getty at .service.m4
 ===================================================================
---- systemd-37.orig/units/serial-getty at .service.m4
-+++ systemd-37/units/serial-getty at .service.m4
-@@ -32,7 +32,7 @@
- 
+--- systemd-206.orig/units/serial-getty at .service.m4	2013-07-22 00:43:28.000000000 +0200
++++ systemd-206/units/serial-getty at .service.m4	2013-09-18 10:21:31.000000000 +0200
+@@ -22,7 +22,7 @@
+ IgnoreOnIsolate=yes
+
  [Service]
- Environment=TERM=vt100
--ExecStart=-/sbin/agetty -s %I 115200,38400,9600
+-ExecStart=-/sbin/agetty --keep-baud %I 115200,38400,9600
 +ExecStart=-/sbin/getty -L %I 115200 vt100
+ Type=idle
  Restart=always
  RestartSec=0
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
index 4e4955e..763471c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,17 +4,18 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 44
+SYSTEMD_VERSION = 207
 SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
 SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
 SYSTEMD_LICENSE = GPLv2+
-SYSTEMD_LICENSE_FILES = LICENSE
+SYSTEMD_LICENSE_FILES = LICENSE.GPLV2 LICENSE.LGPL2.1 LICENSE.MIT
 SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
 	host-intltool \
 	libcap \
-	udev \
-	dbus
+	dbus \
+	util-linux \
+	kmod
 
 # Make sure that systemd will always be built after busybox so that we have
 # a consistent init setup between two builds
@@ -23,21 +24,26 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
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
 	--with-dbuspolicydir=/etc/dbus-1/system.d \
 	--with-dbussessionservicedir=/usr/share/dbus-1/services \
 	--with-dbussystemservicedir=/usr/share/dbus-1/system-services \
 	--with-dbusinterfacedir=/usr/share/dbus-1/interfaces \
-	--with-udevrulesdir=/etc/udev/rules.d \
-	--with-sysvinit-path=/etc/init.d/ \
-	--without-sysvrcd-path \
-	--enable-split-usr
+	--with-firmware-path=/lib/firmware \
+	--enable-split-usr \
+	--enable-introspection=no \
+	--disable-efi \
+	--disable-myhostname \
+	--disable-tcpwrap \
+	--disable-tests \
+	--without-python
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 	SYSTEMD_CONF_OPT += --enable-acl
@@ -46,8 +52,31 @@ else
 	SYSTEMD_CONF_OPT += --disable-acl
 endif
 
-ifneq ($(BR2_LARGEFILE),y)
-	SYSTEMD_CONF_OPT += --disable-largefile
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+	SYSTEMD_CONF_OPT += --enable-gudev
+	SYSTEMD_DEPENDENCIES += libglib2
+else
+	SYSTEMD_CONF_OPT += --disable-gudev
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD_ALL_EXTRAS),y)
+	SYSTEMD_DEPENDENCIES += \
+		xz 		\
+		libgcrypt
+	SYSTEMD_CONF_OPT += 	\
+		--enable-xz 	\
+		--enable-gcrypt	\
+		--with-libgcrypt-prefix=$(STAGING_DIR)/usr
+else
+	SYSTEMD_CONF_OPT += 	\
+		--disable-xz 	\
+		--disable-gcrypt
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY),y)
+        SYSTEMD_DEPENDENCIES += libmicrohttpd
+else
+        SYSTEMD_CONF_OPT += --disable-microhttpd
 endif
 
 # mq_getattr needs -lrt
@@ -55,21 +84,37 @@ SYSTEMD_MAKE_OPT += LIBS=-lrt
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
+endef
+
+define SYSTEMD_SANITIZE_PATH_IN_UNITS
+	find $(TARGET_DIR)/lib/systemd/system -name '*.service' \
+		-exec sed -i -e 's,$(HOST_DIR),,g' {} \;
 endef
 
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 	SYSTEMD_INSTALL_INIT_HOOK \
 	SYSTEMD_INSTALL_TTY_HOOK \
+	SYSTEMD_INSTALL_MACHINEID_HOOK \
+	SYSTEMD_SANITIZE_PATH_IN_UNITS
+
+define SYSTEMD_USERS
+	systemd-journal -1 systemd-journal -1 * /var/log/journal - - Journal
+	systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
+endef
 
 $(eval $(autotools-package))
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 4857683..0056d1d 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -10,6 +10,10 @@ ifeq ($(BR2_PACKAGE_EUDEV),y)
 	UDEV_DEPENDENCIES += eudev
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+	UDEV_DEPENDENCIES += systemd
+endif
+
 ifeq ($(UDEV_DEPENDENCIES),)
 define UDEV_CONFIGURE_CMDS
 	echo "No Udev implementation selected. Configuration error."
diff --git a/system/Config.in b/system/Config.in
index 3ee0c20..9144d5b 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -80,19 +80,29 @@ config BR2_INIT_SYSV
 
 config BR2_INIT_SYSTEMD
 	bool "systemd"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	depends on BR2_INET_IPV6
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_USE_MMU
-	select BR2_PACKAGE_DBUS
+	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	select BR2_PACKAGE_SYSTEMD
 
-comment 'systemd requires largefile, wchar, IPv6, threads and eudev support'
+comment 'systemd needs a (e)glibc toolchain'
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
+comment 'systemd needs a toolchain w/ largefile, wchar, IPv6, threads'
 	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && \
-		     BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS && \
-		     BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV)
+		     BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS)
+
+comment 'systemd needs a toolchain w/ SSP'
+	depends on !BR2_TOOLCHAIN_HAS_SSP
+
+comment "systemd needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
 
 config BR2_INIT_NONE
 	bool "None"
@@ -100,7 +110,7 @@ config BR2_INIT_NONE
 endchoice
 
 choice
-	prompt "/dev management"
+	prompt "/dev management" if !BR2_INIT_SYSTEMD
 	default BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
 
 config BR2_ROOTFS_DEVICE_CREATION_STATIC
@@ -128,6 +138,9 @@ comment "eudev requires a toolchain w/ dynamic library"
 
 endchoice
 
+comment "/dev management using udev (from systemd)"
+	depends on BR2_INIT_SYSTEMD
+
 config BR2_ROOTFS_DEVICE_TABLE
 	string "Path to the permission tables"
 	default "system/device_table.txt"
-- 
1.7.9.5
