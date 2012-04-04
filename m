From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed,  4 Apr 2012 16:46:59 +0200
Subject: [Buildroot] [PATCH 2/2] Bump systemd to version 44
In-Reply-To: <cover.1333550801.git.maxime.ripard@free-electrons.com>
References: <cover.1333550801.git.maxime.ripard@free-electrons.com>
Message-ID: <e6e476588d301a1e80595734b13cef70c64fac42.1333550801.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/systemd/systemd-fix-page-size.patch |   43 +++++++++++++++++++++++++++
 package/systemd/systemd.mk                  |   24 +++++++++-----
 2 files changed, 58 insertions(+), 9 deletions(-)
 create mode 100644 package/systemd/systemd-fix-page-size.patch

diff --git a/package/systemd/systemd-fix-page-size.patch b/package/systemd/systemd-fix-page-size.patch
new file mode 100644
index 0000000..241ceb8
--- /dev/null
+++ b/package/systemd/systemd-fix-page-size.patch
@@ -0,0 +1,43 @@
+commit 7264278fbbdc1dc6c30fedc902d1337594aa6ff6
+Author: Lennart Poettering <lennart@poettering.net>
+Date:   Wed Mar 21 23:47:44 2012 +0100
+
+    journal: PAGE_SIZE is not known on ppc and other archs
+    
+    Let's use NAME_MAX, as suggested by Dan Walsh
+
+diff --git a/src/journal/journald.c b/src/journal/journald.c
+index d27cb60..87390bd 100644
+--- a/src/journal/journald.c
++++ b/src/journal/journald.c
+@@ -29,7 +29,6 @@
+ #include <sys/ioctl.h>
+ #include <linux/sockios.h>
+ #include <sys/statvfs.h>
+-#include <sys/user.h>
+ 
+ #include <systemd/sd-journal.h>
+ #include <systemd/sd-login.h>
+@@ -2149,10 +2148,20 @@ static int process_event(Server *s, struct epoll_event *ev) {
+                         size_t label_len = 0;
+                         union {
+                                 struct cmsghdr cmsghdr;
++
++                                /* We use NAME_MAX space for the
++                                 * SELinux label here. The kernel
++                                 * currently enforces no limit, but
++                                 * according to suggestions from the
++                                 * SELinux people this will change and
++                                 * it will probably be identical to
++                                 * NAME_MAX. For now we use that, but
++                                 * this should be updated one day when
++                                 * the final limit is known.*/
+                                 uint8_t buf[CMSG_SPACE(sizeof(struct ucred)) +
+                                             CMSG_SPACE(sizeof(struct timeval)) +
+-                                            CMSG_SPACE(sizeof(int)) +
+-                                            CMSG_SPACE(PAGE_SIZE)]; /* selinux label */
++                                            CMSG_SPACE(sizeof(int)) + /* fd */
++                                            CMSG_SPACE(NAME_MAX)]; /* selinux label */
+                         } control;
+                         ssize_t n;
+                         int v;
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index eded472..717bdcc 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -3,9 +3,9 @@
 # systemd
 #
 #############################################################
-SYSTEMD_VERSION = 37
+SYSTEMD_VERSION = 44
 SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
-SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.bz2
+SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
 SYSTEMD_DEPENDENCIES = \
 	host-intltool \
 	libcap \
@@ -32,7 +32,8 @@ SYSTEMD_CONF_OPT += \
 	--with-dbusinterfacedir=/usr/share/dbus-1/interfaces \
 	--with-udevrulesdir=/etc/udev/rules.d \
 	--with-sysvinit-path=/etc/init.d/ \
-	--without-sysvrcd-path
+	--without-sysvrcd-path \
+	--enable-split-usr
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 	SYSTEMD_CONF_OPT += --enable-acl
@@ -41,21 +42,26 @@ else
 	SYSTEMD_CONF_OPT += --disable-acl
 endif
 
+ifneq ($(BR2_LARGEFILE),y)
+	SYSTEMD_CONF_OPT += --disable-largefile
+endif
+
 # mq_getattr needs -lrt
 SYSTEMD_MAKE_OPT += LIBS=-lrt
+SYSTEMD_MAKE_OPT += LDFLAGS+=-ldl
 
 define SYSTEMD_INSTALL_INIT_HOOK
-	ln -fs ../bin/systemd $(TARGET_DIR)/sbin/init
-	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/halt
-	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/poweroff
-	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/reboot
+	ln -fs ../usr/lib/systemd/systemd $(TARGET_DIR)/sbin/init
+	ln -fs ../usr/bin/systemctl $(TARGET_DIR)/sbin/halt
+	ln -fs ../usr/bin/systemctl $(TARGET_DIR)/sbin/poweroff
+	ln -fs ../usr/bin/systemctl $(TARGET_DIR)/sbin/reboot
 
-	ln -fs ../../../../lib/systemd/system/multi-user.target $(TARGET_DIR)/etc/systemd/system/default.target
+	ln -fs ../../../usr/lib/systemd/system/multi-user.target $(TARGET_DIR)/etc/systemd/system/default.target
 endef
 
 define SYSTEMD_INSTALL_TTY_HOOK
 	rm -f $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty at tty1.service
-	ln -fs ../../../../lib/systemd/system/serial-getty at .service $(TARGET_DIR)/etc/systemd/system/getty.target.wants/serial-getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
+	ln -fs ../../../../usr/lib/systemd/system/serial-getty at .service $(TARGET_DIR)/etc/systemd/system/getty.target.wants/serial-getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
 endef
 
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
-- 
1.7.5.4
