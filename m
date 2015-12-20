From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 14:06:58 +0100
Subject: [Buildroot] [git commit] package/elementary: rename libelementary
	to elementary
Message-ID: <20151220134303.C99D581E71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=820e16856a7ac32c7c8077a07385c075cd5cb6ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upstream name is elementary so use it.
Even if this package provide libelementary.so, it also provide
elementary_codegen, elementary_run and elm_prefs_cc tools.

Add a legacy entry.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |  8 ++++++++
 package/Config.in                                  |  2 +-
 package/{libelementary => elementary}/Config.in    |  6 +++---
 .../elementary.hash}                               |  0
 .../libelementary.mk => elementary/elementary.mk}  | 22 +++++++++++-----------
 package/enlightenment/Config.in                    |  2 +-
 package/enlightenment/enlightenment.mk             |  2 +-
 7 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c22e35e..f4c462a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -161,6 +161,14 @@ config BR2_PACKAGE_DIRECTFB_UNICHROME
 	  It doesn't build in the latest version and it's unlikely
 	  anyone has any use for it.
 
+config BR2_PACKAGE_LIBELEMENTARY
+	bool "libelementary has been renamed to elementary"
+	select BR2_LEGACY
+	select BR2_PACKAGE_ELEMENTARY
+	help
+	  The libelementary package has been renamed to match the upstream
+	  name.
+
 config BR2_PACKAGE_LIBEINA
 	bool "libeina package has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 5de57de..55cd874 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -242,6 +242,7 @@ comment "Graphic libraries"
 	source "package/cegui06/Config.in"
 	source "package/directfb/Config.in"
 	source "package/directfb-examples/Config.in"
+	source "package/elementary/Config.in"
 	source "package/fbdump/Config.in"
 	source "package/fbgrab/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
@@ -252,7 +253,6 @@ endif
 	source "package/fbv/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/imagemagick/Config.in"
-	source "package/libelementary/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
 	source "package/mesa3d/Config.in"
diff --git a/package/libelementary/Config.in b/package/elementary/Config.in
similarity index 75%
rename from package/libelementary/Config.in
rename to package/elementary/Config.in
index 54f8688..f356784 100644
--- a/package/libelementary/Config.in
+++ b/package/elementary/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_LIBELEMENTARY
-	bool "libelementary"
+config BR2_PACKAGE_ELEMENTARY
+	bool "elementary"
 	depends on BR2_PACKAGE_EFL
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elm_store.c
 	depends on !BR2_STATIC_LIBS
@@ -10,6 +10,6 @@ config BR2_PACKAGE_LIBELEMENTARY
 
 	  https://enlightenment.org
 
-comment "libelementary needs a toolchain w/ threads, dynamic library"
+comment "elementary needs a toolchain w/ threads, dynamic library"
 	depends on BR2_PACKAGE_EFL
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libelementary/libelementary.hash b/package/elementary/elementary.hash
similarity index 100%
rename from package/libelementary/libelementary.hash
rename to package/elementary/elementary.hash
diff --git a/package/libelementary/libelementary.mk b/package/elementary/elementary.mk
similarity index 62%
rename from package/libelementary/libelementary.mk
rename to package/elementary/elementary.mk
index 4ba8681..4320064 100644
--- a/package/libelementary/libelementary.mk
+++ b/package/elementary/elementary.mk
@@ -1,20 +1,20 @@
 ################################################################################
 #
-# libelementary
+# elementary
 #
 ################################################################################
 
-LIBELEMENTARY_VERSION = 1.15.2
-LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.xz
-LIBELEMENTARY_SITE = http://download.enlightenment.org/rel/libs/elementary
-LIBELEMENTARY_LICENSE = LGPLv2.1
-LIBELEMENTARY_LICENSE_FILES = COPYING
+ELEMENTARY_VERSION = 1.15.2
+ELEMENTARY_SOURCE = elementary-$(ELEMENTARY_VERSION).tar.xz
+ELEMENTARY_SITE = http://download.enlightenment.org/rel/libs/elementary
+ELEMENTARY_LICENSE = LGPLv2.1
+ELEMENTARY_LICENSE_FILES = COPYING
 
-LIBELEMENTARY_INSTALL_STAGING = YES
+ELEMENTARY_INSTALL_STAGING = YES
 
-LIBELEMENTARY_DEPENDENCIES = host-pkgconf host-libefl host-libelementary libefl
+ELEMENTARY_DEPENDENCIES = host-pkgconf host-libefl host-elementary libefl
 
-LIBELEMENTARY_CONF_OPTS = \
+ELEMENTARY_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
 	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
@@ -25,8 +25,8 @@ LIBELEMENTARY_CONF_OPTS = \
 
 # We need a host package in order to provide elm_prefs_cc and
 # elementary_codegen.
-HOST_LIBELEMENTARY_DEPENDENCIES = host-pkgconf host-libefl
-HOST_LIBELEMENTARY_CONF_OPTS = \
+HOST_ELEMENTARY_DEPENDENCIES = host-pkgconf host-libefl
+HOST_ELEMENTARY_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
 	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index 7f0d583..451fa0b 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	select BR2_PACKAGE_LIBEFL_X_XLIB
 	select BR2_PACKAGE_LIBEFL_JPEG # needed at runtime by enlightenment_start
 	select BR2_PACKAGE_LIBEFL_PNG # needed at runtime by enlightenment_start
-	select BR2_PACKAGE_LIBELEMENTARY
+	select BR2_PACKAGE_ELEMENTARY
 	select BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
 	select BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
 	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index f2e0bc3..546b5aa 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -14,7 +14,7 @@ ENLIGHTENMENT_DEPENDENCIES = \
 	host-pkgconf \
 	host-libefl \
 	libefl \
-	libelementary \
+	elementary \
 	libevas-generic-loaders \
 	xcb-util-keysyms
 
