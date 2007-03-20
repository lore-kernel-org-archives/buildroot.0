From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 20 Mar 2007 10:50:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/readline
Message-ID: <20070320175023.093F74809B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-20 10:50:23 -0700 (Tue, 20 Mar 2007)
New Revision: 18183

Log:
- provide means to install readline into the target. Closes #968


Modified:
   trunk/buildroot/package/readline/Config.in
   trunk/buildroot/package/readline/readline.mk


Changeset:
Modified: trunk/buildroot/package/readline/Config.in
===================================================================
--- trunk/buildroot/package/readline/Config.in	2007-03-20 17:21:35 UTC (rev 18182)
+++ trunk/buildroot/package/readline/Config.in	2007-03-20 17:50:23 UTC (rev 18183)
@@ -5,3 +5,9 @@
 	help
 	    Enable GNU readline support?
 
+config BR2_PACKAGE_READLINE_TARGET
+	bool "readline for the target"
+	depends on BR2_READLINE
+	help
+	  Say yes here to install the readline libraries and headers
+	  on the target.

Modified: trunk/buildroot/package/readline/readline.mk
===================================================================
--- trunk/buildroot/package/readline/readline.mk	2007-03-20 17:21:35 UTC (rev 18182)
+++ trunk/buildroot/package/readline/readline.mk	2007-03-20 17:50:23 UTC (rev 18183)
@@ -14,6 +14,8 @@
 $(DL_DIR)/$(READLINE_SOURCE):
 	$(WGET) -P $(DL_DIR) $(READLINE_SITE)/$(READLINE_SOURCE)
 
+readline-source:  $(DL_DIR)/$(READLINE_SOURCE)
+
 $(READLINE_DIR)/.unpacked: $(DL_DIR)/$(READLINE_SOURCE)
 	mkdir -p $(READLINE_DIR)
 	tar -C $(BUILD_DIR) -zxf $(DL_DIR)/$(READLINE_SOURCE)
@@ -22,6 +24,7 @@
 
 $(READLINE_DIR)/.configured: $(READLINE_DIR)/.unpacked
 	(cd $(READLINE_DIR); rm -rf config.cache; \
+		bash_cv_func_sigsetjmp=yes \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
@@ -59,16 +62,15 @@
 	touch -c $(STAGING_DIR)/include/readline/readline.h
 
 
-# Install only run-time to Target directory
+# Install to Target directory
 $(TARGET_DIR)/include/readline/readline.h: $(READLINE_DIR)/$(READLINE_BINARY)
 	BUILD_CC=$(TARGET_CC) HOSTCC="$(HOSTCC)" CC=$(TARGET_CC) \
-	$(MAKE1) DESTDIR=$(TARGET_DIR) -C $(READLINE_DIR) install-shared
+	$(MAKE1) DESTDIR=$(TARGET_DIR) -C $(READLINE_DIR) install-shared \
+		uninstall-doc
 	touch -c $(TARGET_DIR)/include/readline/readline.h
 
 readline: $(STAGING_DIR)/include/readline/readline.h
 
-readline-target: $(TARGET_DIR)/include/readline/readline.h
-
 readline-clean:
 	$(MAKE) -C $(READLINE_DIR) uninstall
 	-$(MAKE) -C $(READLINE_DIR) clean
@@ -76,8 +78,11 @@
 readline-dirclean:
 	rm -rf $(READLINE_DIR)
 
-readline-source:  $(DL_DIR)/$(READLINE_SOURCE)
+readline-target: $(TARGET_DIR)/include/readline/readline.h
 
+readline-target-clean:
+	$(MAKE1) DESTDIR=$(TARGET_DIR) -C $(READLINE_DIR) uninstall
+
 ifeq ($(strip $(BR2_READLINE)),y)
 TARGETS+=readline
 endif
