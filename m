From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 31 Aug 2010 23:14:47 +0200
Subject: [Buildroot] [git commit master 1/1] package/games: remove broken
	lxdoom package
Message-ID: <20100831211658.5CB158A2FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1424ff1c147d01028028b921636a8e91c4badb18
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's deprecated upstream (merged in prboom), not updated in years and
broken (uses host includes / missing dependencies), so remove it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                         |    2 +
 package/Config.in                               |    1 -
 package/games/doom-wad/Config.in                |    2 +-
 package/games/lxdoom/Config.in                  |    5 -
 package/games/lxdoom/lxdoom-1.4.4-updated.patch |  173 -----------------------
 package/games/lxdoom/lxdoom.mk                  |   19 ---
 6 files changed, 3 insertions(+), 199 deletions(-)
 delete mode 100644 package/games/lxdoom/Config.in
 delete mode 100644 package/games/lxdoom/lxdoom-1.4.4-updated.patch
 delete mode 100644 package/games/lxdoom/lxdoom.mk

diff --git a/CHANGES b/CHANGES
index 904a92f..0c983f3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,6 +4,8 @@
 
 	Updated/fixed packages: atk, xstroke
 
+	Removed packages: lxdoom
+
 2010.08-rc2, Released August 30th, 2010:
 
 	Fixes all over the tree.
diff --git a/package/Config.in b/package/Config.in
index d8a730d..d60d8ef 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -77,7 +77,6 @@ menu "Games"
 source "package/games/ace_of_penguins/Config.in"
 source "package/games/gnuchess/Config.in"
 source "package/games/magiccube4d/Config.in"
-source "package/games/lxdoom/Config.in"
 source "package/games/prboom/Config.in"
 source "package/games/doom-wad/Config.in"
 source "package/games/rubix/Config.in"
diff --git a/package/games/doom-wad/Config.in b/package/games/doom-wad/Config.in
index 2ca9ec1..aa1d029 100644
--- a/package/games/doom-wad/Config.in
+++ b/package/games/doom-wad/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_DOOM_WAD
 	bool "shareware Doom WAD file"
-	depends on BR2_PACKAGE_LXDOOM || BR2_PACKAGE_PRBOOM
+	depends on BR2_PACKAGE_PRBOOM
 	help
 	  This will install the shareware wad data file for the doom game.
 
