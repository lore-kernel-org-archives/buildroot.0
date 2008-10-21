From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 21 Oct 2008 05:38:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  memstat
Message-ID: <20081021123831.C985A3C731@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-21 05:38:31 -0700 (Tue, 21 Oct 2008)
New Revision: 23753

Log:
package/memstat: add memstat package

Memstat lists all the processes, executables, and shared
libraries that are using up virtual memory. It's helpful to
see how the shared memory is used and which 'old' libs are
loaded.

Added:
   trunk/buildroot/package/memstat/
   trunk/buildroot/package/memstat/Config.in
   trunk/buildroot/package/memstat/memstat.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-10-21 12:36:43 UTC (rev 23752)
+++ trunk/buildroot/package/Config.in	2008-10-21 12:38:31 UTC (rev 23753)
@@ -94,6 +94,7 @@
 source "package/ltp-testsuite/Config.in"
 source "package/ltrace/Config.in"
 source "package/ltt/Config.in"
+source "package/memstat/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/module-init-tools/Config.in"
 source "package/modutils/Config.in"

Added: trunk/buildroot/package/memstat/Config.in
===================================================================
--- trunk/buildroot/package/memstat/Config.in	                        (rev 0)
+++ trunk/buildroot/package/memstat/Config.in	2008-10-21 12:38:31 UTC (rev 23753)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MEMSTAT
+	bool "memstat"
+	help
+	  Memstat lists all the processes, executables, and shared
+	  libraries that are using up virtual memory. It's helpful to
+	  see how the shared memory is used and which 'old' libs are
+	  loaded.

Added: trunk/buildroot/package/memstat/memstat.mk
===================================================================
--- trunk/buildroot/package/memstat/memstat.mk	                        (rev 0)
+++ trunk/buildroot/package/memstat/memstat.mk	2008-10-21 12:38:31 UTC (rev 23753)
@@ -0,0 +1,49 @@
+#############################################################
+#
+# memstat
+#
+#############################################################
+
+MEMSTAT_VERSION:=0.5
+MEMSTAT_SOURCE:=memstat_$(MEMSTAT_VERSION).tar.gz
+MEMSTAT_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/m/memstat
+MEMSTAT_DIR:=$(BUILD_DIR)/memstat-$(MEMSTAT_VERSION)
+
+$(DL_DIR)/$(MEMSTAT_SOURCE):
+	$(WGET) -P $(DL_DIR) $(MEMSTAT_SITE)/$(MEMSTAT_SOURCE)
+
+$(MEMSTAT_DIR)/.unpacked: $(DL_DIR)/$(MEMSTAT_SOURCE)
+	$(ZCAT) $(DL_DIR)/$(MEMSTAT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(MEMSTAT_DIR) package/memstat/ memstat-$(MEMSTAT_VERSION)\*.patch
+	touch $@
+
+$(MEMSTAT_DIR)/.configured: $(MEMSTAT_DIR)/.unpacked
+	touch $@
+
+$(MEMSTAT_DIR)/memstat: $(MEMSTAT_DIR)/.configured
+	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) $(@D)/memstat.c -o $@
+
+$(TARGET_DIR)/usr/bin/memstat: $(MEMSTAT_DIR)/memstat
+	[ -e $(TARGET_DIR)/etc/memstat.conf ] || \
+		$(INSTALL) -m 0644 -D $(^D)/memstat.conf $(TARGET_DIR)/etc
+	$(INSTALL) -m 0755 -D $^ $@
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
+
+memstat: uclibc $(TARGET_DIR)/usr/bin/memstat
+
+memstat-source: $(DL_DIR)/$(MEMSTAT_SOURCE)
+
+memstat-clean:
+	rm -f $(MEMSTAT_DIR)/memstat \
+		$(TARGET_DIR)/etc/memstat.conf $(TARGET_DIR)/usr/bin/memstat
+
+memstat-dirclean:
+	rm -rf $(MEMSTAT_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_MEMSTAT)),y)
+TARGETS+=memstat
+endif
