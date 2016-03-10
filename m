From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Mar 2016 11:52:36 -0300
Subject: [Buildroot] [PATCH 1/2] libglib2: improve dev file handling
Message-ID: <1457621557-23336-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove source schema files from target
(/usr/share/glib-2.0/schemas/*.dtd and *.xml) at target finalization
time.
This is because other packages install schemas as well to avoid
duplicating file removal efforts all around.

Add a schema compiler run on target finalization as well - we previously
didn't do this since not many packages use it, however the upcoming
connman-gtk package does require a valid gschemas.compiled to work
properly.
We also do this at target finalization to avoid each package handling
this on their own.

Purge some extra binaries and files from the target, like the schema
compiler to save additional space since they're unused at run time.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libglib2/libglib2.mk | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index ea45f4a..09cdd87 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -126,22 +126,43 @@ else
 LIBGLIB2_CONF_OPTS += --with-pcre=internal
 endif
 
+# Purge gdb-related files
+ifneq ($(BR2_PACKAGE_GDB),y)
+define LIBGLIB2_REMOVE_GDB_FILES
+	rm -rf $(TARGET_DIR)/usr/share/glib-2.0/gdb
+endef
+endif
+
+# Purge useless binaries from target
 define LIBGLIB2_REMOVE_DEV_FILES
 	rm -rf $(TARGET_DIR)/usr/lib/glib-2.0
-	rm -rf $(TARGET_DIR)/usr/share/glib-2.0/gettext
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/glib-2.0
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,glib-genmarshal glib-gettextize glib-mkenums gobject-query gtester gtester-report)
+	rm -rf $(addprefix $(TARGET_DIR)/usr/share/glib-2.0/,codegen gettext)
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,glib-compile-schemas glib-compile-resources glib-genmarshal glib-gettextize glib-mkenums gobject-query gtester gtester-report)
+	$(LIBGLIB2_REMOVE_GDB_FILES)
 endef
 
 LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_DEV_FILES
 
-define LIBGLIB2_REMOVE_GDB_FILES
-	rm -rf $(TARGET_DIR)/usr/share/glib-2.0/gdb
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/glib-2.0
+# Remove schema sources/DTDs, we use staging ones to compile them.
+# Do so at target finalization since other packages install additional
+# ones and we want to deal with it in a single place.
+define LIBGLIB2_REMOVE_TARGET_SCHEMAS
+	rm -f $(TARGET_DIR)/usr/share/glib-2.0/schemas/*.xml \
+		$(TARGET_DIR)/usr/share/glib-2.0/schemas/*.dtd
 endef
 
-ifneq ($(BR2_PACKAGE_GDB),y)
-LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_GDB_FILES
+# Compile schemas at target finalization since other packages install
+# them as well, and better do it in a central place.
+# It's used at run time so it doesn't matter defering it.
+define LIBGLIB2_COMPILE_SCHEMAS
+	$(HOST_DIR)/usr/bin/glib-compile-schemas \
+		$(STAGING_DIR)/usr/share/glib-2.0/schemas \
+		--targetdir=$(TARGET_DIR)/usr/share/glib-2.0/schemas
+endef
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+TARGET_FINALIZE_HOOKS += LIBGLIB2_REMOVE_TARGET_SCHEMAS
+TARGET_FINALIZE_HOOKS += LIBGLIB2_COMPILE_SCHEMAS
 endif
 
 $(eval $(autotools-package))
-- 
2.4.10
