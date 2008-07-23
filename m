From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 23 Jul 2008 03:35:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/grep
Message-ID: <20080723103556.E08FB3C814@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-23 03:35:56 -0700 (Wed, 23 Jul 2008)
New Revision: 22931

Log:
grep: fix target install and clean

Modified:
   trunk/buildroot/package/grep/grep.mk


Changeset:
Modified: trunk/buildroot/package/grep/grep.mk
===================================================================
--- trunk/buildroot/package/grep/grep.mk	2008-07-23 10:35:53 UTC (rev 22930)
+++ trunk/buildroot/package/grep/grep.mk	2008-07-23 10:35:56 UTC (rev 22931)
@@ -58,21 +58,16 @@
 $(GNUGREP_DIR)/$(GNUGREP_BINARY): $(GNUGREP_DIR)/.configured
 	$(MAKE) -C $(GNUGREP_DIR)
 
-# This stuff is needed to work around GNU make deficiencies
-grep-target_binary: $(GNUGREP_DIR)/$(GNUGREP_BINARY)
-	@if [ -L $(TARGET_DIR)/$(GNUGREP_TARGET_BINARY) ]; then \
-		rm -f $(TARGET_DIR)/$(GNUGREP_TARGET_BINARY); fi
-	@if [ ! -f $(GNUGREP_DIR)/$(GNUGREP_BINARY) -o $(TARGET_DIR)/$(GNUGREP_TARGET_BINARY) -ot \
-	$(GNUGREP_DIR)/$(GNUGREP_BINARY) ]; then \
-	    set -x; \
-	    rm -f $(TARGET_DIR)/bin/grep $(TARGET_DIR)/bin/egrep $(TARGET_DIR)/bin/fgrep; \
-	    cp -a $(GNUGREP_DIR)/src/grep $(GNUGREP_DIR)/src/egrep \
-		$(GNUGREP_DIR)/src/fgrep $(TARGET_DIR)/bin/; fi
+$(TARGET_DIR)/$(GNUGREP_TARGET_BINARY): $(GNUGREP_DIR)/$(GNUGREP_BINARY)
+	for i in egrep fgrep grep; do \
+		$(INSTALL) $(GNUGREP_DIR)/src/$$i $(@D); \
+	done
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
 
-grep: uclibc $(GNUGREP_EXTRA_DEPS) grep-target_binary
+grep: uclibc $(GNUGREP_EXTRA_DEPS) $(TARGET_DIR)/$(GNUGREP_TARGET_BINARY)
 
 grep-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(GNUGREP_DIR) uninstall
+	rm -f $(addprefix $(TARGET_DIR)/bin/,egrep fgrep grep)
 	-$(MAKE) -C $(GNUGREP_DIR) clean
 
 grep-dirclean:
