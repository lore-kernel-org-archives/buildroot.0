From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 23 Jul 2008 05:08:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/grep
Message-ID: <20080723120854.0FE453C7D3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-23 05:08:53 -0700 (Wed, 23 Jul 2008)
New Revision: 22936

Log:
grep: make locale handling less verbose

As suggested by Bernhard.

Modified:
   trunk/buildroot/package/grep/grep.mk


Changeset:
Modified: trunk/buildroot/package/grep/grep.mk
===================================================================
--- trunk/buildroot/package/grep/grep.mk	2008-07-23 11:23:36 UTC (rev 22935)
+++ trunk/buildroot/package/grep/grep.mk	2008-07-23 12:08:53 UTC (rev 22936)
@@ -11,10 +11,6 @@
 GNUGREP_BINARY:=src/grep
 GNUGREP_TARGET_BINARY:=bin/grep
 
-ifeq ($(BR2_ENABLE_LOCALE),y)
-GNUGREP_EXTRA_DEPS:=gettext libintl
-endif
-
 $(DL_DIR)/$(GNUGREP_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(GNUGREP_SITE)/$(GNUGREP_SOURCE)
 
@@ -54,8 +50,9 @@
 	done
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
 
-grep: uclibc $(GNUGREP_EXTRA_DEPS) $(TARGET_DIR)/$(GNUGREP_TARGET_BINARY)
-
+grep: uclibc $(if $(BR2_ENABLE_LOCALE),gettext libintl) \
+	 $(TARGET_DIR)/$(GNUGREP_TARGET_BINARY)
+	echo deps: $^
 grep-clean:
 	rm -f $(addprefix $(TARGET_DIR)/bin/,egrep fgrep grep)
 	-$(MAKE) -C $(GNUGREP_DIR) clean
