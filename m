From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 20 Mar 2015 15:14:14 -0400
Subject: [Buildroot] [PATCH v2 23/25] avahi: systemd cleanups
In-Reply-To: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426878856-15747-24-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Move service files to /usr/lib/systemd/system/
* Only disable systemd support on non-systemd systems

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/avahi/0002-disable-systemd-support.patch | 22 ----------------------
 package/avahi/avahi.mk                           |  8 ++++++--
 2 files changed, 6 insertions(+), 24 deletions(-)
 delete mode 100644 package/avahi/0002-disable-systemd-support.patch

diff --git a/package/avahi/0002-disable-systemd-support.patch b/package/avahi/0002-disable-systemd-support.patch
deleted file mode 100644
index 909795a..0000000
--- a/package/avahi/0002-disable-systemd-support.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-[PATCH] avahi-daemon: disable systemd support
-
-Disable systemd support as it isn't needed for BR, and uses SOCK_CLOEXEC
-which isn't available on uClibc.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- avahi-daemon/sd-daemon.h |    1 +
- 1 file changed, 1 insertion(+)
-
-Index: avahi-0.6.27/avahi-daemon/sd-daemon.h
-===================================================================
---- avahi-0.6.27.orig/avahi-daemon/sd-daemon.h
-+++ avahi-0.6.27/avahi-daemon/sd-daemon.h
-@@ -66,6 +66,7 @@ extern "C" {
- 
-   See sd-daemon(7) for more information.
- */
-+#define DISABLE_SYSTEMD /* no systemd support in BR */
- 
- #if __GNUC__ >= 4
- #define _sd_printf_attr_(a,b) __attribute__ ((format (printf, a, b)))
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 10c9915..53bbab7 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -88,6 +88,10 @@ AVAHI_DEPENDENCIES = \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-intltool \
 	host-pkgconf host-gettext
 
+ifneq ($(BR2_PACKAGE_SYSTEMD),y)
+AVAHI_CFLAGS += -DDISABLE_SYSTEMD
+endif
+
 ifneq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_AVAHI_AUTOIPD),)
 AVAHI_DEPENDENCIES += libdaemon
 else
@@ -185,10 +189,10 @@ ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
 define AVAHI_INSTALL_INIT_SYSTEMD
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 
-	ln -fs /lib/systemd/system/avahi-daemon.service \
+	ln -fs ../../../../usr/lib/systemd/system/avahi-daemon.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/avahi-daemon.service
 
-	ln -fs /lib/systemd/system/avahi-dnsconfd.service \
+	ln -fs ../../../../usr/lib/systemd/system/avahi-dnsconfd.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/avahi-dnsconfd.service
 
 	$(INSTALL) -D -m 644 package/avahi/avahi_tmpfiles.conf \
-- 
2.1.0
