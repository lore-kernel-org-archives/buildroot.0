From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 24 Aug 2007 01:11:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pptp-linux
Message-ID: <20070824081118.BB926A4965@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-24 01:11:17 -0700 (Fri, 24 Aug 2007)
New Revision: 19672

Log:
- add pptp client


Added:
   trunk/buildroot/package/pptp-linux/pptp-linux-1.7.0-001-susv3-legacy.patch

Modified:
   trunk/buildroot/package/pptp-linux/pptp-linux.mk


Changeset:
Added: trunk/buildroot/package/pptp-linux/pptp-linux-1.7.0-001-susv3-legacy.patch
===================================================================
--- trunk/buildroot/package/pptp-linux/pptp-linux-1.7.0-001-susv3-legacy.patch	                        (rev 0)
+++ trunk/buildroot/package/pptp-linux/pptp-linux-1.7.0-001-susv3-legacy.patch	2007-08-24 08:11:17 UTC (rev 19672)
@@ -0,0 +1,24 @@
+diff -rdup pptp-linux-1.7.0/pptp_callmgr.c pptp-linux-1.7.0.orig/pptp_callmgr.c
+--- pptp-linux-1.7.0/pptp_callmgr.c	2005-07-28 03:15:11.000000000 +0200
++++ pptp-linux-1.7.0.orig/pptp_callmgr.c	2007-08-24 09:20:39.000000000 +0200
+@@ -314,7 +314,7 @@ int open_inetsock(struct in_addr inetadd
+         return s;
+     }
+     if (localbind.s_addr != INADDR_NONE) {
+-        bzero(&src, sizeof(src));
++        memset(&src, 0, sizeof(src));
+         src.sin_family = AF_INET;
+         src.sin_addr   = localbind;
+         if (bind(s, (struct sockaddr *) &src, sizeof(src)) != 0) {
+diff -rdup pptp-linux-1.7.0/pptp_gre.c pptp-linux-1.7.0.orig/pptp_gre.c
+--- pptp-linux-1.7.0/pptp_gre.c	2005-07-28 03:15:11.000000000 +0200
++++ pptp-linux-1.7.0.orig/pptp_gre.c	2007-08-24 09:20:56.000000000 +0200
+@@ -81,7 +81,7 @@ int pptp_gre_bind(struct in_addr inetadd
+     int s = socket(AF_INET, SOCK_RAW, PPTP_PROTO);
+     if (s < 0) { warn("socket: %s", strerror(errno)); return -1; }
+     if (localbind.s_addr != INADDR_NONE) {
+-        bzero(&loc_addr, sizeof(loc_addr));
++        memset(&loc_addr, 0, sizeof(loc_addr));
+         loc_addr.sin_family = AF_INET;
+         loc_addr.sin_addr   = localbind;
+         if (bind(s, (struct sockaddr *) &loc_addr, sizeof(loc_addr)) != 0) {

Modified: trunk/buildroot/package/pptp-linux/pptp-linux.mk
===================================================================
--- trunk/buildroot/package/pptp-linux/pptp-linux.mk	2007-08-24 05:36:46 UTC (rev 19671)
+++ trunk/buildroot/package/pptp-linux/pptp-linux.mk	2007-08-24 08:11:17 UTC (rev 19672)
@@ -1,13 +1,78 @@
-################################################################################
+#############################################################
 #
-# a PPTP client
+# pptp-linux
 #
-################################################################################
+#############################################################
+PPTP_LINUX_VERSION:=1.7.0
+PPTP_LINUX_SOURCE:=pptp-linux_$(PPTP_LINUX_VERSION).orig.tar.gz
+#PPTP_LINUX_PATCH:=pptp-linux_$(PPTP_LINUX_VERSION)-2.diff.gz
+PPTP_LINUX_SITE:=ftp://ftp.debian.org/debian/pool/main/a/pptp-linux
+PPTP_LINUX_DIR:=$(BUILD_DIR)/pptp-linux-$(PPTP_LINUX_VERSION).orig
+PPTP_LINUX_CAT:=$(ZCAT)
+PPTP_LINUX_BINARY:=pptp
+PPTP_LINUX_TARGET_BINARY:=usr/sbin/pptp
 
-PPTP_LINUX_VERSION=1.7.0
-PPTP_LINUX_SOURCE=pptp-linux_$(PPTP_LINUX_VERSION).orig.tar.gz
-PPTP_LINUX_PATCH=pptp-linux_$(PPTP_LINUX_VERSION)-2.diff.gz
-PPTP_LINUX_SITE=http://ftp.debian.org/debian/pool/main/p/pptp-linux
-PPTP_LINUX_SKIP_CONFIGURE=true
+$(DL_DIR)/$(PPTP_LINUX_SOURCE):
+	$(WGET) -P $(DL_DIR) $(PPTP_LINUX_SITE)/$(PPTP_LINUX_SOURCE)
 
-$(eval $(call AUTOTARGETS,pptp-linux))
+ifneq ($(PPTP_LINUX_PATCH),)
+PPTP_LINUX_PATCH_FILE:=$(DL_DIR)/$(PPTP_LINUX_PATCH)
+$(PPTP_LINUX_PATCH_FILE):
+	$(WGET) -P $(DL_DIR) $(PPTP_LINUX_SITE)/$(PPTP_LINUX_PATCH)
+endif
+
+$(PPTP_LINUX_DIR)/.unpacked: $(DL_DIR)/$(PPTP_LINUX_SOURCE) $(PPTP_LINUX_PATCH_FILE)
+	$(PPTP_LINUX_CAT) $(DL_DIR)/$(PPTP_LINUX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+ifneq ($(PPTP_LINUX_PATCH),)
+	(cd $(PPTP_LINUX_DIR) && $(PPTP_LINUX_CAT) $(DL_DIR)/$(PPTP_LINUX_PATCH) | patch -p1)
+	if [ -d $(PPTP_LINUX_DIR)/debian/patches ]; then \
+		toolchain/patch-kernel.sh $(PPTP_LINUX_DIR) $(PPTP_LINUX_DIR)/debian/patches \*.patch; \
+	fi
+endif
+	toolchain/patch-kernel.sh $(PPTP_LINUX_DIR) package/pptp-linux/ pptp-linux\*.patch
+	touch $@
+
+$(PPTP_LINUX_DIR)/.configured: $(PPTP_LINUX_DIR)/.unpacked
+	(cd $(PPTP_LINUX_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		$(DISABLE_LARGEFILE) \
+	)
+	touch $@
+
+$(PPTP_LINUX_DIR)/$(PPTP_LINUX_BINARY): $(PPTP_LINUX_DIR)/.unpacked
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) OPTIMIZE="$(TARGET_CFLAGS)" \
+		-C $(PPTP_LINUX_DIR)
+
+$(TARGET_DIR)/$(PPTP_LINUX_TARGET_BINARY): $(PPTP_LINUX_DIR)/$(PPTP_LINUX_BINARY)
+	cp -dpf $(PPTP_LINUX_DIR)/$(PPTP_LINUX_BINARY) $@
+ifeq ($(BR2_HAVE_MANPAGES),y)
+	mkdir -p $(TARGET_DIR)/usr/share/man/man8
+	$(INSTALL) -m 644 $(PPTP_LINUX_DIR)/pptp.8 $(TARGET_DIR)/usr/share/man/man8/pptp.8
+endif
+	$(STRIP) $(STRIP_STRIP_ALL) $@
+
+pptp-linux: uclibc $(TARGET_DIR)/$(PPTP_LINUX_TARGET_BINARY)
+
+pptp-linux-source: $(DL_DIR)/$(PPTP_LINUX_SOURCE) $(PPTP_LINUX_PATCH_FILE)
+
+pptp-linux-clean:
+	-$(MAKE) -C $(PPTP_LINUX_DIR) distclean
+	rm -f $(TARGET_DIR)/$(PPTP_LINUX_TARGET_BINARY) \
+		$(TARGET_DIR)/usr/share/man/man8/pptp.8*
+
+pptp-linux-dirclean:
+	rm -rf $(PPTP_LINUX_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_PPTP_LINUX)),y)
+TARGETS+=pptp-linux
+endif
