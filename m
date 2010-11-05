From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Fri, 5 Nov 2010 10:27:37 +0100
Subject: [Buildroot] [git commit master 1/1] gdk-pixbuf/libgtk2: move
	gdk-pixbuf loader cache setup script
Message-ID: <20101105092847.BBEF78DBA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4411017f86a54c4c8007eaf2458a85dc0510c624
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../S26libgtk2 => gdk-pixbuf/S26gdk-pixbuf}        |    2 +-
 package/gdk-pixbuf/gdk-pixbuf.mk                   |    6 ++++++
 package/libgtk2/libgtk2.mk                         |    1 -
 3 files changed, 7 insertions(+), 2 deletions(-)
 rename package/{libgtk2/S26libgtk2 => gdk-pixbuf/S26gdk-pixbuf} (85%)

diff --git a/package/libgtk2/S26libgtk2 b/package/gdk-pixbuf/S26gdk-pixbuf
similarity index 85%
rename from package/libgtk2/S26libgtk2
rename to package/gdk-pixbuf/S26gdk-pixbuf
index 037746d..82b7944 100644
--- a/package/libgtk2/S26libgtk2
+++ b/package/gdk-pixbuf/S26gdk-pixbuf
@@ -1,6 +1,6 @@
 #!/bin/sh
 #
-# run pgdk-pixbuf-query-loaders if needed
+# run gdk-pixbuf-query-loaders if needed
 
 FILE=/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
 
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 4c3e108..f762095 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -40,6 +40,12 @@ endif
 
 GDK_PIXBUF_DEPENDENCIES += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-pkg-config libglib2 libiconv
 
+define GDK_PIXBUF_POST_INSTALL_TWEAKS
+	$(INSTALL) -m 755 package/gdk-pixbuf/S26gdk-pixbuf $(TARGET_DIR)/etc/init.d/
+endef
+
+GDK_PIXBUF_POST_INSTALL_TARGET_HOOKS += GDK_PIXBUF_POST_INSTALL_TWEAKS
+
 $(eval $(call AUTOTARGETS,package,gdk-pixbuf))
 
 HOST_GDK_PIXBUF_CONF_OPT = \
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
1.7.1
