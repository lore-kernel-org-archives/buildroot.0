From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat,  2 May 2020 00:04:35 -0600
Subject: [Buildroot] [PATCH 1/1] package/gobject-introspection: fix host
 version of .pc file for wrapper
Message-ID: <20200502060435.23004-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since meson searches for gobject-introspection-1.0.pc in the host
pkgconfig PKG_CONFIG_LIBDIR we need to make sure it is useable.

Fixes:
http://autobuild.buildroot.net/results/90a/90a422419030f9e4408f2783d9e0e5c1f8922b66/build-end.log

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../gobject-introspection.mk                  | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index eefb2c83f7..d98eaf945a 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -136,6 +136,36 @@ define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
 endef
 GOBJECT_INTROSPECTION_POST_INSTALL_STAGING_HOOKS += GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
 
+define HOST_GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
+	# Set prefix to /usr because pkg-config appends the sysroot directory
+	$(SED) "s%^prefix=.*%prefix=\/usr%g" \
+		$(HOST_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
+	# Gobject-introspection installs Makefile.introspection in
+	# $(STAGING_DIR)/usr/share which is needed for autotools-based programs to
+	# build .gir and .typelib files. Unfortuantly, gobject-introspection-1.0.pc
+	# uses $(prefix)/share as the directory, which
+	# causes the host /usr/share being used instead of $(STAGING_DIR)/usr/share.
+	# Change datarootdir to $(libdir)/../share which will prefix $(STAGING_DIR)
+	# to the correct location.
+	$(SED) "s%datarootdir=.*%datarootdir=\$${libdir}/../share%g" \
+		$(HOST_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
+
+	# By default, girdir and typelibdir use datadir and libdir as their prefix,
+	# of which pkg-config appends the sysroot directory. This results in files
+	# being installed in $(STAGING_DIR)/$(STAGING_DIR)/path/to/files.
+	# Changing the prefix to exec_prefix prevents this error.
+	$(SED) "s%girdir=.*%girdir=\$${exec_prefix}/share/gir-1.0%g" \
+		$(HOST_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
+
+	$(SED) "s%typelibdir=.*%typelibdir=\$${exec_prefix}/lib/girepository-1.0%g" \
+		$(HOST_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
+
+	# Purge host-libffi cflags
+	$(SED) "s%^Cflags:.*%Cflags: -I\$${includedir}/gobject-introspection-1.0 %g" \
+		$(HOST_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
+endef
+HOST_GOBJECT_INTROSPECTION_POST_INSTALL_HOOKS += HOST_GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
+
 # Only .typelib files are needed to run.
 define GOBJECT_INTROSPECTION_REMOVE_DEVELOPMENT_FILES
 	find $(TARGET_DIR)/usr/share \( -iname "*.gir" -o -iname \*.rnc \) -delete
-- 
2.20.1
