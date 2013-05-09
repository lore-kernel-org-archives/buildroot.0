From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  9 May 2013 08:21:46 -0500
Subject: [Buildroot] [PATCH v2 1/3] libglib2: Bump libglib2 to 2.36.1
In-Reply-To: <1368056050-19285-1-git-send-email-spenser@gillilanding.com>
References: <1368056050-19285-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1368105708-4754-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps libglib2 to version 2.36.1.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 ...b2-make-codegen-python2-python3-compliant.patch |  192 --------------------
 package/libglib2/libglib2-no-tests.patch           |  117 ------------
 package/libglib2/libglib2.mk                       |   10 +-
 3 files changed, 6 insertions(+), 313 deletions(-)
 delete mode 100644 package/libglib2/libglib2-make-codegen-python2-python3-compliant.patch
 delete mode 100644 package/libglib2/libglib2-no-tests.patch

diff --git a/package/libglib2/libglib2-make-codegen-python2-python3-compliant.patch b/package/libglib2/libglib2-make-codegen-python2-python3-compliant.patch
deleted file mode 100644
index b483827..0000000
--- a/package/libglib2/libglib2-make-codegen-python2-python3-compliant.patch
+++ /dev/null
@@ -1,192 +0,0 @@
-Fetch from http://git.gnome.org/browse/glib/patch/?id=03611f7c0670ea14eedbc121972aed7ce60bb9ee
-
-This patch is already included upstream, from the glib-2.32.4 release. 
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
-From 03611f7c0670ea14eedbc121972aed7ce60bb9ee Mon Sep 17 00:00:00 2001
-From: Simon Feltman <s.feltman@gmail.com>
-Date: Thu, 14 Jun 2012 06:20:17 +0000
-Subject: Updated codegen to work with python3.
-
-Most changes were just replacing usage of "has_key" with "in".
-Also updated the sorting function which was simplified and
-changed to a "key" function instead of "cmp" (which is no longer
-supported in python3. Verified everything builds with
-python 2.7 and 3.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=678066
----
-diff --git a/gio/gdbus-2.0/codegen/codegen.py b/gio/gdbus-2.0/codegen/codegen.py
-index 41ea8fa..bca3490 100644
---- a/gio/gdbus-2.0/codegen/codegen.py
-+++ b/gio/gdbus-2.0/codegen/codegen.py
-@@ -304,11 +304,8 @@ class CodeGenerator:
-             #
-             # See https://bugzilla.gnome.org/show_bug.cgi?id=647577#c5
-             # for discussion
--            keys = function_pointers.keys()
--            if len(keys) > 0:
--                keys.sort(cmp=utils.my_version_cmp)
--                for key in keys:
--                    self.h.write('%s'%function_pointers[key])
-+            for key in sorted(function_pointers.keys(), key=utils.version_cmp_key):
-+                self.h.write('%s'%function_pointers[key])
- 
-             self.h.write('};\n')
-             self.h.write('\n')
-@@ -1022,11 +1019,9 @@ class CodeGenerator:
-                 value  = '@get_%s: '%(p.name_lower)
-                 value += 'Getter for the #%s:%s property.'%(i.camel_name, p.name_hyphen)
-                 doc_bits[key] = value
--        keys = doc_bits.keys()
--        if len(keys) > 0:
--            keys.sort(cmp=utils.my_version_cmp)
--            for key in keys:
--                self.c.write(' * %s\n'%doc_bits[key])
-+        for key in sorted(doc_bits.keys(), key=utils.version_cmp_key):
-+            self.c.write(' * %s\n'%doc_bits[key])
-+
-         self.c.write(self.docbook_gen.expand(
-                 ' *\n'
-                 ' * Virtual table for the D-Bus interface #%s.\n'
-diff --git a/gio/gdbus-2.0/codegen/codegen_docbook.py b/gio/gdbus-2.0/codegen/codegen_docbook.py
-index 4ceef57..00581f1 100644
---- a/gio/gdbus-2.0/codegen/codegen_docbook.py
-+++ b/gio/gdbus-2.0/codegen/codegen_docbook.py
-@@ -259,14 +259,12 @@ class DocbookCodeGenerator:
-                 self.expand_member_dict[key] = value
-         # Make sure to expand the keys in reverse order so e.g. #org.foo.Iface:MediaCompat
-         # is evaluated before #org.foo.Iface:Media ...
--        self.expand_member_dict_keys = self.expand_member_dict.keys()
--        self.expand_member_dict_keys.sort(reverse=True)
--        self.expand_iface_dict_keys = self.expand_iface_dict.keys()
--        self.expand_iface_dict_keys.sort(reverse=True)
-+        self.expand_member_dict_keys = sorted(self.expand_member_dict.keys(), reverse=True)
-+        self.expand_iface_dict_keys = sorted(self.expand_iface_dict.keys(), reverse=True)
- 
-     def generate(self):
-         for i in self.ifaces:
--            self.out = file('%s-%s.xml'%(self.docbook, i.name), 'w')
-+            self.out = open('%s-%s.xml'%(self.docbook, i.name), 'w')
-             self.out.write(''%())
-             self.out.write('<?xml version="1.0" encoding="utf-8"?>\n'%())
-             self.out.write('<!DOCTYPE refentry PUBLIC "-//OASIS//DTD DocBook XML V4.1.2//EN"\n'%())
-diff --git a/gio/gdbus-2.0/codegen/codegen_main.py b/gio/gdbus-2.0/codegen/codegen_main.py
-index 76c838c..735cc1f 100755
---- a/gio/gdbus-2.0/codegen/codegen_main.py
-+++ b/gio/gdbus-2.0/codegen/codegen_main.py
-@@ -184,8 +184,8 @@ def codegen_main():
- 
-     c_code = opts.generate_c_code
-     if c_code:
--        h = file(c_code + '.h', 'w')
--        c = file(c_code + '.c', 'w')
-+        h = open(c_code + '.h', 'w')
-+        c = open(c_code + '.c', 'w')
-         gen = codegen.CodeGenerator(all_ifaces,
-                                     opts.c_namespace,
-                                     opts.interface_prefix,
-diff --git a/gio/gdbus-2.0/codegen/parser.py b/gio/gdbus-2.0/codegen/parser.py
-index 5fabd44..7b9d216 100644
---- a/gio/gdbus-2.0/codegen/parser.py
-+++ b/gio/gdbus-2.0/codegen/parser.py
-@@ -152,12 +152,12 @@ class DBusXMLParser:
-                 self.state = DBusXMLParser.STATE_IGNORED
- 
-             # assign docs, if any
--            if attrs.has_key('name') and self.doc_comment_last_symbol == attrs['name']:
-+            if 'name' in attrs and self.doc_comment_last_symbol == attrs['name']:
-                 self._cur_object.doc_string = self.doc_comment_body
--                if self.doc_comment_params.has_key('short_description'):
-+                if 'short_description' in self.doc_comment_params:
-                     short_description = self.doc_comment_params['short_description']
-                     self._cur_object.doc_string_brief = short_description
--                if self.doc_comment_params.has_key('since'):
-+                if 'since' in self.doc_comment_params:
-                     self._cur_object.since = self.doc_comment_params['since']
- 
-         elif self.state == DBusXMLParser.STATE_INTERFACE:
-@@ -185,16 +185,16 @@ class DBusXMLParser:
-                 self.state = DBusXMLParser.STATE_IGNORED
- 
-             # assign docs, if any
--            if attrs.has_key('name') and self.doc_comment_last_symbol == attrs['name']:
-+            if 'name' in attrs and self.doc_comment_last_symbol == attrs['name']:
-                 self._cur_object.doc_string = self.doc_comment_body
--                if self.doc_comment_params.has_key('since'):
-+                if 'since' in self.doc_comment_params:
-                     self._cur_object.since = self.doc_comment_params['since']
- 
-         elif self.state == DBusXMLParser.STATE_METHOD:
-             if name == DBusXMLParser.STATE_ARG:
-                 self.state = DBusXMLParser.STATE_ARG
-                 arg_name = None
--                if attrs.has_key('name'):
-+                if 'name' in attrs:
-                     arg_name = attrs['name']
-                 arg = dbustypes.Arg(arg_name, attrs['type'])
-                 direction = attrs['direction']
-@@ -215,18 +215,18 @@ class DBusXMLParser:
- 
-             # assign docs, if any
-             if self.doc_comment_last_symbol == old_cur_object.name:
--                if attrs.has_key('name') and self.doc_comment_params.has_key(attrs['name']):
-+                if 'name' in attrs and attrs['name'] in self.doc_comment_params:
-                     doc_string = self.doc_comment_params[attrs['name']]
-                     if doc_string != None:
-                         self._cur_object.doc_string = doc_string
--                    if self.doc_comment_params.has_key('since'):
-+                    if 'since' in self.doc_comment_params:
-                         self._cur_object.since = self.doc_comment_params['since']
- 
-         elif self.state == DBusXMLParser.STATE_SIGNAL:
-             if name == DBusXMLParser.STATE_ARG:
-                 self.state = DBusXMLParser.STATE_ARG
-                 arg_name = None
--                if attrs.has_key('name'):
-+                if 'name' in attrs:
-                     arg_name = attrs['name']
-                 arg = dbustypes.Arg(arg_name, attrs['type'])
-                 self._cur_object.args.append(arg)
-@@ -241,11 +241,11 @@ class DBusXMLParser:
- 
-             # assign docs, if any
-             if self.doc_comment_last_symbol == old_cur_object.name:
--                if attrs.has_key('name') and self.doc_comment_params.has_key(attrs['name']):
-+                if 'name' in attrs and attrs['name'] in self.doc_comment_params:
-                     doc_string = self.doc_comment_params[attrs['name']]
-                     if doc_string != None:
-                         self._cur_object.doc_string = doc_string
--                    if self.doc_comment_params.has_key('since'):
-+                    if 'since' in self.doc_comment_params:
-                         self._cur_object.since = self.doc_comment_params['since']
- 
-         elif self.state == DBusXMLParser.STATE_PROPERTY:
-diff --git a/gio/gdbus-2.0/codegen/utils.py b/gio/gdbus-2.0/codegen/utils.py
-index 94bd05c..239b64e 100644
---- a/gio/gdbus-2.0/codegen/utils.py
-+++ b/gio/gdbus-2.0/codegen/utils.py
-@@ -97,15 +97,8 @@ def lookup_brief_docs(annotations):
-     else:
-         return s
- 
--# I'm sure this could be a lot more elegant if I was
--# more fluent in python...
--def my_version_cmp(a, b):
--    if len(a[0]) > 0 and len(b[0]) > 0:
--        va = distutils.version.LooseVersion(a[0])
--        vb = distutils.version.LooseVersion(b[0])
--        ret = va.__cmp__(vb)
--    else:
--        ret = cmp(a[0], b[0])
--    if ret != 0:
--        return ret
--    return cmp(a[1], b[1])
-+def version_cmp_key(key):
-+    # If the 'since' version is empty put a 0 in its place as this will
-+    # allow LooseVersion to work and will always compare lower.
-+    v = key[0] if key[0] else '0'
-+    return (distutils.version.LooseVersion(v), key[1])
---
-cgit v0.9.0.2
diff --git a/package/libglib2/libglib2-no-tests.patch b/package/libglib2/libglib2-no-tests.patch
deleted file mode 100644
index 81b5af2..0000000
--- a/package/libglib2/libglib2-no-tests.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-Add a --disable-tests option to the configure script
-
-Disabling the build of tests has two benefits:
- * Prevents the build of a lot of code that doesn't build on noMMU
-   platforms.
- * Reduces the build time.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: libglib2-2.30.3/Makefile.am
-===================================================================
---- libglib2-2.30.3.orig/Makefile.am	2012-03-11 22:43:28.000000000 +0100
-+++ libglib2-2.30.3/Makefile.am	2013-03-09 17:32:01.000000000 +0100
-@@ -6,7 +6,11 @@
- 
- ACLOCAL_AMFLAGS = -I m4macros ${ACLOCAL_FLAGS}
- 
--SUBDIRS = . m4macros glib gmodule gthread gobject gio tests po docs
-+if BUILD_TESTS
-+TEST_SUBDIR = tests
-+endif
-+
-+SUBDIRS = . m4macros glib gmodule gthread gobject gio $(TEST_SUBDIR) po docs
- DIST_SUBDIRS = $(SUBDIRS) build
- 
- bin_SCRIPTS = glib-gettextize
-Index: libglib2-2.30.3/gio/Makefile.am
-===================================================================
---- libglib2-2.30.3.orig/gio/Makefile.am	2012-03-11 22:44:19.000000000 +0100
-+++ libglib2-2.30.3/gio/Makefile.am	2013-03-09 17:32:38.000000000 +0100
-@@ -282,7 +282,11 @@
- 
- endif
- 
--SUBDIRS += tests
-+if BUILD_TESTS
-+TEST_SUBDIR = tests
-+endif
-+
-+SUBDIRS += $(TEST_SUBDIR)
- 
- libgio_2_0_la_SOURCES =		\
- 	gappinfo.c 		\
-Index: libglib2-2.30.3/configure.ac
-===================================================================
---- libglib2-2.30.3.orig/configure.ac	2013-03-09 17:30:55.000000000 +0100
-+++ libglib2-2.30.3/configure.ac	2013-03-09 17:37:27.000000000 +0100
-@@ -234,11 +234,18 @@
-               [AC_HELP_STRING([--disable-rebuilds],
-                               [disable all source autogeneration rules])],,
-               [enable_rebuilds=yes])
-+AC_ARG_ENABLE(tests,
-+		[AC_HELP_STRING([--disable-tests],
-+				[disable all tests])],
-+		enable_tests=${enableval},
-+		enable_tests=yes)
- 
- if test "x$enable_threads" != "xyes"; then
-   enable_threads=no
- fi
- 
-+AM_CONDITIONAL(BUILD_TESTS, [test x$enable_tests = xyes])
-+
- AC_MSG_CHECKING([whether to enable garbage collector friendliness])
- if test "x$enable_gc_friendly" = "xyes"; then
-   AC_DEFINE(ENABLE_GC_FRIENDLY_DEFAULT, 1, [Whether to enable GC friendliness by default])
-Index: libglib2-2.30.3/glib/Makefile.am
-===================================================================
---- libglib2-2.30.3.orig/glib/Makefile.am	2012-03-11 22:43:28.000000000 +0100
-+++ libglib2-2.30.3/glib/Makefile.am	2013-03-09 18:02:59.000000000 +0100
-@@ -42,7 +42,11 @@
- gregex_h =
- endif
- 
--SUBDIRS = libcharset $(PRINTF_SUBDIR) $(MAYBE_PCRE) update-pcre . tests
-+if BUILD_TESTS
-+TEST_SUBDIR = tests
-+endif
-+
-+SUBDIRS = libcharset $(PRINTF_SUBDIR) $(MAYBE_PCRE) update-pcre . $(TEST_SUBDIR)
- 
- DIST_SUBDIRS = libcharset gnulib pcre update-pcre tests
- 
-Index: libglib2-2.30.3/gobject/Makefile.am
-===================================================================
---- libglib2-2.30.3.orig/gobject/Makefile.am	2012-03-11 22:43:29.000000000 +0100
-+++ libglib2-2.30.3/gobject/Makefile.am	2013-03-09 18:03:40.000000000 +0100
-@@ -4,7 +4,11 @@
- ## Process this file with automake to produce Makefile.in
- include $(top_srcdir)/Makefile.decl
- 
--SUBDIRS = . tests
-+if BUILD_TESTS
-+TEST_SUBDIR = tests
-+endif
-+
-+SUBDIRS = . $(TEST_SUBDIR)
- 
- BUILT_SOURCES=
- CLEANFILES=
-Index: libglib2-2.30.3/gthread/Makefile.am
-===================================================================
---- libglib2-2.30.3.orig/gthread/Makefile.am	2012-03-11 22:43:29.000000000 +0100
-+++ libglib2-2.30.3/gthread/Makefile.am	2013-03-09 18:04:16.000000000 +0100
-@@ -1,7 +1,11 @@
- ## Process this file with automake to produce Makefile.in
- include $(top_srcdir)/Makefile.decl
- 
--SUBDIRS = . tests
-+if BUILD_TESTS
-+TEST_SUBDIR = tests
-+endif
-+
-+SUBDIRS = . $(TEST_SUBDIR)
- DIST_SUBDIRS = tests
- 
- AM_CPPFLAGS = 				\
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index d78e8ec..ee9f470 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -3,8 +3,8 @@
 # libglib2
 #
 #############################################################
-LIBGLIB2_VERSION_MAJOR = 2.30
-LIBGLIB2_VERSION_MINOR = 3
+LIBGLIB2_VERSION_MAJOR = 2.36
+LIBGLIB2_VERSION_MINOR = 1
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
@@ -44,6 +44,8 @@ LIBGLIB2_CONF_ENV = \
 		ac_cv_path_GLIB_GENMARSHAL=$(HOST_DIR)/usr/bin/glib-genmarshal ac_cv_prog_F77=no \
 		ac_cv_func_posix_getgrgid_r=no glib_cv_long_long_format=ll \
 		ac_cv_func_printf_unix98=yes ac_cv_func_vsnprintf_c99=yes \
+		ac_cv_func_newlocale=no ac_cv_func_uselocale=no \
+		ac_cv_func_strtod_l=no ac_cv_func_strtoll_l=no ac_cv_func_strtoull_l=no \
 		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
 # old uClibc versions don't provide qsort_r
@@ -64,9 +66,9 @@ HOST_LIBGLIB2_CONF_OPT = \
 		--disable-dtrace \
 		--disable-systemtap \
 		--disable-gcov \
-		--disable-tests
+		--disable-modular-tests
 
-LIBGLIB2_CONF_OPT += --disable-tests
+LIBGLIB2_CONF_OPT += --disable-modular-tests
 
 LIBGLIB2_DEPENDENCIES = host-pkgconf host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext) host-gettext
 
-- 
1.7.9.5
