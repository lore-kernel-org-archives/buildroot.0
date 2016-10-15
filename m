From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 15 Oct 2016 16:51:02 +0200
Subject: [Buildroot] [PATCH 08/13] sstrip: remove deprecated package
In-Reply-To: <20161015145107.18264-1-arnout@mind.be>
References: <20161015145107.18264-1-arnout@mind.be>
Message-ID: <20161015145107.18264-9-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We will remove BR2_DEPRECATED, so remove this deprecated package.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy         |  9 +++++++++
 package/Config.in        |  1 -
 package/sstrip/Config.in |  8 --------
 package/sstrip/sstrip.mk | 20 --------------------
 4 files changed, 9 insertions(+), 29 deletions(-)
 delete mode 100644 package/sstrip/Config.in
 delete mode 100644 package/sstrip/sstrip.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 76365e6..1fcedfe 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,15 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.11"
 
+config BR2_PACKAGE_SSTRIP
+	bool "sstrip removed"
+	select BR2_LEGACY
+	help
+	  sstrip is unmaintained and potentially harmful. It doesn't
+	  save so much compared to normal binutils strip, and there is
+	  a big risk of binaries that don't work. Use normal strip
+	  instead.
+
 config BR2_KERNEL_HEADERS_4_3
 	bool "kernel headers version 4.3.x are no longer supported"
 	select BR2_KERNEL_HEADERS_4_1
diff --git a/package/Config.in b/package/Config.in
index 0257685..47c0801 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -143,7 +143,6 @@ menu "Development tools"
 	source "package/patch/Config.in"
 	source "package/pkgconf/Config.in"
 	source "package/sed/Config.in"
-	source "package/sstrip/Config.in"
 	source "package/subversion/Config.in"
 	source "package/tree/Config.in"
 	source "package/yasm/Config.in"
diff --git a/package/sstrip/Config.in b/package/sstrip/Config.in
deleted file mode 100644
index c458f8e..0000000
--- a/package/sstrip/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_SSTRIP
-	bool "sstrip"
-	depends on BR2_DEPRECATED_SINCE_2016_08
-	help
-	  Small utility that removes a few bytes from an executable that
-	  strip leaves behind.
-
-	  http://www.muppetlabs.com/~breadbox/software/elfkickers.html
diff --git a/package/sstrip/sstrip.mk b/package/sstrip/sstrip.mk
deleted file mode 100644
index 685ea09..0000000
--- a/package/sstrip/sstrip.mk
+++ /dev/null
@@ -1,20 +0,0 @@
-################################################################################
-#
-# sstrip
-#
-################################################################################
-
-SSTRIP_SITE = svn://svn.openwrt.org/openwrt/trunk/tools/sstrip
-SSTRIP_VERSION = 20154
-
-define SSTRIP_BUILD_CMDS
-	cd $(@D) ; \
-	$(TARGET_CC) $(TARGET_CFLAGS) -include endian.h -include byteswap.h \
-		-o sstrip src/sstrip.c
-endef
-
-define SSTRIP_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/sstrip $(TARGET_DIR)/usr/bin/sstrip
-endef
-
-$(eval $(generic-package))
-- 
2.9.3
