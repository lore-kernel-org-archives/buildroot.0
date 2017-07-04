From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:28:46 +0200
Subject: [Buildroot] [git commit] pango: use the new gettext logic
Message-ID: <20170704233518.3A5767FB2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdef565cd6437d54f245563241e4a8e3f57fd489
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
