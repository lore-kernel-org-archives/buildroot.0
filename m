From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:36:55 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  xboard
Message-ID: <20080306183655.281EA1202A8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:36:54 -0800 (Thu, 06 Mar 2008)
New Revision: 21242

Log:
added xboard

Added:
   trunk/buildroot/package/xboard/
   trunk/buildroot/package/xboard/Config.in
   trunk/buildroot/package/xboard/xboard-4.2.7-installer.patch
   trunk/buildroot/package/xboard/xboard.mk


Changeset:
Added: trunk/buildroot/package/xboard/Config.in
===================================================================
--- trunk/buildroot/package/xboard/Config.in	                        (rev 0)
+++ trunk/buildroot/package/xboard/Config.in	2008-03-06 18:36:54 UTC (rev 21242)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XBOARD
+	bool "xboard"
+	default n
+	help
+	  XBoard and WinBoard are graphical user interfaces for chess.
+
+	  http://ftp.gnu.org/gnu/xboard

Added: trunk/buildroot/package/xboard/xboard-4.2.7-installer.patch
===================================================================
--- trunk/buildroot/package/xboard/xboard-4.2.7-installer.patch	                        (rev 0)
+++ trunk/buildroot/package/xboard/xboard-4.2.7-installer.patch	2008-03-06 18:36:54 UTC (rev 21242)
@@ -0,0 +1,55 @@
+--- a/Makefile.in	2003-11-28 16:12:57.000000000 -0500
++++ b/Makefile.in	2008-02-13 13:18:34.000000000 -0500
+@@ -63,27 +63,27 @@ default: xboard zic2xpm
+ all: default pseudosource info FAQ html dvi ps
+ 
+ install: installdirs default
+-	$(INSTALL_PROGRAM) -s xboard $(bindir)/xboard
+-	$(INSTALL_PROGRAM) -s zic2xpm $(bindir)/zic2xpm
+-	$(INSTALL_PROGRAM) cmail $(bindir)/cmail
+-	$(INSTALL_PROGRAM) $(srcdir)/pxboard $(bindir)/pxboard
+-	$(INSTALL_DATA) $(srcdir)/xboard.man $(man6dir)/xboard$(man6ext)
+-	$(INSTALL_DATA) $(srcdir)/zic2xpm.man $(man6dir)/zic2xpm$(man6ext)
+-	$(INSTALL_DATA) xboard.info $(infodir)/xboard.info
++	$(INSTALL_PROGRAM) xboard $(DESTDIR)$(bindir)/xboard
++	$(INSTALL_PROGRAM) zic2xpm $(DESTDIR)$(bindir)/zic2xpm
++	$(INSTALL_PROGRAM) cmail $(DESTDIR)$(bindir)/cmail
++	$(INSTALL_PROGRAM) $(srcdir)/pxboard $(DESTDIR)$(bindir)/pxboard
++	$(INSTALL_DATA) $(srcdir)/xboard.man $(DESTDIR)$(man6dir)/xboard$(man6ext)
++	$(INSTALL_DATA) $(srcdir)/zic2xpm.man $(DESTDIR)$(man6dir)/zic2xpm$(man6ext)
++	$(INSTALL_DATA) xboard.info $(DESTDIR)$(infodir)/xboard.info
+ 	-PATH=$$PATH:/sbin:/usr/sbin install-info \
+-		$(infodir)/xboard.info $(infodir)/dir
++		$(infodir)/xboard.info $(DESTDIR)$(infodir)/dir
+ 
+ installdirs: mkinstalldirs
+ 	$(srcdir)/mkinstalldirs $(bindir) $(mandir) $(man6dir) $(infodir)
+ 
+ uninstall:
+-	rm -f $(bindir)/xboard $(bindir)/cmail $(bindir)/pxboard
+-	rm -f $(bindir)/zic2xpm
+-	rm -f $(man6dir)/xboard$(man6ext) $(man6dir)/cmail$(man6ext)
+-	rm -f $(man6dir)/zic2xpm$(man6ext)
+-	rm -f $(infodir)/xboard.info
++	rm -f $(DESTDIR)$(bindir)/xboard $(DESTDIR)$(bindir)/cmail $(DESTDIR)$(bindir)/pxboard
++	rm -f $(DESTDIR)$(bindir)/zic2xpm
++	rm -f $(DESTDIR)$(man6dir)/xboard$(man6ext) $(DESTDIR)$(man6dir)/cmail$(man6ext)
++	rm -f $(DESTDIR)$(man6dir)/zic2xpm$(man6ext)
++	rm -f $(DESTDIR)$(infodir)/xboard.info
+ 	-PATH=$$PATH:/sbin:/usr/sbin install-info --delete \
+-		$(infodir)/xboard.info $(infodir)/dir
++		$(DESTDIR)$(infodir)/xboard.info $(DESTDIR)$(infodir)/dir
+ 
+ clean:
+ 	rm -f xboard zic2xpm *.o xboard.txt zic2xpm.txt $(LEX_OUTPUT_ROOT).c
+--- a/Makefile.in	2008-02-13 13:20:14.000000000 -0500
++++ b/Makefile.in	2008-02-13 13:21:25.000000000 -0500
+@@ -74,7 +74,7 @@ install: installdirs default
+ 		$(infodir)/xboard.info $(DESTDIR)/$(infodir)/dir
+ 
+ installdirs: mkinstalldirs
+-	$(srcdir)/mkinstalldirs $(bindir) $(mandir) $(man6dir) $(infodir)
++	$(srcdir)/mkinstalldirs $(DESTDIR)$(bindir) $(DESTDIR)$(mandir) $(DESTDIR)$(man6dir) $(DESTDIR)$(infodir)
+ 
+ uninstall:
+ 	rm -f $(DESTDIR)/$(bindir)/xboard $(DESTDIR)/$(bindir)/cmail $(DESTDIR)/$(bindir)/pxboard

Added: trunk/buildroot/package/xboard/xboard.mk
===================================================================
--- trunk/buildroot/package/xboard/xboard.mk	                        (rev 0)
+++ trunk/buildroot/package/xboard/xboard.mk	2008-03-06 18:36:54 UTC (rev 21242)
@@ -0,0 +1,19 @@
+#############################################################
+#
+# xboard
+#
+#############################################################
+XBOARD_VERSION = 4.2.7
+XBOARD_SOURCE = xboard-$(XBOARD_VERSION).tar.gz
+XBOARD_SITE = http://ftp.gnu.org/gnu/xboard
+XBOARD_AUTORECONF = NO
+XBOARD_INSTALL_STAGING = NO
+XBOARD_INSTALL_TARGET = YES
+XBOARD_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+
+XBOARD_CONF_OPT --prefix=/usr
+
+XBOARD_DEPENDENCIES = uclibc gnuchess
+
+$(eval $(call AUTOTARGETS,package,xboard))
+
