From: Romain Naour <romain.naour@openwide.fr>
Date: Sat,  2 May 2015 22:16:36 +0200
Subject: [Buildroot] [PATCH] package/efl/libevas: x-includes and x-libraries
	must be set for cross-compiling
Message-ID: <1430597796-23584-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

evas_engine_software_xlib_cflags and evas_engine_software_xlib_libs
contains unsafe libraries paths if x-include and x-libraries are
not set in libevas.mk.

config.log:
evas_engine_software_xlib_cflags='-I/usr/X11R6/include'
evas_engine_software_xlib_libs='-L/usr/X11R6/lib -lX11 -lXext'

Fixes:
http://autobuild.buildroot.net/results/e5f/e5fb1e62cb634b20233751b4ea3b0630de70e9e0/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/efl/libevas/libevas.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 8312902..8113162 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -63,7 +63,10 @@ LIBEVAS_CONF_OPTS += --enable-buffer
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_X11),y)
-LIBEVAS_CONF_OPTS += --enable-software-xlib
+LIBEVAS_CONF_OPTS += --enable-software-xlib \
+	--with-x=$(STAGING_DIR) \
+	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-libraries=$(STAGING_DIR)/usr/lib
 LIBEVAS_DEPENDENCIES += xlib_libX11 xlib_libXext
 else
 LIBEVAS_CONF_OPTS += --disable-software-xlib
-- 
1.9.3
