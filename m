From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Apr 2014 14:12:40 -0300
Subject: [Buildroot] [PATCH] freetype: security bump to version 2.5.3
Message-ID: <1398186760-1174-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-2240.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/freetype/freetype.mk | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 31f8204..2f8d497 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.5.2
+FREETYPE_VERSION = 2.5.3
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
 FREETYPE_INSTALL_STAGING = YES
@@ -17,6 +17,18 @@ FREETYPE_CONFIG_SCRIPTS = freetype-config
 HOST_FREETYPE_DEPENDENCIES = host-pkgconf
 HOST_FREETYPE_CONF_OPT = --without-zlib --without-bzip2 --without-png
 
+# Regen required because the tarball ships with an experimental ltmain.sh
+# that can't be patched by our infra.
+# autogen.sh is because autotools stuff lives in other directories and
+# even AUTORECONF with _OPT doesn't do it properly.
+# POST_PATCH is because we still need to patch libtool after the regen.
+define FREETYPE_RUN_AUTOGEN
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+FREETYPE_POST_PATCH_HOOKS += FREETYPE_RUN_AUTOGEN
+FREETYPE_DEPENDENCIES += host-automake host-autoconf host-libtool
+HOST_FREETYPE_DEPENDENCIES += host-automake host-autoconf host-libtool
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 FREETYPE_DEPENDENCIES += zlib
 FREETYPE_CONF_OPT += --with-zlib
-- 
1.8.3.2