diff --git a/package/games/lxdoom/Config.in b/package/games/lxdoom/Config.in
deleted file mode 100644
index ebef9f5..0000000
--- a/package/games/lxdoom/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_LXDOOM
-	bool "lxdoom"
-	depends on BR2_PACKAGE_XORG7
-	help
-	  This is the linux version of the popular doom game.
diff --git a/package/games/lxdoom/lxdoom-1.4.4-updated.patch b/package/games/lxdoom/lxdoom-1.4.4-updated.patch
deleted file mode 100644
index cbb4a0a..0000000
--- a/package/games/lxdoom/lxdoom-1.4.4-updated.patch
+++ /dev/null
@@ -1,173 +0,0 @@
-diff -Nrup lxdoom-1.4.4/src/m_menu.c lxdoom-1.4.4-avr32/src/m_menu.c
---- a/src/m_menu.c	2000-03-17 15:50:30.000000000 -0500
-+++ b/src/m_menu.c	2007-10-22 17:18:43.000000000 -0400
-@@ -38,6 +38,7 @@ rcsid[] = "$Id: m_menu.c,v 1.24 2000/03/
- 
- #include <fcntl.h>
- #include <unistd.h>
-+#include <bits/posix1_lim.h>
- 
- #include "doomdef.h"
- #include "doomstat.h"
-diff -Nrup lxdoom-1.4.4/src/p_maputl.c lxdoom-1.4.4-avr32/src/p_maputl.c
---- a/src/p_maputl.c	1999-10-12 09:01:13.000000000 -0400
-+++ b/src/p_maputl.c	2007-10-22 17:20:56.000000000 -0400
-@@ -322,7 +322,7 @@ void P_SetThingPosition(mobj_t *thing)
- //
- // A fast function for testing intersections between things and linedefs.
- 
--boolean CONSTFUNC ThingIsOnLine(const mobj_t *t, const line_t *l)
-+boolean ThingIsOnLine(const mobj_t *t, const line_t *l)
- {
-   int dx = l->dx >> FRACBITS;                             // Linedef vector
-   int dy = l->dy >> FRACBITS;
-diff -Nrup lxdoom-1.4.4/src/r_data.c lxdoom-1.4.4-avr32/src/r_data.c
---- a/src/r_data.c	2000-01-25 17:40:45.000000000 -0500
-+++ b/src/r_data.c	2007-10-22 17:19:29.000000000 -0400
-@@ -38,6 +38,7 @@ rcsid[] = "$Id: r_data.c,v 1.13 2000/01/
- #include "r_main.h"
- #include "r_sky.h"
- #include "lprintf.h"  // jff 08/03/98 - declaration of lprintf
-+#include <bits/posix1_lim.h>
- 
- //
- // Graphics.
-diff -Nrup lxdoom-1.4.4/src/r_segs.c lxdoom-1.4.4-avr32/src/r_segs.c
---- a/src/r_segs.c	1999-10-17 04:52:04.000000000 -0400
-+++ b/src/r_segs.c	2007-10-22 17:14:46.000000000 -0400
-@@ -47,15 +47,15 @@ rcsid[] = "$Id: r_segs.c,v 1.14 1999/10/
- // killough 1/6/98: replaced globals with statics where appropriate
- 
- // True if any of the segs textures might be visible.
--static boolean  segtextured;
--static boolean  markfloor;      // False if the back side is the same plane.
--static boolean  markceiling;
--static boolean  maskedtexture;
--static int      toptexture;
--static int      bottomtexture;
--static int      midtexture;
-+boolean  segtextured;
-+boolean  markfloor;      // False if the back side is the same plane.
-+boolean  markceiling;
-+boolean  maskedtexture;
-+int      toptexture;
-+int      bottomtexture;
-+int      midtexture;
- 
--static fixed_t  toptexheight, midtexheight, bottomtexheight; // cph
-+fixed_t  toptexheight, midtexheight, bottomtexheight; // cph
- 
- angle_t         rw_normalangle; // angle to line origin
- int             rw_angle1;
-@@ -65,28 +65,28 @@ lighttable_t    **walllights;
- //
- // regular wall
- //
--static int      rw_x;
--static int      rw_stopx;
--static angle_t  rw_centerangle;
--static fixed_t  rw_offset;
--static fixed_t  rw_scale;
--static fixed_t  rw_scalestep;
--static fixed_t  rw_midtexturemid;
--static fixed_t  rw_toptexturemid;
--static fixed_t  rw_bottomtexturemid;
--static int      worldtop;
--static int      worldbottom;
--static int      worldhigh;
--static int      worldlow;
--static fixed_t  pixhigh;
--static fixed_t  pixlow;
--static fixed_t  pixhighstep;
--static fixed_t  pixlowstep;
--static fixed_t  topfrac;
--static fixed_t  topstep;
--static fixed_t  bottomfrac;
--static fixed_t  bottomstep;
--static short    *maskedtexturecol;
-+int      rw_x;
-+int      rw_stopx;
-+angle_t  rw_centerangle;
-+fixed_t  rw_offset;
-+fixed_t  rw_scale;
-+fixed_t  rw_scalestep;
-+fixed_t  rw_midtexturemid;
-+fixed_t  rw_toptexturemid;
-+fixed_t  rw_bottomtexturemid;
-+int      worldtop;
-+int      worldbottom;
-+int      worldhigh;
-+int      worldlow;
-+fixed_t  pixhigh;
-+fixed_t  pixlow;
-+fixed_t  pixhighstep;
-+fixed_t  pixlowstep;
-+fixed_t  topfrac;
-+fixed_t  topstep;
-+fixed_t  bottomfrac;
-+fixed_t  bottomstep;
-+short    *maskedtexturecol;
- 
- //
- // R_ScaleFromGlobalAngle
---- a/src/wi_stuff.c	2008-02-12 14:02:42.000000000 -0500
-+++ b/src/wi_stuff.c	2008-02-12 14:04:34.000000000 -0500
-@@ -368,7 +368,7 @@ static const patch_t  * items;
- static const patch_t  * frags;
- 
- // Time sucks.
--static const patch_t  * time;
-+static const patch_t  * mytime;
- static const patch_t  * par;
- static const patch_t  * sucks;
-
-diff -Nrup lxdoom-1.4.4/src/d_main.c lxdoom-1.4.4-avr32/src/d_main.c
---- a/src/d_main.c	2000-03-27 05:33:49.000000000 -0500
-+++ b/src/d_main.c	2007-10-22 17:18:05.000000000 -0400
-@@ -39,7 +39,7 @@ static const char rcsid[] = "$Id: d_main
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <fcntl.h>
--
-+#include <bits/posix1_lim.h>
- #include "doomdef.h"
- #include "doomstat.h"
- #include "dstrings.h"
-@@ -228,7 +228,7 @@ void D_Display (void)
-     case -1:
-     case GS_LEVEL:
-       V_SetPalette(0); // cph - use default (basic) palette  
--    default:
-+    default:;
-     }
- 
-     switch (gamestate) {
-@@ -241,7 +241,7 @@ void D_Display (void)
-     case GS_DEMOSCREEN:
-       D_PageDrawer();
-       break;
--    default:
-+    default:;
-     }
-   } else if (gametic) { // In a level
-     boolean redrawborderstuff;
-diff -Nrup lxdoom-1.4.4/src/g_game.c lxdoom-1.4.4-avr32/src/g_game.c
---- a/src/g_game.c	2000-03-17 15:50:30.000000000 -0500
-+++ b/src/g_game.c	2007-10-22 17:18:10.000000000 -0400
-@@ -67,6 +67,7 @@ rcsid[] = "$Id: g_game.c,v 1.36 2000/03/
- #include "lprintf.h"
- #include "i_main.h"
- #include "i_system.h"
-+#include <bits/posix1_lim.h>
- 
- #define SAVEGAMESIZE  0x20000
- #define SAVESTRINGSIZE  24
-@@ -868,7 +869,7 @@ void G_Ticker (void)
-     switch (prevgamestate) {
-     case GS_INTERMISSION:
-       WI_End();
--    default:
-+    default:;
-     }
-     prevgamestate = gamestate;
-   } 
\ No newline at end of file
diff --git a/package/games/lxdoom/lxdoom.mk b/package/games/lxdoom/lxdoom.mk
deleted file mode 100644
index b9584b1..0000000
--- a/package/games/lxdoom/lxdoom.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-#############################################################
-#
-# lxdoom
-#
-#############################################################
-LXDOOM_VERSION = 1.4.4
-LXDOOM_SOURCE = lxdoom-$(LXDOOM_VERSION).tar.gz
-LXDOOM_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/lxdoom
-LXDOOM_INSTALL_STAGING = NO
-LXDOOM_INSTALL_TARGET = YES
-LXDOOM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-
-LXDOOM_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) --prefix=/usr \
-		--includedir=/usr/include --enable-shared
-
-LXDOOM_DEPENDENCIES = xserver_xorg-server
-
-$(eval $(call AUTOTARGETS,package/games,lxdoom))
-- 
1.7.1
