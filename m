From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 21 May 2019 00:47:38 +0200
Subject: [Buildroot] [PATCH] package/chocolate-doom: fix BUG_85180 build
 timeout
Message-ID: <20190520224738.116874-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x build hangs on compiling last files
before linking.
This is due to bug 85180:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
Bug shows up building chocolate-doom with optimization but not when
building with -O0.

If BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 passing it to
CFLAGS.

Fixes:
http://autobuild.buildroot.net/results/e57/e570839576be8963dc6bd36342e2f857da3c6146/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/chocolate-doom/chocolate-doom.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/chocolate-doom/chocolate-doom.mk b/package/chocolate-doom/chocolate-doom.mk
index 54121c43aa..5f2c28cdd9 100644
--- a/package/chocolate-doom/chocolate-doom.mk
+++ b/package/chocolate-doom/chocolate-doom.mk
@@ -21,6 +21,10 @@ CHOCOLATE_DOOM_CONF_OPTS = \
 	--with-sdl-prefix=$(STAGING_DIR)/usr \
 	--with-sdl-exec-prefix=$(STAGING_DIR)/usr
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+CHOCOLATE_DOOM_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 CHOCOLATE_DOOM_DEPENDENCIES += libpng
 CHOCOLATE_DOOM_CONF_OPTS += --with-libpng
-- 
2.17.1
