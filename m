From: bogdan at nimblex.org <bogdan@nimblex.org>
Date: Wed, 19 Dec 2012 16:58:41 +0000
Subject: [Buildroot] [PATCH 1/4] libglib2: bumped version to 2.32.4
Message-ID: <1355936324-9585-1-git-send-email-bogdan@nimblex.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sven Neumann <s.neumann@raumfeld.com>

Bump libglib2 to a newer stable version.

There are a few changes to the configure options necessary
in order to make it compile cleanly and work correctly.
The patch has been tested on ARM and i486. Some things
might have to be adjusted for other platforms.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 ...b2-make-codegen-python2-python3-compliant.patch | 192 ---------------------
 ...glib2-xdgmime-return-early-for-empty-data.patch |  31 ++++
 package/libglib2/libglib2.mk                       |  15 +-
 3 files changed, 39 insertions(+), 199 deletions(-)
 delete mode 100644 package/libglib2/libglib2-make-codegen-python2-python3-compliant.patch
 create mode 100644 package/libglib2/libglib2-xdgmime-return-early-for-empty-data.patch

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
diff --git a/package/libglib2/libglib2-xdgmime-return-early-for-empty-data.patch b/package/libglib2/libglib2-xdgmime-return-early-for-empty-data.patch
new file mode 100644
index 0000000..17fed92
--- /dev/null
+++ b/package/libglib2/libglib2-xdgmime-return-early-for-empty-data.patch
@@ -0,0 +1,31 @@
+From 9689286b990709414227030a13ac2f287fed5a9c Mon Sep 17 00:00:00 2001
+From: Sven Neumann <s.neumann@raumfeld.com>
+Date: Mon, 9 Jul 2012 12:13:48 +0200
+Subject: [PATCH] xdgmime: return early for empty data
+
+Add a check for the data length to xdg_mime_get_mime_type_for_data()
+and return early for len == 0 instead of crashing later in
+cache_magic_matchlet_compare().
+
+Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
+---
+ gio/xdgmime/xdgmime.c |    3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/gio/xdgmime/xdgmime.c b/gio/xdgmime/xdgmime.c
+index 846be39..9e53500 100644
+--- a/gio/xdgmime/xdgmime.c
++++ b/gio/xdgmime/xdgmime.c
+@@ -467,6 +467,9 @@ xdg_mime_get_mime_type_for_data (const void *data,
+ {
+   const char *mime_type;
+ 
++  if (len == 0)
++    return XDG_MIME_TYPE_UNKNOWN;
++
+   xdg_mime_init ();
+ 
+   if (_caches)
+-- 
+1.7.9.5
+
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index c3e510b..b476200 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -3,8 +3,9 @@
 # libglib2
 #
 #############################################################
-LIBGLIB2_VERSION_MAJOR = 2.30
-LIBGLIB2_VERSION_MINOR = 3
+
+LIBGLIB2_VERSION_MAJOR = 2.32
+LIBGLIB2_VERSION_MINOR = 4
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
@@ -13,6 +14,7 @@ LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
 LIBGLIB2_CONF_ENV = \
+		CPPFLAGS=-D__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 \
 		ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no ac_cv_func_strtod=yes \
 		ac_fsusage_space=yes fu_cv_sys_stat_statfs2_bsize=yes \
@@ -40,8 +42,10 @@ LIBGLIB2_CONF_ENV = \
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
 		ac_cv_path_GLIB_GENMARSHAL=$(HOST_DIR)/usr/bin/glib-genmarshal ac_cv_prog_F77=no \
-		ac_cv_func_posix_getgrgid_r=no glib_cv_long_long_format=ll \
-		ac_cv_func_printf_unix98=yes ac_cv_func_vsnprintf_c99=yes \
+		ac_cv_func_posix_getgrgid_r=no \
+		ac_cv_alignof_guint32=4 ac_cv_alignof_guint64=8 ac_cv_alignof_unsigned_long=4 \
+		ac_cv_func_newlocale=no ac_cv_func_uselocale=no \
+		ac_cv_func_strtod_l=no ac_cv_func_strtoll_l=no ac_cv_func_strtoull_l=no \
 		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
 # old uClibc versions don't provide qsort_r
@@ -54,9 +58,6 @@ endif
 HOST_LIBGLIB2_CONF_OPT = \
 		--disable-gtk-doc \
 		--enable-debug=no \
-		--disable-dtrace \
-		--disable-systemtap \
-		--disable-gcov
 
 LIBGLIB2_DEPENDENCIES = host-pkgconf host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext)
 
-- 
1.7.12.1
