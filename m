From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 May 2014 23:34:44 +0200
Subject: [Buildroot] [git commit] vala: remove deprecated target package
Message-ID: <20140501213801.113F49CAAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=947ca9e1207a906960efdeb1b377be57c0f305e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The vala target package has been deprecated since 2013.05 and thus can be
removed in 2014.05. The host vala support is left untouched.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                 |    8 ++++++++
 package/Config.in                |    1 -
 package/pulseaudio/pulseaudio.mk |    2 --
 package/vala/Config.in           |   19 -------------------
 package/vala/vala.mk             |    8 --------
 5 files changed, 8 insertions(+), 30 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c3c430c..023dfd3 100644
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
index 6888dc3..8bdc1c2 100644
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
index 98e49bd..94df387 100644
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
index 239c003..0000000
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
index 368e3f8..9b0fd31 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -11,17 +11,9 @@ VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
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
