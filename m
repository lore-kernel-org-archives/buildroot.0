From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 24 Sep 2007 00:34:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ltrace
Message-ID: <20070924073450.5314A30046@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-24 00:34:48 -0700 (Mon, 24 Sep 2007)
New Revision: 19984

Log:
- bump version; some cleanups while at it


Modified:
   trunk/buildroot/package/ltrace/ltrace.mk


Changeset:
Modified: trunk/buildroot/package/ltrace/ltrace.mk
===================================================================
--- trunk/buildroot/package/ltrace/ltrace.mk	2007-09-24 07:34:02 UTC (rev 19983)
+++ trunk/buildroot/package/ltrace/ltrace.mk	2007-09-24 07:34:48 UTC (rev 19984)
@@ -3,9 +3,9 @@
 # ltrace
 #
 #############################################################
-LTRACE_VERSION=0.4
+LTRACE_VERSION=0.5
 LTRACE_SOURCE=ltrace_$(LTRACE_VERSION).orig.tar.gz
-#LTRACE_PATCH=ltrace_$(LTRACE_VERSION)-1.diff.gz
+LTRACE_PATCH=ltrace_$(LTRACE_VERSION)-3.diff.gz
 LTRACE_SITE=http://ftp.debian.org/debian/pool/main/l/ltrace
 LTRACE_DIR=$(BUILD_DIR)/ltrace-$(LTRACE_VERSION)
 LTRACE_BINARY=ltrace
@@ -20,18 +20,18 @@
 	$(WGET) -P $(DL_DIR) $(LTRACE_SITE)/$(LTRACE_SOURCE)
 
 ifneq ($(LTRACE_PATCH),)
-LTRACE_SOURCE2:=$(DL_DIR)/$(LTRACE_PATCH)
-$(LTRACE_SOURCE2):
+LTRACE_PATCH_FILE:=$(DL_DIR)/$(LTRACE_PATCH)
+$(LTRACE_PATCH_FILE):
 	$(WGET) -P $(DL_DIR) $(LTRACE_SITE)/$(LTRACE_PATCH)
 
 else
-LTRACE_SOURCE2:=
+LTRACE_PATCH_FILE:=
 endif
 
-$(LTRACE_DIR)/.patched: $(DL_DIR)/$(LTRACE_SOURCE) $(LTRACE_SOURCE2)
+$(LTRACE_DIR)/.patched: $(DL_DIR)/$(LTRACE_SOURCE) $(LTRACE_PATCH_FILE)
 	$(ZCAT) $(DL_DIR)/$(LTRACE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(LTRACE_PATCH),)
-	$(ZCAT) $(LTRACE_SOURCE2) | patch -p1 -d $(LTRACE_DIR)
+	$(ZCAT) $(LTRACE_PATCH_FILE) | patch -p1 -d $(LTRACE_DIR)
 endif
 	toolchain/patch-kernel.sh $(LTRACE_DIR) package/ltrace ltrace\*.patch
 	$(CONFIG_UPDATE) $(@D)
@@ -57,17 +57,22 @@
 		-C $(LTRACE_DIR)
 
 $(TARGET_DIR)/$(LTRACE_TARGET_BINARY): $(LTRACE_DIR)/$(LTRACE_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) ARCH=$(LTRACE_ARCH) \
-		-C $(LTRACE_DIR) install
-	rm -Rf $(TARGET_DIR)/usr/man
+	#$(MAKE) DESTDIR=$(TARGET_DIR) ARCH=$(LTRACE_ARCH)  -C $(LTRACE_DIR) install
+	$(INSTALL) -D $(LTRACE_DIR)/$(LTRACE_BINARY) $@
+ifeq ($(BR2_HAVE_MANPAGES),y)
+	$(INSTALL) -D $(LTRACE_DIR)/ltrace.1 \
+		$(TARGET_DIR)/usr/share/man/man1/ltrace.1
+endif
+	$(STRIP) $(STRIP_STRIP_ALL) $@
 
 ltrace: uclibc libelf $(TARGET_DIR)/$(LTRACE_TARGET_BINARY)
 
-ltrace-source: $(DL_DIR)/$(LTRACE_SOURCE) $(LTRACE_SOURCE2)
+ltrace-source: $(DL_DIR)/$(LTRACE_SOURCE) $(LTRACE_PATCH_FILE)
 
 ltrace-clean:
-	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(LTRACE_DIR) uninstall
 	-$(MAKE) -C $(LTRACE_DIR) clean
+	rm -f $(LTRACE_DIR)/$(LTRACE_BINARY) \
+		$(TARGET_DIR)/usr/share/man/man1/ltrace.1*
 
 ltrace-dirclean:
 	rm -rf $(LTRACE_DIR)
