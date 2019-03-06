From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  6 Mar 2019 16:24:26 +0100
Subject: [Buildroot] [PATCH 3/3] package/libump: remove it
In-Reply-To: <20190306152426.8402-1-francois.perrad@gadz.org>
References: <20190306152426.8402-1-francois.perrad@gadz.org>
Message-ID: <20190306152426.8402-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this library was previously a part of sunxi-mali

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 Config.in.legacy                                    |  6 ++++++
 DEVELOPERS                                          |  1 -
 package/Config.in                                   |  1 -
 package/libump/Config.in                            | 13 -------------
 package/libump/libump.hash                          |  2 --
 package/libump/libump.mk                            | 13 -------------
 .../xdriver_xf86-video-fbturbo.mk                   |  4 ----
 7 files changed, 6 insertions(+), 34 deletions(-)
 delete mode 100644 package/libump/Config.in
 delete mode 100644 package/libump/libump.hash
 delete mode 100644 package/libump/libump.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index de10703c6..030947341 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -152,6 +152,12 @@ config BR2_PACKAGE_SUNXI_MALI
 	help
 	  The sunxi-mali package was removed.
 
+config BR2_PACKAGE_LIBUMP
+	bool "libump package removed"
+	select BR2_LEGACY
+	help
+	  The libump package was removed.
+
 ###############################################################################
 
 comment "Legacy options removed in 2019.02"
diff --git a/DEVELOPERS b/DEVELOPERS
index 9ab39185f..335f11f2d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -827,7 +827,6 @@ F:	package/ficl/
 F:	package/gdbm/
 F:	package/libtomcrypt/
 F:	package/libtommath/
-F:	package/libump/
 F:	package/linenoise/
 F:	package/ljlinenoise/
 F:	package/lpeg/
diff --git a/package/Config.in b/package/Config.in
index 9c723315c..f8f96a872 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -453,7 +453,6 @@ endmenu
 	source "package/kbd/Config.in"
 	source "package/lcdproc/Config.in"
 	source "package/libuio/Config.in"
-	source "package/libump/Config.in"
 	source "package/linuxconsoletools/Config.in"
 	source "package/linux-backports/Config.in"
 	source "package/lirc-tools/Config.in"
diff --git a/package/libump/Config.in b/package/libump/Config.in
deleted file mode 100644
index 696ccf3b1..000000000
--- a/package/libump/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_LIBUMP
-	bool "libump"
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_arm
-	help
-	  The ARMs Universal Memory Provider userspace library.
-	  This library is a requirement for ARMs binary Mali driver.
-
-	  http://github.com/linux-sunxi/libump
-
-comment "libump needs a glibc toolchain"
-	depends on BR2_arm
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/libump/libump.hash b/package/libump/libump.hash
deleted file mode 100644
index 5d2ad2eb3..000000000
--- a/package/libump/libump.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256  745bbb3e6a6b2b1d8caec75d2f2e884691ceefa5c2be0480baed31dba66cf450  libump-ec0680628744f30b8fac35e41a7bd8e23e59c39f.tar.gz
diff --git a/package/libump/libump.mk b/package/libump/libump.mk
deleted file mode 100644
index 65012ffd1..000000000
--- a/package/libump/libump.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# libump
-#
-################################################################################
-
-LIBUMP_VERSION = ec0680628744f30b8fac35e41a7bd8e23e59c39f
-LIBUMP_SITE = $(call github,linux-sunxi,libump,$(LIBUMP_VERSION))
-LIBUMP_LICENSE = Apache-2.0
-LIBUMP_AUTORECONF = YES
-LIBUMP_INSTALL_STAGING = YES
-
-$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk b/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk
index 58a70416d..049a2b5be 100644
--- a/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk
+++ b/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.mk
@@ -21,10 +21,6 @@ else
 XDRIVER_XF86_VIDEO_FBTURBO_CONF_OPTS += --disable-pciaccess
 endif
 
-ifeq ($(BR2_PACKAGE_LIBUMP),y)
-XDRIVER_XF86_VIDEO_FBTURBO_DEPENDENCIES += libump
-endif
-
 define XDRIVER_XF86_VIDEO_FBTURBO_INSTALL_CONF_FILE
 	$(INSTALL) -m 0644 -D $(@D)/xorg.conf $(TARGET_DIR)/etc/X11/xorg.conf
 endef
-- 
2.17.1
