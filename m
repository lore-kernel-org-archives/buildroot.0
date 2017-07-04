From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:42 +0200
Subject: [Buildroot] [PATCH 062/100] pango: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-63-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pango/Config.in | 1 -
 package/pango/pango.mk  | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/pango/Config.in b/package/pango/Config.in
index 7813c4e..dd2117a 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -11,7 +11,6 @@ config BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_HARFBUZZ
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	help
 	  Pango is a library for laying out and rendering of text, with an
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 2f2d580..7556f0b 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -17,7 +17,7 @@ PANGO_CONF_OPTS = --enable-explicit-deps=no
 HOST_PANGO_CONF_OPTS = --enable-explicit-deps=no
 
 PANGO_DEPENDENCIES = \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
+	$(TARGET_NLS_DEPENDENCIES) \
 	host-pkgconf \
 	libglib2 \
 	cairo \
-- 
2.9.4
