From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 28 Jan 2019 17:12:34 -0500
Subject: [Buildroot] [PATCH 1/1] libglib2: bump to 2.58.3
Message-ID: <20190128221234.93143-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

In addition:
  - Re-add the changes from 178eb1d7ea165d87460224d297ce615bb63090f0

  - Add a new patch: 0005-remove-glib-2.0.pc-bindir-variable-prefix.patch
    This patch fixes the previous autobuild errors by removing the ${bindir}
    variable in the front of the glib_genmarshal, gobject_query and glib_mkenums
    lines.

All tests passed with the packages: AT, libsoup, and dbus-glib selected:
br-arm-full [1/6]: OK
br-arm-cortex-a9-glibc [2/6]: OK
br-arm-cortex-m4-full [3/6]: SKIPPED
br-x86-64-musl [4/6]: OK
br-arm-full-static [5/6]: OK
armv5-ctng-linux-gnueabi [6/6]: OK

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libglib2/0002-disable-tests.patch     |  8 ++--
 ...e-glib-2.0.pc-bindir-variable-prefix.patch | 37 +++++++++++++++++++
 package/libglib2/libglib2.hash                |  4 +-
 package/libglib2/libglib2.mk                  | 11 +++++-
 4 files changed, 54 insertions(+), 6 deletions(-)
 create mode 100644 package/libglib2/0005-remove-glib-2.0.pc-bindir-variable-prefix.patch

diff --git a/package/libglib2/0002-disable-tests.patch b/package/libglib2/0002-disable-tests.patch
index 523ebb35ac..e03dc2fee2 100644
--- a/package/libglib2/0002-disable-tests.patch
+++ b/package/libglib2/0002-disable-tests.patch
@@ -8,6 +8,8 @@ gets mixed with distro python leading to build failures.
 
 Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
 Signed-off-by: Adam Duskett <aduskett@codeblue.com>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Update for version 2.58.1]
 ---
  Makefile.am      | 2 +-
  gio/Makefile.am  | 2 +-
@@ -22,9 +24,9 @@ index 008ad58..007332d 100644
  
  ACLOCAL_AMFLAGS = -I m4macros ${ACLOCAL_FLAGS}
  
--SUBDIRS = . m4macros glib gmodule gthread gobject gio po docs tests
-+SUBDIRS = . m4macros glib gmodule gthread gobject gio po docs
- DIST_SUBDIRS = $(SUBDIRS) build win32
+-SUBDIRS = . m4macros glib gmodule gthread gobject gio po docs tests subprojects
++SUBDIRS = . m4macros glib gmodule gthread gobject gio po docs subprojects
+ DIST_SUBDIRS = $(SUBDIRS) build
  
  bin_SCRIPTS = glib-gettextize
 diff --git a/gio/Makefile.am b/gio/Makefile.am
diff --git a/package/libglib2/0005-remove-glib-2.0.pc-bindir-variable-prefix.patch b/package/libglib2/0005-remove-glib-2.0.pc-bindir-variable-prefix.patch
new file mode 100644
index 0000000000..561f461da9
--- /dev/null
+++ b/package/libglib2/0005-remove-glib-2.0.pc-bindir-variable-prefix.patch
@@ -0,0 +1,37 @@
+From d30304db01a87964bdccf1ff99b6baf257fa26c6 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Mon, 28 Jan 2019 15:22:31 -0500
+Subject: [PATCH] remove glib-2.0.pc bindir variable prefix.
+
+If glib_genmarshal, gobject_query or glib_mkenums are prefixed with
+${bindir} pkg-config will search the host system if the --variable flag
+is called.
+
+Revert the behavior by removing the bindir prefix from these variables.
+
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ glib-2.0.pc.in | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/glib-2.0.pc.in b/glib-2.0.pc.in
+index 3c5ea81..275fc01 100644
+--- a/glib-2.0.pc.in
++++ b/glib-2.0.pc.in
+@@ -3,10 +3,9 @@ exec_prefix=@exec_prefix@
+ libdir=@libdir@
+ includedir=@includedir@
+ 
+-bindir=@bindir@
+-glib_genmarshal=${bindir}/glib-genmarshal
+-gobject_query=${bindir}/gobject-query
+-glib_mkenums=${bindir}/glib-mkenums
++glib_genmarshal=glib-genmarshal
++gobject_query=gobject-query
++glib_mkenums=glib-mkenums
+ 
+ Name: GLib
+ Description: C Utility Library
+-- 
+2.20.1
+
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 57403a2154..7aa4c6cc02 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.56/glib-2.56.3.sha256sum
-sha256  a9a4c5b4c81b6c75bc140bdf5e32120ef3ce841b7413214ecf5f987acec74cb2  glib-2.56.3.tar.xz
+# http://ftp.gnome.org/pub/gnome/sources/glib/2.58/glib-2.58.3.sha256sum
+sha256  8f43c31767e88a25da72b52a40f3301fefc49a665b56dc10ee7cc9565cbe7481  glib-2.58.3.tar.xz
 # License files, locally calculated
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index f602c371f5..981112cac0 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.56
+LIBGLIB2_VERSION_MAJOR = 2.58
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
@@ -13,6 +13,15 @@ LIBGLIB2_LICENSE_FILES = COPYING
 # 0002-disable-tests.patch
 LIBGLIB2_AUTORECONF = YES
 
+# Copy what is done in autogen.sh when gtk-doc is not available
+define LIBGLIB2_GTK_DOC_HOOK
+	echo "EXTRA_DIST=" > $(@D)/gtk-doc.make
+	echo "CLEANFILES=" >> $(@D)/gtk-doc.make
+endef
+
+LIBGLIB2_PRE_CONFIGURE_HOOKS += LIBGLIB2_GTK_DOC_HOOK
+HOST_LIBGLIB2_PRE_CONFIGURE_HOOKS += LIBGLIB2_GTK_DOC_HOOK
+
 LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
-- 
2.20.1
