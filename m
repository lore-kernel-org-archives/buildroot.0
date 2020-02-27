From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 28 Feb 2020 00:29:52 +0100
Subject: [Buildroot] [PATCH v3 1/4] package/connman: format opts and deps
Message-ID: <20200227232955.16610-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use style typical for Buildroot.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v2->v3:
* New commit (each logical change should be in a separate commit).

 package/connman/connman.mk | 73 +++++++++++++++++++++++++++++---------
 1 file changed, 57 insertions(+), 16 deletions(-)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 2cbf3fe752..8403237c28 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -11,22 +11,63 @@ CONNMAN_DEPENDENCIES = libglib2 dbus iptables
 CONNMAN_INSTALL_STAGING = YES
 CONNMAN_LICENSE = GPL-2.0
 CONNMAN_LICENSE_FILES = COPYING
-CONNMAN_CONF_OPTS += \
-	--with-dbusconfdir=/etc \
-	$(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug) \
-	$(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet) \
-	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi) \
-	$(if $(BR2_PACKAGE_CONNMAN_WISPR),--enable-wispr,--disable-wispr) \
-	$(if $(BR2_PACKAGE_CONNMAN_BLUETOOTH),--enable-bluetooth,--disable-bluetooth) \
-	$(if $(BR2_PACKAGE_CONNMAN_LOOPBACK),--enable-loopback,--disable-loopback) \
-	$(if $(BR2_PACKAGE_CONNMAN_NEARD),--enable-neard,--disable-neard) \
-	$(if $(BR2_PACKAGE_CONNMAN_OFONO),--enable-ofono,--disable-ofono) \
-	$(if $(BR2_INIT_SYSTEMD),--with-systemdunitdir=/usr/lib/systemd/system)
-
-CONNMAN_DEPENDENCIES += \
-	$(if $(BR2_PACKAGE_CONNMAN_NEARD),neard) \
-	$(if $(BR2_PACKAGE_CONNMAN_OFONO),ofono) \
-	$(if $(BR2_PACKAGE_CONNMAN_WISPR),gnutls)
+
+CONNMAN_CONF_OPTS = --with-dbusconfdir=/etc
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+CONNMAN_CONF_OPTS += --with-systemdunitdir=/usr/lib/systemd/system
+endif
+
+ifeq ($(BR2_PACKAGE_CONNMAN_BLUETOOTH),y)
+CONNMAN_CONF_OPTS += --enable-bluetooth
+else
+CONNMAN_CONF_OPTS += --disable-bluetooth
+endif
+
+ifeq ($(BR2_PACKAGE_CONNMAN_DEBUG),y)
+CONNMAN_CONF_OPTS += --enable-debug
+else
+CONNMAN_CONF_OPTS += --disable-debug
+endif
+
+ifeq ($(BR2_PACKAGE_CONNMAN_ETHERNET),y)
+CONNMAN_CONF_OPTS += --enable-ethernet
+else
+CONNMAN_CONF_OPTS += --disable-ethernet
+endif
+
+ifeq ($(BR2_PACKAGE_CONNMAN_LOOPBACK),y)
+CONNMAN_CONF_OPTS += --enable-loopback
+else
+CONNMAN_CONF_OPTS += --disable-loopback
+endif
+
+ifeq ($(BR2_PACKAGE_CONNMAN_NEARD),y)
+CONNMAN_CONF_OPTS += --enable-neard
+CONNMAN_DEPENDENCIES += neard
+else
+CONNMAN_CONF_OPTS += --disable-neard
+endif
+
+ifeq ($(BR2_PACKAGE_CONNMAN_OFONO),y)
+CONNMAN_CONF_OPTS += --enable-ofono
+CONNMAN_DEPENDENCIES += ofono
+else
+CONNMAN_CONF_OPTS += --disable-ofono
+endif
+
+ifeq ($(BR2_PACKAGE_CONNMAN_WIFI),y)
+CONNMAN_CONF_OPTS += --enable-wifi
+else
+CONNMAN_CONF_OPTS += --disable-wifi
+endif
+
+ifeq ($(BR2_PACKAGE_CONNMAN_WISPR),y)
+CONNMAN_CONF_OPTS += --enable-wispr
+CONNMAN_DEPENDENCIES += gnutls
+else
+CONNMAN_CONF_OPTS += --disable-wispr
+endif
 
 define CONNMAN_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
-- 
2.25.1
