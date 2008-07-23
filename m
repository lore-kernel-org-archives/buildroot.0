From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 23 Jul 2008 03:35:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/grep
Message-ID: <20080723103553.C15B83C806@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-23 03:35:53 -0700 (Wed, 23 Jul 2008)
New Revision: 22930

Log:
grep: gettext/libintl is only required if locale is enabled

Modified:
   trunk/buildroot/package/grep/Config.in
   trunk/buildroot/package/grep/grep.mk


Changeset:
Modified: trunk/buildroot/package/grep/Config.in
===================================================================
--- trunk/buildroot/package/grep/Config.in	2008-07-23 10:35:50 UTC (rev 22929)
+++ trunk/buildroot/package/grep/Config.in	2008-07-23 10:35:53 UTC (rev 22930)
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_GREP
 	bool "grep"
-	select BR2_PACKAGE_GETTEXT
-	select BR2_PACKAGE_LIBINTL
+	select BR2_PACKAGE_GETTEXT if BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_ENABLE_LOCALE
 	help
 	  The GNU regular expression matcher.
-	  Needs gettext
+
 	  http://www.gnu.org/software/grep/grep.html

Modified: trunk/buildroot/package/grep/grep.mk
===================================================================
--- trunk/buildroot/package/grep/grep.mk	2008-07-23 10:35:50 UTC (rev 22929)
+++ trunk/buildroot/package/grep/grep.mk	2008-07-23 10:35:53 UTC (rev 22930)
@@ -11,6 +11,10 @@
 GNUGREP_BINARY:=src/grep
 GNUGREP_TARGET_BINARY:=bin/grep
 
+ifeq ($(BR2_ENABLE_LOCALE),y)
+GNUGREP_EXTRA_DEPS:=gettext libintl
+endif
+
 $(DL_DIR)/$(GNUGREP_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(GNUGREP_SITE)/$(GNUGREP_SOURCE)
 
@@ -65,7 +69,7 @@
 	    cp -a $(GNUGREP_DIR)/src/grep $(GNUGREP_DIR)/src/egrep \
 		$(GNUGREP_DIR)/src/fgrep $(TARGET_DIR)/bin/; fi
 
-grep: uclibc gettext libintl grep-target_binary
+grep: uclibc $(GNUGREP_EXTRA_DEPS) grep-target_binary
 
 grep-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(GNUGREP_DIR) uninstall
