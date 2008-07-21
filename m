From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 21 Jul 2008 15:55:38 +0200
Subject: [Buildroot] [PATCH 1/2] lsdldoom: new package lsdldoom
Message-ID: <1216648539-19020-1-git-send-email-hans-christian.egtvedt@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a new package lsdldoom, this Doom client is based on the SDL
framework. An alternative to the lxdoom package.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
---
 package/Config.in                                  |    1 +
 package/lsdldoom/Config.in                         |    9 ++
 .../lsdldoom/lsdldoom-1.4.4.4-fix-c-syntax.patch   |  104 ++++++++++++++++++++
 package/lsdldoom/lsdldoom.mk                       |   23 +++++
 4 files changed, 137 insertions(+), 0 deletions(-)
 create mode 100644 package/lsdldoom/Config.in
 create mode 100644 package/lsdldoom/lsdldoom-1.4.4.4-fix-c-syntax.patch
 create mode 100644 package/lsdldoom/lsdldoom.mk

diff --git a/package/Config.in b/package/Config.in
index 2941033..e23acc0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -489,6 +489,7 @@ menuconfig BR2_GAMES
 	  Support for games
 
 if BR2_GAMES
+source "package/lsdldoom/Config.in"
 source "package/lxdoom/Config.in"
 source "package/ace_of_penguins/Config.in"
 source "package/gnuchess/Config.in"
