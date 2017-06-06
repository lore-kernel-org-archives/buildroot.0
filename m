From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 22:58:35 +0200
Subject: [Buildroot] [git commit] ratpoison: new package
Message-ID: <20170606205934.462A0822D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2bfe74f3496305b1e2b72dca15171f75ecf6efc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested with:
nitrogen6sx_defconfig

Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
[Thomas:
 - formatting fixes
 - license is GPL-2.0+, not GPL-2.0
 - explicitly disable xft/xkb support]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                       |  3 +++
 package/Config.in                |  1 +
 package/ratpoison/Config.in      | 16 ++++++++++++++++
 package/ratpoison/ratpoison.hash |  2 ++
 package/ratpoison/ratpoison.mk   | 28 ++++++++++++++++++++++++++++
 5 files changed, 50 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 77a3b62..048789c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1057,6 +1057,9 @@ F:	package/polkit/
 F:	package/sg3_utils/
 F:	package/udisks/
 
+N:	Mario Rugiero <mrugiero@gmail.com>
+F:	package/ratpoison/
+
 N:	Markos Chandras <markos.chandras@imgtec.com>
 F:	package/harfbuzz/
 F:	package/libsecret/
diff --git a/package/Config.in b/package/Config.in
index 3442828..c464618 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -341,6 +341,7 @@ comment "X window managers"
 	source "package/matchbox/Config.in"
 	source "package/metacity/Config.in"
 	source "package/openbox/Config.in"
+	source "package/ratpoison/Config.in"
 endmenu
 
 menu "Hardware handling"
diff --git a/package/ratpoison/Config.in b/package/ratpoison/Config.in
new file mode 100644
index 0000000..0c78a1f
--- /dev/null
+++ b/package/ratpoison/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_RATPOISON
+	bool "ratpoison"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_LIBERATION
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  Ratpoison is a simple Window Manager. It is largely modelled
+	  after GNU Screen and focuses on the keyboard instead of a
+	  mouse.
+
+	  The screen can be split into non-overlapping frames.  All
+	  windows are kept maximized inside their frames to take full
+	  advantage of your precious screen real estate.
+
+	  http://www.nongnu.org/ratpoison/
diff --git a/package/ratpoison/ratpoison.hash b/package/ratpoison/ratpoison.hash
new file mode 100644
index 0000000..44781b0
--- /dev/null
+++ b/package/ratpoison/ratpoison.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 d98fa4be025ecca453c407ff311ab3949f29f20d6d8abedf8f0716b85fc8d1f1 ratpoison-1.4.9.tar.xz
diff --git a/package/ratpoison/ratpoison.mk b/package/ratpoison/ratpoison.mk
new file mode 100644
index 0000000..27cca84
--- /dev/null
+++ b/package/ratpoison/ratpoison.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# ratpoison
+#
+################################################################################
+
+RATPOISON_VERSION = 1.4.9
+RATPOISON_SOURCE = ratpoison-$(RATPOISON_VERSION).tar.xz
+RATPOISON_SITE = http://download.savannah.nongnu.org/releases/ratpoison
+RATPOISON_LICENSE = GPL-2.0+
+RATPOISON_LICENSE_FILES = COPYING
+
+RATPOISON_CONF_OPTS = \
+	--x-includes=$(STAGING_DIR)/usr/include/X11 \
+	--x-libraries=$(STAGING_DIR)/usr/lib \
+	--without-xkb \
+	--without-xft
+
+RATPOISON_DEPENDENCIES = xlib_libX11
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
+RATPOISON_DEPENDENCIES += xlib_libXrandr
+RATPOISON_CONF_OPTS += --with-xrandr
+else
+RATPOISON_CONF_OPTS += --without-xrandr
+endif
+
+$(eval $(autotools-package))
