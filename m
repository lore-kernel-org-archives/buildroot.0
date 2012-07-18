From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 18 Jul 2012 23:17:37 +0200
Subject: [Buildroot] [PATCH 2/5] libglib2: fix linker flags
In-Reply-To: <1342646260-11203-1-git-send-email-s.neumann@raumfeld.com>
References: <1342646260-11203-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1342646260-11203-3-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Makefiles distributed with glib 2.32 omit some needed linker flags.
Fix this and autoreconf to get the changes applied.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/libglib2/libglib2-fix-linker-flags.patch |   36 ++++++++++++++++++++++
 package/libglib2/libglib2.mk                     |    1 +
 2 files changed, 37 insertions(+)
 create mode 100644 package/libglib2/libglib2-fix-linker-flags.patch

diff --git a/package/libglib2/libglib2-fix-linker-flags.patch b/package/libglib2/libglib2-fix-linker-flags.patch
new file mode 100644
index 0000000..cc8facf
--- /dev/null
+++ b/package/libglib2/libglib2-fix-linker-flags.patch
@@ -0,0 +1,36 @@
+--- libglib2-2.31.18-orig/gio/Makefile.am	2012-02-20 21:23:17.000000000 +0100
++++ libglib2-2.31.18/gio/Makefile.am	2012-02-29 12:10:35.680474728 +0100
+@@ -647,6 +647,7 @@
+ glib_compile_resources_LDADD = \
+ 	$(top_builddir)/glib/libglib-2.0.la \
+ 	$(top_builddir)/gobject/libgobject-2.0.la	\
++	$(top_builddir)/gmodule/libgmodule-2.0.la	\
+ 	libgio-2.0.la
+ 
+ glib_compile_resources_SOURCES = \
+@@ -677,6 +678,7 @@
+ gsettings_LDADD = \
+ 	$(top_builddir)/glib/libglib-2.0.la		\
+ 	$(top_builddir)/gobject/libgobject-2.0.la	\
++	$(top_builddir)/gmodule/libgmodule-2.0.la	\
+ 	libgio-2.0.la
+ gsettings_SOURCES = gsettings-tool.c
+ 
+@@ -690,7 +692,8 @@
+ gdbus_SOURCES = gdbus-tool.c
+ gdbus_LDADD = libgio-2.0.la \
+ 	$(top_builddir)/glib/libglib-2.0.la 		\
+-	$(top_builddir)/gobject/libgobject-2.0.la
++	$(top_builddir)/gobject/libgobject-2.0.la	\
++	$(top_builddir)/gmodule/libgmodule-2.0.la
+ 
+ completiondir = $(sysconfdir)/bash_completion.d
+ completion_DATA = \
+@@ -707,6 +710,7 @@
+ gresource_LDADD = libgio-2.0.la \
+ 	$(top_builddir)/glib/libglib-2.0.la 		\
+ 	$(top_builddir)/gobject/libgobject-2.0.la \
++	$(top_builddir)/gmodule/libgmodule-2.0.la	\
+ 	$(ELF_LIBS)
+ 
+ # ------------------------------------------------------------------------
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 976caf0..cc76669 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -9,6 +9,7 @@ LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 
+LIBGLIB2_AUTORECONF = YES
 LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_INSTALL_TARGET = YES
 LIBGLIB2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
-- 
1.7.9.5
