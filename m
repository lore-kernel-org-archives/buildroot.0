From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 16 Jul 2007 04:14:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/readline
Message-ID: <20070716111445.8F032A6ABC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-16 04:14:44 -0700 (Mon, 16 Jul 2007)
New Revision: 19111

Log:
Avoid rebuilding 'readline-5.1'

Modified:
   trunk/buildroot/package/readline/readline.mk


Changeset:
Modified: trunk/buildroot/package/readline/readline.mk
===================================================================
--- trunk/buildroot/package/readline/readline.mk	2007-07-16 10:58:58 UTC (rev 19110)
+++ trunk/buildroot/package/readline/readline.mk	2007-07-16 11:14:44 UTC (rev 19111)
@@ -9,7 +9,9 @@
 READLINE_DIR:=$(BUILD_DIR)/readline-$(READLINE_VERSION)
 READLINE_CAT:=$(ZCAT)
 READLINE_BINARY:=libhistory.a
+READLINE_SHARED_BINARY:=libhistory.so
 READLINE_TARGET_BINARY:=lib/$(READLINE_BINARY)
+READLINE_TARGET_SHARED_BINARY:=lib/$(READLINE_SHARED_BINARY)
 
 $(DL_DIR)/$(READLINE_SOURCE):
 	$(WGET) -P $(DL_DIR) $(READLINE_SITE)/$(READLINE_SOURCE)
@@ -48,6 +50,7 @@
 
 $(READLINE_DIR)/$(READLINE_BINARY): $(READLINE_DIR)/.configured
 	$(MAKE) -C $(READLINE_DIR)
+	ls $(READLINE_DIR)/$(READLINE_BINARY)
 	touch -c $@
 
 $(STAGING_DIR)/$(READLINE_TARGET_BINARY): $(READLINE_DIR)/.configured
@@ -61,7 +64,7 @@
 	touch -c $@
 
 # Install to Target directory
-$(TARGET_DIR)/$(READLINE_TARGET_BINARY): $(READLINE_DIR)/$(READLINE_BINARY)
+$(TARGET_DIR)/$(READLINE_TARGET_SHARED_BINARY): $(READLINE_DIR)/$(READLINE_BINARY)
 	# make sure we don't end up with lib{readline,history}...old
 	$(MAKE1) DESTDIR=$(TARGET_DIR) -C $(READLINE_DIR) uninstall
 	BUILD_CC=$(TARGET_CC) HOSTCC="$(HOSTCC)" CC=$(TARGET_CC) \
@@ -77,7 +80,7 @@
 readline-dirclean:
 	rm -rf $(READLINE_DIR)
 
-readline-target: $(TARGET_DIR)/$(READLINE_TARGET_BINARY)
+readline-target: $(TARGET_DIR)/$(READLINE_TARGET_SHARED_BINARY)
 
 readline-target-clean:
 	$(MAKE1) DESTDIR=$(TARGET_DIR) -C $(READLINE_DIR) uninstall
