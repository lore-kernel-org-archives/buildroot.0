From: Mario J. Rugiero <mrugiero@gmail.com>
Date: Fri, 12 May 2017 19:02:46 -0300
Subject: [Buildroot] [PATCH] new package: ratpoison
Message-ID: <20170512220246.18575-1-mrugiero@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested with:
nitrogen6sx_defconfig

Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
---
 package/Config.in                |  1 +
 package/ratpoison/Config.in      | 22 ++++++++++++++++++++++
 package/ratpoison/ratpoison.hash |  2 ++
 package/ratpoison/ratpoison.mk   | 22 ++++++++++++++++++++++
 4 files changed, 47 insertions(+)
 create mode 100644 package/ratpoison/Config.in
 create mode 100644 package/ratpoison/ratpoison.hash
 create mode 100644 package/ratpoison/ratpoison.mk

diff --git a/package/Config.in b/package/Config.in
index 3876ffa93..6ad761bc1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -339,6 +339,7 @@ comment "X window managers"
 	source "package/matchbox/Config.in"
 	source "package/metacity/Config.in"
 	source "package/openbox/Config.in"
+	source "package/ratpoison/Config.in"
 endmenu
 
 menu "Hardware handling"
diff --git a/package/ratpoison/Config.in b/package/ratpoison/Config.in
new file mode 100644
index 000000000..c5c5cc774
--- /dev/null
+++ b/package/ratpoison/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_RATPOISON
+	bool "ratpoison"
+	depends on BR2_PACKAGE_XORG || BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_LIBERATION
+	select BR2_PACKAGE_FONTCONFIG
+	help
+	  Ratpoison is a simple Window Manager. It is largely modelled after
+	  GNU Screen and focuses on the keyboard instead of a mouse.
+
+	  The screen can be split into non-overlapping frames.
+	  All windows are kept maximized inside their frames to take full
+	  advantage of your precious screen real estate. 
+
+	  http://www.nongnu.org/ratpoison/
+
+config BR2_PACKAGE_RATPOISON_RANDR
+	bool "Xrandr support"
+	depends on BR2_PACKAGE_RATPOISON
+	depends on BR2_PACKAGE_XLIB_LIBXRANDR
+	help
+	  Build ratpoison with randr support, mainly for multihead.
diff --git a/package/ratpoison/ratpoison.hash b/package/ratpoison/ratpoison.hash
new file mode 100644
index 000000000..0f6e169d4
--- /dev/null
+++ b/package/ratpoison/ratpoison.hash
@@ -0,0 +1,2 @@
+#Locally computed
+sha256 d98fa4be025ecca453c407ff311ab3949f29f20d6d8abedf8f0716b85fc8d1f1 ratpoison-1.4.9.tar.xz
diff --git a/package/ratpoison/ratpoison.mk b/package/ratpoison/ratpoison.mk
new file mode 100644
index 000000000..1545cb17c
--- /dev/null
+++ b/package/ratpoison/ratpoison.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# ratpoison
+#
+#############################################################
+
+RATPOISON_VERSION = 1.4.9
+RATPOISON_SOURCE = ratpoison-$(RATPOISON_VERSION).tar.xz
+RATPOISON_SITE = http://download.savannah.nongnu.org/releases/ratpoison
+
+RATPOISON_CONF_OPTS = --x-includes=$(STAGING_DIR)/usr/include/X11 \
+		      --x-libraries=$(STAGING_DIR)/usr/lib
+
+RATPOISON_DEPENDENCIES = $(XSERVER) xlib_libX11
+
+ifeq ($(BR2_PACKAGE_RATPOISON_RANDR),y)
+	RATPOISON_DEPENDENCIES += xlib_libXrandr
+else
+	RATPOISON_CONF_OPTS += --without-xrandr
+endif
+
+$(eval $(autotools-package))
-- 
2.13.0
