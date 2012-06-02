From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Jun 2012 18:13:55 +0200
Subject: [Buildroot] [PATCH 05/10] qextserialport: new package
In-Reply-To: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
References: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
Message-ID: <32f4831f7961e448c93c0eef1a9564436183cc73.1338653505.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in                                  |    1 +
 package/qextserialport/Config.in                   |    9 +++++
 .../qextserialport-main-include.patch              |   15 +++++++++
 .../qextserialport-no-examples.patch               |   17 ++++++++++
 .../qextserialport/qextserialport-pkgconfig.patch  |   19 +++++++++++
 package/qextserialport/qextserialport.mk           |   35 ++++++++++++++++++++
 6 files changed, 96 insertions(+)
 create mode 100644 package/qextserialport/Config.in
 create mode 100644 package/qextserialport/qextserialport-main-include.patch
 create mode 100644 package/qextserialport/qextserialport-no-examples.patch
 create mode 100644 package/qextserialport/qextserialport-pkgconfig.patch
 create mode 100644 package/qextserialport/qextserialport.mk

diff --git a/package/Config.in b/package/Config.in
index 4af638f..53d6bba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -369,6 +369,7 @@ source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/libv4l/Config.in"
 source "package/llrp-toolkit/Config.in"
+source "package/qextserialport/Config.in"
 endmenu
 
 menu "Javascript"
diff --git a/package/qextserialport/Config.in b/package/qextserialport/Config.in
new file mode 100644
index 0000000..4e92ecf
--- /dev/null
+++ b/package/qextserialport/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_QEXTSERIALPORT
+	bool "qextserialport"
+	# Qt is a big library, we don't want to select it
+	# automatically without the user knowing
+	depends on BR2_PACKAGE_QT
+	help
+	  A Qt library to manage serial ports
+
+	  http://code.google.com/p/qextserialport/
diff --git a/package/qextserialport/qextserialport-main-include.patch b/package/qextserialport/qextserialport-main-include.patch
new file mode 100644
index 0000000..858f335
--- /dev/null
+++ b/package/qextserialport/qextserialport-main-include.patch
@@ -0,0 +1,15 @@
+Create a main include file QExtSerialPort
+
+This main include file will be installed in
+<QExtSerialPort/QExtSerialPort> so that Qt applications can use this
+library by including header files in a Qt-like style.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: qextserialport-ef4af2a2ee3f/src/QExtSerialPort
+===================================================================
+--- /dev/null
++++ qextserialport-ef4af2a2ee3f/src/QExtSerialPort
+@@ -0,0 +1,2 @@
++#include "qextserialport.h"
++#include "qextserialenumerator.h"
diff --git a/package/qextserialport/qextserialport-no-examples.patch b/package/qextserialport/qextserialport-no-examples.patch
new file mode 100644
index 0000000..c7d2d41
--- /dev/null
+++ b/package/qextserialport/qextserialport-no-examples.patch
@@ -0,0 +1,17 @@
+Disable compilation of examples
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: qextserialport-ef4af2a2ee3f/qextserialport.pro
+===================================================================
+--- qextserialport-ef4af2a2ee3f.orig/qextserialport.pro
++++ qextserialport-ef4af2a2ee3f/qextserialport.pro
+@@ -1,7 +1,4 @@
+ #
+ TEMPLATE = subdirs
+ CONFIG   += ordered
+-SUBDIRS  = src \
+-           examples/enumerator \
+-           examples/event
+-
++SUBDIRS  = src
diff --git a/package/qextserialport/qextserialport-pkgconfig.patch b/package/qextserialport/qextserialport-pkgconfig.patch
new file mode 100644
index 0000000..d67f3fc
--- /dev/null
+++ b/package/qextserialport/qextserialport-pkgconfig.patch
@@ -0,0 +1,19 @@
+Add a pkgconfig file to ease usage with applications
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: qextserialport-ef4af2a2ee3f/qextserialport.pc
+===================================================================
+--- /dev/null
++++ qextserialport-ef4af2a2ee3f/qextserialport.pc
+@@ -0,0 +1,10 @@
++prefix=/usr
++exec_prefix=${prefix}
++libdir=${prefix}/lib
++includedir=${prefix}/include/QExtSerialPort
++
++Name: QtExtSerialPort
++Description: QtExtSerialPort library
++Version: 1.2.0
++Libs: -L${libdir} -lqextserialport
++Cflags: -I${includedir}
diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
new file mode 100644
index 0000000..c632667
--- /dev/null
+++ b/package/qextserialport/qextserialport.mk
@@ -0,0 +1,35 @@
+#############################################################
+#
+# qextserialport
+#
+#############################################################
+
+QEXTSERIALPORT_VERSION     = ef4af2a2ee3f
+QEXTSERIALPORT_SITE        = https://qextserialport.googlecode.com/hg/
+QEXTSERIALPORT_SITE_METHOD = hg
+
+QEXTSERIALPORT_DEPENDENCIES = qt
+
+QEXTSERIALPORT_INSTALL_STAGING = YES
+
+define QEXTSERIALPORT_CONFIGURE_CMDS
+	(cd $(@D); $(QT_QMAKE))
+endef
+
+define QEXTSERIALPORT_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define QEXTSERIALPORT_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/QExtSerialPort
+	cp $(@D)/src/*.h $(STAGING_DIR)/usr/include/QExtSerialPort/
+	cp $(@D)/src/QExtSerialPort $(STAGING_DIR)/usr/include/QExtSerialPort/
+	cp -a $(@D)/src/build/*.so* $(STAGING_DIR)/usr/lib/
+	cp $(@D)/qextserialport.pc $(STAGING_DIR)/usr/lib/pkgconfig/
+endef
+
+define QEXTSERIALPORT_INSTALL_TARGET_CMDS
+	cp -a $(@D)/src/build/*.so.* $(TARGET_DIR)/usr/lib
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.9.5
