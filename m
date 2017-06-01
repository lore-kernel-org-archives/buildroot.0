From: Mario J. Rugiero <mrugiero@gmail.com>
Date: Thu,  1 Jun 2017 11:33:49 -0300
Subject: [Buildroot] [PATCH v2] new package: ratpoison
In-Reply-To: <20170512220246.18575-1-mrugiero@gmail.com>
References: <20170512220246.18575-1-mrugiero@gmail.com>
Message-ID: <20170601143349.5406-1-mrugiero@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested with:
nitrogen6sx_defconfig

Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
---
v2: fix inexistent variables, add license and license files, fix style
    issues, add myself to DEVELOPERS.
v1: create the package.
 DEVELOPERS                       |  3 +++
 package/Config.in                |  1 +
 package/ratpoison/Config.in      | 15 +++++++++++++++
 package/ratpoison/ratpoison.hash |  2 ++
 package/ratpoison/ratpoison.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 46 insertions(+)
 create mode 100644 package/ratpoison/Config.in
 create mode 100644 package/ratpoison/ratpoison.hash
 create mode 100644 package/ratpoison/ratpoison.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4936b81bd..7a00e6b29 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1046,6 +1046,9 @@ F:	package/polkit/
 F:	package/sg3_utils/
 F:	package/udisks/
 
+N:	Mario Rugiero <mrugiero@gmail.com>
+F:	package/ratpoison/
+
 N:	Markos Chandras <markos.chandras@imgtec.com>
 F:	package/harfbuzz/
 F:	package/libsecret/
diff --git a/package/Config.in b/package/Config.in
index 43d75a9c7..3e7c45dc1 100644
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
index 000000000..e16a2fac7
--- /dev/null
+++ b/package/ratpoison/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_RATPOISON
+	bool "ratpoison"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_LIBERATION
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  Ratpoison is a simple Window Manager. It is largely modelled after
+	  GNU Screen and focuses on the keyboard instead of a mouse.
+
+	  The screen can be split into non-overlapping frames.
+	  All windows are kept maximized inside their frames to take full
+	  advantage of your precious screen real estate. 
+
+	  http://www.nongnu.org/ratpoison/
diff --git a/package/ratpoison/ratpoison.hash b/package/ratpoison/ratpoison.hash
new file mode 100644
index 000000000..44781b07a
--- /dev/null
+++ b/package/ratpoison/ratpoison.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 d98fa4be025ecca453c407ff311ab3949f29f20d6d8abedf8f0716b85fc8d1f1 ratpoison-1.4.9.tar.xz
diff --git a/package/ratpoison/ratpoison.mk b/package/ratpoison/ratpoison.mk
new file mode 100644
index 000000000..18222c217
--- /dev/null
+++ b/package/ratpoison/ratpoison.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# ratpoison
+#
+################################################################################
+
+RATPOISON_VERSION = 1.4.9
+RATPOISON_SOURCE = ratpoison-$(RATPOISON_VERSION).tar.xz
+RATPOISON_SITE = http://download.savannah.nongnu.org/releases/ratpoison
+RATPOISON_LICENSE = GPL-2.0
+RATPOISON_LICENSE_FILES = COPYING
+
+RATPOISON_CONF_OPTS = --x-includes=$(STAGING_DIR)/usr/include/X11 \
+		      --x-libraries=$(STAGING_DIR)/usr/lib
+
+RATPOISON_DEPENDENCIES = xlib_libX11
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
+	RATPOISON_DEPENDENCIES += xlib_libXrandr
+	RATPOISON_CONF_OPTS += --with-xrandr
+else
+	RATPOISON_CONF_OPTS += --without-xrandr
+endif
+
+$(eval $(autotools-package))
-- 
2.13.0
