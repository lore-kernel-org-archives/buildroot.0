From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Dec 2014 23:02:49 +0100
Subject: [Buildroot] [git commit] package: add python-gobject
Message-ID: <20141203222237.A52627FBBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2ff50d2ae368bab568b063d8ad57d87fad89a61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                  |    1 +
 .../0001-add-PYTHON_INCLUDES-override.patch        |   32 ++++++++++++++++
 package/python-gobject/Config.in                   |   14 +++++++
 package/python-gobject/python-gobject.hash         |    2 +
 package/python-gobject/python-gobject.mk           |   39 ++++++++++++++++++++
 5 files changed, 88 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b8fc7d1..a8010d3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -494,6 +494,7 @@ menu "external python modules"
 	source "package/python-dpkt/Config.in"
 	source "package/python-flask/Config.in"
 	source "package/python-flup/Config.in"
+	source "package/python-gobject/Config.in"
 	source "package/python-httplib2/Config.in"
 	source "package/python-id3/Config.in"
 	source "package/python-ipy/Config.in"
diff --git a/package/python-gobject/0001-add-PYTHON_INCLUDES-override.patch b/package/python-gobject/0001-add-PYTHON_INCLUDES-override.patch
new file mode 100644
index 0000000..d883f60
--- /dev/null
+++ b/package/python-gobject/0001-add-PYTHON_INCLUDES-override.patch
@@ -0,0 +1,32 @@
+[PATCH] m4/python.m4: add PYTHON_INCLUDES override for cross compilation
+
+As the configure script mixes up host/target python. Equivalent to the
+similar code in dbus-python.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ m4/python.m4 |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+Index: python-gobject-2.28.6/m4/python.m4
+===================================================================
+--- python-gobject-2.28.6.orig/m4/python.m4
++++ python-gobject-2.28.6/m4/python.m4
+@@ -43,6 +43,9 @@
+ [AC_REQUIRE([AM_PATH_PYTHON])
+ AC_MSG_CHECKING(for headers required to compile python extensions)
+ dnl deduce PYTHON_INCLUDES
++if test "${PYTHON_INCLUDES+set}" = set; then
++  AC_MSG_NOTICE([PYTHON_INCLUDES overridden to: $PYTHON_INCLUDES])
++else
+ py_prefix=`$PYTHON -c "import sys; sys.stdout.write(sys.prefix)"`
+ py_exec_prefix=`$PYTHON -c "import sys; sys.stdout.write(sys.exec_prefix)"`
+ PYTHON_CONFIG=`which $PYTHON`-config
+@@ -54,6 +57,7 @@
+   PYTHON_INCLUDES="$PYTHON_INCLUDES -I${py_exec_prefix}/include/python${PYTHON_VERSION}"
+ fi
+ fi
++fi
+ AC_SUBST(PYTHON_INCLUDES)
+ dnl check if the headers exist:
+ save_CPPFLAGS="$CPPFLAGS"
diff --git a/package/python-gobject/Config.in b/package/python-gobject/Config.in
new file mode 100644
index 0000000..475ff25
--- /dev/null
+++ b/package/python-gobject/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PYTHON_GOBJECT
+	bool "python-gobject"
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  Python bindings for the GLib/GObject library
+
+	  https://wiki.gnome.org/action/show/Projects/PyGObject
+
+comment "python-gobject needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
new file mode 100644
index 0000000..024419e
--- /dev/null
+++ b/package/python-gobject/python-gobject.hash
@@ -0,0 +1,2 @@
+# from http://ftp.gnome.org/pub/GNOME/sources/pygobject/2.28/pygobject-2.28.6.sha256sum
+sha256	fb8a1d4f665130a125011659bd347c7339c944232163dbb9a34fd0686577adb8  pygobject-2.28.6.tar.xz
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
new file mode 100644
index 0000000..c47954c
--- /dev/null
+++ b/package/python-gobject/python-gobject.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# python-gobject
+#
+################################################################################
+
+PYTHON_GOBJECT_VERSION_MAJOR = 2.28
+PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).6
+PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.xz
+PYTHON_GOBJECT_SITE = http://ftp.gnome.org/pub/gnome/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
+PYTHON_GOBJECT_LICENSE = LGPLv2.1+
+PYTHON_GOBJECT_LICENSE_FILES = COPYING
+PYTHON_GOBJECT_DEPENDENCIES = host-pkgconf libglib2
+PYTHON_GOBJECT_CONF_OPTS = --disable-introspection
+# for 0001-add-PYTHON_INCLUDES-override.patch
+PYTHON_GOBJECT_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+PYTHON_GOBJECT_DEPENDENCIES += python host-python
+
+PYTHON_GOBJECT_CONF_ENV = \
+	PYTHON=$(HOST_DIR)/usr/bin/python2 \
+	PYTHON_INCLUDES="$(shell $(STAGING_DIR)/usr/bin/python2-config --includes)"
+else
+PYTHON_GOBJECT_DEPENDENCIES += python3 host-python3
+
+PYTHON_GOBJECT_CONF_ENV = \
+	PYTHON=$(HOST_DIR)/usr/bin/python3 \
+	PYTHON_INCLUDES="$(shell $(STAGING_DIR)/usr/bin/python3-config --includes)"
+endif
+
+ifeq ($(BR2_PACKAGE_LIBFFI),y)
+PYTHON_GOBJECT_CONF_OPTS += --with-ffi
+PYTHON_GOBJECT_DEPENDENCIES += libffi
+else
+PYTHON_GOBJECT_CONF_OPTS += --without-ffi
+endif
+
+$(eval $(autotools-package))
