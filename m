From: Frederic Bassaler <frederic.bassaler@gmail.com>
Date: Tue, 2 Aug 2011 19:10:04 +0200
Subject: [Buildroot] [PATCH] Adding Fluxbox window manager
Message-ID: <20110802191004.66ae3ee3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hope this is ok, sorry I'm a git-newbie

(if it's not good, can somebody tell me the proper git commands? thanks)



---
 package/Config.in          |    1 +
 package/fluxbox/Config.in  |   13 +++++++++++++
 package/fluxbox/fluxbox.mk |   23 +++++++++++++++++++++++
 3 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 package/fluxbox/Config.in
 create mode 100644 package/fluxbox/fluxbox.mk

diff --git a/package/Config.in b/package/Config.in
index 7112e05..c4cecfa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -127,6 +127,7 @@ comment "X Window managers"
 source "package/matchbox/Config.in"
 source "package/metacity/Config.in"
 source "package/blackbox/Config.in"
+source "package/fluxbox/Config.in"
 
 comment "X applications"
 source "package/alsamixergui/Config.in"
diff --git a/package/fluxbox/Config.in b/package/fluxbox/Config.in
new file mode 100644
index 0000000..63840b2
--- /dev/null
+++ b/package/fluxbox/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_FLUXBOX
+	bool "fluxbox"
+        depends on BR2_PACKAGE_XORG7
+        depends on BR2_INSTALL_LIBSTDCPP
+        select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+        select BR2_PACKAGE_XLIB_LIBX11
+  	help
+	  The Fluxbox lightweight window manager for X
+
+	  http://fluxbox.org
+
+comment "fluxbox requires a toolchain with C++ support enabled"
+        depends on BR2_PACKAGE_XORG7 && !BR2_INSTALL_LIBSTDCPP
diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
new file mode 100644
index 0000000..726a133
--- /dev/null
+++ b/package/fluxbox/fluxbox.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# FLUXBOX
+#
+#############################################################
+
+FLUXBOX_VERSION:=1.3.1
+FLUXBOX_SOURCE:=fluxbox-$(FLUXBOX_VERSION).tar.bz2
+FLUXBOX_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fluxbox/
+FLUXBOX_AUTORECONF:=NO
+FLUXBOX_INSTALL_STAGING:=NO
+FLUXBOX_INSTALL_TARGET:=YES
+
+FLUXBOX_CONF_OPT:=--x-includes=$(STAGING_DIR)/usr/include/X11 \
+		--x-libraries=$(STAGING_DIR)/usr/lib
+
+FLUXBOX_DEPENDENCIES = xlib_libX11
+
+ifneq ($(BR2_ENABLE_LOCALE),y)
+FLUXBOX_DEPENDENCIES += libiconv
+endif
+
+$(eval $(call AUTOTARGETS,package,fluxbox))
-- 
1.7.2.3
