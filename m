From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 11 Aug 2011 11:57:41 +0200
Subject: [Buildroot] [PATCH] libsoup: add option to enable HTTPS (SSL)
	support
Message-ID: <1313056661-6090-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By selecting BR2_PACKAGE_LIBSOUP_SSL the gnutls package is selected
and libsoup will be compiled with SSL support.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/libsoup/Config.in  |    7 +++++++
 package/libsoup/libsoup.mk |    8 +++++++-
 2 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 2264b63..347687c 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -12,5 +12,12 @@ config BR2_PACKAGE_LIBSOUP
 
 	  http://live.gnome.org/LibSoup
 
+config BR2_PACKAGE_LIBSOUP_SSL
+	bool "https support"
+	select BR2_PACKAGE_GNUTLS
+	depends on BR2_PACKAGE_LIBSOUP
+	help
+	  Enable HTTPS (SSL) support.
+
 comment "libsoup requires a toolchain with WCHAR support"
 	depends on !BR2_USE_WCHAR
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 11bfadd..02db60a 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -19,9 +19,15 @@ endif
 LIBSOUP_CONF_OPT = \
 	--disable-explicit-deps \
 	--disable-glibtest	\
-	--disable-ssl		\
 	--without-gnome
 
 LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-pkg-config host-libglib2 libglib2 libxml2
 
+ifeq ($(BR2_PACKAGE_LIBSOUP_SSL),y)
+LIBSOUP_DEPENDENCIES += gnutls
+LIBSOUP_CONF_OPT += --enable-ssl --without-libgcrypt-prefix
+else
+LIBSOUP_CONF_OPT += --disable-ssl
+endif
+
 $(eval $(call AUTOTARGETS,package,libsoup))
-- 
1.7.4.1
