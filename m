From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  1 May 2014 20:17:54 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_5/8=5D_mesa3d=3A_Remove_dependency?=
	=?utf-8?q?_for_the_libxml2_module_of_host-python?=
In-Reply-To: <1398968277-9044-1-git-send-email-bernd.kuhls@t-online.de>
References: <1398968277-9044-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1398968277-9044-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the ugly BR2_PACKAGE_HOST_LIBXML2_PYTHON hack as well as
mesa3d was the only package using it.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libxml2/Config.in                          |    3 -
 package/libxml2/libxml2-python2.patch              |   27 -
 package/libxml2/libxml2.mk                         |   14 -
 package/mesa3d/Config.in                           |    1 -
 package/mesa3d/mesa3d-0004-no_python_libxml2.patch |  699 ++++++++++++++++++++
 package/mesa3d/mesa3d.mk                           |    1 -
 6 files changed, 699 insertions(+), 46 deletions(-)
 delete mode 100644 package/libxml2/libxml2-python2.patch
 create mode 100644 package/mesa3d/mesa3d-0004-no_python_libxml2.patch

diff --git a/package/libxml2/Config.in b/package/libxml2/Config.in
index 85694f9..ebd63fe 100644
--- a/package/libxml2/Config.in
+++ b/package/libxml2/Config.in
@@ -4,6 +4,3 @@ config BR2_PACKAGE_LIBXML2
 	  XML C Parser
 
 	  http://xmlsoft.org/
-
-config BR2_PACKAGE_HOST_LIBXML2_PYTHON
-	bool
diff --git a/package/libxml2/libxml2-python2.patch b/package/libxml2/libxml2-python2.patch
deleted file mode 100644
index 19195a6..0000000
--- a/package/libxml2/libxml2-python2.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Prefer python2 binary in case python points to python3
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr libxml2-2.9.1.org/configure.in libxml2-2.9.1/configure.in
---- libxml2-2.9.1.org/configure.in	2013-04-19 09:25:20.000000000 +0200
-+++ libxml2-2.9.1/configure.in	2014-04-12 14:16:26.579361068 +0200
-@@ -748,6 +748,11 @@
- PYTHON_TESTS=
- pythondir=
- if test "$with_python" != "no" ; then
-+    if test -x "$with_python/bin/python2"
-+    then
-+        echo Found python2 in $with_python/bin/python2
-+        PYTHON="$with_python/bin/python2"
-+    else
-     if test -x "$with_python/bin/python"
-     then
-         echo Found python in $with_python/bin/python
-@@ -773,6 +778,7 @@
- 	    fi
- 	fi
-     fi
-+    fi
-     if test "$PYTHON" != ""
-     then
-         PYTHON_VERSION=`$PYTHON -c "from distutils import sysconfig; print(sysconfig.get_python_version())"`
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 62f3e27..7644a48 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -22,20 +22,6 @@ HOST_LIBXML2_DEPENDENCIES = host-pkgconf
 
 HOST_LIBXML2_CONF_OPT = --without-zlib --without-lzma
 
-# mesa3d uses functions that are only available with debug
-ifeq ($(BR2_PACKAGE_MESA3D),y)
-HOST_LIBXML2_CONF_OPT += --with-debug
-else
-HOST_LIBXML2_CONF_OPT += --without-debug
-endif
-
-ifeq ($(BR2_PACKAGE_HOST_LIBXML2_PYTHON),y)
-HOST_LIBXML2_DEPENDENCIES += host-python
-HOST_LIBXML2_CONF_OPT += --with-python=$(HOST_DIR)/usr
-else
-HOST_LIBXML2_CONF_OPT += --without-python
-endif
-
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBXML2_DEPENDENCIES += zlib
 LIBXML2_CONF_OPT += --with-zlib
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index b645712..703b465 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -2,7 +2,6 @@ menuconfig BR2_PACKAGE_MESA3D
 	bool "Mesa 3D Graphics Library"
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_HOST_LIBXML2_PYTHON
 	select BR2_PACKAGE_XPROTO_DRI2PROTO if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
