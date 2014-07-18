From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 21:38:08 +0200
Subject: [Buildroot] [git commit] libsoup: add libsoup-gnome support
Message-ID: <20140718193818.ECB329D270@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d017035c4b52d04a9f0eb20e12b73219e8aa88b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsoup can build a libsoup-gnome library. Add support for
libsoup-gnome as it is a dependency of Midori.

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsoup/Config.in  |    5 +++++
 package/libsoup/libsoup.mk |    8 +++++++-
 2 files changed, 12 insertions(+), 1 deletions(-)

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
