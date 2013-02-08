From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 8 Feb 2013 22:06:41 +0100
Subject: [Buildroot] [git commit] package/customize: remove
Message-ID: <20130208210651.C0A1C9AA22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=12ccc43fb7afe0f2dee850e33f8261f652ff4dd4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This mechanism of root filesystem customization has been deprecated
since a long time, so let's remove it now.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: "Samuel Martin" <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in.legacy                |    8 ++++++++
 package/Config.in               |    1 -
 package/customize/Config.in     |    7 -------
 package/customize/customize.mk  |   32 --------------------------------
 support/scripts/pkg-stats       |    1 -
 5 files changed, 8 insertions(+), 41 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 90a7b67..d90132c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -44,6 +44,14 @@ endif
 #
 # Legacy options since 2012.11
 #
+config BR2_PACKAGE_CUSTOMIZE
+	bool "customize package has been removed"
+	select BR2_LEGACY
+	help
+	  The 'customize' special package has been removed. Instead,
+	  we recommend to create either your own packages, or use a
+	  post-build script to customize your root filesystem. See
+	  Buildroot's documentation for more details.
 
 config BR2_PACKAGE_XSERVER_xorg
 	bool "X.org modular server"
diff --git a/package/Config.in b/package/Config.in
index 8588951..2fad94d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1,7 +1,6 @@
 menu "Package Selection for the target"
 
 source "package/busybox/Config.in"
-source "package/customize/Config.in"
 
 # Audio and video applications
 source "package/multimedia/Config.in"
diff --git a/package/customize/Config.in b/package/customize/Config.in
deleted file mode 100644
index 8f8aaa2..0000000
--- a/package/customize/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_CUSTOMIZE
-	bool "customize"
-	depends on BR2_DEPRECATED
-	help
-	  Add custom stuff to your buildroot.
-
-	  (edit package/customize/customize.mk)
diff --git a/package/customize/customize.mk b/package/customize/customize.mk
deleted file mode 100644
index d2b8518..0000000
--- a/package/customize/customize.mk
+++ /dev/null
@@ -1,32 +0,0 @@
-#############################################################
-#
-# Any custom stuff you feel like doing....
-#
-#############################################################
-CUST_DIR:=package/customize/source
-
-$(BUILD_DIR)/.customize:
-	rm -f $(BUILD_DIR)/series
-	(cd $(CUST_DIR); \
-	 /bin/ls -d * > $(BUILD_DIR)/series || \
-	 touch $(BUILD_DIR)/series )
-	for f in `cat $(BUILD_DIR)/series`; do \
-		cp -af $(CUST_DIR)/$$f $(TARGET_DIR); \
-	done
-	rm -f $(BUILD_DIR)/series
-	touch $@
-
-customize: $(BUILD_DIR)/.customize
-
-customize-clean:
-	rm -f $(BUILD_DIR)/.customize
-
-.PHONY: customize
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_CUSTOMIZE),y)
-TARGETS+=customize
-endif
diff --git a/package/customize/source/.empty b/package/customize/source/.empty
deleted file mode 100644
index e69de29..0000000
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 929b8d1..a65a6ae 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -92,7 +92,6 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	$i = "package/games/games.mk" -o \
 	$i = "package/gtk2-themes/gtk2-themes.mk" -o \
 	$i = "package/multimedia/multimedia.mk" -o \
- 	$i = "package/customize/customize.mk" -o \
  	$i = "package/pkg-autotools.mk" -o \
  	$i = "package/pkg-cmake.mk" -o \
  	$i = "package/pkg-generic.mk" -o \
