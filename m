From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 23:18:23 +0100
Subject: [Buildroot] [git commit] package/libump: remove package
Message-ID: <20190315221544.47C5F81481@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b643a75b90d314085e9969e8d6f7d863340e93a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This library was previously a part of sunxi-mali.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                            |  7 +++++++
 DEVELOPERS                                                  |  1 -
 package/Config.in                                           |  1 -
 package/libump/Config.in                                    | 13 -------------
 package/libump/libump.hash                                  |  2 --
 package/libump/libump.mk                                    | 13 -------------
 .../xdriver_xf86-video-fbturbo.mk                           |  4 ----
 7 files changed, 7 insertions(+), 34 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c094f07584..2030b51e1d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2019.05"
 
+config BR2_PACKAGE_LIBUMP
+	bool "libump package removed"
+	select BR2_LEGACY
+	help
+	  The libump package was removed, it was only used as a
+	  dependency of sunxi-mali, which itself was removed.
+
 config BR2_PACKAGE_SUNXI_MALI
 	bool "sunxi-mali package removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 62ad09950b..778dffa5d5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -843,7 +843,6 @@ F:	package/ficl/
 F:	package/gdbm/
 F:	package/libtomcrypt/
 F:	package/libtommath/
-F:	package/libump/
 F:	package/libwpe/
 F:	package/linenoise/
 F:	package/ljlinenoise/
diff --git a/package/Config.in b/package/Config.in
index b8c57d34eb..30391cfc89 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -454,7 +454,6 @@ endmenu
 	source "package/kbd/Config.in"
 	source "package/lcdproc/Config.in"
 	source "package/libuio/Config.in"
-	source "package/libump/Config.in"
 	source "package/linuxconsoletools/Config.in"
 	source "package/linux-backports/Config.in"
 	source "package/lirc-tools/Config.in"
diff --git a/package/libump/Config.in b/package/libump/Config.in
deleted file mode 100644
index 696ccf3b11..0000000000
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
index 5d2ad2eb3e..0000000000
--- a/package/libump/libump.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256  745bbb3e6a6b2b1d8caec75d2f2e884691ceefa5c2be0480baed31dba66cf450  libump-ec0680628744f30b8fac35e41a7bd8e23e59c39f.tar.gz
diff --git a/package/libump/libump.mk b/package/libump/libump.mk
deleted file mode 100644
index 65012ffd13..0000000000
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
index 58a70416dd..049a2b5be1 100644
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
