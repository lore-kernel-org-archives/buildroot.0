From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  6 Feb 2019 15:10:50 +0100
Subject: [Buildroot] [PATCH 08/16] package/poppler: remove qt option
In-Reply-To: <20190206141058.24155-1-peter@korsgaard.com>
References: <20190206141058.24155-1-peter@korsgaard.com>
Message-ID: <20190206141058.24155-8-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The qt option uses the obsolete qt4 package, which we are about to remove,
so remove the poppler qt option as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy           | 6 ++++++
 package/poppler/Config.in  | 8 --------
 package/poppler/poppler.mk | 9 +--------
 3 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 67e3b0dc70..c137006948 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2019.02"
 
+config BR2_PACKAGE_POPPLER_QT
+	bool "poppler qt option removed"
+	select BR2_LEGACY
+	help
+	  The poppler qt option was removed.
+
 config BR2_PACKAGE_OPENCV3_WITH_QT
 	bool "opencv3 qt backend option removed"
 	select BR2_LEGACY
diff --git a/package/poppler/Config.in b/package/poppler/Config.in
index 9b03df8d27..4a553df721 100644
--- a/package/poppler/Config.in
+++ b/package/poppler/Config.in
@@ -13,14 +13,6 @@ config BR2_PACKAGE_POPPLER
 
 if BR2_PACKAGE_POPPLER
 
-config BR2_PACKAGE_POPPLER_QT
-	bool "Qt support"
-	depends on BR2_PACKAGE_QT
-	select BR2_PACKAGE_QT_GUI_MODULE
-	select BR2_PACKAGE_QT_XML
-	help
-	  Build Qt support into the Poppler library
-
 config BR2_PACKAGE_POPPLER_QT5
 	bool "Qt5 support"
 	depends on BR2_PACKAGE_QT5
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index bad61a6613..be1c0e4821 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -12,7 +12,7 @@ POPPLER_LICENSE = GPL-2.0+
 POPPLER_LICENSE_FILES = COPYING
 POPPLER_INSTALL_STAGING = YES
 POPPLER_CONF_OPTS = --with-font-configuration=fontconfig \
-	--enable-xpdf-headers
+	--enable-xpdf-headers --disable-poppler-qt4
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 POPPLER_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -latomic"
@@ -84,13 +84,6 @@ else
 POPPLER_CONF_OPTS += --without-x
 endif
 
-ifeq ($(BR2_PACKAGE_POPPLER_QT),y)
-POPPLER_DEPENDENCIES += qt
-POPPLER_CONF_OPTS += --enable-poppler-qt4
-else
-POPPLER_CONF_OPTS += --disable-poppler-qt4
-endif
-
 ifeq ($(BR2_PACKAGE_POPPLER_QT5),y)
 POPPLER_DEPENDENCIES += qt5base
 POPPLER_CONF_OPTS += --enable-poppler-qt5
-- 
2.11.0
