From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  6 Feb 2019 15:10:53 +0100
Subject: [Buildroot] [PATCH 11/16] package/libmediaart: remove qt4 support
In-Reply-To: <20190206141058.24155-1-peter@korsgaard.com>
References: <20190206141058.24155-1-peter@korsgaard.com>
Message-ID: <20190206141058.24155-11-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt4 support is about to be dropped, so remove the support from libmediaart
as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmediaart/Config.in      | 9 ++++-----
 package/libmediaart/libmediaart.mk | 4 +---
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/libmediaart/Config.in b/package/libmediaart/Config.in
index e073677395..c11d6f49d9 100644
--- a/package/libmediaart/Config.in
+++ b/package/libmediaart/Config.in
@@ -32,12 +32,11 @@ config BR2_PACKAGE_LIBMEDIAART_BACKEND_GDK_PIXBUF
 
 config BR2_PACKAGE_LIBMEDIAART_BACKEND_QT
 	bool "Qt"
-	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
-	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
-	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_GUI
 
-comment "Qt backend depends on Qt or Qt5"
-	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
+comment "Qt backend depends on Qt5"
+	depends on !BR2_PACKAGE_QT5
 
 endchoice
 
diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
index f64210c266..a81542ac69 100644
--- a/package/libmediaart/libmediaart.mk
+++ b/package/libmediaart/libmediaart.mk
@@ -25,9 +25,7 @@ else ifeq ($(BR2_PACKAGE_LIBMEDIAART_BACKEND_QT),y)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 LIBMEDIAART_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 endif
-LIBMEDIAART_DEPENDENCIES += \
-	$(if $(BR2_PACKAGE_QT),qt) \
-	$(if $(BR2_PACKAGE_QT5),qt5base)
+LIBMEDIAART_DEPENDENCIES += qt5base
 LIBMEDIAART_CONF_OPTS += \
 	--disable-gdkpixbuf \
 	--enable-qt
-- 
2.11.0
