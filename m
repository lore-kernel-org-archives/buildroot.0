From: wberrier at uclibc.org <wberrier@uclibc.org>
Date: Mon,  6 Oct 2008 13:41:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  logrotate
Message-ID: <20081006204112.DFD173C807@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: wberrier
Date: 2008-10-06 13:41:12 -0700 (Mon, 06 Oct 2008)
New Revision: 23610

Log:
logrotate:
-new package


Added:
   trunk/buildroot/package/logrotate/
   trunk/buildroot/package/logrotate/Config.in
   trunk/buildroot/package/logrotate/logrotate.conf
   trunk/buildroot/package/logrotate/logrotate.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-10-06 20:28:46 UTC (rev 23609)
+++ trunk/buildroot/package/Config.in	2008-10-06 20:41:12 UTC (rev 23610)
@@ -89,6 +89,7 @@
 source "package/liblockfile/Config.in"
 source "package/libsysfs/Config.in"
 source "package/lockfile-progs/Config.in"
+source "package/logrotate/Config.in"
 source "package/lsof/Config.in"
 source "package/ltp-testsuite/Config.in"
 source "package/ltrace/Config.in"

Added: trunk/buildroot/package/logrotate/Config.in
===================================================================
--- trunk/buildroot/package/logrotate/Config.in	                        (rev 0)
+++ trunk/buildroot/package/logrotate/Config.in	2008-10-06 20:41:12 UTC (rev 23610)
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LOGROTATE
+	bool "logrotate"
+	select BR2_PACKAGE_POPT
+	depends on BR2_USE_WCHAR
+	help
+	  A simple program to rotate logs.
+
+	  https://fedorahosted.org/logrotate/
+
+comment "logrotate     - disabled (requires wchar support)"
+	depends on !BR2_USE_WCHAR
+

Added: trunk/buildroot/package/logrotate/logrotate.conf
===================================================================
--- trunk/buildroot/package/logrotate/logrotate.conf	                        (rev 0)
+++ trunk/buildroot/package/logrotate/logrotate.conf	2008-10-06 20:41:12 UTC (rev 23610)
@@ -0,0 +1,14 @@
+compress
+
+include /etc/logrotate.d
+
+/var/log/messages /var/log/auth.log /var/log/user.log {
+	rotate 7
+	daily
+	delaycompress
+	missingok
+	sharedscripts
+	postrotate
+		/usr/bin/killall -HUP syslogd
+	endscript
+}

Added: trunk/buildroot/package/logrotate/logrotate.mk
===================================================================
--- trunk/buildroot/package/logrotate/logrotate.mk	                        (rev 0)
+++ trunk/buildroot/package/logrotate/logrotate.mk	2008-10-06 20:41:12 UTC (rev 23610)
@@ -0,0 +1,38 @@
+LOGROTATE_VERSION:=3.7.7
+LOGROTATE_SOURCE:=logrotate-$(LOGROTATE_VERSION).tar.gz
+LOGROTATE_SITE:=https://fedorahosted.org/releases/l/o/logrotate/
+LOGROTATE_DIR:=$(BUILD_DIR)/logrotate-$(LOGROTATE_VERSION)
+LOGROTATE_BINARY:=logrotate
+LOGROTATE_TARGET_BINARY:=usr/sbin/$(LOGROTATE_BINARY)
+
+$(DL_DIR)/$(LOGROTATE_SOURCE):
+	$(WGET) -P $(DL_DIR) $(LOGROTATE_SITE)/$(LOGROTATE_SOURCE)
+
+$(LOGROTATE_DIR)/.source: $(DL_DIR)/$(LOGROTATE_SOURCE)
+	$(ZCAT) $(DL_DIR)/$(LOGROTATE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(LOGROTATE_DIR) package/logrotate/ *.patch	
+	touch $@
+
+$(LOGROTATE_DIR)/$(LOGROTATE_BINARY): $(LOGROTATE_DIR)/.source
+	$(MAKE) CC=$(TARGET_CC) -C $(LOGROTATE_DIR)
+
+$(TARGET_DIR)/$(LOGROTATE_TARGET_BINARY): $(LOGROTATE_DIR)/$(LOGROTATE_BINARY)
+	$(MAKE) PREFIX=$(TARGET_DIR) -C $(LOGROTATE_DIR) install
+	$(INSTALL) -m 0644 package/logrotate/logrotate.conf $(TARGET_DIR)/etc/logrotate.conf
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/logrotate.d
+
+logrotate: uclibc busybox popt $(TARGET_DIR)/$(LOGROTATE_TARGET_BINARY)
+
+logrotate-source: $(DL_DIR)/$(LOGROTATE_SOURCE)
+
+logrotate-clean:
+	rm -f $(TARGET_DIR)/$(LOGROTATE_TARGET_BINARY)
+	-$(MAKE) -C $(LOGROTATE_DIR) clean
+
+logrotate-dirclean:
+	rm -Rf $(LOGROTATE_DIR)
+
+ifeq ($(strip $(BR2_PACKAGE_LOGROTATE)),y)
+TARGETS+=logrotate
+endif
+
