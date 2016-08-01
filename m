From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon,  1 Aug 2016 21:58:36 +0200
Subject: [Buildroot] [PATCH] libglob: new package
Message-ID: <20160801195836.30837-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libglob is the OpenBSD implementation of glob(3).

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/Config.in            |  1 +
 package/libglob/Config.in    |  4 ++++
 package/libglob/libglob.hash |  2 ++
 package/libglob/libglob.mk   | 47 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 54 insertions(+)
 create mode 100644 package/libglob/Config.in
 create mode 100644 package/libglob/libglob.hash
 create mode 100644 package/libglob/libglob.mk

diff --git a/package/Config.in b/package/Config.in
index 645fa29..54e9368 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1291,6 +1291,7 @@ menu "Other"
 	source "package/libffi/Config.in"
 	source "package/libgee/Config.in"
 	source "package/libglib2/Config.in"
+	source "package/libglob/Config.in"
 	source "package/libical/Config.in"
 	source "package/liblinear/Config.in"
 	source "package/libnspr/Config.in"
diff --git a/package/libglob/Config.in b/package/libglob/Config.in
new file mode 100644
index 0000000..029ed6a
--- /dev/null
+++ b/package/libglob/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_LIBGLOB
+	bool "libglob"
+	help
+	  OpenBSD implementation of glob(3).
diff --git a/package/libglob/libglob.hash b/package/libglob/libglob.hash
new file mode 100644
index 0000000..0b39407
--- /dev/null
+++ b/package/libglob/libglob.hash
@@ -0,0 +1,2 @@
+# Locally calculated:
+sha256  4f1b204dad065689941c64828a92441fb316c9c7539b39525fa728125da65e22  libglob-1.0.tar.gz
diff --git a/package/libglob/libglob.mk b/package/libglob/libglob.mk
new file mode 100644
index 0000000..62a26f3
--- /dev/null
+++ b/package/libglob/libglob.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# libglob
+#
+################################################################################
+
+LIBGLOB_VERSION = 1.0
+LIBGLOB_SITE = $(call github,voidlinux,libglob,$(LIBGLOB_VERSION))
+LIBGLOB_LICENSE = BSD-3c
+LIBGLOB_LICENSE_FILE = LICENSE
+LIBGLOB_INSTALL_STAGING = YES
+
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+# $1: destination directory
+define LIBGLOB_INSTALL_SHARED
+	$(INSTALL) -m 0755 -D $(@D)/libglob.so.0.0.0 \
+		$(1)/usr/lib/libglob.so.0.0.0
+	ln -sf libglob.so.0.0.0 $(1)/usr/lib/libglob.so.0
+	ln -sf libglob.so.0.0.0 $(1)/usr/lib/libglob.so
+endef
+endif
+
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+# $1: destination directory
+define LIBGLOB_INSTALL_STATIC
+	$(INSTALL) -m 0644 -D $(@D)/libglob.a $(1)/usr/lib/libglob.a
+endef
+endif
+
+define LIBGLOB_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),libglob.so) \
+		$(if $(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),libglob.a)
+endef
+
+define LIBGLOB_INSTALL_STAGING_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/glob.h \
+		$(STAGING_DIR)/usr/include/libglob/glob.h
+	$(call LIBGLOB_INSTALL_SHARED,$(STAGING_DIR))
+	$(call LIBGLOB_INSTALL_STATIC,$(STAGING_DIR))
+endef
+
+define LIBGLOB_INSTALL_TARGET_CMDS
+	$(call LIBGLOB_INSTALL_SHARED,$(TARGET_DIR))
+endef
+
+$(eval $(generic-package))
-- 
2.9.2
