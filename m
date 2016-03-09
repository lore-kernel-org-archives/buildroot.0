From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Mar 2016 13:39:37 -0300
Subject: [Buildroot] [PATCH v2] libglib2: improve dev file removal
Message-ID: <1457541577-21773-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Remove /usr/share/glib-2.0 rmdir from DEV_FILES hook, if we are not
using gdb the GDB_FILES hook will hit and remove it anway, and if we are
indeed using gdb we need it.

* Remove glib-compile-resources and glib-compile-schemas binaries, these
aren't used for runtime purposes.

* Remove /usr/share/glib-2.0/codegen and /usr/share/glib-2.0/schemas, as
with the binaries these aren't used for runtime purposes either.

Size savings delta +800 KB.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libglib2/libglib2.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index ea45f4a..f162cd4 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -128,9 +128,8 @@ endif
 
 define LIBGLIB2_REMOVE_DEV_FILES
 	rm -rf $(TARGET_DIR)/usr/lib/glib-2.0
-	rm -rf $(TARGET_DIR)/usr/share/glib-2.0/gettext
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/glib-2.0
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,glib-genmarshal glib-gettextize glib-mkenums gobject-query gtester gtester-report)
+	rm -rf $(addprefix $(TARGET_DIR)/usr/share/glib-2.0/,codegen gettext schemas)
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,glib-compile-resources glib-compile-schemas glib-genmarshal glib-gettextize glib-mkenums gobject-query gtester gtester-report)
 endef
 
 LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_DEV_FILES
-- 
2.4.10
