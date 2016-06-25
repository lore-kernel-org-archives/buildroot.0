From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Jun 2016 09:49:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdvdread: fix static compile by
	adding libdvdcss as dependency
Message-ID: <1466840953-28255-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If libdvdcss support was not found during configure libdvdread tries
to open libdvdcss.so nonetheless:
https://code.videolan.org/videolan/libdvdread/blob/master/src/dvd_input.c#L275

This will obviously fail in a static-only configuration. To fix the
problem add libdvdcss as hard dependency to this package.

Fixes
http://autobuild.buildroot.net/results/415/41534b70a66c6297652f0944f9ecc7e780b26c45/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdvdread/Config.in     | 1 +
 package/libdvdread/libdvdread.mk | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/libdvdread/Config.in b/package/libdvdread/Config.in
index dea59eb..91bec83 100644
--- a/package/libdvdread/Config.in
+++ b/package/libdvdread/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBDVDREAD
 	bool "libdvdread"
+	select BR2_PACKAGE_LIBDVDCSS
 	help
 	  libdvdread provides a simple foundation for reading
 	  DVD-Video images.
diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index b8541fa..c1ee6f6 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -10,12 +10,7 @@ LIBDVDREAD_SITE = http://www.videolan.org/pub/videolan/libdvdread/$(LIBDVDREAD_V
 LIBDVDREAD_INSTALL_STAGING = YES
 LIBDVDREAD_LICENSE = GPLv2+
 LIBDVDREAD_LICENSE_FILES = COPYING
-
-ifeq ($(BR2_PACKAGE_LIBDVDCSS),y)
 LIBDVDREAD_CONF_OPTS += --with-libdvdcss
 LIBDVDREAD_DEPENDENCIES += libdvdcss
-else
-LIBDVDREAD_CONF_OPTS += --without-libdvdcss
-endif
 
 $(eval $(autotools-package))
-- 
2.8.1
