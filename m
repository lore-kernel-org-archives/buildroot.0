From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 17:05:43 +0100
Subject: [Buildroot] [git commit] yad: new package
Message-ID: <20151104160556.678D181DD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=701200973863f7b74b823fed53067c57adb81876
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: remove dependency on libglib2, as it is not tested directly
by yad's configure script, and is anyway guaranteed to be available
since yad depends on gtk2 or gtk3, which both require libglib2.]

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in     |    1 +
 package/yad/Config.in |   13 +++++++++++++
 package/yad/yad.hash  |    2 ++
 package/yad/yad.mk    |   24 ++++++++++++++++++++++++
 4 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f4affa8..3a0bd2f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -292,6 +292,7 @@ comment "X applications"
 	source "package/xscreensaver/Config.in"
 	source "package/xterm/Config.in"
 	source "package/xvkbd/Config.in"
+	source "package/yad/Config.in"
 
 comment "X libraries and helper libraries"
 	source "package/libsexy/Config.in"
diff --git a/package/yad/Config.in b/package/yad/Config.in
new file mode 100644
index 0000000..e4b63a2
--- /dev/null
+++ b/package/yad/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_YAD
+	bool "yad"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
+	help
+	  YAD (yet another dialog) is a tool for create graphical dialogs
+	  from shell scripts.
+
+	  http://sourceforge.net/projects/yad-dialog/
+
+comment "yad needs libgtk2 or libgtk3"
+	depends on BR2_PACKAGE_XORG7
+	depends on !BR2_PACKAGE_LIBGTK2 && !BR2_PACKAGE_LIBGTK3
diff --git a/package/yad/yad.hash b/package/yad/yad.hash
new file mode 100644
index 0000000..4e88ab0
--- /dev/null
+++ b/package/yad/yad.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 c91d6a9eb36abdb502d2d8ada0ec29c266b94a6628f723adeca436bee0b6c55c yad-0.31.2.tar.xz
diff --git a/package/yad/yad.mk b/package/yad/yad.mk
new file mode 100644
index 0000000..9d7ab37
--- /dev/null
+++ b/package/yad/yad.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# yad
+#
+################################################################################
+
+YAD_VERSION = 0.31.2
+YAD_SOURCE = yad-$(YAD_VERSION).tar.xz
+YAD_SITE = http://sourceforge.net/projects/yad-dialog/files
+YAD_LICENSE = GPLv3
+YAD_LICENSE_FILES = COPYING
+YAD_DEPENDENCIES = host-intltool host-pkgconf
+
+YAD_CONF_OPTS = --enable-html=no
+
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+YAD_DEPENDENCIES += libgtk3
+YAD_CONF_OPTS += --with-gtk=gtk3
+else
+YAD_DEPENDENCIES += libgtk2
+YAD_CONF_OPTS += --with-gtk=gtk2
+endif
+
+$(eval $(autotools-package))
