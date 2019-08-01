From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 1 Aug 2019 12:52:29 +0200
Subject: [Buildroot] [git commit] dbus-python: add host package
Message-ID: <20190801104954.9502B88FF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fa51d247bfad150232185d8b500bce1e5c94355
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in.host             |  1 +
 package/dbus-python/Config.in.host |  6 ++++++
 package/dbus-python/dbus-python.mk | 18 ++++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 1501889b72..93822304e9 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -10,6 +10,7 @@ menu "Host utilities"
 	source "package/cmake/Config.in.host"
 	source "package/cramfs/Config.in.host"
 	source "package/cryptsetup/Config.in.host"
+	source "package/dbus-python/Config.in.host"
 	source "package/dfu-util/Config.in.host"
 	source "package/dos2unix/Config.in.host"
 	source "package/dosfstools/Config.in.host"
diff --git a/package/dbus-python/Config.in.host b/package/dbus-python/Config.in.host
new file mode 100644
index 0000000000..1e30e0a7f0
--- /dev/null
+++ b/package/dbus-python/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_DBUS_PYTHON
+	bool "host dbus-python"
+	help
+	  Python bindings for D-Bus
+
+	  http://dbus.freedesktop.org/doc/dbus-python/
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index d6af7454af..eaf4e5f483 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -12,6 +12,9 @@ DBUS_PYTHON_LICENSE_FILES = COPYING
 DBUS_PYTHON_DEPENDENCIES = dbus-glib
 DBUS_PYTHON_CONF_OPTS = --disable-html-docs --disable-api-docs
 
+HOST_DBUS_PYTHON_DEPENDENCIES = host-dbus-glib
+HOST_DBUS_PYTHON_CONF_OPTS = --disable-html-docs --disable-api-docs
+
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 DBUS_PYTHON_DEPENDENCIES += python host-python
 
@@ -19,6 +22,13 @@ DBUS_PYTHON_CONF_ENV += \
 	PYTHON=$(HOST_DIR)/bin/python2 \
 	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python2-config --includes`" \
 	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python2-config --ldflags`"
+
+HOST_DBUS_PYTHON_DEPENDENCIES += host-python
+
+HOST_DBUS_PYTHON_CONF_ENV += \
+	PYTHON=$(HOST_DIR)/bin/python2 \
+	PYTHON_INCLUDES="`$(HOST_DIR)/usr/bin/python2-config --includes`" \
+	PYTHON_LIBS="`$(HOST_DIR)/usr/bin/python2-config --ldflags`"
 else
 DBUS_PYTHON_DEPENDENCIES += python3 host-python3
 
@@ -26,6 +36,14 @@ DBUS_PYTHON_CONF_ENV += \
 	PYTHON=$(HOST_DIR)/bin/python3 \
 	PYTHON_INCLUDES="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
 	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`"
+
+HOST_DBUS_PYTHON_DEPENDENCIES += host-python3
+
+HOST_DBUS_PYTHON_CONF_ENV += \
+	PYTHON=$(HOST_DIR)/bin/python3 \
+	PYTHON_INCLUDES="`$(HOST_DIR)/usr/bin/python3-config --includes`" \
+	PYTHON_LIBS="`$(HOST_DIR)/usr/bin/python3-config --ldflags`"
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
