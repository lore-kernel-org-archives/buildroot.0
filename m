From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 12:01:33 +0100
Subject: [Buildroot] [PATCH 05/10] libffi: new package
In-Reply-To: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
References: <cover.1295866866.git.thomas.petazzoni@free-electrons.com>
Message-ID: <53b628750ea059696cf3babbce8245911c43e272.1295866866.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libffi is needed by the Python interpreter.

The libffi library provides a portable, high level programming
interface to various calling conventions. This allows a programmer to
call any function specified by a call interface description at
run-time.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |    1 +
 package/libffi/Config.in |    9 +++++++++
 package/libffi/libffi.mk |   33 +++++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 package/libffi/Config.in
 create mode 100644 package/libffi/libffi.mk

diff --git a/package/Config.in b/package/Config.in
index da5b62b..438e1b4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -326,6 +326,7 @@ source "package/libcap/Config.in"
 source "package/libdaemon/Config.in"
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"
+source "package/libffi/Config.in"
 source "package/libglib2/Config.in"
 source "package/liboil/Config.in"
 source "package/startup-notification/Config.in"
diff --git a/package/libffi/Config.in b/package/libffi/Config.in
new file mode 100644
index 0000000..56eedf8
--- /dev/null
+++ b/package/libffi/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBFFI
+	bool "libffi"
+	help
+	  The libffi library provides a portable, high level
+	  programming interface to various calling conventions. This
+	  allows a programmer to call any function specified by a call
+	  interface description at run-time.
+
+	  http://sourceware.org/libffi/
\ No newline at end of file
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
new file mode 100644
index 0000000..0c5184d
--- /dev/null
+++ b/package/libffi/libffi.mk
@@ -0,0 +1,33 @@
+#############################################################
+#
+# libffi
+#
+#############################################################
+
+LIBFFI_VERSION = 3.0.9
+LIBFFI_SITE    = ftp://sources.redhat.com/pub/libffi/
+
+LIBFFI_INSTALL_STAGING = YES
+
+# Move the headers to the usual location, and adjust the .pc file
+# accordingly
+define LIBFFI_MOVE_STAGING_HEADERS
+	mv $(STAGING_DIR)/usr/lib/libffi-*/include/*.h $(STAGING_DIR)/usr/include/
+	sed -i '/^includedir.*/d' $(STAGING_DIR)/usr/lib/pkgconfig/libffi.pc
+	rm -rf $(TARGET_DIR)/usr/lib/libffi-*
+endef
+
+LIBFFI_POST_INSTALL_STAGING_HOOKS += LIBFFI_MOVE_STAGING_HEADERS
+
+# Similar for target headers
+define LIBFFI_MOVE_TARGET_HEADERS
+	install -d $(TARGET_DIR)/usr/include/
+	mv $(TARGET_DIR)/usr/lib/libffi-*/include/*.h $(TARGET_DIR)/usr/include/
+	sed -i '/^includedir.*/d' $(TARGET_DIR)/usr/lib/pkgconfig/libffi.pc
+	rm -rf $(TARGET_DIR)/usr/lib/libffi-*
+endef
+
+LIBFFI_POST_INSTALL_TARGET_HOOKS += LIBFFI_MOVE_TARGET_HEADERS
+
+$(eval $(call AUTOTARGETS,package,libffi))
+
-- 
1.7.0.4
