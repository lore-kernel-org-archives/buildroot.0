From: Stephan Hoffmann <sho@relinux.de>
Date: Sat, 22 Sep 2012 08:59:49 +0200
Subject: [Buildroot] [PATCH] qtuio: new package
Message-ID: <1348297189-29498-1-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Implementation of an interface connecting TUIO messages and QT events

https://github.com/x29a/qTUIO

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 build-tested with a minimal internal toolchain for ARM.
---
 package/Config.in       |    6 ++++
 package/qtuio/Config.in |   18 ++++++++++++
 package/qtuio/qtuio.mk  |   70 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+), 0 deletions(-)
 create mode 100644 package/qtuio/Config.in
 create mode 100644 package/qtuio/qtuio.mk

diff --git a/package/Config.in b/package/Config.in
index 58dd5e8..a659a5f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -133,6 +133,12 @@ source "package/sdl_gfx/Config.in"
 comment "other GUIs"
 source "package/efl/Config.in"
 source "package/qt/Config.in"
+
+if BR2_PACKAGE_QT
+comment "QT libraries and helper libraries"
+source "package/qtuio/Config.in"
+endif
+
 source "package/x11r7/Config.in"
 
 comment "X libraries and helper libraries"
diff --git a/package/qtuio/Config.in b/package/qtuio/Config.in
new file mode 100644
index 0000000..19499fd
--- /dev/null
+++ b/package/qtuio/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_QTUIO
+	bool "qtuio"
+	depends on BR2_PACKAGE_QT_GUI_MODULE
+	help
+	  Implementation of an interface connecting TUIO messages
+	  and QT events
+
+	  https://github.com/x29a/qTUIO
+
+config BR2_QTUIO_EXAMPLES
+	bool "qtuio examples"
+	depends on BR2_PACKAGE_QTUIO
+	help
+	  Build and install qtuio examples
+
+comment "qtuio depends on QT gui module"
+	depends on !BR2_PACKAGE_QT_GUI_MODULE
+
diff --git a/package/qtuio/qtuio.mk b/package/qtuio/qtuio.mk
new file mode 100644
index 0000000..c7231f5
--- /dev/null
+++ b/package/qtuio/qtuio.mk
@@ -0,0 +1,70 @@
+#############################################################
+#
+# qTUIO
+#
+#############################################################
+QTUIO_VERSION = abe4973ff6
+QTUIO_SITE = git://github.com/x29a/qTUIO.git
+QTUIO_INSTALL_STAGING = YES
+QTUIO_DEPENDENCIES = qt
+
+QTUIO_LICENSE = GPLv3+
+QTUIO_LICENSE_FILES = COPYING
+
+# The pong example needs QtOpenGL support, which might become available
+# some time in the future. Then add pong to the list of examples.
+QTUIO_EXAMPLES = dials fingerpaint knobs pinchzoom
+
+ifeq ($(BR2_QTUIO_EXAMPLES),y)
+define QTUIO_CONFIGURE_EXAMPLES
+	for example in $(QTUIO_EXAMPLES) ; do \
+		(cd $(@D)/examples/$${example} && $(QT_QMAKE)) ; \
+	done
+endef
+endif
+
+define QTUIO_CONFIGURE_CMDS
+	cd $(@D)/src && $(QT_QMAKE)
+	$(QTUIO_CONFIGURE_EXAMPLES)
+endef
+
+ifeq ($(BR2_QTUIO_EXAMPLES),y)
+define QTUIO_BUILD_EXAMPLES
+	for example in $(QTUIO_EXAMPLES) ; do \
+		($(MAKE) -C $(@D)/examples/$${example}) ; \
+	done
+endef
+endif
+
+define QTUIO_BUILD_CMDS
+	$(MAKE) -C $(@D)/src
+	$(QTUIO_BUILD_EXAMPLES)
+endef
+
+# Unfortunately, there is no working "install" target available
+ifeq ($(BR2_QTUIO_EXAMPLES),y)
+define QTUIO_INSTALL_EXAMPLES
+	for example in $(QTUIO_EXAMPLES) ; do \
+		($(INSTALL) -D -m 0755 $(@D)/examples/$${example}/$${example} $(TARGET_DIR)/usr/share/qtuio/$${example}) ; \
+	done
+endef
+endif
+
+define QTUIO_INSTALL_TARGET_CMDS
+	cp -dpf $(@D)/lib/libqTUIO.so* $(TARGET_DIR)/usr/lib
+	$(QTUIO_INSTALL_EXAMPLES)
+endef
+
+define QTUIO_INSTALL_STAGING_CMDS
+	cp -dpf $(@D)/lib/libqTUIO.so* $(STAGING_DIR)/usr/lib
+endef
+
+define QTUIO_CLEAN_CMDS
+	$(MAKE) -C $(@D)/src clean
+	for example in $(QTUIO_EXAMPLES) ; do \
+		($(MAKE) -C $(@D)/examples/$${example} clean) ; \
+	done
+endef
+
+
+$(eval $(generic-package))
-- 
1.7.0.4
