From: hamish at uclibc.org <hamish@uclibc.org>
Date: Wed,  3 Sep 2008 22:50:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libdnet
Message-ID: <20080904055031.A4B5D3C80D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-09-03 22:50:31 -0700 (Wed, 03 Sep 2008)
New Revision: 23319

Log:
New package for dnet, a wrapper library for getting access to kernel network information
and an optional Python module for the same.


Added:
   trunk/buildroot/package/libdnet/
   trunk/buildroot/package/libdnet/Config.in
   trunk/buildroot/package/libdnet/libdnet-001-python-gcc.patch
   trunk/buildroot/package/libdnet/libdnet-002-python-makefile.patch
   trunk/buildroot/package/libdnet/libdnet.mk


Changeset:
Added: trunk/buildroot/package/libdnet/Config.in
===================================================================
--- trunk/buildroot/package/libdnet/Config.in	                        (rev 0)
+++ trunk/buildroot/package/libdnet/Config.in	2008-09-04 05:50:31 UTC (rev 23319)
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LIBDNET
+	bool "libdnet"
+	help
+	  libdnet - simplified interface to low-level networking routines.
+
+	  http://libdnet.sourceforge.net/
+
+config BR2_PACKAGE_LIBDNET_PYTHON
+	bool "libdnet python module"
+	depends on BR2_PACKAGE_LIBDNET && BR2_PACKAGE_PYTHON
+	help
+	  dnet module for python
+
+comment "dnet module for python requires python package"
+	depends on BR2_PACKAGE_LIBDNET && !BR2_PACKAGE_PYTHON
+

Added: trunk/buildroot/package/libdnet/libdnet-001-python-gcc.patch
===================================================================
--- trunk/buildroot/package/libdnet/libdnet-001-python-gcc.patch	                        (rev 0)
+++ trunk/buildroot/package/libdnet/libdnet-001-python-gcc.patch	2008-09-04 05:50:31 UTC (rev 23319)
@@ -0,0 +1,20 @@
+--- a/python/dnet.c	2006-01-19 18:08:23.000000000 +1100
++++ b/python/dnet.c	2008-09-03 16:30:47.000000000 +1000
+@@ -2726,7 +2726,7 @@
+   PyObject *__pyx_3 = 0;
+   unsigned short __pyx_4;
+   Py_INCREF(__pyx_v_self);
+-  ((PyObject*)__pyx_v_next) = Py_None; Py_INCREF(((PyObject*)__pyx_v_next));
++  __pyx_v_next = (struct __pyx_obj_4dnet_addr*)Py_None; Py_INCREF(((PyObject*)__pyx_v_next));
+ 
+   /* "/Users/dugsong/projects/libdnet/python/./dnet.pyx":634 */
+   __pyx_1 = (((struct __pyx_obj_4dnet___addr_ip4_iter *)__pyx_v_self)->cur <= ((struct __pyx_obj_4dnet___addr_ip4_iter *)__pyx_v_self)->max);
+@@ -2738,7 +2739,7 @@
+     Py_DECREF(__pyx_2); __pyx_2 = 0;
+     if (!__Pyx_TypeTest(__pyx_3, __pyx_ptype_4dnet_addr)) {__pyx_filename = __pyx_f[0]; __pyx_lineno = 635; goto __pyx_L1;}
+     Py_DECREF(((PyObject *)__pyx_v_next));
+-    ((PyObject *)__pyx_v_next) = __pyx_3;
++    __pyx_v_next = (struct __pyx_obj_4dnet_addr*)__pyx_3;
+     __pyx_3 = 0;
+ 
+     /* "/Users/dugsong/projects/libdnet/python/./dnet.pyx":636 */

Added: trunk/buildroot/package/libdnet/libdnet-002-python-makefile.patch
===================================================================
--- trunk/buildroot/package/libdnet/libdnet-002-python-makefile.patch	                        (rev 0)
+++ trunk/buildroot/package/libdnet/libdnet-002-python-makefile.patch	2008-09-04 05:50:31 UTC (rev 23319)
@@ -0,0 +1,10 @@
+--- a/python/Makefile.am	2006-01-15 18:08:23.000000000 +1100
++++ b/python/Makefile.am	2008-09-04 15:25:52.000000000 +1000
+@@ -11,6 +11,7 @@
+ 	pyrexc $(srcdir)/dnet.pyx
+ 
+ python-build: $(srcdir)/dnet.c
++	CC="$(CC)" LDSHARED="$(CC) -shared" $(PYTHON) setup.py build_ext -I$(PYINCDIR)
+ 	$(PYTHON) setup.py build
+ 	touch python-build
+ 

Added: trunk/buildroot/package/libdnet/libdnet.mk
===================================================================
--- trunk/buildroot/package/libdnet/libdnet.mk	                        (rev 0)
+++ trunk/buildroot/package/libdnet/libdnet.mk	2008-09-04 05:50:31 UTC (rev 23319)
@@ -0,0 +1,29 @@
+#############################################################
+#
+# libdnet
+#
+#############################################################
+
+LIBDNET_VERSION = 1.11
+LIBDNET_SOURCE = libdnet-$(LIBDNET_VERSION).tar.gz
+LIBDNET_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libdnet/
+LIBDNET_INSTALL_STAGING = YES
+LIBDNET_INSTALL_TARGET = YES
+LIBDNET_AUTORECONF = YES
+LIBDNET_CONF_OPT = --with-gnu-ld --enable-shared --enable-static
+LIBDNET_DEPENDENCIES = uclibc
+
+ifneq ($(BR2_PACKAGE_LIBDNET_PYTHON),)
+LIBDNET_DEPENDENCIES += python
+LIBDNET_CONF_OPT += --with-python
+LIBDNET_MAKE_OPT = PYTHON=python$(PYTHON_VERSION_SHORT) PYINCDIR=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_SHORT)
+LIBDNET_INSTALL_TARGET_OPT = $(LIBDNET_MAKE_OPT) DESTDIR=$(TARGET_DIR) INSTALL_STRIP_FLAG=-s install-exec
+LIBDNET_INSTALL_STAGING_OPT = $(LIBDNET_MAKE_OPT) DESTDIR=$(STAGING_DIR) install
+endif
+
+$(eval $(call AUTOTARGETS,package,libdnet))
+
+$(LIBDNET_HOOK_POST_EXTRACT):
+	ln -sf config/acinclude.m4 $(LIBDNET_DIR)
+	touch $@
+
