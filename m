From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 17:38:11 +0200
Subject: [Buildroot] [git commit] dropbear: unbundle libtomath & libtomcrypt
Message-ID: <20180428154800.2DF377FCD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf9b5522d1f8488b1c7e74822eff9f3ac69d8821
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

DROPBEAR_SMALL_CODE could be only honored with bundled libtomcrypt

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dropbear/Config.in   | 1 +
 package/dropbear/dropbear.mk | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index 6700778161..5d6b83b6d1 100644
--- a/package/dropbear/Config.in
+++ b/package/dropbear/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DROPBEAR
 	bool "dropbear"
 	select BR2_PACKAGE_ZLIB if !BR2_PACKAGE_DROPBEAR_SMALL
+	select BR2_PACKAGE_LIBTOMCRYPT if !BR2_PACKAGE_DROPBEAR_SMALL
 	help
 	  A small SSH 2 server designed for small memory environments.
 
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 10cb99b5e4..1da1a559a3 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -76,10 +76,11 @@ DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_REVERSE_DNS
 endif
 
 ifeq ($(BR2_PACKAGE_DROPBEAR_SMALL),y)
-DROPBEAR_CONF_OPTS += --disable-zlib
+DROPBEAR_CONF_OPTS += --disable-zlib --enable-bundled-libtom
 else
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_BUILD_FEATURED
-DROPBEAR_DEPENDENCIES += zlib
+DROPBEAR_DEPENDENCIES += zlib libtomcrypt
+DROPBEAR_CONF_OPTS += --disable-bundled-libtom
 endif
 
 ifneq ($(BR2_PACKAGE_DROPBEAR_WTMP),y)
