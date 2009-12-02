From: Marc Egli <marc.egli@hsr.ch>
Date: Wed, 2 Dec 2009 18:02:33 +0100
Subject: [Buildroot] [PATCH] Adding openbox to buildroot
Message-ID: <867286CD-192F-48CE-8C3A-00D988A93C6B@hsr.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I wan't to use the lxde desktop with the openbox window manager. So i integrated those packages into buildroot. While i still have some issues with lxde, openbox is running pretty good.
So here is my patch that could eventually fit into the next release.

diff --git a/package/Config.in b/package/Config.in
index c5a2365..d2028cf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -348,6 +348,7 @@ comment "X Window managers"
 source "package/matchbox/Config.in"
 source "package/metacity/Config.in"
 source "package/blackbox/Config.in"
+source "package/openbox/Config.in"
 
 comment "X applications"
 source "package/alsamixergui/Config.in"
diff --git a/package/openbox/Config.in b/package/openbox/Config.in
new file mode 100644
index 0000000..53167e6
--- /dev/null
+++ b/package/openbox/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_OPENBOX
+       bool "openbox windowmanager"
+       select BR2_PACKAGE_PANGO
+       select BR2_PACKAGE_LIBGLIB2
+       select BR2_PACKAGE_LIBXML2
+       depends on BR2_PACKAGE_XORG7
+       help
+               http://icculus.org/openbox/index.php/Main_Page lightwight windowmanager
+
diff --git a/package/openbox/openbox.mk b/package/openbox/openbox.mk
new file mode 100644
index 0000000..29a79aa
--- /dev/null
+++ b/package/openbox/openbox.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# openbox
+#
+#############################################################
+
+OPENBOX_VERSION = 3.4.7.2
+OPENBOX_SOURCE = openbox-$(OPENBOX_VERSION).tar.gz
+OPENBOX_SITE = http://icculus.org/openbox/releases
+OPENBOX_DEPENDENCIES = libglib2 pango libxml2
+#OPENBOX_LIBTOOL_PATCH=NO
+OPENBOX_INSTALL_STAGING=YES
+OPENBOX_INSTALL_TARGET=YES
+
+$(eval $(call AUTOTARGETS,package,openbox))
+
