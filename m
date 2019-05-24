From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 May 2019 21:39:50 +0200
Subject: [Buildroot] [git commit] package/chocolate-doom: work around gcc
 bug 85180
Message-ID: <20190524193402.6ED5A8DAF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f20f59c4cc4187258e3fc7d19be4dccf3dfc837f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With Microblaze Gcc version < 8.x the build hangs due to bug 85180:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug shows up
when building chocolate-doom with optimization but not when building
with -O0. To work around this bug, if
BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y, we force using -O0.

Fixes:

  http://autobuild.buildroot.net/results/e570839576be8963dc6bd36342e2f857da3c6146/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
[Thomas: tweak CFLAGS logic, improve commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/chocolate-doom/chocolate-doom.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/chocolate-doom/chocolate-doom.mk b/package/chocolate-doom/chocolate-doom.mk
index 54121c43aa..8c16a7fa30 100644
--- a/package/chocolate-doom/chocolate-doom.mk
+++ b/package/chocolate-doom/chocolate-doom.mk
@@ -21,6 +21,14 @@ CHOCOLATE_DOOM_CONF_OPTS = \
 	--with-sdl-prefix=$(STAGING_DIR)/usr \
 	--with-sdl-exec-prefix=$(STAGING_DIR)/usr
 
+CHOCOLATE_DOOM_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+CHOCOLATE_DOOM_CFLAGS += -O0
+endif
+
+CHOCOLATE_DOOM_CONF_ENV += CFLAGS="$(CHOCOLATE_DOOM_CFLAGS)"
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 CHOCOLATE_DOOM_DEPENDENCIES += libpng
 CHOCOLATE_DOOM_CONF_OPTS += --with-libpng
