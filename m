From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 21 Mar 2007 01:04:20 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/readline
Message-ID: <20070321080420.43B5B48073@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-21 01:04:19 -0700 (Wed, 21 Mar 2007)
New Revision: 18190

Log:
- install target headers into the correct dir
- make sure not to create libwhatever...old cruft


Modified:
   trunk/buildroot/package/readline/readline.mk


Changeset:
Modified: trunk/buildroot/package/readline/readline.mk
===================================================================
--- trunk/buildroot/package/readline/readline.mk	2007-03-21 04:13:14 UTC (rev 18189)
+++ trunk/buildroot/package/readline/readline.mk	2007-03-21 08:04:19 UTC (rev 18190)
@@ -20,7 +20,7 @@
 	mkdir -p $(READLINE_DIR)
 	tar -C $(BUILD_DIR) -zxf $(DL_DIR)/$(READLINE_SOURCE)
 	$(CONFIG_UPDATE) $(READLINE_DIR)
-	touch $(READLINE_DIR)/.unpacked
+	touch $@
 
 $(READLINE_DIR)/.configured: $(READLINE_DIR)/.unpacked
 	(cd $(READLINE_DIR); rm -rf config.cache; \
@@ -45,29 +45,30 @@
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 	);
-	touch $(READLINE_DIR)/.configured
+	touch $@
 
 $(READLINE_DIR)/$(READLINE_BINARY): $(READLINE_DIR)/.configured
 	$(MAKE)  -C $(READLINE_DIR)
-	touch -c $(READLINE_DIR)/$(READLINE_BINARY)
+	touch -c $@
 
 $(STAGING_DIR)/$(READLINE_TARGET_BINARY): $(READLINE_DIR)/.configured
 	$(MAKE) -C $(READLINE_DIR)  install
-	touch -c $(STAGING_DIR)/$(READLINE_TARGET_BINARY)
+	touch -c $@
 
 # Install to Staging area
 $(STAGING_DIR)/include/readline/readline.h: $(READLINE_DIR)/$(READLINE_BINARY)
 	BUILD_CC=$(TARGET_CC) HOSTCC="$(HOSTCC)" CC=$(TARGET_CC) \
-	$(MAKE1) DESTDIR=$(STAGING_DIR) -C $(READLINE_DIR) install;
-	touch -c $(STAGING_DIR)/include/readline/readline.h
+	$(MAKE1) DESTDIR=$(STAGING_DIR) -C $(READLINE_DIR) install
+	touch -c $@
 
-
 # Install to Target directory
-$(TARGET_DIR)/include/readline/readline.h: $(READLINE_DIR)/$(READLINE_BINARY)
+$(TARGET_DIR)/$(READLINE_TARGET_BINARY): $(READLINE_DIR)/$(READLINE_BINARY)
+	# make sure we don't end up with lib{readline,hostory}...old
+	$(MAKE1) DESTDIR=$(TARGET_DIR) includedir=/usr/include \
+		-C $(READLINE_DIR) uninstall
 	BUILD_CC=$(TARGET_CC) HOSTCC="$(HOSTCC)" CC=$(TARGET_CC) \
-	$(MAKE1) DESTDIR=$(TARGET_DIR) -C $(READLINE_DIR) install-shared \
-		uninstall-doc
-	touch -c $(TARGET_DIR)/include/readline/readline.h
+	$(MAKE1) DESTDIR=$(TARGET_DIR) includedir=/usr/include \
+		-C $(READLINE_DIR) install-shared uninstall-doc
 
 readline: $(STAGING_DIR)/include/readline/readline.h
 
@@ -78,10 +79,11 @@
 readline-dirclean:
 	rm -rf $(READLINE_DIR)
 
-readline-target: $(TARGET_DIR)/include/readline/readline.h
+readline-target: $(TARGET_DIR)/$(READLINE_TARGET_BINARY)
 
 readline-target-clean:
-	$(MAKE1) DESTDIR=$(TARGET_DIR) -C $(READLINE_DIR) uninstall
+	$(MAKE1) DESTDIR=$(TARGET_DIR) includedir=/usr/include \
+		-C $(READLINE_DIR) uninstall
 
 ifeq ($(strip $(BR2_READLINE)),y)
 TARGETS+=readline
