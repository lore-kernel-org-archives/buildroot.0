From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 13 Jul 2011 18:58:43 +0200
Subject: [Buildroot] [PATCH 1/2] libsoup: update to version 2.32.2 and
	enable SSL support
Message-ID: <1310576324-9603-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SSL support is enabled if gnutls is enabled.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/libsoup/libsoup.mk |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 6ec0882..697f426 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBSOUP_MAJOR_VERSION:=2.31
+LIBSOUP_MAJOR_VERSION:=2.32
 LIBSOUP_VERSION:=$(LIBSOUP_MAJOR_VERSION).2
 LIBSOUP_SOURCE:=libsoup-$(LIBSOUP_VERSION).tar.bz2
 LIBSOUP_SITE:=http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_MAJOR_VERSION)
@@ -19,9 +19,15 @@ endif
 LIBSOUP_CONF_OPT = \
 	--disable-explicit-deps \
 	--disable-glibtest	\
-	--disable-ssl		\
 	--without-gnome
 
 LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-pkg-config host-libglib2 libglib2 libxml2
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LIBSOUP_DEPENDENCIES += gnutls
+LIBSOUP_CONF_OPT += --enable-ssl
+else
+LIBSOUP_CONF_OPT += --disable-ssl
+endif
+
 $(eval $(call AUTOTARGETS,package,libsoup))
-- 
1.7.1
