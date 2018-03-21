From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 21 Mar 2018 17:03:29 +0100
Subject: [Buildroot] [V3 2/2] dropbear: unbundle libtomath & libtomcrypt
In-Reply-To: <20180321160329.20768-1-francois.perrad@gadz.org>
References: <20180321160329.20768-1-francois.perrad@gadz.org>
Message-ID: <20180321160329.20768-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DROPBEAR_SMALL_CODE could be only honored with bundled libtomcrypt

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/dropbear/Config.in   | 1 +
 package/dropbear/dropbear.mk | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
index 670077816..5d6b83b6d 100644
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
index 634396dc0..e32bdc758 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -63,10 +63,11 @@ DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_REVERSE_DNS
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
-- 
2.11.0
