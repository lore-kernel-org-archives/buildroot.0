From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
Date: Fri,  4 Mar 2011 16:47:00 +0100
Subject: [Buildroot] [PATCH] libv4l: Add new package libv4l
Message-ID: <1299253620-10707-1-git-send-email-schwarzkopf@sensortherm.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
---
 package/libv4l/Config.in |   10 ++++++++++
 package/libv4l/libv4l.mk |   44 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+), 0 deletions(-)
 create mode 100644 package/libv4l/Config.in
 create mode 100644 package/libv4l/libv4l.mk

diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
new file mode 100644
index 0000000..df447c9
--- /dev/null
+++ b/package/libv4l/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBV4L
+	bool "libv4l"
+	depends on BR2_LARGEFILE
+	help
+	  	libv4l is an accompanying collection of libraries that adds a thin abstraction layer on top of video4linux2 (V4L2) devices.
+
+		http://freshmeat.net/projects/libv4l
+
+comment "libv4l requires a toolchain with LARGEFILE support"
+        depends on !BR2_LARGEFILE
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
new file mode 100644
index 0000000..adf653e
--- /dev/null
+++ b/package/libv4l/libv4l.mk
@@ -0,0 +1,44 @@
+#############################################################
+#
+# libv4l
+#
+#############################################################
+LIBV4L_VERSION = 0.8.1
+LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
+LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils/
+LIBV4L_INSTALL_STAGING = YES
+LIBV4L_INSTALL_TARGET = YES
+LIBV4L_CONF_OPT = --enable-shared \
+		  --enable-static \
+
+define LIBV4L_BUILD_CMDS
+ 	#$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) all
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/lib PREFIX=/usr LINKTYPE=static
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/lib PREFIX=/usr 
+#CFLAGS=-DO_LARGEFILE=0400000
+endef
+
+define LIBV4L_INSTALL_STAGING_CMDS
+ 	$(INSTALL) -D -m 0755 $(@D)/lib/libv4l1/libv4l1.a $(STAGING_DIR)/usr/lib/libv4l1.a
+ 	$(INSTALL) -D -m 0644 $(@D)/lib/include/libv4l1.h $(STAGING_DIR)/usr/include/libv4l1.h
+ 	$(INSTALL) -D -m 0755 $(@D)/lib/libv4l1/libv4l1.so* $(STAGING_DIR)/usr/lib
+
+ 	$(INSTALL) -D -m 0755 $(@D)/lib/libv4l2/libv4l2.a $(STAGING_DIR)/usr/lib/libv4l2.a
+ 	$(INSTALL) -D -m 0644 $(@D)/lib/include/libv4l2.h $(STAGING_DIR)/usr/include/libv4l2.h
+ 	$(INSTALL) -D -m 0755 $(@D)/lib/libv4l2/libv4l2.so* $(STAGING_DIR)/usr/lib
+
+ 	$(INSTALL) -D -m 0755 $(@D)/lib/libv4lconvert/libv4lconvert.a $(STAGING_DIR)/usr/lib/libv4l2.a
+ 	$(INSTALL) -D -m 0644 $(@D)/lib/include/libv4lconvert.h $(STAGING_DIR)/usr/include/libv4lconvert.h
+ 	$(INSTALL) -D -m 0755 $(@D)/lib/libv4lconvert/libv4lconvert.so* $(STAGING_DIR)/usr/lib
+endef
+
+define LIBV4L_INSTALL_TARGET_CMDS
+ 	$(INSTALL) -D -m 0755 $(@D)/lib/libv4l1/libv4l1.so* $(TARGET_DIR)/usr/lib
+ 	$(INSTALL) -D -m 0755 $(@D)/lib/libv4l2/libv4l2.so* $(TARGET_DIR)/usr/lib
+ 	$(INSTALL) -D -m 0755 $(@D)/lib/libv4lconvert/libv4lconvert.so* $(TARGET_DIR)/usr/lib
+endef
+
+$(eval $(call GENTARGETS,package,libv4l))
+#$(eval $(call AUTOTARGETS,package,libv4l))
+
+
-- 
1.7.0.4
