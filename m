From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Nov 2014 14:53:31 +0100
Subject: [Buildroot] [PATCH next 3/3] dbus-python: add python3 support
In-Reply-To: <1416491611-19815-1-git-send-email-peter@korsgaard.com>
References: <1416491611-19815-1-git-send-email-peter@korsgaard.com>
Message-ID: <1416491611-19815-4-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus-python/Config.in      |  5 +++--
 package/dbus-python/dbus-python.mk | 17 ++++++++++++++---
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/package/dbus-python/Config.in b/package/dbus-python/Config.in
index a38d277..4b302ef 100644
--- a/package/dbus-python/Config.in
+++ b/package/dbus-python/Config.in
@@ -3,10 +3,11 @@ config BR2_PACKAGE_DBUS_PYTHON
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_PACKAGE_DBUS
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_DBUS_GLIB
 	# pyexpat: runtime dependency only
-	select BR2_PACKAGE_PYTHON_PYEXPAT
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3
 	help
 	  Python bindings for D-Bus
 
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index bc57689..1637406 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -9,14 +9,25 @@ DBUS_PYTHON_SITE = http://dbus.freedesktop.org/releases/dbus-python
 DBUS_PYTHON_INSTALL_STAGING = YES
 DBUS_PYTHON_LICENSE = MIT
 DBUS_PYTHON_LICENSE_FILES = COPYING
+DBUS_PYTHON_DEPENDENCIES = dbus-glib
+DBUS_PYTHON_CONF_OPTS = --disable-html-docs --disable-api-docs
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+DBUS_PYTHON_DEPENDENCIES += python host-python
 
-DBUS_PYTHON_CONF_ENV = \
+DBUS_PYTHON_CONF_ENV += \
 	PYTHON=$(HOST_DIR)/usr/bin/python2 \
 	PYTHON_INCLUDES="$(shell $(STAGING_DIR)/usr/bin/python2-config --includes)" \
 	PYTHON_LIBS="$(shell $(STAGING_DIR)/usr/bin/python2-config --ldflags)"
+else
+DBUS_PYTHON_DEPENDENCIES += python3 host-python3
+
+DBUS_PYTHON_CONF_ENV += \
+	PYTHON=$(HOST_DIR)/usr/bin/python3 \
+	PYTHON_INCLUDES="$(shell $(STAGING_DIR)/usr/bin/python3-config --includes)" \
+	PYTHON_LIBS="$(shell $(STAGING_DIR)/usr/bin/python3-config --ldflags)"
+endif
 
-DBUS_PYTHON_CONF_OPTS = --disable-html-docs --disable-api-docs
 
-DBUS_PYTHON_DEPENDENCIES = dbus-glib python host-python
 
 $(eval $(autotools-package))
-- 
2.1.3
