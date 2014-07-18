From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Fri, 18 Jul 2014 17:39:38 +0200
Subject: [Buildroot] [PATCH v2 3/4] libsoup: add libsoup-gnome support
In-Reply-To: <1405697979-23957-1-git-send-email-hadrien.boutteville@gmail.com>
References: <1405697979-23957-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <1405697979-23957-4-git-send-email-hadrien.boutteville@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libsoup can build a libsoup-gnome library. Add support for
libsoup-gnome as it is a dependency of Midori.

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libsoup/Config.in  | 5 +++++
 package/libsoup/libsoup.mk | 8 +++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 874f50c..bc0ba95 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -15,6 +15,11 @@ config BR2_PACKAGE_LIBSOUP
 
 if BR2_PACKAGE_LIBSOUP
 
+config BR2_PACKAGE_LIBSOUP_GNOME
+	bool "libsoup-gnome"
+	help
+	  Build libsoup-gnome library.
+
 config BR2_PACKAGE_LIBSOUP_SSL
 	bool "https support"
 	select BR2_PACKAGE_GLIB_NETWORKING
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 11585c8..abc8ac5 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -18,11 +18,17 @@ ifneq ($(BR2_INET_IPV6),y)
 LIBSOUP_CONF_ENV += soup_cv_ipv6=no
 endif
 
-LIBSOUP_CONF_OPT = --disable-glibtest --without-gnome
+LIBSOUP_CONF_OPT = --disable-glibtest
 
 LIBSOUP_DEPENDENCIES = host-pkgconf host-libglib2 \
        libglib2 libxml2 sqlite host-intltool
 
+ifeq ($(BR2_PACKAGE_LIBSOUP_GNOME),y)
+LIBSOUP_CONF_OPT += --with-gnome
+else
+LIBSOUP_CONF_OPT += --without-gnome
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSOUP_SSL),y)
 LIBSOUP_DEPENDENCIES += glib-networking
 else
-- 
2.0.1
