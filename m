From: tpetazzoni at uclibc.org <tpetazzoni@uclibc.org>
Date: Wed,  3 Dec 2008 01:02:46 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  liboil
Message-ID: <20081203090246.B5CC23C869@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: tpetazzoni
Date: 2008-12-03 01:02:46 -0800 (Wed, 03 Dec 2008)
New Revision: 24238

Log:
Liboil is a library of simple functions that are optimized for various
CPUs. It is required by various GStreamer plugins.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>

Modifications by Thomas Petazzoni:

 - Remove the glib2 dependency, which is only necessary to build a few
   examples. If glib2 is enabled in the configuration, then we still
   depend on it in order to build the examples, but that's just
   pedantic, not so useful.

 - Remove the oil-bugreport program installed to the target by
   install-strip.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>



Added:
   trunk/buildroot/package/liboil/
   trunk/buildroot/package/liboil/Config.in
   trunk/buildroot/package/liboil/liboil.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-12-02 22:56:59 UTC (rev 24237)
+++ trunk/buildroot/package/Config.in	2008-12-03 09:02:46 UTC (rev 24238)
@@ -78,6 +78,7 @@
 source "package/libgpg-error/Config.in"
 source "package/libiconv/Config.in"
 source "package/liblockfile/Config.in"
+source "package/liboil/Config.in"
 source "package/libsysfs/Config.in"
 source "package/lockfile-progs/Config.in"
 source "package/logrotate/Config.in"

Added: trunk/buildroot/package/liboil/Config.in
===================================================================
--- trunk/buildroot/package/liboil/Config.in	                        (rev 0)
+++ trunk/buildroot/package/liboil/Config.in	2008-12-03 09:02:46 UTC (rev 24238)
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBOIL
+	bool "liboil"
+	help
+	  Library of simple functions that are optimized for various CPUs.
+
+	  http://liboil.freedesktop.org/

Added: trunk/buildroot/package/liboil/liboil.mk
===================================================================
--- trunk/buildroot/package/liboil/liboil.mk	                        (rev 0)
+++ trunk/buildroot/package/liboil/liboil.mk	2008-12-03 09:02:46 UTC (rev 24238)
@@ -0,0 +1,43 @@
+#############################################################
+#
+# liboil
+#
+#############################################################
+LIBOIL_VERSION = 0.3.15
+LIBOIL_SOURCE = liboil-$(LIBOIL_VERSION).tar.gz
+LIBOIL_SITE = http://liboil.freedesktop.org/download
+LIBOIL_AUTORECONF = NO
+LIBOIL_INSTALL_STAGING = YES
+LIBOIL_INSTALL_TARGET = YES
+
+# Checking if unaligned memory access works correctly cannot be done when cross
+# compiling. For the following architectures there is no information available
+# in the configure script.
+ifeq ($(BR2_avr32),y)
+LIBOIL_CONF_ENV = as_cv_unaligned_access=no
+endif
+ifeq ($(BR2_cris),y)
+LIBOIL_CONF_ENV = as_cv_unaligned_access=yes
+endif
+ifeq ($(BR2_nios2),y)
+LIBOIL_CONF_ENV = as_cv_unaligned_access=no
+endif
+ifeq ($(BR2_s390),y)
+LIBOIL_CONF_ENV = as_cv_unaligned_access=yes
+endif
+ifeq ($(BR2_x86_64),y)
+LIBOIL_CONF_ENV = as_cv_unaligned_access=yes
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+LIBOIL_GLIB_DEP = libglib2
+endif
+
+LIBOIL_DEPENDENCIES = uclibc $(LIBOIL_GLIB_DEP)
+
+$(eval $(call AUTOTARGETS,package,liboil))
+
+$(LIBOIL_HOOK_POST_INSTALL):
+	# Remove useless bugreport program from the target
+	rm -f $(TARGET_DIR)/usr/bin/oil-bugreport
+	touch $@
\ No newline at end of file
