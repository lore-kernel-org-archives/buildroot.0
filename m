From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 19:10:42 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot:  package/libglib2
Message-ID: <20090126191042.A65DE768D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-26 19:10:41 +0000 (Mon, 26 Jan 2009)
New Revision: 25058

Log:
libglib2: move HOST_GLIB detection to glib package

Makes more sense to have it here, and easier to change once we start
building host-glib.

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/libglib2/libglib2.mk


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2009-01-26 18:17:57 UTC (rev 25057)
+++ trunk/buildroot/Makefile	2009-01-26 19:10:41 UTC (rev 25058)
@@ -132,10 +132,7 @@
 HOSTLD:=$(shell which $(HOSTLD) || type -p $(HOSTLD) || echo ld)
 HOSTLN:=$(shell which $(HOSTLN) || type -p $(HOSTLN) || echo ln)
 HOSTNM:=$(shell which $(HOSTNM) || type -p $(HOSTNM) || echo nm)
-HOST_GLIB_BIN:=`dirname $(shell which glib-genmarshal || echo /usr/bin/glib-genmarshal)`
-HOST_GLIB:=$(shell dirname $(HOST_GLIB_BIN) || echo /usr)
 
-
 ifndef CFLAGS_FOR_BUILD
 CFLAGS_FOR_BUILD:=-g -O2
 endif

Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2009-01-26 18:17:57 UTC (rev 25057)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2009-01-26 19:10:41 UTC (rev 25058)
@@ -14,6 +14,10 @@
 LIBGLIB2_INSTALL_TARGET = YES
 LIBGLIB2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
+# detect install prefix of host glib development stuff
+HOST_GLIB_BIN:=`dirname $(shell which glib-genmarshal || echo /usr/bin/glib-genmarshal)`
+HOST_GLIB:=$(shell dirname $(HOST_GLIB_BIN) || echo /usr)
+
 LIBGLIB2_CONF_ENV =	\
 		ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no ac_cv_func_strtod=yes \
