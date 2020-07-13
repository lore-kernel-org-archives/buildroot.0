From: Aaron Sierra <asierra@xes-inc.com>
Date: Mon, 13 Jul 2020 13:47:50 -0500
Subject: [Buildroot] [PATCH RESEND 1/2] package/x11r7/xapp_mkfontscale:
 support bzip2
In-Reply-To: <20200713184751.23534-1-asierra@xes-inc.com>
References: <20200713184751.23534-1-asierra@xes-inc.com>
Message-ID: <20200713184751.23534-2-asierra@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support bzip2 compression for PCF fonts, since gzip is not reproducible
due to its use of -N/--name by default.

Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 package/x11r7/xapp_mkfontscale/Config.in           | 1 +
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_mkfontscale/Config.in b/package/x11r7/xapp_mkfontscale/Config.in
index d0a9d89658..02eff4f9f1 100644
--- a/package/x11r7/xapp_mkfontscale/Config.in
+++ b/package/x11r7/xapp_mkfontscale/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_MKFONTSCALE
 	bool "mkfontscale"
+	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBFONTENC
diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
index 11d9cc952f..96cde6b942 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
@@ -9,9 +9,11 @@ XAPP_MKFONTSCALE_SOURCE = mkfontscale-$(XAPP_MKFONTSCALE_VERSION).tar.bz2
 XAPP_MKFONTSCALE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_MKFONTSCALE_LICENSE = MIT
 XAPP_MKFONTSCALE_LICENSE_FILES = COPYING
-XAPP_MKFONTSCALE_DEPENDENCIES = zlib freetype xlib_libfontenc xorgproto
+XAPP_MKFONTSCALE_CONF_OPTS = --with-bzip2
+XAPP_MKFONTSCALE_DEPENDENCIES = bzip2 zlib freetype xlib_libfontenc xorgproto
+HOST_XAPP_MKFONTSCALE_CONF_OPTS = --with-bzip2
 HOST_XAPP_MKFONTSCALE_DEPENDENCIES = \
-	host-zlib host-freetype host-xlib_libfontenc host-xorgproto
+	host-bzip2 host-zlib host-freetype host-xlib_libfontenc host-xorgproto
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.17.1
