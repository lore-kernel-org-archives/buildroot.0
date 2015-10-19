From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 19 Oct 2015 18:38:33 -0300
Subject: [Buildroot] [PATCH 1/3] exfat: bump to version 1.2.1
Message-ID: <1445290716-25372-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to github homepage and site.
Package is now autotools-based.
musl tweak no longer required.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/exfat/Config.in  |  2 +-
 package/exfat/exfat.hash |  4 ++--
 package/exfat/exfat.mk   | 27 ++++-----------------------
 3 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/package/exfat/Config.in b/package/exfat/Config.in
index 575f389..c0b4eab 100644
--- a/package/exfat/Config.in
+++ b/package/exfat/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_EXFAT
 	  A full-featured exFAT file system implementation for GNU/Linux
 	  and other Unix-like systems as a FUSE module.
 
-	  http://code.google.com/p/exfat/
+	  https://github.com/relan/exfat
 
 comment "exfat needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
diff --git a/package/exfat/exfat.hash b/package/exfat/exfat.hash
index bfaca6e..af67785 100644
--- a/package/exfat/exfat.hash
+++ b/package/exfat/exfat.hash
@@ -1,2 +1,2 @@
-# From https://code.google.com/p/exfat/wiki/Downloads?tm=2
-sha1	060560f74dbce4dc947c7e658e75fdf339bc10ff	fuse-exfat-1.1.0.tar.gz
+# Locally calculated
+sha256	f444cd2849295b8de7fc61022fbf02f5bb1a84790c43f0c75ba3bf96f4619dd4	fuse-exfat-1.2.1.tar.gz
diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
index 5508ec3..cc474a7 100644
--- a/package/exfat/exfat.mk
+++ b/package/exfat/exfat.mk
@@ -4,31 +4,12 @@
 #
 ################################################################################
 
-EXFAT_VERSION = 1.1.0
-EXFAT_SITE = http://distfiles.gentoo.org/distfiles
+EXFAT_VERSION = 1.2.1
+EXFAT_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_VERSION)
 EXFAT_SOURCE = fuse-exfat-$(EXFAT_VERSION).tar.gz
-EXFAT_DEPENDENCIES = host-scons libfuse
+EXFAT_DEPENDENCIES = libfuse host-pkgconf
 EXFAT_LICENSE = GPLv3+
 EXFAT_LICENSE_FILES = COPYING
 EXFAT_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
-# The endianness handling functions in platform.h are protected behind
-# ifdef __GLIBC__ which musl doesn't define even though it does
-# provide the endianness handling interface. Work around it by
-# ensuring __GLIBC__ is defined.
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-EXFAT_CFLAGS += -D__GLIBC__
-endif
-
-define EXFAT_BUILD_CMDS
-	(cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS) CCFLAGS="$(EXFAT_CFLAGS)" $(SCONS))
-endef
-
-define EXFAT_INSTALL_TARGET_CMDS
-	(cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS) CCFLAGS="$(EXFAT_CFLAGS)" $(SCONS) \
-		DESTDIR=$(TARGET_DIR)/usr/sbin install)
-endef
-
-$(eval $(generic-package))
+$(eval $(autotools-package))
-- 
2.4.10
