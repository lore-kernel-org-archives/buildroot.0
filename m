From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Sat, 20 Jul 2013 20:52:19 +0800
Subject: [Buildroot] [PATCH 1/1] tstools: new package
Message-ID: <1374324739-15242-1-git-send-email-tjlee@ambarella.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
---
 package/multimedia/Config.in                       |  1 +
 package/multimedia/tstools/Config.in               | 17 +++++++++
 ...tools-1_11-build-get-along-with-buildroot.patch | 40 ++++++++++++++++++++++
 package/multimedia/tstools/tstools.mk              | 27 +++++++++++++++
 4 files changed, 85 insertions(+)
 create mode 100644 package/multimedia/tstools/Config.in
 create mode 100644 package/multimedia/tstools/tstools-1_11-build-get-along-with-buildroot.patch
 create mode 100644 package/multimedia/tstools/tstools.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 925051e..7760be1 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -37,6 +37,7 @@ source "package/multimedia/on2-8170-libs/Config.in"
 source "package/opus-tools/Config.in"
 source "package/multimedia/pulseaudio/Config.in"
 source "package/multimedia/tidsp-binaries/Config.in"
+source "package/multimedia/tstools/Config.in"
 source "package/multimedia/vorbis-tools/Config.in"
 source "package/multimedia/wavpack/Config.in"
 source "package/yavta/Config.in"
diff --git a/package/multimedia/tstools/Config.in b/package/multimedia/tstools/Config.in
new file mode 100644
index 0000000..4f99aea
--- /dev/null
+++ b/package/multimedia/tstools/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_TSTOOLS
+	bool "tstools"
+	help
+
+	This is a set of cross-platform command line tools for
+	working with MPEG data
+
+	The emphasis is on relatively simple tools which concentrate
+	on MPEG (H.264 and H.262) data packaged according to H.222
+	(i.e., TS or PS), with a particular interest in checking
+	for conformance.
+
+	Transport Stream (TS) is typically used for distribution of
+	cable and satellite data. Program Stream (PS) is typically
+	used to store data on DVDs.
+
+	http://tstools.berlios.de/
diff --git a/package/multimedia/tstools/tstools-1_11-build-get-along-with-buildroot.patch b/package/multimedia/tstools/tstools-1_11-build-get-along-with-buildroot.patch
new file mode 100644
index 0000000..1e7a748
--- /dev/null
+++ b/package/multimedia/tstools/tstools-1_11-build-get-along-with-buildroot.patch
@@ -0,0 +1,40 @@
+From 44f80bce0914d4d9c5e7486c7cdb521ba637b324 Mon Sep 17 00:00:00 2001
+From: Tzu-Jung Lee <tjlee@ambarella.com>
+Date: Fri, 19 Jul 2013 22:45:18 +0800
+Subject: [PATCH] build: get along with buildroot
+
+Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
+---
+ Makefile | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 2c3568e..98bb994 100644
+--- a/Makefile
++++ b/Makefile
+@@ -34,12 +34,6 @@ SHELL = /bin/sh
+ .SUFFIXES:
+ .SUFFIXES: .c .o
+ 
+-ifdef CROSS_COMPILE
+-CC = $(CROSS_COMPILE)gcc
+-else
+-CC = gcc
+-endif
+-
+ # Use WARN=1 periodically to get too many warnings...
+ ifdef WARN
+ WARNING_FLAGS = -Wall -W -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wcast-qual -Wconversion -Wmissing-prototypes -Wmissing-declarations -Wunreachable-code -Winline
+@@ -452,3 +446,9 @@ test_lists:	$(BINDIR)/test_nal_unit_list  $(BINDIR)/test_es_unit_list
+ 	@echo +++ Testing ES unit lists
+ 	$(BINDIR)/test_es_unit_list
+ 	@echo +++ Test succeeded
++
++.PHONY: install
++install:
++	@for i in $(PROGS); do \
++		cp -f $$i $(DESTDIR)/usr/bin/; \
++	done
+-- 
+1.8.3.2
+
diff --git a/package/multimedia/tstools/tstools.mk b/package/multimedia/tstools/tstools.mk
new file mode 100644
index 0000000..0ff7d26
--- /dev/null
+++ b/package/multimedia/tstools/tstools.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+# tstools
+#
+#############################################################
+
+TSTOOLS_VERSION		= 1_11
+TSTOOLS_SITE		= https://tstools.googlecode.com/files/
+TSTOOLS_SOURCE		= tstools-$(TSTOOLS_VERSION).tgz
+TSTOOLS_DEPENDENCIES	= libpcap
+TSTOOLS_INSTALL_STAGING	= NO
+TSTOOLS_INSTALL_IMAGES	= NO
+TSTOOLS_INSTALL_TARGET	= YES
+
+define TSTOOLS_INSTALL_TARGET_CMDS
+  $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+define TSTOOLS_BUILD_CMDS
+  $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define TSTOOLS_CLEAN_CMDS
+  $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
-- 
1.8.3.2
