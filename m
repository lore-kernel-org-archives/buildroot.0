From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Dec 2013 12:00:26 -0300
Subject: [Buildroot] [PATCH] dbus-cpp: new package
Message-ID: <1388070026-4256-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

D-Bus C++ bindings, closes bug #65.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                           |  1 +
 package/dbus-cpp/Config.in                  | 18 +++++++++++++++
 package/dbus-cpp/dbus-cpp-0001-gcc4.7.patch | 17 ++++++++++++++
 package/dbus-cpp/dbus-cpp.mk                | 36 +++++++++++++++++++++++++++++
 4 files changed, 72 insertions(+)
 create mode 100644 package/dbus-cpp/Config.in
 create mode 100644 package/dbus-cpp/dbus-cpp-0001-gcc4.7.patch
 create mode 100644 package/dbus-cpp/dbus-cpp.mk

diff --git a/package/Config.in b/package/Config.in
index 9bffb02..d1769f4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -262,6 +262,7 @@ source "package/acpid/Config.in"
 source "package/cdrkit/Config.in"
 source "package/cryptsetup/Config.in"
 source "package/dbus/Config.in"
+source "package/dbus-cpp/Config.in"
 source "package/dbus-glib/Config.in"
 source "package/dbus-python/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/dbus-cpp/Config.in b/package/dbus-cpp/Config.in
new file mode 100644
index 0000000..f631ece
--- /dev/null
+++ b/package/dbus-cpp/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_DBUS_CPP
+	bool "dbus-c++"
+	depends on BR2_PACKAGE_DBUS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_USE_MMU # dbus
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_EXPAT
+	help
+	  dbus-c++ attempts to provide a C++ API for D-BUS.
+	  The library has a glib/gtk and an Ecore mainloop integration.
+	  It also offers an optional own main loop.
+
+	  http://sourceforge.net/projects/dbus-cplusplus/
+
+comment "dbus-c++ needs a toolchain w/ C++, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_DBUS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dbus-cpp/dbus-cpp-0001-gcc4.7.patch b/package/dbus-cpp/dbus-cpp-0001-gcc4.7.patch
new file mode 100644
index 0000000..ad3046c
--- /dev/null
+++ b/package/dbus-cpp/dbus-cpp-0001-gcc4.7.patch
@@ -0,0 +1,17 @@
+Fix build failure with gcc 4.7+
+From bugtracker: http://sourceforge.net/p/dbus-cplusplus/patches/13/
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff --git a/include/dbus-c++/eventloop-integration.h b/include/dbus-c++/eventloop-integration.h
+index 1b0302e..3e44304 100644
+--- a/include/dbus-c++/eventloop-integration.h
++++ b/include/dbus-c++/eventloop-integration.h
+@@ -26,6 +26,7 @@
+ #define __DBUSXX_EVENTLOOP_INTEGRATION_H
+ 
+ #include <errno.h>
++#include <unistd.h>
+ #include "api.h"
+ #include "dispatcher.h"
+ #include "util.h"
diff --git a/package/dbus-cpp/dbus-cpp.mk b/package/dbus-cpp/dbus-cpp.mk
new file mode 100644
index 0000000..7936abd
--- /dev/null
+++ b/package/dbus-cpp/dbus-cpp.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# dbus-c++
+#
+################################################################################
+
+DBUS_CPP_VERSION = 0.9.0
+DBUS_CPP_SITE = http://downloads.sourceforge.net/project/dbus-cplusplus/dbus-c++/$(DBUS_CPP_VERSION)
+DBUS_CPP_SOURCE = libdbus-c++-$(DBUS_CPP_VERSION).tar.gz
+DBUS_CPP_INSTALL_STAGING = YES
+# expat is required for the tools irrespective of dbus xml backend
+DBUS_CPP_DEPENDENCIES = host-dbus-cpp host-pkgconf dbus expat
+HOST_DBUS_CPP_DEPENDENCIES = host-pkgconf host-dbus host-expat
+DBUS_CPP_CONF_OPT = --disable-examples --disable-tests --disable-doxygen-docs \
+	--with-build-libdbus-cxx=$(HOST_DBUS_CPP_BUILDDIR)
+HOST_DBUS_CPP_CONF_OPT = --disable-examples --disable-tests \
+	--disable-doxygen-docs --disable-ecore --disable-glib
+DBUS_CPP_LICENSE = LGPLv2.1+
+DBUS_CPP_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_LIBECORE),y)
+	DBUS_CPP_CONF_OPT += --enable-ecore
+	DBUS_CPP_DEPENDENCIES += libecore
+else
+	DBUS_CPP_CONF_OPT += --disable-ecore
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+	DBUS_CPP_CONF_OPT += --enable-glib
+	DBUS_CPP_DEPENDENCIES += libglib2
+else
+	DBUS_CPP_CONF_OPT += --disable-glib
+endif
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.8.3.2
