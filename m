From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 16:09:38 +0200
Subject: [Buildroot] [git commit] tstools: new package
Message-ID: <20130727141205.C54069AC92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=396e92ed2e2aad55fbb2c0592c7e3f0063e0e065
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: properly indent help text, add largefile dependency, remove
unneeded libpcap dependency, remove unneeded CLEAN_CMDS, reorder build
and install commands, remove uneeded <pkg>_INSTALL_STAGING,
<pkg>_INSTALL_TARGET and <pkg>_INSTALL_IMAGES variables, move from
package/multimedia/ to package/, add license details, rename patch to
remove version number in the patch filename.]

Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/Config.in                       |    1 +
 package/tstools/Config.in                          |   17 ++++++++
 .../tstools-build-get-along-with-buildroot.patch   |   40 ++++++++++++++++++++
 package/tstools/tstools.mk                         |   21 ++++++++++
 4 files changed, 79 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 925051e..2fcac56 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -37,6 +37,7 @@ source "package/multimedia/on2-8170-libs/Config.in"
 source "package/opus-tools/Config.in"
 source "package/multimedia/pulseaudio/Config.in"
 source "package/multimedia/tidsp-binaries/Config.in"
+source "package/tstools/Config.in"
 source "package/multimedia/vorbis-tools/Config.in"
 source "package/multimedia/wavpack/Config.in"
 source "package/yavta/Config.in"
diff --git a/package/tstools/Config.in b/package/tstools/Config.in
new file mode 100644
index 0000000..58f3df1
--- /dev/null
+++ b/package/tstools/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_TSTOOLS
+	bool "tstools"
+	depends on BR2_LARGEFILE
+	help
+	  This is a set of cross-platform command line tools for
+	  working with MPEG data
+
+	  The emphasis is on relatively simple tools which concentrate
+	  on MPEG (H.264 and H.262) data packaged according to H.222
+	  (i.e., TS or PS), with a particular interest in checking for
+	  conformance.
+
+	  Transport Stream (TS) is typically used for distribution of
+	  cable and satellite data. Program Stream (PS) is typically
+	  used to store data on DVDs.
+
+	  http://tstools.berlios.de/
diff --git a/package/tstools/tstools-build-get-along-with-buildroot.patch b/package/tstools/tstools-build-get-along-with-buildroot.patch
new file mode 100644
index 0000000..1e7a748
--- /dev/null
+++ b/package/tstools/tstools-build-get-along-with-buildroot.patch
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
diff --git a/package/tstools/tstools.mk b/package/tstools/tstools.mk
new file mode 100644
index 0000000..377cc34
--- /dev/null
+++ b/package/tstools/tstools.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# tstools
+#
+################################################################################
+
+TSTOOLS_VERSION = 1_11
+TSTOOLS_SITE    = https://tstools.googlecode.com/files/
+TSTOOLS_SOURCE  = tstools-$(TSTOOLS_VERSION).tgz
+TSTOOLS_LICENSE = MPL v1.1
+
+define TSTOOLS_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define TSTOOLS_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