diff --git a/package/lsdldoom/Config.in b/package/lsdldoom/Config.in
new file mode 100644
index 0000000..49191fa
--- /dev/null
+++ b/package/lsdldoom/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LSDLDOOM
+	bool "lsdldoom"
+	depends on BR2_PACKAGE_SDL
+	help
+	  This is the linux version of the popular doom game using the SDL
+	  library, lsdldoom is an alternative to the lxdoom package.
+
+	  It is recommended to add the SDL_mixer package for audio support, but
+	  it is not required.
diff --git a/package/lsdldoom/lsdldoom-1.4.4.4-fix-c-syntax.patch b/package/lsdldoom/lsdldoom-1.4.4.4-fix-c-syntax.patch
new file mode 100644
index 0000000..628ef63
--- /dev/null
+++ b/package/lsdldoom/lsdldoom-1.4.4.4-fix-c-syntax.patch
@@ -0,0 +1,104 @@
+Index: lsdldoom-1.4.4.4/src/d_main.c
+===================================================================
+--- lsdldoom-1.4.4.4.orig/src/d_main.c	2008-07-21 10:33:34.000000000 +0200
++++ lsdldoom-1.4.4.4/src/d_main.c	2008-07-21 10:36:16.000000000 +0200
+@@ -230,6 +230,7 @@
+     case GS_LEVEL:
+       V_SetPalette(0); // cph - use default (basic) palette  
+     default:
++      break;
+     }
+ 
+     switch (gamestate) {
+@@ -243,6 +244,7 @@
+       D_PageDrawer();
+       break;
+     default:
++      break;
+     }
+   } else if (gametic) { // In a level
+     boolean redrawborderstuff;
+Index: lsdldoom-1.4.4.4/src/g_game.c
+===================================================================
+--- lsdldoom-1.4.4.4.orig/src/g_game.c	2008-07-21 10:33:34.000000000 +0200
++++ lsdldoom-1.4.4.4/src/g_game.c	2008-07-21 10:34:06.000000000 +0200
+@@ -875,6 +875,7 @@
+     case GS_INTERMISSION:
+       WI_End();
+     default:
++      break;
+     }
+     prevgamestate = gamestate;
+   }
+Index: lsdldoom-1.4.4.4/src/p_maputl.h
+===================================================================
+--- lsdldoom-1.4.4.4.orig/src/p_maputl.h	2008-07-21 10:33:40.000000000 +0200
++++ lsdldoom-1.4.4.4/src/p_maputl.h	2008-07-21 10:46:35.000000000 +0200
+@@ -82,7 +82,7 @@
+ void    P_SetThingPosition(mobj_t *thing);
+ boolean P_BlockLinesIterator (int x, int y, boolean func(line_t *));
+ boolean P_BlockThingsIterator(int x, int y, boolean func(mobj_t *));
+-boolean ThingIsOnLine(const mobj_t *t, const line_t *l);  /* killough 3/15/98 */
++boolean CONSTFUNC ThingIsOnLine(const mobj_t *t, const line_t *l);  /* killough 3/15/98 */
+ boolean P_PathTraverse(fixed_t x1, fixed_t y1, fixed_t x2, fixed_t y2,
+                        int flags, boolean trav(intercept_t *));
+ 
+Index: lsdldoom-1.4.4.4/src/r_segs.c
+===================================================================
+--- lsdldoom-1.4.4.4.orig/src/r_segs.c	2008-07-21 10:33:35.000000000 +0200
++++ lsdldoom-1.4.4.4/src/r_segs.c	2008-07-21 10:35:47.000000000 +0200
+@@ -47,9 +47,9 @@
+ // killough 1/6/98: replaced globals with statics where appropriate
+ 
+ // True if any of the segs textures might be visible.
+-static boolean  segtextured;
+-static boolean  markfloor;      // False if the back side is the same plane.
+-static boolean  markceiling;
++boolean         segtextured;
++boolean         markfloor;      // False if the back side is the same plane.
++boolean         markceiling;
+ static boolean  maskedtexture;
+ static int      toptexture;
+ static int      bottomtexture;
+@@ -65,8 +65,8 @@
+ //
+ // regular wall
+ //
+-static int      rw_x;
+-static int      rw_stopx;
++int             rw_x;
++int             rw_stopx;
+ static angle_t  rw_centerangle;
+ static fixed_t  rw_offset;
+ static fixed_t  rw_scale;
+Index: lsdldoom-1.4.4.4/src/wi_stuff.c
+===================================================================
+--- lsdldoom-1.4.4.4.orig/src/wi_stuff.c	2008-07-21 10:33:35.000000000 +0200
++++ lsdldoom-1.4.4.4/src/wi_stuff.c	2008-07-21 10:45:41.000000000 +0200
+@@ -368,7 +368,7 @@
+ static const patch_t  * frags;
+ 
+ // Time sucks.
+-static const patch_t  * time;
++static const patch_t  * witime;
+ static const patch_t  * par;
+ static const patch_t  * sucks;
+ 
+@@ -806,7 +806,7 @@
+ 
+ static void WI_drawTimeStats(int cnt_time, int cnt_total_time, int cnt_par)
+ {
+-  V_DrawMemPatch(SP_TIMEX, SP_TIMEY, FB, time, NULL, VPT_STRETCH);
++  V_DrawMemPatch(SP_TIMEX, SP_TIMEY, FB, witime, NULL, VPT_STRETCH);
+   WI_drawTime(320/2 - SP_TIMEX, SP_TIMEY, cnt_time);
+ 
+   V_DrawMemPatch(SP_TIMEX, (SP_TIMEY+200)/2, FB, total, NULL, VPT_STRETCH);
+@@ -1790,7 +1790,7 @@
+   { "WIOSTI", &items },
+   { "WIFRGS", &frags },
+   { "WICOLON",&colon },
+-  { "WITIME", &time  },
++  { "WITIME", &witime  },
+   { "WISUCKS",&sucks },
+   { "WIPAR",  &par   },
+   { "WIKILRS",&killers},
diff --git a/package/lsdldoom/lsdldoom.mk b/package/lsdldoom/lsdldoom.mk
new file mode 100644
index 0000000..464eef8
--- /dev/null
+++ b/package/lsdldoom/lsdldoom.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# lsdldoom
+#
+#############################################################
+
+LSDLDOOM_VERSION = 1.4.4.4
+LSDLDOOM_SOURCE = lsdldoom-$(LSDLDOOM_VERSION).tar.gz
+LSDLDOOM_SITE = http://firehead.org/~jessh/lsdldoom/src
+LSDLDOOM_AUTORECONF = NO
+LSDLDOOM_INSTALL_STAGING = NO
+LSDLDOOM_INSTALL_TARGET = YES
+LSDLDOOM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+
+LSDLDOOM_MAKE_ENV = CC=$(TARGET_CC)
+
+LSDLDOOM_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) --prefix=/usr \
+		$(DISABLE_NLS)
+
+LSDLDOOM_DEPENDENCIES = sdl
+
+$(eval $(call AUTOTARGETS,package,lsdldoom))
-- 
1.5.4.3
