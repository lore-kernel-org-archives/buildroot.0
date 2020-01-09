From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  9 Jan 2020 20:06:04 +0100
Subject: [Buildroot] [PATCH 2/2] package/pinentry: add pinentry-fltk
In-Reply-To: <20200109190604.3707812-1-fontaine.fabrice@gmail.com>
References: <20200109190604.3707812-1-fontaine.fabrice@gmail.com>
Message-ID: <20200109190604.3707812-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pinentry-fltk has been added in version 1.1.0 with
https://github.com/gpg/pinentry/commit/6c45eed62214b44fcc11e642b19df7b6ca0da0bd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pinentry/Config.in   | 13 +++++++++++++
 package/pinentry/pinentry.mk |  9 +++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index 518e3ad37f..9048edd21b 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -15,6 +15,19 @@ menuconfig BR2_PACKAGE_PINENTRY
 
 if BR2_PACKAGE_PINENTRY
 
+config BR2_PACKAGE_PINENTRY_FLTK
+	bool "pinentry-fltk"
+	depends on BR2_USE_MMU # fltk
+	depends on BR2_INSTALL_LIBSTDCPP # fltk
+	depends on BR2_PACKAGE_XORG7 # fltk
+	select BR2_PACKAGE_FLTK
+	help
+	  The pinentry-fltk tool
+
+comment "pinentry-fltk needs X and a toolchain w/ C++"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_XORG7 || !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_PINENTRY_NCURSES
 	bool "pinentry-ncurses"
 	select BR2_PACKAGE_NCURSES
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index 0e9dfb2f0e..1bc1adab17 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -36,6 +36,15 @@ else
 PINENTRY_CONF_OPTS += --disable-libsecret
 endif
 
+# pinentry-fltk backend
+ifeq ($(BR2_PACKAGE_PINENTRY_FLTK),y)
+PINENTRY_CONF_ENV += ac_cv_path_FLTK_CONFIG=$(STAGING_DIR)/usr/bin/fltk-config
+PINENTRY_CONF_OPTS += --enable-pinentry-fltk
+PINENTRY_DEPENDENCIES += fltk
+else
+PINENTRY_CONF_OPTS += --disable-pinentry-fltk
+endif
+
 # pinentry-ncurses backend
 ifeq ($(BR2_PACKAGE_PINENTRY_NCURSES),y)
 PINENTRY_CONF_OPTS += --enable-ncurses --with-ncurses-include-dir=none
-- 
2.24.1
