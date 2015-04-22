From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:17:36 +0200
Subject: [Buildroot] [git commit] avahi: systemd cleanups
Message-ID: <20150422201756.EBE4981D87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c1db80c1d8854e5155f114c685b27451e5723eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Move service files to /usr/lib/systemd/system/
* Only disable systemd support on non-systemd systems

[Thomas: use positive logic for the systemd test.]

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avahi/0002-disable-systemd-support.patch |   22 ----------------------
 package/avahi/avahi.mk                           |   12 ++++++++++--
 2 files changed, 10 insertions(+), 24 deletions(-)

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
index 10c9915..24967f4 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -88,6 +88,12 @@ AVAHI_DEPENDENCIES = \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-intltool \
 	host-pkgconf host-gettext
 
+AVAHI_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),)
+AVAHI_CFLAGS += -DDISABLE_SYSTEMD
+endif
+
 ifneq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_AVAHI_AUTOIPD),)
 AVAHI_DEPENDENCIES += libdaemon
 else
@@ -154,6 +160,8 @@ else
 AVAHI_CONF_OPTS += --disable-python-dbus
 endif
 
+AVAHI_CONF_ENV += CFLAGS="$(AVAHI_CFLAGS)"
+
 AVAHI_MAKE_OPTS += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),LIBS=-lintl)
 
 define AVAHI_USERS
@@ -185,10 +193,10 @@ ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
 define AVAHI_INSTALL_INIT_SYSTEMD
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 
-	ln -fs /lib/systemd/system/avahi-daemon.service \
+	ln -fs ../../../../usr/lib/systemd/system/avahi-daemon.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/avahi-daemon.service
 
-	ln -fs /lib/systemd/system/avahi-dnsconfd.service \
+	ln -fs ../../../../usr/lib/systemd/system/avahi-dnsconfd.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/avahi-dnsconfd.service
 
 	$(INSTALL) -D -m 644 package/avahi/avahi_tmpfiles.conf \
