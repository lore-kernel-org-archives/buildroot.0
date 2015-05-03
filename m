From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 May 2015 11:44:13 +0200
Subject: [Buildroot] [git commit] package/efl/libevas: x-includes and
	x-libraries must be set for cross-compiling
Message-ID: <20150503094553.85F9C80160@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da50b6b61c4a566fd28888f5a3a6dcb06fe1b495
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

evas_engine_software_xlib_cflags and evas_engine_software_xlib_libs
contains unsafe libraries paths if x-include and x-libraries are
not set in libevas.mk.

config.log:
evas_engine_software_xlib_cflags='-I/usr/X11R6/include'
evas_engine_software_xlib_libs='-L/usr/X11R6/lib -lX11 -lXext'

Fixes:
http://autobuild.buildroot.net/results/e5f/e5fb1e62cb634b20233751b4ea3b0630de70e9e0/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libevas/libevas.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

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
