From: Philippe Ney <philippe.ney@pardes.ws>
Date: Wed, 22 Nov 2006 19:56:46 +0100
Subject: [Buildroot] patch: target/cpio
In-Reply-To: <20061121095514.GK3065@priv.blacknet.de>
References: <20061120154423.GG3065@priv.blacknet.de>
	<20061120180143.456f1bd0.philippe.ney@pardes.ws>
	<20061121095514.GK3065@priv.blacknet.de>
Message-ID: <20061122195646.9173ef42.philippe.ney@pardes.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Shure, please provide a patch.

Et voil?.

Philippe


diff -Naur a/package/Config.in b/package/Config.in
--- a/package/Config.in	2006-11-22 08:55:57.000000000 +0100
+++ b/package/Config.in	2006-11-22 19:50:43.000000000 +0100
@@ -34,6 +34,7 @@
 source "package/bison/Config.in"
 source "package/boa/Config.in"
 source "package/bridge/Config.in"
+source "package/cpio/Config.in"
 source "package/customize/Config.in"
 source "package/dhcp/Config.in"
 source "package/dialog/Config.in"
diff -Naur a/package/cpio/Config.in b/package/cpio/Config.in
--- a/package/cpio/Config.in	1970-01-01 01:00:00.000000000 +0100
+++ b/package/cpio/Config.in	2006-11-22 19:49:40.000000000 +0100
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CPIO
+	bool "cpio"
+	default n
+	help
+	  Archiver that handles various types of cpio and tar archives
+	  (Busybox cpio doesn't support archive generation)
+
+	  http://www.gnu.org/software/cpio/
diff -Naur a/package/cpio/cpio.mk b/package/cpio/cpio.mk
--- a/package/cpio/cpio.mk	1970-01-01 01:00:00.000000000 +0100
+++ b/package/cpio/cpio.mk	2006-11-22 19:49:40.000000000 +0100
@@ -0,0 +1,101 @@
+#############################################################
+#
+# cpio
+#
+#############################################################
+
+CPIO_VER:=2.6
+CPIO_SOURCE:=cpio-$(CPIO_VER).tar.gz
+CPIO_SITE:=ftp://ftp.gnu.org/pub/gnu/cpio
+CPIO_DIR1:=$(TOOL_BUILD_DIR)/cpio-$(CPIO_VER)
+CPIO_DIR2:=$(BUILD_DIR)/cpio-$(CPIO_VER)
+CPIO_CAT:=zcat
+CPIO_BINARY:=src/cpio
+CPIO_TARGET_BINARY:=usr/bin/cpio
+
+CPIO:=$(STAGING_DIR)/$(CPIO_TARGET_BINARY)
+
+#------------------------------------------------------------
+$(DL_DIR)/$(CPIO_SOURCE):
+	$(WGET) -P $(DL_DIR) $(CPIO_SITE)/$(CPIO_SOURCE)
+
+#############################################################
+#
+# Build cpio for use on the host system
+#
+#############################################################
+$(CPIO_DIR1)/.unpacked: $(DL_DIR)/$(CPIO_SOURCE)
+	$(CPIO_CAT) $(DL_DIR)/$(CPIO_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(CPIO_DIR1)/.unpacked
+
+$(CPIO_DIR1)/.configured: $(CPIO_DIR1)/.unpacked
+	(cd $(CPIO_DIR1); rm -rf config.cache; \
+		CPPFLAGS=-DHAVE_LSTAT=1 \
+		./configure \
+		--prefix=$(STAGING_DIR)/usr \
+		--exec-prefix=$(STAGING_DIR)/usr \
+	);
+	touch  $(CPIO_DIR1)/.configured
+
+$(CPIO_DIR1)/$(CPIO_BINARY): $(CPIO_DIR1)/.configured
+	$(MAKE) -C $(CPIO_DIR1)
+
+$(STAGING_DIR)/$(CPIO_TARGET_BINARY): $(CPIO_DIR1)/$(CPIO_BINARY)
+	$(MAKE) -C $(CPIO_DIR1) install
+
+cpio-host: $(STAGING_DIR)/$(CPIO_TARGET_BINARY)
+
+cpio-host-clean:
+	$(MAKE) -C $(CPIO_DIR1) clean
+
+cpio-host-dirclean:
+	rm -rf $(CPIO_DIR1)
+
+#############################################################
+#
+# Build cpio for use on the target system
+#
+#############################################################
+$(CPIO_DIR2)/.unpacked: $(DL_DIR)/$(CPIO_SOURCE)
+	$(CPIO_CAT) $(DL_DIR)/$(CPIO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(CPIO_DIR2)/.unpacked
+
+$(CPIO_DIR2)/.configured: $(CPIO_DIR2)/.unpacked
+	(cd $(CPIO_DIR2); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) CC_FOR_BUILD=$(HOSTCC) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		CPPFLAGS=-DHAVE_LSTAT=1 \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--disable-rpath \
+		$(DISABLE_NLS) \
+		$(DISABLE_LARGEFILE) \
+	);
+	touch $(CPIO_DIR2)/.configured
+
+$(CPIO_DIR2)/$(CPIO_BINARY): $(CPIO_DIR2)/.configured
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(CPIO_DIR2)
+
+$(TARGET_DIR)/$(CPIO_TARGET_BINARY): $(CPIO_DIR2)/$(CPIO_BINARY)
+	install -D $(CPIO_DIR2)/$(CPIO_BINARY) $(TARGET_DIR)/$(CPIO_TARGET_BINARY)
+
+cpio: uclibc $(TARGET_DIR)/$(CPIO_TARGET_BINARY)
+
+cpio-clean:
+	rm -f $(TARGET_DIR)/$(CPIO_TARGET_BINARY)
+	-$(MAKE) -C $(CPIO_DIR2) clean
+
+cpio-dirclean:
+	rm -rf $(CPIO_DIR2)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_CPIO)),y)
+TARGETS+=cpio
+endif
