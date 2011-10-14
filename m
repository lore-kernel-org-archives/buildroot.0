From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 14 Oct 2011 11:25:28 +0200
Subject: [Buildroot] [PATCH v5 3/3] New package: feh
In-Reply-To: <1318584328-6080-1-git-send-email-yegorslists@googlemail.com>
References: <1318584328-6080-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1318584328-6080-4-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in     |    1 +
 package/feh/Config.in |   13 +++++++++++++
 package/feh/feh.mk    |   22 ++++++++++++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 package/feh/Config.in
 create mode 100644 package/feh/feh.mk

diff --git a/package/Config.in b/package/Config.in
index 7f82934..b39f41b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -133,6 +133,7 @@ source "package/fluxbox/Config.in"
 comment "X applications"
 source "package/alsamixergui/Config.in"
 source "package/docker/Config.in"
+source "package/feh/Config.in"
 source "package/gqview/Config.in"
 source "package/gmpc/Config.in"
 source "package/gob2/Config.in"
diff --git a/package/feh/Config.in b/package/feh/Config.in
new file mode 100644
index 0000000..c89939d
--- /dev/null
+++ b/package/feh/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_FEH
+	bool "feh"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXINERAMA
+	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_IMLIB2_PNG
+	select BR2_PACKAGE_IMLIB2_X
+	select BR2_PACKAGE_GIBLIB
+	select BR2_PACKAGE_LIBCURL
+	help
+	  feh is an X11 image viewer aimed mostly at console users.
+
+	  http://feh.finalrewind.org/
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
new file mode 100644
index 0000000..b59bb2f
--- /dev/null
+++ b/package/feh/feh.mk
@@ -0,0 +1,22 @@
+FEH_VERSION = 2.0
+FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
+FEH_SITE = http://feh.finalrewind.org/
+FEH_DEPENDENCIES = libcurl giblib imlib2 libpng xlib_libXinerama xlib_libXt
+
+define FEH_BUILD_CMDS
+	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
+		-C $(@D) all
+endef
+
+define FEH_INSTALL_TARGET_CMDS
+	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) " \
+		DESTDIR=$(TARGET_DIR) -C $(@D) install
+endef
+
+define FEH_UNINSTALL_TARGET_CMDS
+	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) " \
+		DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
+endef
+
+$(eval $(call GENTARGETS))
+
-- 
1.7.1.1
