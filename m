From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 5 Sep 2013 20:04:23 -0500
Subject: [Buildroot] [PATCH 09/10] dbus: add support for SELinux
In-Reply-To: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1378429464-12546-10-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/dbus/dbus.mk |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index d50f630..228b98e 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -21,7 +21,6 @@ DBUS_CONF_OPT = --with-dbus-user=dbus \
 		--disable-tests \
 		--disable-asserts \
 		--enable-abstract-sockets \
-		--disable-selinux \
 		--disable-xml-docs \
 		--disable-doxygen-docs \
 		--disable-static \
@@ -54,6 +53,15 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 DBUS_CONF_OPT += --with-systemdsystemunitdir=/lib/systemd/system
 endif
 
+# SELinux support relies on audit support so enable both 
+# of them if libselinux has been selected.
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+DBUS_CONF_OPT += --enable-selinux --enable-libaudit
+DBUS_DEPENDENCIES += libselinux audit
+else
+DBUS_CONF_OPT += --disable-selinux --disable-libaudit
+endif
+
 # fix rebuild (dbus makefile errors out if /var/lib/dbus is a symlink)
 define DBUS_REMOVE_VAR_LIB_DBUS
 	rm -rf $(TARGET_DIR)/var/lib/dbus
-- 
1.7.1
