From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Nov 2020 22:58:05 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/wine: update
 optional dependencies for 5.12
Message-ID: <20201102214535.24AE986376@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48bd20b2b45114c86aa95f0e552ac9ad42f21b46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

wine was bumped to 5.12 in commit
6daf15db41c1d9c97a4fe7d6233a2cbe06f88db1, but a few changes in
optional dependencies were not taken into account:

 - A new optional dependency on libusb exists

 - The option name to use libv4l has been changed

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e9f0125bed2e0cde62d3922ebf4d30d742f2410c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wine/wine.mk | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 7d7b22a137..7eafe9b06d 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -145,11 +145,18 @@ else
 WINE_CONF_OPTS += --without-png
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+WINE_CONF_OPTS += --with-usb
+WINE_DEPENDENCIES += libusb
+else
+WINE_CONF_OPTS += --without-usb
+endif
+
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
-WINE_CONF_OPTS += --with-v4l
+WINE_CONF_OPTS += --with-v4l2
 WINE_DEPENDENCIES += libv4l
 else
-WINE_CONF_OPTS += --without-v4l
+WINE_CONF_OPTS += --without-v4l2
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
@@ -386,7 +393,8 @@ HOST_WINE_CONF_OPTS += \
 	--without-sane \
 	--without-sdl \
 	--without-tiff \
-	--without-v4l \
+	--without-usb \
+	--without-v4l2 \
 	--without-vkd3d \
 	--without-vulkan \
 	--without-x \
