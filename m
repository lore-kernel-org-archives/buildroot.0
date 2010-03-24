From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Wed, 24 Mar 2010 09:00:57 +0100
Subject: [Buildroot] [git commit master] Add lmbench
Message-ID: <20100324082325.A6C21776F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0e9aad6c717505bdb3dd9f87ac93acff9c3111b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #661

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    3 +-
 package/Config.in          |    1 +
 package/lmbench/Config.in  |    7 ++++++
 package/lmbench/lmbench.mk |   47 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 57 insertions(+), 1 deletions(-)
 create mode 100644 package/lmbench/Config.in
 create mode 100644 package/lmbench/lmbench.mk

diff --git a/CHANGES b/CHANGES
index 79bd7f6..7cf730d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,7 +5,7 @@
 
 	X.org updated to 7.5.
 
-	New packages: librsync
+	New packages: librsync, lmbench
 
 	Updated/fixed packages: busybox, dosfstools, e2fsprogs,
 	freetype, iperf, libglib2, libpng, mdadm, memstat, mtd-utils,
@@ -13,6 +13,7 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#661: lmbench: new package
 	#800: [PATCH] iperf update to 2.0.4
 	#805: [PATCH] mdadm - version update
 	#1111: Bump wget to 1.12 and migrate to Makefile.autotools.in
diff --git a/package/Config.in b/package/Config.in
index 9f56c60..8504f23 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -86,6 +86,7 @@ source "package/libsysfs/Config.in"
 source "package/lockfile-progs/Config.in"
 source "package/logrotate/Config.in"
 source "package/lsof/Config.in"
+source "package/lmbench/Config.in"
 source "package/ltp-testsuite/Config.in"
 source "package/ltrace/Config.in"
 source "package/memstat/Config.in"
diff --git a/package/lmbench/Config.in b/package/lmbench/Config.in
new file mode 100644
index 0000000..704b3ff
--- /dev/null
+++ b/package/lmbench/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LMBENCH
+	bool "lmbench"
+	help
+	  LMbench is a suite of simple, portable,
+	  ANSI/C microbenchmarks for UNIX/POSIX.
+
+	  http://sourceforge.net/projects/lmbench/
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
new file mode 100644
index 0000000..7083527
--- /dev/null
+++ b/package/lmbench/lmbench.mk
@@ -0,0 +1,47 @@
+#############################################################
+#
+# lmbench
+#
+#############################################################
+LMBENCH_VERSION:=3.0-a9
+LMBENCH_SOURCE:=lmbench-$(LMBENCH_VERSION).tgz
+LMBENCH_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/lmbench/development/lmbench-3.0-a9/
+LMBENCH_CAT:=$(ZCAT)
+LMBENCH_DIR:=$(BUILD_DIR)/lmbench-$(LMBENCH_VERSION)
+LMBENCH_BIN:=lmbench
+LMBENCH_TARGET_BIN:=usr/bin/$(LMBENCH_BIN)
+
+$(DL_DIR)/$(LMBENCH_SOURCE):
+	$(call DOWNLOAD,$(LMBENCH_SITE),$(LMBENCH_SOURCE))
+
+$(LMBENCH_DIR)/.unpacked: $(DL_DIR)/$(LMBENCH_SOURCE)
+	$(LMBENCH_CAT) $(DL_DIR)/$(LMBENCH_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(LMBENCH_DIR) package/lmbench lmbench-$(LMBENCH_VERSION)\*.patch
+	$(CONFIG_UPDATE) $(LMBENCH_DIR)
+	sed -i 's/CFLAGS=/CFLAGS+=/g' $(LMBENCH_DIR)/src/Makefile
+	touch $@
+
+$(LMBENCH_DIR)/bin/$(ARCH)/$(LMBENCH_BIN): $(LMBENCH_DIR)/.unpacked
+	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" OS=$(ARCH) CC=$(TARGET_CC) -C $(LMBENCH_DIR)/src
+
+$(TARGET_DIR)/$(LMBENCH_TARGET_BIN): $(LMBENCH_DIR)/bin/$(ARCH)/$(LMBENCH_BIN)
+	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" OS=$(ARCH) CC=$(TARGET_CC) BASE=$(TARGET_DIR)/usr -C $(LMBENCH_DIR)/src install
+
+lmbench: $(TARGET_DIR)/$(LMBENCH_TARGET_BIN)
+
+lmbench-source: $(DL_DIR)/$(LMBENCH_SOURCE)
+
+lmbench-clean:
+	-$(MAKE) -C $(LMBENCH_DIR)/src clean
+
+lmbench-dirclean:
+	rm -rf $(LMBENCH_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(BR2_PACKAGE_LMBENCH),y)
+TARGETS+=lmbench
+endif
-- 
1.6.3.3
