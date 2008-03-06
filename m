From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:06:04 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  cups
Message-ID: <20080306180604.76F10120159@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:06:01 -0800 (Thu, 06 Mar 2008)
New Revision: 21188

Log:
added cups


Added:
   trunk/buildroot/package/cups/
   trunk/buildroot/package/cups/Config.in
   trunk/buildroot/package/cups/cups-1.3.5-mantohtml.patch
   trunk/buildroot/package/cups/cups-1.3.5-no-tests-man.patch
   trunk/buildroot/package/cups/cups.mk


Changeset:
Added: trunk/buildroot/package/cups/Config.in
===================================================================
--- trunk/buildroot/package/cups/Config.in	                        (rev 0)
+++ trunk/buildroot/package/cups/Config.in	2008-03-06 18:06:01 UTC (rev 21188)
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CUPS
+	bool "cups"
+	default n
+	help
+		The Common Unix Print Subsystem
+
+		http://www.cups.org
+

Added: trunk/buildroot/package/cups/cups-1.3.5-mantohtml.patch
===================================================================
--- trunk/buildroot/package/cups/cups-1.3.5-mantohtml.patch	                        (rev 0)
+++ trunk/buildroot/package/cups/cups-1.3.5-mantohtml.patch	2008-03-06 18:06:01 UTC (rev 21188)
@@ -0,0 +1,11 @@
+--- cups-1.3.5/man/Makefile	2007-07-12 21:01:14.000000000 -0400
++++ cups-1.3.5/man/Makefile	2008-02-11 08:55:24.000000000 -0500
+@@ -173,7 +173,7 @@ html:	$(MAN1) $(MAN5) $(MAN7) $(MAN8) ma
+ 	done
+ 
+ mantohtml:	mantohtml.o
+-	$(CC) $(LDFLAGS) -o $@ mantohtml.o
++	gcc -I/usr/include -I../ -L/usr/lib mantohtml.c -o mantohtml
+ 
+ 
+ #

Added: trunk/buildroot/package/cups/cups-1.3.5-no-tests-man.patch
===================================================================
--- trunk/buildroot/package/cups/cups-1.3.5-no-tests-man.patch	                        (rev 0)
+++ trunk/buildroot/package/cups/cups-1.3.5-no-tests-man.patch	2008-03-06 18:06:01 UTC (rev 21188)
@@ -0,0 +1,13 @@
+--- cups-1.3.5/Makefile	2007-12-06 15:09:39.000000000 -0500
++++ cups-1.3.5/Makefile	2008-02-09 21:53:03.000000000 -0500
+@@ -19,8 +19,8 @@ include Makedefs
+ # Directories to make...
+ #
+ 
+-DIRS	=	cups backend berkeley cgi-bin filter locale man monitor \
+-		notifier $(PDFTOPS) scheduler systemv test \
++DIRS	=	cups backend berkeley cgi-bin filter locale monitor \
++		notifier $(PDFTOPS) scheduler systemv \
+ 		$(PHPDIR) \
+ 		conf data doc $(FONTS) ppd templates
+ 

Added: trunk/buildroot/package/cups/cups.mk
===================================================================
--- trunk/buildroot/package/cups/cups.mk	                        (rev 0)
+++ trunk/buildroot/package/cups/cups.mk	2008-03-06 18:06:01 UTC (rev 21188)
@@ -0,0 +1,32 @@
+################################################################################
+#
+# cups
+#
+################################################################################
+
+CUPS_VERSION = 1.3.5
+CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.bz2
+CUPS_SITE = http://ftp.easysw.com/pub/cups/1.3.5
+CUPS_AUTORECONF = NO
+CUPS_INSTALL_STAGING = YES
+CUPS_INSTALL_TARGET = YES
+CUPS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install DSTROOT=$(STAGING_DIR)
+CUPS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install DSTROOT=$(TARGET_DIR)
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+        CUPS_CONF_OPT_DBUS =--disable-dbus
+        CUPS_DEPENDENCIES_DBUS = dbus
+else
+        CUPS_CONF_OPT_DBUS =--enable-dbus
+endif
+
+ifneq ($(BR2_PACKAGE_XSERVER_none),y)
+        CUPS_DEPENDENCIES_X = xlib_libX11
+endif
+
+CUPS_CONF_OPT = --prefix=/usr --includedir=/usr/include --libdir=/usr/lib --disable-gnutls --disable-gssapi $(CUPS_CONF_OPT_DBUS)
+CUPS_MAKE_OPT = cups backend berkeley cgi-bin filter locale monitor notifier pdftops scheduler systemv scripting/php conf data doc fonts ppd templates
+
+CUPS_DEPENDENCIES = $(CUPS_DEPENDENCIES_DBUS) $(CUPS_DEPENDENCIES_X) 
+
+$(eval $(call AUTOTARGETS,package,cups))
