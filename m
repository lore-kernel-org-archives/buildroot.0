From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 20 Sep 2013 14:24:04 +0200
Subject: [Buildroot] [PATCH v2 3/6] systemd: bump to v206.
In-Reply-To: <1379679847-16141-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1379679847-16141-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1379679847-16141-4-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps systemd to v206 but also converts udev to a virtual
package. Starting with systemd 183, udev has been merged into
systemd. The udev daemon is now installed as /lib/systemd/systemd-udevd.
This means that /dev management using udev is only available if systemd
is chosen as init system.

When configuring systemd, the following options are available:

 - activation of systemd-journal-gatewayd, to access the journal via
   HTTP.
 - activation of extra features like journal compression and sealing.

The selection of the following packages will also add features:

 - libglib2 package will add support for gudev.
 - acl package will add support for multi-seat.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/systemd/Config.in                          |   35 +++++++--
 package/systemd/systemd-fix-getty-unit.patch       |   36 ++++-----
 package/systemd/systemd-fix-page-size.patch        |   43 ----------
 .../systemd/systemd-optional-secure-getenv.patch   |   20 +++++
 package/systemd/systemd-uclibc-fix.patch           |   59 --------------
 ...systemd-use-cap_mknod-conditioncapability.patch |   26 +++++++
 package/systemd/systemd.mk                         |   82 +++++++++++++++-----
 package/udev/Config.in                             |   41 +---------
 package/udev/udev.mk                               |   46 +----------
 system/Config.in                                   |   34 ++++----
 10 files changed, 176 insertions(+), 246 deletions(-)
 delete mode 100644 package/systemd/systemd-fix-page-size.patch
 create mode 100644 package/systemd/systemd-optional-secure-getenv.patch
 delete mode 100644 package/systemd/systemd-uclibc-fix.patch
 create mode 100644 package/systemd/systemd-use-cap_mknod-conditioncapability.patch

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 86ab2cf..ad92b73 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -1,11 +1,14 @@
 config BR2_PACKAGE_SYSTEMD
 	bool "systemd"
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
-	depends on BR2_INET_IPV6
+	depends on BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_KMOD
+	select BR2_PACKAGE_KMOD_TOOLS
 	help
 	  systemd is a system and service manager for Linux, compatible with
 	  SysV and LSB init scripts. systemd provides aggressive parallelization
@@ -18,6 +21,28 @@ config BR2_PACKAGE_SYSTEMD

 	  http://freedesktop.org/wiki/Software/systemd

-comment "systemd not available (depends on /dev management with udev and ipv6 support, and thread support in toolchain)"
-	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || !BR2_INET_IPV6 || \\
-		!BR2_TOOLCHAIN_HAS_THREADS
+comment "systemd needs a toolchain w/ threads, MMU"
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
diff --git a/package/systemd/systemd-optional-secure-getenv.patch b/package/systemd/systemd-optional-secure-getenv.patch
new file mode 100644
index 0000000..c163031
--- /dev/null
+++ b/package/systemd/systemd-optional-secure-getenv.patch
@@ -0,0 +1,20 @@
+on uclibc secure_getenv is not available
+therefore default to using getenv instead
+
+Upstream-Status: Denied [no desire for uclibc support]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+
+Index: git/src/shared/missing.h
+===================================================================
+--- git.orig/src/shared/missing.h	2012-09-22 18:46:44.141282145 -0700
++++ git/src/shared/missing.h	2012-09-22 18:48:44.081276570 -0700
+@@ -233,6 +233,8 @@
+ #ifndef HAVE_SECURE_GETENV
+ #  ifdef HAVE___SECURE_GETENV
+ #    define secure_getenv __secure_getenv
++#  elif defined __UCLIBC__
++#    define secure_getenv getenv
+ #  else
+ #    error neither secure_getenv nor __secure_getenv are available
+ #  endif
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
diff --git a/package/systemd/systemd-use-cap_mknod-conditioncapability.patch b/package/systemd/systemd-use-cap_mknod-conditioncapability.patch
new file mode 100644
index 0000000..e91fea8
--- /dev/null
+++ b/package/systemd/systemd-use-cap_mknod-conditioncapability.patch
@@ -0,0 +1,26 @@
+Fixes errors seen when booting VMs on QEMU like
+
+systemd[1]: kmod-static-nodes.service: main process exited, code=exited, status=203/EXEC
+systemd[1]: Failed to start Create list of required static device nodes for the current kernel.
+systemd[1]: Unit kmod-static-nodes.service entered failed state.
+
+Make sure that mknod capability is available
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+---
+ units/kmod-static-nodes.service.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: systemd-206/units/kmod-static-nodes.service.in
+===================================================================
+--- systemd-206.orig/units/kmod-static-nodes.service.in	2013-08-21 19:13:02.000000000 -0700
++++ systemd-206/units/kmod-static-nodes.service.in	2013-08-21 20:39:13.310689871 -0700
+@@ -9,6 +9,7 @@
+ Description=Create list of required static device nodes for the current kernel
+ DefaultDependencies=no
+ Before=sysinit.target systemd-tmpfiles-setup-dev.service
++ConditionCapability=CAP_MKNOD
+
+ [Service]
+ Type=oneshot
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1bb429c..d371711 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,15 +4,16 @@
 #
 ################################################################################

