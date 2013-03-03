From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sun,  3 Mar 2013 14:09:34 +0200
Subject: [Buildroot] [PATCH 1/1] Updated systemd to version 197
Message-ID: <1362312574-17701-1-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Made changes to config to allow for building systemd integrated udev
rather than building udev and systemd separately.

Created the versions of the existing patches for the new systemd version

The page-size issue for which there was a patch fixed in the new version,
thus deleted.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/systemd/Config.in                    |    6 +--
 package/systemd/systemd-fix-getty-unit.patch |   46 ++++++++++--------
 package/systemd/systemd-fix-page-size.patch  |   43 -----------------
 package/systemd/systemd-uclibc-fix.patch     |   64 +++++++++++++++-----------
 package/systemd/systemd.mk                   |   20 ++++++--
 system/Config.in                             |   18 ++++++--
 6 files changed, 97 insertions(+), 100 deletions(-)
 delete mode 100644 package/systemd/systemd-fix-page-size.patch

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 86ab2cf..2df4a3b 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_SYSTEMD
 	bool "systemd"
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	depends on BR2_ROOTFS_DEVICE_CREATION_SYSTEMD_DYNAMIC_UDEV
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
@@ -18,6 +18,6 @@ config BR2_PACKAGE_SYSTEMD
 
 	  http://freedesktop.org/wiki/Software/systemd
 
-comment "systemd not available (depends on /dev management with udev and ipv6 support, and thread support in toolchain)"
-	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || !BR2_INET_IPV6 || \\
+comment "systemd not available (depends on ipv6 support, and thread support in toolchain)"
+	depends on !BR2_ROOTFS_DEVICE_CREATION_SYSTEMD_DYNAMIC_UDEV || !BR2_INET_IPV6 || \\
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/systemd/systemd-fix-getty-unit.patch b/package/systemd/systemd-fix-getty-unit.patch
index 6df54b1..9b7f719 100644
--- a/package/systemd/systemd-fix-getty-unit.patch
+++ b/package/systemd/systemd-fix-getty-unit.patch
@@ -1,34 +1,40 @@
-Prefer getty to agetty in console setup systemd units
+From e3b4ecc1ad838fea5b9796e9bdc08dcfd9e9c03e Mon Sep 17 00:00:00 2001
+From: Olivier Schonken <olivier.schonken@gmail.com>
+Date: Sun, 3 Mar 2013 13:35:03 +0200
+Subject: Prefer getty to agetty in console setup systemd units
 
-Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
+Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
 ---
  units/getty at .service.m4        |    2 +-
  units/serial-getty at .service.m4 |    2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
-Index: systemd-37/units/getty at .service.m4
-===================================================================
---- systemd-37.orig/units/getty at .service.m4
-+++ systemd-37/units/getty at .service.m4
-@@ -32,7 +32,7 @@
+diff --git a/units/getty at .service.m4 b/units/getty at .service.m4
+index 083eb97..60d5808 100644
+--- a/units/getty at .service.m4
++++ b/units/getty at .service.m4
+@@ -27,7 +27,7 @@ ConditionPathExists=/dev/tty0
  
  [Service]
- Environment=TERM=linux
--ExecStart=-/sbin/agetty %I 38400
-+ExecStart=-/sbin/getty -L %I 115200 vt100
+ # the VT is cleared by TTYVTDisallocate
+-ExecStart=-/sbin/agetty --noclear %I 38400 linux
++ExecStart=-/sbin/agetty -L %I 115200 vt100
+ Type=idle
  Restart=always
  RestartSec=0
- UtmpIdentifier=%I
-Index: systemd-37/units/serial-getty at .service.m4
-===================================================================
---- systemd-37.orig/units/serial-getty at .service.m4
-+++ systemd-37/units/serial-getty at .service.m4
-@@ -32,7 +32,7 @@
+diff --git a/units/serial-getty at .service.m4 b/units/serial-getty at .service.m4
+index 60d7737..3c5bdda 100644
+--- a/units/serial-getty at .service.m4
++++ b/units/serial-getty at .service.m4
+@@ -22,7 +22,7 @@ Before=getty.target
+ IgnoreOnIsolate=yes
  
  [Service]
- Environment=TERM=vt100
--ExecStart=-/sbin/agetty -s %I 115200,38400,9600
-+ExecStart=-/sbin/getty -L %I 115200 vt100
+-ExecStart=-/sbin/agetty -s %I 115200,38400,9600 vt102
++ExecStart=-/sbin/agetty -L %I 115200 vt100
+ Type=idle
  Restart=always
  RestartSec=0
