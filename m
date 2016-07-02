From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 15:42:00 +0200
Subject: [Buildroot] [git commit] package/libdvdread: fix static compile by
	adding libdvdcss as dependency
Message-ID: <20160702134212.BB51E81999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7dd1b8ad113b56cac164df50f521e0684263624
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If libdvdcss support was not found during configure libdvdread tries
to open libdvdcss.so nonetheless:
https://code.videolan.org/videolan/libdvdread/blob/master/src/dvd_input.c#L275

This will obviously fail in a static-only configuration. To fix the
problem add libdvdcss as hard dependency to this package.

Fixes
http://autobuild.buildroot.net/results/415/41534b70a66c6297652f0944f9ecc7e780b26c45/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: replace += by =.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdvdread/Config.in     | 1 +
 package/libdvdread/libdvdread.mk | 9 ++-------
 2 files changed, 3 insertions(+), 7 deletions(-)

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
index b8541fa..c92eca5 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -10,12 +10,7 @@ LIBDVDREAD_SITE = http://www.videolan.org/pub/videolan/libdvdread/$(LIBDVDREAD_V
 LIBDVDREAD_INSTALL_STAGING = YES
 LIBDVDREAD_LICENSE = GPLv2+
 LIBDVDREAD_LICENSE_FILES = COPYING
-
-ifeq ($(BR2_PACKAGE_LIBDVDCSS),y)
-LIBDVDREAD_CONF_OPTS += --with-libdvdcss
-LIBDVDREAD_DEPENDENCIES += libdvdcss
-else
-LIBDVDREAD_CONF_OPTS += --without-libdvdcss
-endif
+LIBDVDREAD_CONF_OPTS = --with-libdvdcss
+LIBDVDREAD_DEPENDENCIES = libdvdcss
 
 $(eval $(autotools-package))