-SYSTEMD_VERSION = 44
+SYSTEMD_VERSION = 206
 SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
 SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
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
@@ -21,21 +22,25 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
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
+	--enable-split-usr \
+	--enable-introspection=no \
+	--disable-efi \
+	--disable-myhostname \
+	--disable-tcpwrap \
+	--disable-tests \
+	--without-python

 ifeq ($(BR2_PACKAGE_ACL),y)
 	SYSTEMD_CONF_OPT += --enable-acl
@@ -44,8 +49,31 @@ else
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
@@ -53,21 +81,37 @@ SYSTEMD_MAKE_OPT += LIBS=-lrt
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
+	ln -fs ../../../../lib/systemd/system/serial-getty at .service $(TARGET_DIR)/etc/systemd/system/getty.target.wants/serial-getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
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
diff --git a/package/udev/Config.in b/package/udev/Config.in
index d4d97c1..23c443e 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -1,41 +1,2 @@
 config BR2_PACKAGE_UDEV
-	bool "udev"
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
-	depends on BR2_LARGEFILE # util-linux
-	depends on BR2_USE_WCHAR # util-linux
-	depends on !BR2_PREFER_STATIC_LIB # kmod
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_KMOD
-	help
-	  Userspace device daemon.
-
-	  udev requires a Linux kernel >= 2.6.34: it relies on devtmpfs.
-
-	  ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/
-
-if BR2_PACKAGE_UDEV
-
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
-
-comment "enabling all extras requires a toolchain with WCHAR and threading support"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
-endif
-
-comment "udev requires /dev mgmnt set to udev under System configuration"
-	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	bool
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index db86850..c6fcdfc 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -4,48 +4,6 @@
 #
 ################################################################################

-UDEV_VERSION = 182
-UDEV_SOURCE = udev-$(UDEV_VERSION).tar.xz
-UDEV_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
-UDEV_LICENSE = GPLv2+
-UDEV_LICENSE_FILES = COPYING
-UDEV_INSTALL_STAGING = YES
+UDEV_SOURCE =

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
-
-ifeq ($(BR2_PACKAGE_UDEV_ALL_EXTRAS),y)
-UDEV_DEPENDENCIES += acl hwdata libglib2
-UDEV_CONF_OPT +=		\
-	--enable-udev_acl
-else
-UDEV_CONF_OPT +=		\
-	--disable-gudev
-endif
-
-ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-	UDEV_CONF_OPT += --with-systemdsystemunitdir=/lib/systemd/system/
-endif
-
-define UDEV_INSTALL_INITSCRIPT
-	$(INSTALL) -m 0755 package/udev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
-endef
-
-UDEV_POST_INSTALL_TARGET_HOOKS += UDEV_INSTALL_INITSCRIPT
-
-$(eval $(autotools-package))
+$(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index 1fe4127..c16e8e7 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -83,16 +83,22 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	depends on BR2_INET_IPV6
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_USE_MMU
-	select BR2_PACKAGE_DBUS
+	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	select BR2_PACKAGE_SYSTEMD

-comment 'systemd requires largefile, wchar, IPv6, threads and udev support'
+comment 'systemd needs toolchain w/ largefile, wchar, IPv6, threads'
 	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && \
-		     BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS && \
-		     BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV)
+		     BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS)
+
+comment 'systemd needs toolchain w/ stack smashing protection'
+	depends on !BR2_TOOLCHAIN_HAS_SSP
+
+comment "systemd doesn't work with 'prefer static libraries'"
+	depends on BR2_PREFER_STATIC_LIB

 config BR2_INIT_NONE
 	bool "None"
@@ -100,7 +106,7 @@ config BR2_INIT_NONE
 endchoice

 choice
-	prompt "/dev management"
+	prompt "/dev management" if !BR2_INIT_SYSTEMD
 	default BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS

 config BR2_ROOTFS_DEVICE_CREATION_STATIC
@@ -113,20 +119,14 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
 	bool "Dynamic using mdev"
 	select BR2_PACKAGE_BUSYBOX

+endchoice
+
 config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
-	bool "Dynamic using udev"
-	depends on BR2_LARGEFILE # udev
-	depends on BR2_USE_WCHAR # udev
-	depends on !BR2_PREFER_STATIC_LIB # udev -> kmod
+	bool
 	select BR2_PACKAGE_UDEV

-comment "udev requires a toolchain with LARGEFILE + WCHAR support"
-	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
-
-comment "udev doesn't work with 'prefer static libraries'"
-	depends on BR2_PREFER_STATIC_LIB
-
-endchoice
+comment "/dev management using udev (from systemd)"
+	depends on BR2_INIT_SYSTEMD

 config BR2_ROOTFS_DEVICE_TABLE
 	string "Path to the permission tables"
--
1.7.9.5
