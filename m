From: Stephan Hoffmann <sho@relinux.de>
Date: Wed, 29 Aug 2012 11:01:09 +0200
Subject: [Buildroot] [PATCH 4/4] qtuio: new package
In-Reply-To: <1346230869-4926-1-git-send-email-sho@relinux.de>
References: <1346230869-4926-1-git-send-email-sho@relinux.de>
Message-ID: <1346230869-4926-4-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Implementation of an interface connecting TUIO messages and QT events

https://github.com/x29a/qTUIO

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 package/Config.in       |    3 ++
 package/qtuio/Config.in |   18 ++++++++++++
 package/qtuio/qtuio.mk  |   68 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+), 0 deletions(-)
 create mode 100644 package/qtuio/Config.in
 create mode 100644 package/qtuio/qtuio.mk

diff --git a/package/Config.in b/package/Config.in
index a4da3c1..1c7b221 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -133,6 +133,9 @@ source "package/efl/Config.in"
 source "package/qt/Config.in"
 source "package/x11r7/Config.in"
 
+comment "QT libraries and helper libraries"
+source "package/qtuio/Config.in"
+
 comment "X libraries and helper libraries"
 source "package/liberation/Config.in"
 source "package/libsexy/Config.in"
diff --git a/package/qtuio/Config.in b/package/qtuio/Config.in
new file mode 100644
index 0000000..dfea228
--- /dev/null
+++ b/package/qtuio/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_QTUIO
+	bool "qtuio"
+	select BR2_PACKAGE_MTDEF2TUIO
+	depends on BR2_PACKAGE_QT
+	help
+	  Implementation of an interface connecting TUIO messages
+	  and QT events
+
+	  https://github.com/x29a/qTUIO
+
+comment "qtuio depends on QT"
+	depends on !BR2_PACKAGE_QT
+
+config BR2_QTUIO_EXAMPLES
+	bool "qtuio_examples"
+	depends on BR2_PACKAGE_QTUIO
+	help
+	  Build and install qtuio examples
diff --git a/package/qtuio/qtuio.mk b/package/qtuio/qtuio.mk
new file mode 100644
index 0000000..efaeae8
--- /dev/null
+++ b/package/qtuio/qtuio.mk
@@ -0,0 +1,68 @@
+#############################################################
+#
+# qTUIO
+#
+#############################################################
+QTUIO_VERSION = abe4973ff6
+QTUIO_SITE = git://github.com/x29a/qTUIO.git
+QTUIO_DEPENDENCIES = qt mtdev2tuio
+
+QTUIO_LICENSE = GPLv3+
+QTUIO_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_QTUIO_EXAMPLES),y)
+define QTUIO_CONFIGURE_EXAMPLES
+cd $(@D)/examples/dials && $(QT_QMAKE)
+cd $(@D)/examples/fingerpaint && $(QT_QMAKE)
+cd $(@D)/examples/knobs && $(QT_QMAKE)
+cd $(@D)/examples/pinchzoom && $(QT_QMAKE)
+## pong depends on QtOpenGL cd $(@D)/examples/pong && $(QT_QMAKE)
+endef
+endif
+
+define QTUIO_CONFIGURE_CMDS
+cd $(@D)/src && $(QT_QMAKE)
+$(QTUIO_CONFIGURE_EXAMPLES)
+endef
+
+ifeq ($(BR2_QTUIO_EXAMPLES),y)
+define QTUIO_BUILD_EXAMPLES
+$(MAKE) -C $(@D)/examples/dials
+$(MAKE) -C $(@D)/examples/fingerpaint
+$(MAKE) -C $(@D)/examples/knobs
+$(MAKE) -C $(@D)/examples/pinchzoom
+## pong depends on QtOpenGL $(MAKE) -C $(@D)/examples/pong
+endef
+endif
+
+define QTUIO_BUILD_CMDS
+$(MAKE) -C $(@D)/src
+$(QTUIO_BUILD_EXAMPLES)
+endef
+
+ifeq ($(BR2_QTUIO_EXAMPLES),y)
+define QTUIO_INSTALL_EXAMPLES
+$(INSTALL) -D -m 0755 $(@D)/examples/dials/dials $(TARGET_DIR)/usr/share/qtuio/dials
+$(INSTALL) -D -m 0755 $(@D)/examples/fingerpaint/fingerpaint $(TARGET_DIR)/usr/share/qtuio/fingerpaint
+$(INSTALL) -D -m 0755 $(@D)/examples/knobs/knobs $(TARGET_DIR)/usr/share/qtuio/knobs
+$(INSTALL) -D -m 0755 $(@D)/examples/pinchzoom/pinchzoom $(TARGET_DIR)/usr/share/qtuio/pinchzoom
+## pong depends on QtOpenGL $(INSTALL) -D -m 0755 $(@D)/examples/pong/pong $(TARGET_DIR)/usr/share/qtuio/pong
+endef
+endif
+
+define QTUIO_INSTALL_TARGET_CMDS
+$(INSTALL) -D -m 0755 $(@D)/lib/libqTUIO.so* $(TARGET_DIR)/usr/lib
+$(QTUIO_INSTALL_EXAMPLES)
+endef
+
+define QTUIO_CLEAN_CMDS
+$(MAKE) -C $(@D)/src clean
+$(MAKE) -C $(@D)/examples/dials clean
+$(MAKE) -C $(@D)/examples/fingerpaint clean
+$(MAKE) -C $(@D)/examples/knobs clean
+$(MAKE) -C $(@D)/examples/pinchzoom clean
+$(MAKE) -C $(@D)/examples/pong clean
+endef
+
+
+$(eval $(generic-package))
-- 
1.7.0.4
