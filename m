From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu,  4 Nov 2010 03:50:25 +0100
Subject: [Buildroot] [PATCH 06/12] gdk-pixbuf/libgtk2: move gdk-pixbuf
	loader cache setup script
In-Reply-To: <1288839031-24277-1-git-send-email-llandwerlin@gmail.com>
References: <1288839031-24277-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1288839031-24277-7-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/gdk-pixbuf/S26gdk-pixbuf |   19 +++++++++++++++++++
 package/gdk-pixbuf/gdk-pixbuf.mk |    4 ++++
 package/libgtk2/S26libgtk2       |   19 -------------------
 package/libgtk2/libgtk2.mk       |    1 -
 4 files changed, 23 insertions(+), 20 deletions(-)
 create mode 100644 package/gdk-pixbuf/S26gdk-pixbuf
 delete mode 100644 package/libgtk2/S26libgtk2

diff --git a/package/gdk-pixbuf/S26gdk-pixbuf b/package/gdk-pixbuf/S26gdk-pixbuf
new file mode 100644
index 0000000..037746d
--- /dev/null
+++ b/package/gdk-pixbuf/S26gdk-pixbuf
@@ -0,0 +1,19 @@
+#!/bin/sh
+#
+# run pgdk-pixbuf-query-loaders if needed
+
+FILE=/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
+
+case "$1" in
+    start|"")
+	if [ ! -f "$FILE" ] ; then
+	    /usr/bin/gdk-pixbuf-query-loaders --update-cache
+	fi
+	;;
+    stop)
+	;;
+    *)
+	echo "Usage: $0 {start|stop}" >&2
+	exit 1
+	;;
+esac
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 4c3e108..c54f0a6 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -40,6 +40,10 @@ endif
 
 GDK_PIXBUF_DEPENDENCIES += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-pkg-config libglib2 libiconv
 
+define GDK_PIXBUF_POST_INSTALL_TWEAKS
+	$(INSTALL) -m 755 package/gdk-pixbuf/S26gdk-pixbuf $(TARGET_DIR)/etc/init.d/
+endef
+
 $(eval $(call AUTOTARGETS,package,gdk-pixbuf))
 
 HOST_GDK_PIXBUF_CONF_OPT = \
diff --git a/package/libgtk2/S26libgtk2 b/package/libgtk2/S26libgtk2
deleted file mode 100644
index 037746d..0000000
--- a/package/libgtk2/S26libgtk2
+++ /dev/null
@@ -1,19 +0,0 @@
-#!/bin/sh
-#
-# run pgdk-pixbuf-query-loaders if needed
-
-FILE=/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
-
-case "$1" in
-    start|"")
-	if [ ! -f "$FILE" ] ; then
-	    /usr/bin/gdk-pixbuf-query-loaders --update-cache
-	fi
-	;;
-    stop)
-	;;
-    *)
-	echo "Usage: $0 {start|stop}" >&2
-	exit 1
-	;;
-esac
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index e41fcc9..6e14d27 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -115,7 +115,6 @@ LIBGTK2_CONF_OPT += --disable-cups
 endif
 
 define LIBGTK2_POST_INSTALL_TWEAKS
-	$(INSTALL) -m 755 package/libgtk2/S26libgtk2 $(TARGET_DIR)/etc/init.d/
 	rm -rf $(TARGET_DIR)/usr/share/gtk-2.0/demo $(TARGET_DIR)/usr/bin/gtk-demo
 endef
 
-- 
1.7.2.3
