From: Daniel Mack <daniel@caiaq.de>
Date: Thu,  9 Jul 2009 12:48:49 +0200
Subject: [Buildroot] [PATCH] Add bonnie++-1.03e package
Message-ID: <1247136529-29913-1-git-send-email-daniel@caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Daniel Mack <daniel@caiaq.de>
---
 package/Config.in            |    1 +
 package/bonnie++/Config.in   |   10 +++++++
 package/bonnie++/bonnie++.mk |   57 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 0 deletions(-)
 create mode 100644 package/bonnie++/Config.in
 create mode 100644 package/bonnie++/bonnie++.mk

diff --git a/package/Config.in b/package/Config.in
index cb83563..e77cec9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -228,6 +228,7 @@ endmenu
 
 menu "Hardware handling / blockdevices and filesystem maintenance"
 source "package/acpid/Config.in"
+source "package/bonnie++/Config.in"
 source "package/dbus/Config.in"
 source "package/dbus-glib/Config.in"
 source "package/dbus-python/Config.in"
diff --git a/package/bonnie++/Config.in b/package/bonnie++/Config.in
new file mode 100644
index 0000000..26648dd
--- /dev/null
+++ b/package/bonnie++/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_BONNIE
+	bool "bonnie++"
+	help
+	  Bonnie++ is a benchmark suite that is aimed at performing a number
+	  of simple tests of hard drive and file system performance. Then you
+	  can decide which test is important and decide how to compare
+	  different systems after running it.
+
+	  http://www.coker.com.au/bonnie++/
+
diff --git a/package/bonnie++/bonnie++.mk b/package/bonnie++/bonnie++.mk
new file mode 100644
index 0000000..d44b2e2
--- /dev/null
+++ b/package/bonnie++/bonnie++.mk
@@ -0,0 +1,57 @@
+#############################################################
+#
+# bonnie
+#
+#############################################################
+BONNIE_VERSION:=1.03e
+BONNIE_SOURCE:=bonnie++-$(BONNIE_VERSION).tgz
+BONNIE_SITE:=http://www.coker.com.au/bonnie++/
+BONNIE_DIR:=$(BUILD_DIR)/bonnie++-$(BONNIE_VERSION)
+BONNIE_CAT:=$(ZCAT)
+BONNIE_BINARY:=bonnie++
+BONNIE_TARGET_BINARY:=usr/bin/bonnie++
+BONNIE_AUTORECONF=YES
+
+$(eval $(call AUTOTARGETS,package,bonnie))
+
+$(DL_DIR)/$(BONNIE_SOURCE):
+	$(call DOWNLOAD,$(BONNIE_SITE),$(BONNIE_SOURCE))
+
+bonnie-source: $(DL_DIR)/$(BONNIE_SOURCE)
+
+$(BONNIE_DIR)/.unpacked: $(DL_DIR)/$(BONNIE_SOURCE)
+	$(BONNIE_CAT) $(DL_DIR)/$(BONNIE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(BONNIE_DIR)
+	touch $@
+
+$(BONNIE_DIR)/.configured: $(BONNIE_DIR)/.unpacked
+	(cd $(BONNIE_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--prefix=/ \
+	)
+	touch $@
+
+$(BONNIE_DIR)/$(BONNIE_BINARY): $(BONNIE_DIR)/.configured
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(BONNIE_DIR)
+
+$(TARGET_DIR)/$(BONNIE_TARGET_BINARY): $(BONNIE_DIR)/$(BONNIE_BINARY)
+	install -D $(BONNIE_DIR)/$(BONNIE_BINARY) $(TARGET_DIR)/$(BONNIE_TARGET_BINARY)
+
+bonnie: uclibc $(TARGET_DIR)/$(BONNIE_TARGET_BINARY)
+
+bonnie-clean:
+	rm -f $(TARGET_DIR)/$(BONNIE_TARGET_BINARY)
+	-$(MAKE) -C $(BONNIE_DIR) clean
+
+bonnie-dirclean:
+	rm -rf $(BONNIE_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(BR2_PACKAGE_BONNIE),y)
+TARGETS+=bonnie
+endif
-- 
1.6.3.1
