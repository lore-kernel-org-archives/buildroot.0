From: Brent Generous <bgenerous@impinj.com>
Date: Wed, 17 Oct 2018 21:42:41 +0000
Subject: [Buildroot] [PATCH v2] dbus-python: add host package
Message-ID: <20181017214225.22415-1-bgenerous@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This can be useful for Python scripts running on a host machine that
need to connect to a bus on a remote device, e.g. test scripts.

The target dbus-python depends on dbus instead of selecting it because
dbus has dependencies that check that it is supported. Using 'select'
would override those dependencies. For host-dbus, there are no such
checks -- it's assumed the host has the features neeeded to run dbus, so
it is okay to just depend on host-dbus.

The pyexpat dependency is not needed, as it is forced on for
host-python.

Signed-off-by: Brent Generous <bgenerous@impinj.com>
---
 package/dbus-python/dbus-python.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index da04b7404f..6021b63060 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -12,6 +12,10 @@ DBUS_PYTHON_LICENSE_FILES = COPYING
 DBUS_PYTHON_DEPENDENCIES = dbus-glib
 DBUS_PYTHON_CONF_OPTS = --disable-html-docs --disable-api-docs
 
+HOST_DBUS_PYTHON_DEPENDENCIES = host-dbus host-dbus-glib \
+				$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
+HOST_DBUS_PYTHON_CONF_OPTS = $(DBUS_PYTHON_CONF_OPTS)
+
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 DBUS_PYTHON_DEPENDENCIES += python host-python
 
@@ -19,6 +23,11 @@ DBUS_PYTHON_CONF_ENV += \
 	PYTHON=$(HOST_DIR)/bin/python2 \
 	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python2-config --includes`" \
 	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python2-config --ldflags`"
+
+HOST_DBUS_PYTHON_CONF_ENV += \
+	PYTHON=$(HOST_DIR)/bin/python2 \
+	PYTHON_INCLUDES="`$(HOST_DIR)/usr/bin/python2-config --includes`" \
+	PYTHON_LIBS="`$(HOST_DIR)/usr/bin/python2-config --ldflags`"
 else
 DBUS_PYTHON_DEPENDENCIES += python3 host-python3
 
@@ -26,6 +35,12 @@ DBUS_PYTHON_CONF_ENV += \
 	PYTHON=$(HOST_DIR)/bin/python3 \
 	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
 	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`"
+
+HOST_DBUS_PYTHON_CONF_ENV += \
+	PYTHON=$(HOST_DIR)/bin/python3 \
+	PYTHON_INCLUDES="`$(HOST_DIR)/usr/bin/python3-config --includes`" \
+	PYTHON_LIBS="`$(HOST_DIR)/usr/bin/python3-config --ldflags`"
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.14.4