- UtmpIdentifier=%I
+-- 
+1.7.10.4
+
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
index 9a20845..2f689dc 100644
--- a/package/systemd/systemd-uclibc-fix.patch
+++ b/package/systemd/systemd-uclibc-fix.patch
@@ -1,6 +1,9 @@
-[PATCH] fix build with uClibc
-
-Based on OE patch from Khem Raj:
+From 19a0d4a9007c6505320a1f413e7fbb14c765ad1f Mon Sep 17 00:00:00 2001
+From: Olivier Schonken <olivier.schonken@gmail.com>
+Date: Sun, 3 Mar 2013 13:43:19 +0200
+Subject: Based on previous buildroot patch to systemd - including
+ previous commit message "Based on OE patch from Khem
+ Raj:
 
 http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch
 
@@ -8,16 +11,38 @@ But extended to also cover execvpe (OE carries a patch adding execvpe
 support to uClibc).
 
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+"
+
+Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
 ---
  src/journal/journal-file.c |    2 ++
- src/macro.h                |   15 +++++++++++++++
+ src/shared/macro.h         |   15 +++++++++++++++
  2 files changed, 17 insertions(+)
 
-Index: systemd-44/src/macro.h
-===================================================================
---- systemd-44.orig/src/macro.h
-+++ systemd-44/src/macro.h
-@@ -28,6 +28,21 @@
+diff --git a/src/journal/journal-file.c b/src/journal/journal-file.c
+index 13fc8ed..84daf75 100644
+--- a/src/journal/journal-file.c
++++ b/src/journal/journal-file.c
+@@ -318,12 +318,14 @@ static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size)
+                 }
+         }
+ 
++#ifndef __UCLIBC__
+         /* Note that the glibc fallocate() fallback is very
+            inefficient, hence we try to minimize the allocation area
+            as we can. */
+         r = posix_fallocate(f->fd, old_size, new_size - old_size);
+         if (r != 0)
+                 return -r;
++#endif
+ 
+         if (fstat(f->fd, &f->last_stat) < 0)
+                 return -errno;
+diff --git a/src/shared/macro.h b/src/shared/macro.h
+index 29d9139..1919c61 100644
+--- a/src/shared/macro.h
++++ b/src/shared/macro.h
+@@ -27,6 +27,21 @@
  #include <sys/uio.h>
  #include <inttypes.h>
  
@@ -39,21 +64,6 @@ Index: systemd-44/src/macro.h
  #define _printf_attr_(a,b) __attribute__ ((format (printf, a, b)))
  #define _sentinel_ __attribute__ ((sentinel))
  #define _noreturn_ __attribute__((noreturn))
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
+-- 
+1.7.10.4
+
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e85355f..a04b15e 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -3,14 +3,13 @@
 # systemd
 #
 #############################################################
-SYSTEMD_VERSION = 44
+SYSTEMD_VERSION = 197
 SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
 SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
 SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
 	host-intltool \
 	libcap \
-	udev \
 	dbus
 
 # Make sure that systemd will always be built after busybox so that we have
@@ -34,7 +33,22 @@ SYSTEMD_CONF_OPT += \
 	--with-udevrulesdir=/etc/udev/rules.d \
 	--with-sysvinit-path=/etc/init.d/ \
 	--without-sysvrcd-path \
-	--enable-split-usr
+	--enable-split-usr 
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+	SYSTEMD_CONF_OPT += --enable-gudev
+	SYSTEMD_DEPENDENCIES += libglib2
+else
+	SYSTEMD_CONF_OPT += --disable-gudev 
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+	SYSTEMD_CONF_OPT += --enable-acl
+	SYSTEMD_DEPENDENCIES += python
+else
+	SYSTEMD_CONF_OPT += --without-python
+endif
+        
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 	SYSTEMD_CONF_OPT += --enable-acl
diff --git a/system/Config.in b/system/Config.in
index 1e4fff3..4834298 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -86,7 +86,17 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	depends on BR2_USE_WCHAR # udev
 	select BR2_PACKAGE_UDEV
 
-comment "udev requires a toolchain with LARGEFILE + WCHAR support"
+config BR2_ROOTFS_DEVICE_CREATION_SYSTEMD_DYNAMIC_UDEV
+	bool "Dynamic using sytemd integrated udev"
+	depends on BR2_LARGEFILE # udev
+	depends on BR2_USE_WCHAR # udev
+	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_SYSTEMD
+
+comment "systemd udev requires a toolchain with LARGEFILE + WCHAR support"
 	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
 
 endchoice
@@ -108,16 +118,16 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	depends on BR2_INET_IPV6
-	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+	depends on BR2_ROOTFS_DEVICE_CREATION_SYSTEMD_DYNAMIC_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_SYSTEMD
 
-comment 'systemd requires largefile, wchar, IPv6, threads and udev support'
+comment 'systemd requires largefile, wchar, IPv6 and threads support'
 	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && \
 		     BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS && \
-		     BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV)
+                     BR2_ROOTFS_DEVICE_CREATION_SYSTEMD_DYNAMIC_UDEV)
 
 config BR2_INIT_NONE
 	bool "None"
-- 
1.7.10.4
