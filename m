From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Mar 2016 13:25:12 -0300
Subject: [Buildroot] [PATCH] libglib2: improve dev file removal
Message-ID: <1457540712-19580-1-git-send-email-gustavo@zacarias.com.ar>
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
 package/libglib2/libglib2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index ea45f4a..8539505 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -128,9 +128,9 @@ endif
 
 define LIBGLIB2_REMOVE_DEV_FILES
 	rm -rf $(TARGET_DIR)/usr/lib/glib-2.0
-	rm -rf $(TARGET_DIR)/usr/share/glib-2.0/gettext
+	rm -rf $(addprefix $(TARGET_DIR)/usr/share/glib-2.0/,codegen gettext schemas)
 	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/glib-2.0
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,glib-genmarshal glib-gettextize glib-mkenums gobject-query gtester gtester-report)
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,glib-compile-resources glib-compile-schemas glib-genmarshal glib-gettextize glib-mkenums gobject-query gtester gtester-report)
 endef
 
 LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_DEV_FILES
-- 
2.4.10
