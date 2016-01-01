From: Romain Naour <romain.naour@gmail.com>
Date: Fri,  1 Jan 2016 19:08:03 +0100
Subject: [Buildroot] [PATCH] package/dillo: enable jpeg support only with
	libjpeg provider
Message-ID: <1451671683-10101-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dillo add libjpeg to his dependencies when the virtual package
jpeg is selected. This is wrong because jpeg-turbo can be
selected instead of libjpeg. So the build of libjpeg can be
trigged at Makefile level when jpeg-turbo is selected at
Config.in level by the user.

Since 28f67899e54f15c6e48484ea2976c3e431756bcb, the build
stop if a package build is trigged at Makefile level without
being selected at Config.in level.

Use a dependency on the jpeg provider intead of the virtual
package.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/dillo/dillo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
index 8eb8d88..45fd611 100644
--- a/package/dillo/dillo.mk
+++ b/package/dillo/dillo.mk
@@ -30,7 +30,7 @@ else
 DILLO_CONF_OPTS += --disable-png
 endif
 
-ifeq ($(BR2_PACKAGE_JPEG),y)
+ifeq ($(BR2_PACKAGE_LIBJPEG),y)
 DILLO_CONF_OPTS += --enable-jpeg
 DILLO_DEPENDENCIES += libjpeg
 else
-- 
2.4.3
