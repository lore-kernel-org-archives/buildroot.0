From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
Date: Mon,  7 Mar 2011 18:21:18 +0100
Subject: [Buildroot] [PATCH] libv4l: Add new package libv4l
Message-ID: <1299518478-4151-1-git-send-email-schwarzkopf@sensortherm.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
---
 package/Config.in        |    1 +
 package/libv4l/Config.in |   11 +++++++++++
 package/libv4l/libv4l.mk |   30 ++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 package/libv4l/Config.in
 create mode 100644 package/libv4l/libv4l.mk

diff --git a/package/Config.in b/package/Config.in
index f459c1b..18d7a6c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -96,6 +96,7 @@ source "package/rrdtool/Config.in"
 comment "graphic libraries"
 source "package/directfb/Config.in"
 source "package/directfb-examples/Config.in"
+source "package/libv4l/Config.in"
 source "package/divine/Config.in"
 source "package/fbdump/Config.in"
 source "package/fbgrab/Config.in"
diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
new file mode 100644
index 0000000..1620b93
--- /dev/null
+++ b/package/libv4l/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBV4L
+	bool "libv4l"
+	depends on BR2_LARGEFILE
+	help
+	  libv4l is an accompanying collection of libraries that adds a thin
+	  abstraction layer on top of video4linux2 (V4L2) devices.
+
+	  http://freshmeat.net/projects/libv4l
+
+comment "libv4l requires a toolchain with LARGEFILE support"
+        depends on !BR2_LARGEFILE
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
new file mode 100644
index 0000000..12c998d
--- /dev/null
+++ b/package/libv4l/libv4l.mk
@@ -0,0 +1,30 @@
+#############################################################
+#
+# libv4l
+#
+#############################################################
+LIBV4L_VERSION = 0.8.3
+LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
+LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils/
+LIBV4L_INSTALL_STAGING = YES
+LIBV4L_INSTALL_TARGET = YES
+LIBV4L_MAKE_OPTS = PREFIX=/usr
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+	LIBV4L_MAKE_OPTS += LINKTYPE=static
+endif
+
+define LIBV4L_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/lib $(LIBV4L_MAKE_OPTS)
+endef
+
+define LIBV4L_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D)/lib DESTDIR=$(STAGING_DIR) $(LIBV4L_MAKE_OPTS) install
+endef
+
+define LIBV4L_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D)/lib DESTDIR=$(TARGET_DIR) $(LIBV4L_MAKE_OPTS) install
+endef
+
+$(eval $(call GENTARGETS,package,libv4l))
+
-- 
1.7.0.4
