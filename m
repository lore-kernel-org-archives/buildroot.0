From: Stephan Hoffmann <sho@relinux.de>
Date: Wed, 29 Aug 2012 11:01:08 +0200
Subject: [Buildroot] [PATCH 3/4] mtdev2tuio: new package
In-Reply-To: <1346230869-4926-1-git-send-email-sho@relinux.de>
References: <1346230869-4926-1-git-send-email-sho@relinux.de>
Message-ID: <1346230869-4926-3-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mtdev2tuio is a simple application for converting touch events
to the standart TUIO 1.1 protocol.

https://github.com/olivopaolo/mtdev2tuio

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 package/Config.in                |    1 +
 package/mtdev2tuio/Config.in     |   10 ++++++++++
 package/mtdev2tuio/mtdev2tuio.mk |   24 ++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 package/mtdev2tuio/Config.in
 create mode 100644 package/mtdev2tuio/mtdev2tuio.mk

diff --git a/package/Config.in b/package/Config.in
index 3da6306..a4da3c1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -463,6 +463,7 @@ source "package/libsigc/Config.in"
 source "package/libtpl/Config.in"
 source "package/liburcu/Config.in"
 source "package/lttng-libust/Config.in"
+source "package/mtdev2tuio/Config.in"
 source "package/orc/Config.in"
 source "package/poco/Config.in"
 source "package/protobuf/Config.in"
diff --git a/package/mtdev2tuio/Config.in b/package/mtdev2tuio/Config.in
new file mode 100644
index 0000000..697e219
--- /dev/null
+++ b/package/mtdev2tuio/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_MTDEV2TUIO
+	bool "mtdev2tuio"
+	select BR2_PACKAGE_LIBLO
+	select BR2_PACKAGE_MTDEV
+	help
+	  mtdev2tuio is a simple application for converting touch
+	  events captured from libmtdev to TUIO 1.1
+
+	  https://github.com/olivopaolo/mtdev2tuio
+
diff --git a/package/mtdev2tuio/mtdev2tuio.mk b/package/mtdev2tuio/mtdev2tuio.mk
new file mode 100644
index 0000000..1a00f6a
--- /dev/null
+++ b/package/mtdev2tuio/mtdev2tuio.mk
@@ -0,0 +1,24 @@
+#############################################################
+#
+# mtdev2tuio
+#
+#############################################################
+MTDEV2TUIO_VERSION = e1e7378d86
+MTDEV2TUIO_SITE = git://github.com/olivopaolo/mtdev2tuio.git
+MTDEV2TUIO_DEPENDENCIES = mtdev liblo
+MTDEV2TUIO_LICENSE = GPLv3+
+MTDEV2TUIO_LICENSE_FILES = COPYING
+
+define MTDEV2TUIO_BUILD_CMDS
+$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_CC)" -C $(@D) 
+endef
+
+define MTDEV2TUIO_INSTALL_TARGET_CMDS
+$(INSTALL) -D -m 0755 $(@D)/mtdev2tuio $(TARGET_DIR)/usr/bin/
+endef
+
+define MTDEV2TUIO_CLEAN_CMDS
+$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_CC)" -C $(@D) clean
+endef
+
+$(eval $(generic-package))
-- 
1.7.0.4