diff --git a/package/mesa3d/mesa3d-0004-no_python_libxml2.patch b/package/mesa3d/mesa3d-0004-no_python_libxml2.patch
new file mode 100644
index 0000000..660137d
--- /dev/null
+++ b/package/mesa3d/mesa3d-0004-no_python_libxml2.patch
@@ -0,0 +1,699 @@
+backported from mesa3d/master
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+From 2de70fe23f320ce4f559e37057fe07b7af99cf5a Mon Sep 17 00:00:00 2001
+From: Jos? Fonseca <jfonseca@vmware.com>
+Date: Mon, 24 Mar 2014 15:41:08 +0000
+Subject: mapi/glapi: Use ElementTree instead of libxml2.
+
+It is quite hard to meet the dependency of the libxml2 python bindings
+outside Linux, and in particularly on MacOSX; whereas ElementTree is
+part of Python's standard library.  ElementTree is more limited than
+libxml2: no DTD verification, defaults from DTD, or XInclude support,
+but none of these limitations is serious enough to justify using
+libxml2.
+
+In fact, it was easier to refactor the code to use ElementTree than to
+try to get libxml2 python bindings.
+
+In the process, gl_item_factory class was refactored so that there is
+one method for each kind of object to be created, as it simplifies
+things substantially.
+
+I confirmed that precisely the same output is generated for GL/GLX/GLES.
+
+v2: Remove m4/ax_python_module.m4 as suggested by Matt Turner.
+
+Reviewed-by: Ian Romanick <ian.d.romanick@intel.com>
+---
+diff --git a/SConstruct b/SConstruct
+index de735e9..0e10818 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -59,13 +59,6 @@ else:
+ 
+ Help(opts.GenerateHelpText(env))
+ 
+-# fail early for a common error on windows
+-if env['gles']:
+-    try:
+-        import libxml2
+-    except ImportError:
+-        raise SCons.Errors.UserError, "GLES requires libxml2-python to build"
+-
+ #######################################################################
+ # Environment setup
+ 
+diff --git a/configure.ac b/configure.ac
+index 97d7dc5..1e5e496 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -54,7 +54,6 @@ AM_PROG_CC_C_O
+ AM_PROG_AS
+ AC_CHECK_PROGS([MAKE], [gmake make])
+ AC_CHECK_PROGS([PYTHON2], [python2 python])
+-AX_PYTHON_MODULE([libxml2], [needed])
+ AC_PROG_SED
+ AC_PROG_MKDIR_P
+ 
+diff --git a/docs/README.WIN32 b/docs/README.WIN32
+index 0cd007c..c8759f6 100644
+--- a/docs/README.WIN32
++++ b/docs/README.WIN32
+@@ -36,17 +36,15 @@ Recipe
+ Building on windows requires several open-source packages. These are
+ steps that work as of this writing.
+ 
+-1) install python 2.7
+-2) install scons (latest)
+-3) install mingw, flex, and bison
+-4) install libxml2 from here: http://www.lfd.uci.edu/~gohlke/pythonlibs
+-  get libxml2-python-2.9.1.win-amd64-py2.7.exe
+-5) install pywin32 from here: http://www.lfd.uci.edu/~gohlke/pythonlibs
++- install python 2.7
++- install scons (latest)
++- install mingw, flex, and bison
++- install pywin32 from here: http://www.lfd.uci.edu/~gohlke/pythonlibs
+   get pywin32-218.4.win-amd64-py2.7.exe
+-6) install git
+-7) download mesa from git
++- install git
++- download mesa from git
+   see http://www.mesa3d.org/repository.html
+-8) run scons
++- run scons
+ 
+ General
+ -------
+diff --git a/docs/install.html b/docs/install.html
+index 24492a7..5061ede 100644
+--- a/docs/install.html
++++ b/docs/install.html
+@@ -44,10 +44,6 @@ On Windows with MinGW, install flex and bison with:
+ </li>
+ <li>python - Python is needed for building the Gallium components.
+ Version 2.6.4 or later should work.
+-<br>
+-<br>
+-To build OpenGL ES 1.1 and 2.0 you'll also need
+-<a href="http://xmlsoft.org/sources/win32/python/libxml2-python-2.7.7.win32-py2.7.exe">libxml2-python</a>.
+ </li>
+ </ul>
+ 
+diff --git a/m4/ax_python_module.m4 b/m4/ax_python_module.m4
+deleted file mode 100644
+index 2e6670a..0000000
+--- a/m4/ax_python_module.m4
++++ b/dev/null
+@@ -1,49 +0,0 @@
+-# ===========================================================================
+-#     http://www.gnu.org/software/autoconf-archive/ax_python_module.html
+-# ===========================================================================
+-#
+-# SYNOPSIS
+-#
+-#   AX_PYTHON_MODULE(modname[, fatal])
+-#
+-# DESCRIPTION
+-#
+-#   Checks for Python module.
+-#
+-#   If fatal is non-empty then absence of a module will trigger an error.
+-#
+-# LICENSE
+-#
+-#   Copyright (c) 2008 Andrew Collier
+-#
+-#   Copying and distribution of this file, with or without modification, are
+-#   permitted in any medium without royalty provided the copyright notice
+-#   and this notice are preserved. This file is offered as-is, without any
+-#   warranty.
+-
+-#serial 6
+-
+-AU_ALIAS([AC_PYTHON_MODULE], [AX_PYTHON_MODULE])
+-AC_DEFUN([AX_PYTHON_MODULE],[
+-    if test -z $PYTHON2;
+-    then
+-        PYTHON2="python"
+-    fi
+-    PYTHON_NAME=`basename $PYTHON2`
+-    AC_MSG_CHECKING($PYTHON_NAME module: $1)
+-	$PYTHON2 -c "import $1" 2>/dev/null
+-	if test $? -eq 0;
+-	then
+-		AC_MSG_RESULT(yes)
+-		eval AS_TR_CPP(HAVE_PYMOD_$1)=yes
+-	else
+-		AC_MSG_RESULT(no)
+-		eval AS_TR_CPP(HAVE_PYMOD_$1)=no
+-		#
+-		if test -n "$2"
+-		then
+-			AC_MSG_ERROR(failed to find required module $1)
+-			exit 1
+-		fi
+-	fi
+-])
+diff --git a/src/mapi/glapi/gen/glX_XML.py b/src/mapi/glapi/gen/glX_XML.py
+index 03a35b7..12ff291 100644
+--- a/src/mapi/glapi/gen/glX_XML.py
++++ b/src/mapi/glapi/gen/glX_XML.py
+@@ -33,29 +33,27 @@ import sys, getopt, string
+ class glx_item_factory(gl_XML.gl_item_factory):
+     """Factory to create GLX protocol oriented objects derived from gl_item."""
+ 
+-    def create_item(self, name, element, context):
+-        if name == "function":
+-            return glx_function(element, context)
+-        elif name == "enum":
+-            return glx_enum(element, context)
+-        elif name == "api":
+-            return glx_api(self)
+-        else:
+-            return gl_XML.gl_item_factory.create_item(self, name, element, context)
++    def create_function(self, element, context):
++        return glx_function(element, context)
++
++    def create_enum(self, element, context, category):
++        return glx_enum(element, context, category)
++
++    def create_api(self):
++        return glx_api(self)
+ 
+ 
+ class glx_enum(gl_XML.gl_enum):
+-    def __init__(self, element, context):
+-        gl_XML.gl_enum.__init__(self, element, context)
++    def __init__(self, element, context, category):
++        gl_XML.gl_enum.__init__(self, element, context, category)
+ 
+         self.functions = {}
+ 
+-        child = element.children
+-        while child:
+-            if child.type == "element" and child.name == "size":
+-                n = child.nsProp( "name", None )
+-                c = child.nsProp( "count", None )
+-                m = child.nsProp( "mode", None )
++        for child in element.getchildren():
++            if child.tag == "size":
++                n = child.get( "name" )
++                c = child.get( "count" )
++                m = child.get( "mode", "set" )
+ 
+                 if not c:
+                     c = self.default_count
+@@ -70,8 +68,6 @@ class glx_enum(gl_XML.gl_enum):
+                 if not self.functions.has_key(n):
+                     self.functions[ n ] = [c, mode]
+ 
+-            child = child.next
+-
+         return
+ 
+ 
+@@ -120,10 +116,10 @@ class glx_function(gl_XML.gl_function):
+         # appears after the function that it aliases.
+ 
+         if not self.vectorequiv:
+-            self.vectorequiv = element.nsProp("vectorequiv", None)
++            self.vectorequiv = element.get("vectorequiv")
+ 
+ 
+-        name = element.nsProp("name", None)
++        name = element.get("name")
+         if name == self.name:
+             for param in self.parameters:
+                 self.parameters_by_name[ param.name ] = param
+@@ -135,12 +131,11 @@ class glx_function(gl_XML.gl_function):
+                     self.counter_list.append(param.counter)
+ 
+ 
+-        child = element.children
+-        while child:
+-            if child.type == "element" and child.name == "glx":
+-                rop = child.nsProp( 'rop', None )
+-                sop = child.nsProp( 'sop', None )
+-                vop = child.nsProp( 'vendorpriv', None )
++        for child in element.getchildren():
++            if child.tag == "glx":
++                rop = child.get( 'rop' )
++                sop = child.get( 'sop' )
++                vop = child.get( 'vendorpriv' )
+ 
+                 if rop:
+                     self.glx_rop = int(rop)
+@@ -152,12 +147,12 @@ class glx_function(gl_XML.gl_function):
+                     self.glx_vendorpriv = int(vop)
+                     self.glx_vendorpriv_names.append(name)
+ 
+-                self.img_reset = child.nsProp( 'img_reset', None )
++                self.img_reset = child.get( 'img_reset' )
+ 
+                 # The 'handcode' attribute can be one of 'true',
+                 # 'false', 'client', or 'server'.
+ 
+-                handcode = child.nsProp( 'handcode', None )
++                handcode = child.get( 'handcode', 'false' )
+                 if handcode == "false":
+                     self.server_handcode = 0
+                     self.client_handcode = 0
+@@ -179,8 +174,6 @@ class glx_function(gl_XML.gl_function):
+                 self.reply_always_array   = gl_XML.is_attr_true( child, 'always_array' )
+                 self.dimensions_in_reply  = gl_XML.is_attr_true( child, 'dimensions_in_reply' )
+ 
+-            child = child.next
+-
+ 
+         # Do some validation of the GLX protocol information.  As
+         # new tests are discovered, they should be added here.
+diff --git a/src/mapi/glapi/gen/glX_proto_common.py b/src/mapi/glapi/gen/glX_proto_common.py
+index 86d9189..ae2c2d5 100644
+--- a/src/mapi/glapi/gen/glX_proto_common.py
++++ b/src/mapi/glapi/gen/glX_proto_common.py
+@@ -32,18 +32,15 @@ import string
+ class glx_proto_item_factory(glX_XML.glx_item_factory):
+     """Factory to create GLX protocol oriented objects derived from gl_item."""
+ 
+-    def create_item(self, name, element, context):
+-        if name == "type":
+-            return glx_proto_type(element, context)
+-        else:
+-            return glX_XML.glx_item_factory.create_item(self, name, element, context)
++    def create_type(self, element, context, category):
++        return glx_proto_type(element, context, category)
+ 
+ 
+ class glx_proto_type(gl_XML.gl_type):
+-    def __init__(self, element, context):
+-        gl_XML.gl_type.__init__(self, element, context)
++    def __init__(self, element, context, category):
++        gl_XML.gl_type.__init__(self, element, context, category)
+ 
+-        self.glx_name = element.nsProp( "glx_name", None )
++        self.glx_name = element.get( "glx_name" )
+         return
+ 
+ 
+diff --git a/src/mapi/glapi/gen/gl_XML.py b/src/mapi/glapi/gen/gl_XML.py
+index 3bbc794..1a2bc2b 100644
+--- a/src/mapi/glapi/gen/gl_XML.py
++++ b/src/mapi/glapi/gen/gl_XML.py
+@@ -26,20 +26,19 @@
+ #    Ian Romanick <idr@us.ibm.com>
+ 
+ from decimal import Decimal
+-import libxml2
++import xml.etree.ElementTree as ET
+ import re, sys, string
++import os.path
+ import typeexpr
+ 
+ 
+ def parse_GL_API( file_name, factory = None ):
+-    doc = libxml2.readFile( file_name, None, libxml2.XML_PARSE_XINCLUDE + libxml2.XML_PARSE_NOBLANKS + libxml2.XML_PARSE_DTDVALID + libxml2.XML_PARSE_DTDATTR + libxml2.XML_PARSE_DTDLOAD + libxml2.XML_PARSE_NOENT )
+-    ret = doc.xincludeProcess()
+ 
+     if not factory:
+         factory = gl_item_factory()
+ 
+-    api = factory.create_item( "api", None, None )
+-    api.process_element( doc )
++    api = factory.create_api()
++    api.parse_file( file_name )
+ 
+     # After the XML has been processed, we need to go back and assign
+     # dispatch offsets to the functions that request that their offsets
+@@ -51,12 +50,10 @@ def parse_GL_API( file_name, factory = None ):
+             func.offset = api.next_offset;
+             api.next_offset += 1
+ 
+-    doc.freeDoc()
+-
+     return api
+ 
+ 
+-def is_attr_true( element, name ):
++def is_attr_true( element, name, default = "false" ):
+     """Read a name value from an element's attributes.
+ 
+     The value read from the attribute list must be either 'true' or
+@@ -64,7 +61,7 @@ def is_attr_true( element, name ):
+     value is 'true', non-zero will be returned.  An exception will be
+     raised for any other value."""
+ 
+-    value = element.nsProp( name, None )
++    value = element.get( name, default )
+     if value == "true":
+         return 1
+     elif value == "false":
+@@ -254,8 +251,8 @@ class gl_print_base(object):
+ 
+ 
+ def real_function_name(element):
+-    name = element.nsProp( "name", None )
+-    alias = element.nsProp( "alias", None )
++    name = element.get( "name" )
++    alias = element.get( "alias" )
+ 
+     if alias:
+         return alias
+@@ -324,21 +321,22 @@ def create_parameter_string(parameters, include_names):
+ 
+ 
+ class gl_item(object):
+-    def __init__(self, element, context):
++    def __init__(self, element, context, category):
+         self.context = context
+-        self.name = element.nsProp( "name", None )
+-        self.category = real_category_name( element.parent.nsProp( "name", None ) )
++        self.name = element.get( "name" )
++        self.category = real_category_name( category )
++
+         return
+ 
+ 
+ class gl_type( gl_item ):
+-    def __init__(self, element, context):
+-        gl_item.__init__(self, element, context)
+-        self.size = int( element.nsProp( "size", None ), 0 )
++    def __init__(self, element, context, category):
++        gl_item.__init__(self, element, context, category)
++        self.size = int( element.get( "size" ), 0 )
+ 
+         te = typeexpr.type_expression( None )
+         tn = typeexpr.type_node()
+-        tn.size = int( element.nsProp( "size", None ), 0 )
++        tn.size = int( element.get( "size" ), 0 )
+         tn.integer = not is_attr_true( element, "float" )
+         tn.unsigned = is_attr_true( element, "unsigned" )
+         tn.pointer = is_attr_true( element, "pointer" )
+@@ -354,11 +352,11 @@ class gl_type( gl_item ):
+ 
+ 
+ class gl_enum( gl_item ):
+-    def __init__(self, element, context):
+-        gl_item.__init__(self, element, context)
+-        self.value = int( element.nsProp( "value", None ), 0 )
++    def __init__(self, element, context, category):
++        gl_item.__init__(self, element, context, category)
++        self.value = int( element.get( "value" ), 0 )
+ 
+-        temp = element.nsProp( "count", None )
++        temp = element.get( "count" )
+         if not temp or temp == "?":
+             self.default_count = -1
+         else:
+@@ -404,12 +402,12 @@ class gl_enum( gl_item ):
+ 
+ class gl_parameter(object):
+     def __init__(self, element, context):
+-        self.name = element.nsProp( "name", None )
++        self.name = element.get( "name" )
+ 
+-        ts = element.nsProp( "type", None )
++        ts = element.get( "type" )
+         self.type_expr = typeexpr.type_expression( ts, context )
+ 
+-        temp = element.nsProp( "variable_param", None )
++        temp = element.get( "variable_param" )
+         if temp:
+             self.count_parameter_list = temp.split( ' ' )
+         else:
+@@ -420,7 +418,7 @@ class gl_parameter(object):
+         # statement will throw an exception, and the except block will
+         # take over.
+ 
+-        c = element.nsProp( "count", None )
++        c = element.get( "count" )
+         try: 
+             count = int(c)
+             self.count = count
+@@ -430,7 +428,7 @@ class gl_parameter(object):
+             self.count = 0
+             self.counter = c
+ 
+-        self.count_scale = int(element.nsProp( "count_scale", None ))
++        self.count_scale = int(element.get( "count_scale", "1" ))
+ 
+         elements = (count * self.count_scale)
+         if elements == 1:
+@@ -450,19 +448,19 @@ class gl_parameter(object):
+ 
+         # Pixel data has special parameters.
+ 
+-        self.width      = element.nsProp('img_width',  None)
+-        self.height     = element.nsProp('img_height', None)
+-        self.depth      = element.nsProp('img_depth',  None)
+-        self.extent     = element.nsProp('img_extent', None)
++        self.width      = element.get('img_width')
++        self.height     = element.get('img_height')
++        self.depth      = element.get('img_depth')
++        self.extent     = element.get('img_extent')
+ 
+-        self.img_xoff   = element.nsProp('img_xoff',   None)
+-        self.img_yoff   = element.nsProp('img_yoff',   None)
+-        self.img_zoff   = element.nsProp('img_zoff',   None)
+-        self.img_woff   = element.nsProp('img_woff',   None)
++        self.img_xoff   = element.get('img_xoff')
++        self.img_yoff   = element.get('img_yoff')
++        self.img_zoff   = element.get('img_zoff')
++        self.img_woff   = element.get('img_woff')
+ 
+-        self.img_format = element.nsProp('img_format', None)
+-        self.img_type   = element.nsProp('img_type',   None)
+-        self.img_target = element.nsProp('img_target', None)
++        self.img_format = element.get('img_format')
++        self.img_type   = element.get('img_type')
++        self.img_target = element.get('img_target')
+ 
+         self.img_pad_dimensions = is_attr_true( element, 'img_pad_dimensions' )
+         self.img_null_flag      = is_attr_true( element, 'img_null_flag' )
+@@ -648,17 +646,17 @@ class gl_function( gl_item ):
+ 
+ 
+     def process_element(self, element):
+-        name = element.nsProp( "name", None )
+-        alias = element.nsProp( "alias", None )
++        name = element.get( "name" )
++        alias = element.get( "alias" )
+ 
+-        if is_attr_true(element, "static_dispatch"):
++        if is_attr_true(element, "static_dispatch", "true"):
+             self.static_entry_points.append(name)
+ 
+         self.entry_points.append( name )
+ 
+         self.entry_point_api_map[name] = {}
+         for api in ('es1', 'es2'):
+-            version_str = element.nsProp(api, None)
++            version_str = element.get(api, 'none')
+             assert version_str is not None
+             if version_str != 'none':
+                 version_decimal = Decimal(version_str)
+@@ -667,15 +665,15 @@ class gl_function( gl_item ):
+                         version_decimal < self.api_map[api]:
+                     self.api_map[api] = version_decimal
+ 
+-        exec_flavor = element.nsProp('exec', None)
++        exec_flavor = element.get('exec')
+         if exec_flavor:
+             self.exec_flavor = exec_flavor
+ 
+-        deprecated = element.nsProp('deprecated', None)
++        deprecated = element.get('deprecated', 'none')
+         if deprecated != 'none':
+             self.deprecated = Decimal(deprecated)
+ 
+-        if not is_attr_true(element, 'desktop'):
++        if not is_attr_true(element, 'desktop', 'true'):
+             self.desktop = False
+ 
+         if alias:
+@@ -686,7 +684,7 @@ class gl_function( gl_item ):
+             # Only try to set the offset when a non-alias entry-point
+             # is being processed.
+ 
+-            offset = element.nsProp( "offset", None )
++            offset = element.get( "offset" )
+             if offset:
+                 try:
+                     o = int( offset )
+@@ -712,16 +710,12 @@ class gl_function( gl_item ):
+ 
+         parameters = []
+         return_type = "void"
+-        child = element.children
+-        while child:
+-            if child.type == "element":
+-                if child.name == "return":
+-                    return_type = child.nsProp( "type", None )
+-                elif child.name == "param":
+-                    param = self.context.factory.create_item( "parameter", child, self.context)
+-                    parameters.append( param )
+-
+-            child = child.next
++        for child in element.getchildren():
++            if child.tag == "return":
++                return_type = child.get( "type", "void" )
++            elif child.tag == "param":
++                param = self.context.factory.create_parameter(child, self.context)
++                parameters.append( param )
+ 
+ 
+         if self.initialized:
+@@ -746,7 +740,7 @@ class gl_function( gl_item ):
+                 if param.is_image():
+                     self.images.append( param )
+ 
+-        if element.children:
++        if element.getchildren():
+             self.initialized = 1
+             self.entry_point_parameters[name] = parameters
+         else:
+@@ -848,19 +842,20 @@ class gl_function( gl_item ):
+ class gl_item_factory(object):
+     """Factory to create objects derived from gl_item."""
+ 
+-    def create_item(self, item_name, element, context):
+-        if item_name == "function":
+-            return gl_function(element, context)
+-        if item_name == "type":
+-            return gl_type(element, context)
+-        elif item_name == "enum":
+-            return gl_enum(element, context)
+-        elif item_name == "parameter":
+-            return gl_parameter(element, context)
+-        elif item_name == "api":
+-            return gl_api(self)
+-        else:
+-            return None
++    def create_function(self, element, context):
++        return gl_function(element, context)
++
++    def create_type(self, element, context, category):
++        return gl_type(element, context, category)
++
++    def create_enum(self, element, context, category):
++        return gl_enum(element, context, category)
++
++    def create_parameter(self, element, context):
++        return gl_parameter(element, context)
++
++    def create_api(self):
++        return gl_api(self)
+ 
+ 
+ class gl_api(object):
+@@ -903,66 +898,64 @@ class gl_api(object):
+ 
+         self.functions_by_name = functions_by_name
+ 
+-    def process_element(self, doc):
+-        element = doc.children
+-        while element.type != "element" or element.name != "OpenGLAPI":
+-            element = element.next
+ 
+-        if element:
+-            self.process_OpenGLAPI(element)
+-        return
++    def parse_file(self, file_name):
++        doc = ET.parse( file_name )
++        self.process_element(file_name, doc)
+ 
+ 
+-    def process_OpenGLAPI(self, element):
+-        child = element.children
+-        while child:
+-            if child.type == "element":
+-                if child.name == "category":
+-                    self.process_category( child )
+-                elif child.name == "OpenGLAPI":
+-                    self.process_OpenGLAPI( child )
++    def process_element(self, file_name, doc):
++        element = doc.getroot()
++        if element.tag == "OpenGLAPI":
++            self.process_OpenGLAPI(file_name, element)
++        return
++
+ 
+-            child = child.next
++    def process_OpenGLAPI(self, file_name, element):
++        for child in element.getchildren():
++            if child.tag == "category":
++                self.process_category( child )
++            elif child.tag == "OpenGLAPI":
++                self.process_OpenGLAPI( file_name, child )
++            elif child.tag == '{http://www.w3.org/2001/XInclude}include':
++                href = child.get('href')
++                href = os.path.join(os.path.dirname(file_name), href)
++                self.parse_file(href)
+ 
+         return
+ 
+ 
+     def process_category(self, cat):
+-        cat_name = cat.nsProp( "name", None )
+-        cat_number = cat.nsProp( "number", None )
++        cat_name = cat.get( "name" )
++        cat_number = cat.get( "number" )
+ 
+         [cat_type, key] = classify_category(cat_name, cat_number)
+         self.categories[cat_type][key] = [cat_name, cat_number]
+ 
+-        child = cat.children
+-        while child:
+-            if child.type == "element":
+-                if child.name == "function":
+-                    func_name = real_function_name( child )
+-
+-                    temp_name = child.nsProp( "name", None )
+-                    self.category_dict[ temp_name ] = [cat_name, cat_number]
+-
+-                    if self.functions_by_name.has_key( func_name ):
+-                        func = self.functions_by_name[ func_name ]
+-                        func.process_element( child )
+-                    else:
+-                        func = self.factory.create_item( "function", child, self )
+-                        self.functions_by_name[ func_name ] = func
++        for child in cat.getchildren():
++            if child.tag == "function":
++                func_name = real_function_name( child )
+ 
+-                    if func.offset >= self.next_offset:
+-                        self.next_offset = func.offset + 1
++                temp_name = child.get( "name" )
++                self.category_dict[ temp_name ] = [cat_name, cat_number]
+ 
++                if self.functions_by_name.has_key( func_name ):
++                    func = self.functions_by_name[ func_name ]
++                    func.process_element( child )
++                else:
++                    func = self.factory.create_function( child, self )
++                    self.functions_by_name[ func_name ] = func
+ 
+-                elif child.name == "enum":
+-                    enum = self.factory.create_item( "enum", child, self )
+-                    self.enums_by_name[ enum.name ] = enum
+-                elif child.name == "type":
+-                    t = self.factory.create_item( "type", child, self )
+-                    self.types_by_name[ "GL" + t.name ] = t
++                if func.offset >= self.next_offset:
++                    self.next_offset = func.offset + 1
+ 
+ 
+-            child = child.next
++            elif child.tag == "enum":
++                enum = self.factory.create_enum( child, self, cat_name )
++                self.enums_by_name[ enum.name ] = enum
++            elif child.tag == "type":
++                t = self.factory.create_type( child, self, cat_name )
++                self.types_by_name[ "GL" + t.name ] = t
+ 
+         return
+ 
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 310731c..75d2c7a 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -18,7 +18,6 @@ MESA3D_DEPENDENCIES = \
 	host-bison \
 	host-flex \
 	host-gettext \
-	host-libxml2 \
 	host-python \
 	host-xutil_makedepend \
 	libdrm
-- 
1.7.10.4
