From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 30 Apr 2014 20:18:23 +0200
Subject: [Buildroot] [PATCH 1 of 2] vala: remove deprecated target package
In-Reply-To: <patchbomb.1398881902@argentina>
References: <patchbomb.1398881902@argentina>
Message-ID: <abd4f3c1158cf5b6cb65.1398881903@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The vala target package has been deprecated since 2013.05 and thus can be
removed in 2014.05. The host vala support is left untouched.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Config.in.legacy                 |   8 ++++++++
 package/Config.in                |   1 -
 package/pulseaudio/pulseaudio.mk |   2 --
 package/vala/Config.in           |  19 -------------------
 package/vala/vala.mk             |   8 --------
 5 files changed, 8 insertions(+), 30 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.05"
 
+config BR2_PACKAGE_VALA
+	bool "vala target package has been removed"
+	select BR2_LEGACY
+	help
+	  The 'vala' target package has been removed since it has been
+	  deprecated for more than four buildroot releases.
+	  Note: the host vala package still exists.
+
 config BR2_TARGET_TZ_ZONELIST
 	default BR2_PACKAGE_TZDATA_ZONELIST if BR2_PACKAGE_TZDATA_ZONELIST != ""
 
diff --git a/package/Config.in b/package/Config.in
--- a/package/Config.in
+++ b/package/Config.in
@@ -125,7 +125,6 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/tar/Config.in"
 endif
 source "package/tree/Config.in"
-source "package/vala/Config.in"
 source "package/yasm/Config.in"
 endmenu
 
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -100,13 +100,11 @@ else
 PULSEAUDIO_CONF_OPT += --disable-x11
 endif
 
-ifneq ($(BR2_PACKAGE_VALA),y)
 define PULSEAUDIO_REMOVE_VALA
 	rm -rf $(TARGET_DIR)/usr/share/vala
 endef
 
 PULSEAUDIO_POST_INSTALL_TARGET_HOOKS += PULSEAUDIO_REMOVE_VALA
-endif
 
 ifeq ($(BR2_PACKAGE_PULSEAUDIO_DAEMON),y)
 define PULSEAUDIO_USERS
diff --git a/package/vala/Config.in b/package/vala/Config.in
deleted file mode 100644
--- a/package/vala/Config.in
+++ /dev/null
@@ -1,19 +0,0 @@
-config BR2_PACKAGE_VALA
-	bool "vala"
-	# We no longer support a toolchain on the target
-	depends on BR2_DEPRECATED_SINCE_2013_05
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	help
-	  Compiler for the GObject type system.
-
-	  http://live.gnome.org/Vala
-
-comment "vala needs a toolchain w/ wchar, threads"
-	depends on BR2_DEPRECATED_SINCE_2013_05
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -11,17 +11,9 @@ VALA_SOURCE = vala-$(VALA_VERSION).tar.x
 VALA_LICENSE = LGPLv2.1+
 VALA_LICENSE_FILES = COPYING
 
-VALA_DEPENDENCIES = host-flex host-bison libglib2 \
-		$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
-
-# Force Vala to not use the host xsltproc even if available, because it may or
-# may not work with Vala documentation (some versions of xsltproc segfault)
-VALA_CONF_ENV = ac_cv_path_XSLTPROC=:
-
 HOST_VALA_DEPENDENCIES = host-flex host-libglib2
 # Yes, the autoconf script understands ':' as "xsltproc is not
 # available".
 HOST_VALA_CONF_ENV = ac_cv_path_XSLTPROC=:
 
-$(eval $(autotools-package))
 $(eval $(host-autotools-package))
