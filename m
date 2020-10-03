From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2020 08:33:13 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/freetype: drop
 libpng workaround
Message-ID: <20201003064010.7BA7D8FBAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8cd7dac2329a5508544549e588f6001c3f6b3dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

libpng workaround which has been added with commit
f7313cadf2ca9e0195a873f62f6b6c38a58a3630 is not needed since version
2.5.3 and
https://git.savannah.gnu.org/cgit/freetype/freetype2.git/commit/?id=00c79ed9680a0d7a367c6914adc7485391299542

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 005a3437a5eee0300f6a8d9974d7a94e5ef723ac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.mk | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 516d1c0cfc..428531ed08 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -37,9 +37,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 FREETYPE_DEPENDENCIES += libpng
-FREETYPE_CONF_OPTS += LIBPNG_CFLAGS="`$(STAGING_DIR)/usr/bin/libpng-config --cflags`" \
-	LIBPNG_LDFLAGS="`$(STAGING_DIR)/usr/bin/libpng-config --ldflags`"
-FREETYPE_LIBPNG_LIBS = "`$(STAGING_DIR)/usr/bin/libpng-config --libs`"
+FREETYPE_CONF_OPTS += --with-png
 else
 FREETYPE_CONF_OPTS += --without-png
 endif
@@ -52,14 +50,5 @@ define FREETYPE_FIX_CONFIG_FILE
 endef
 FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FIX_CONFIG_FILE
 
-# libpng isn't included in freetype-config & freetype2.pc :-/
-define FREETYPE_FIX_CONFIG_FILE_LIBS
-	$(SED) "s,^Libs.private:,& $(FREETYPE_LIBPNG_LIBS)," \
-		$(STAGING_DIR)/usr/lib/pkgconfig/freetype2.pc
-	$(SED) "s,-lfreetype,& $(FREETYPE_LIBPNG_LIBS)," \
-		$(STAGING_DIR)/usr/bin/freetype-config
-endef
-FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FIX_CONFIG_FILE_LIBS
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
