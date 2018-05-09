From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed,  9 May 2018 18:33:23 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/libmediaart: Fix config prefix
In-Reply-To: <20180509163323.30172-1-petr.vorel@gmail.com>
References: <20180509163323.30172-1-petr.vorel@gmail.com>
Message-ID: <20180509163323.30172-2-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Options should be prefixed by BR2_PACKAGE_LIBMEDIAART and not
BR2_PACKAGE_MEDIAART, but package was using both prefixes.

We cannot put old options into Config.in.legacy, because those
options are part of a Kconfig choice, and it's not possible to
select an item of a choice.

This was found as default symbol was defined as
BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE (correct prefix), but symbol
was actually BR2_PACKAGE_MEDIAART_BACKEND_NONE).

Fixes: c443830a57 libmediaart: new package

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2:
* Change package prefix to BR2_PACKAGE_LIBMEDIAART as
  BR2_PACKAGE_MEDIAART is wrong (asked by Thomas).


Kind regards,
Petr
---
 package/libmediaart/Config.in      | 8 ++++----
 package/libmediaart/libmediaart.mk | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libmediaart/Config.in b/package/libmediaart/Config.in
index e5e770d4fc..e073677395 100644
--- a/package/libmediaart/Config.in
+++ b/package/libmediaart/Config.in
@@ -20,17 +20,17 @@ choice
 	prompt "media art backend"
 	default BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE
 
-config BR2_PACKAGE_MEDIAART_BACKEND_NONE
+config BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE
 	bool "none"
 	help
 	  With no backend, libmediaart will not be able to process MP3
 	  album art.
 
-config BR2_PACKAGE_MEDIAART_BACKEND_GDK_PIXBUF
+config BR2_PACKAGE_LIBMEDIAART_BACKEND_GDK_PIXBUF
 	bool "gdk-pixbuf"
 	select BR2_PACKAGE_GDK_PIXBUF
 
-config BR2_PACKAGE_MEDIAART_BACKEND_QT
+config BR2_PACKAGE_LIBMEDIAART_BACKEND_QT
 	bool "Qt"
 	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
@@ -41,4 +41,4 @@ comment "Qt backend depends on Qt or Qt5"
 
 endchoice
 
-endif # BR2_PACKAGE_MEDIAART
+endif # BR2_PACKAGE_LIBMEDIAART
diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
index db4f1fa2a1..f64210c266 100644
--- a/package/libmediaart/libmediaart.mk
+++ b/package/libmediaart/libmediaart.mk
@@ -15,12 +15,12 @@ LIBMEDIAART_INSTALL_STAGING = YES
 LIBMEDIAART_DEPENDENCIES = libglib2
 LIBMEDIAART_CONF_OPTS = --disable-unit-tests
 
-ifeq ($(BR2_PACKAGE_MEDIAART_BACKEND_GDK_PIXBUF),y)
+ifeq ($(BR2_PACKAGE_LIBMEDIAART_BACKEND_GDK_PIXBUF),y)
 LIBMEDIAART_DEPENDENCIES += gdk-pixbuf
 LIBMEDIAART_CONF_OPTS += \
 	--enable-gdkpixbuf \
 	--disable-qt
-else ifeq ($(BR2_PACKAGE_MEDIAART_BACKEND_QT),y)
+else ifeq ($(BR2_PACKAGE_LIBMEDIAART_BACKEND_QT),y)
 # qt5 needs c++11 (since qt-5.7)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 LIBMEDIAART_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
@@ -31,7 +31,7 @@ LIBMEDIAART_DEPENDENCIES += \
 LIBMEDIAART_CONF_OPTS += \
 	--disable-gdkpixbuf \
 	--enable-qt
-else ifeq ($(BR2_PACKAGE_MEDIAART_BACKEND_NONE),y)
+else ifeq ($(BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE),y)
 LIBMEDIAART_CONF_OPTS += \
 	--disable-gdkpixbuf \
 	--disable-qt
-- 
2.16.3
