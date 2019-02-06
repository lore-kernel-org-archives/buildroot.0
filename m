From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  6 Feb 2019 15:10:51 +0100
Subject: [Buildroot] [PATCH 09/16] package/pinentry: remove qt4 option
In-Reply-To: <20190206141058.24155-1-peter@korsgaard.com>
References: <20190206141058.24155-1-peter@korsgaard.com>
Message-ID: <20190206141058.24155-9-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The qt4 option uses the obsolete qt4 package, which we are about to remove,
so remove the pinentry-qt4 option as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy             |  6 ++++++
 package/pinentry/Config.in   | 18 ------------------
 package/pinentry/pinentry.mk | 11 +++--------
 3 files changed, 9 insertions(+), 26 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c137006948..64f5d58bd7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2019.02"
 
+config BR2_PACKAGE_PINENTRY_QT4
+	bool "pinentry-qt4 option removed"
+	select BR2_LEGACY
+	help
+	  The pinentry-qt4 option was removed.
+
 config BR2_PACKAGE_POPPLER_QT
 	bool "poppler qt option removed"
 	select BR2_LEGACY
diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index 5f2cb58fbb..22bc2bb43d 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -7,7 +7,6 @@ menuconfig BR2_PACKAGE_PINENTRY
 	# At least one backend is needed to avoid build breakage
 	select BR2_PACKAGE_PINENTRY_NCURSES if \
 		!BR2_PACKAGE_PINENTRY_GTK2 && \
-		!BR2_PACKAGE_PINENTRY_QT4 && \
 		!BR2_PACKAGE_PINENTRY_QT5
 	help
 	  A collection of simple PIN or pass-phrase entry dialogs
@@ -42,28 +41,12 @@ comment "pinentry-gtk2 needs X and a toolchain w/ wchar, threads, C++"
 	depends on !BR2_PACKAGE_XORG7 || !BR2_USE_WCHAR || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
-config BR2_PACKAGE_PINENTRY_QT4
-	bool "pinentry-qt4"
-	depends on BR2_USE_MMU # fork
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_QT
-	select BR2_PACKAGE_QT_GUI_MODULE
-	help
-	  The pinentry-qt4 tool
-
-comment "pinentry-qt4 needs a toolchain w/ C++, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-
 config BR2_PACKAGE_PINENTRY_QT5
 	bool "pinentry-qt5"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_PACKAGE_PINENTRY_QT4
-	depends on !BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_WIDGETS
@@ -71,7 +54,6 @@ config BR2_PACKAGE_PINENTRY_QT5
 	  The pinentry-qt5 tool
 
 comment "pinentry-qt5 needs a toolchain w/ wchar, NPTL, C++, dynamic library"
-	depends on !BR2_PACKAGE_PINENTRY_QT4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index d0179728bd..ce82f1090a 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -52,15 +52,10 @@ else
 PINENTRY_CONF_OPTS += --disable-pinentry-gtk2
 endif
 
-# pinentry-qt4/5 backend
-ifeq ($(BR2_PACKAGE_PINENTRY_QT4)$(BR2_PACKAGE_PINENTRY_QT5),y)
-ifeq ($(BR2_PACKAGE_PINENTRY_QT4),y)
-# -pthread needs to be passed for certain toolchains
-# http://autobuild.buildroot.net/results/6be/6be109ccedec603a67cebdb31b55865dcce0e128/
-PINENTRY_CONF_OPTS += LIBS=-pthread MOC=$(HOST_DIR)/bin/moc
-endif
+# pinentry-qt5 backend
+ifeq ($(BR2_PACKAGE_PINENTRY_QT5),y)
 PINENTRY_CONF_OPTS += --enable-pinentry-qt
-PINENTRY_DEPENDENCIES += $(if $(BR2_PACKAGE_PINENTRY_QT4),qt,qt5base)
+PINENTRY_DEPENDENCIES += qt5base
 else
 PINENTRY_CONF_OPTS += --disable-pinentry-qt
 endif
-- 
2.11.0
