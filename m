From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Sep 2020 18:51:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/pdmenu: fix build with gcc 10
Message-ID: <20200912165119.324752-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/78946a381f9f70975b41d24b0b050ba2073d6ef8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../pdmenu/0003-fix-build-with-gcc-10.patch   | 191 ++++++++++++++++++
 1 file changed, 191 insertions(+)
 create mode 100644 package/pdmenu/0003-fix-build-with-gcc-10.patch

diff --git a/package/pdmenu/0003-fix-build-with-gcc-10.patch b/package/pdmenu/0003-fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..428f05f57a
--- /dev/null
+++ b/package/pdmenu/0003-fix-build-with-gcc-10.patch
@@ -0,0 +1,191 @@
+From f0143217767eab5f7bf268204a4ed97fae654db7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 12 Sep 2020 10:14:31 +0200
+Subject: [PATCH] fix build with gcc 10
+
+Defines variables as extern in headers to avoid the following build
+failure with gcc 10 (which defaults to -fno-common):
+
+/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: src/error.o:(.bss+0x0): multiple definition of `ScreenTitle'; src/actions.o:(.bss+0x94): first defined here
+/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: src/error.o:(.bss+0x4): multiple definition of `BG'; src/actions.o:(.bss+0x98): first defined here
+/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: src/error.o:(.bss+0x79): multiple definition of `FG'; src/actions.o:(.bss+0x10d): first defined here
+/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: src/error.o:(.bss+0xf0): multiple definition of `Superhot'; src/actions.o:(.bss+0x184): first defined here
+/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: src/error.o:(.bss+0xf4): multiple definition of `Numeric'; src/actions.o:(.bss+0x188): first defined here
+/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: src/error.o:(.bss+0xf8): multiple definition of `Lowbit'; src/actions.o:(.bss+0x18c): first defined here
+/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: src/error.o:(.bss+0xfc): multiple definition of `Retro'; src/actions.o:(.bss+0x190): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/78946a381f9f70975b41d24b0b050ba2073d6ef8
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: Joey Hess <joeyh@joeyh.name>]
+---
+ src/global.h | 26 +++++++++++++-------------
+ src/menu.c   | 11 +++++++++++
+ src/menu.h   | 20 ++++++++++----------
+ src/pdmenu.c | 17 +++++++++++++++++
+ src/screen.c |  5 +++++
+ src/screen.h |  6 +++---
+ 6 files changed, 59 insertions(+), 26 deletions(-)
+
+diff --git a/src/global.h b/src/global.h
+index 481dd42..ef4a5ba 100644
+--- a/src/global.h
++++ b/src/global.h
+@@ -14,27 +14,27 @@
+ /* Global variables */
+ 
+ /* Pointer to linked list of all windows on the screen */
+-Window_List_Type *CurrentWindow;
++extern Window_List_Type *CurrentWindow;
+ /* Pointer to linked list of all available menus. */
+-Menu_Type *menus;
++extern Menu_Type *menus;
+ /* Pointer to the menu that will be modified by new rc commands. */
+-Menu_Type *current_rc_menu;
++extern Menu_Type *current_rc_menu;
+ 
+ /* Boolean variables, 0=no, 1=yes */
+-int Use_Color;
+-int Q_Exits;
+-int Unpark_Cursor;
++extern int Use_Color;
++extern int Q_Exits;
++extern int Unpark_Cursor;
+ #ifdef GPM_SUPPORT
+ /* Was the mouse detected? */
+-int gpm_ok;
++extern int gpm_ok;
+ #endif
+ /* Set when the screen has resized */
+-int Want_Screen_Resize;
++extern int Want_Screen_Resize;
+ /* Use old-style look if set. */
+-int Retro;
++extern int Retro;
+ /* Don't use high bit line drawing chars. */
+-int Lowbit;
++extern int Lowbit;
+ /* Don't use 2 or 8 for up and down if set */
+-int Numeric;
++extern int Numeric;
+ /* Use superhot hot keys */
+-int Superhot;
++extern int Superhot;
+diff --git a/src/menu.c b/src/menu.c
+index fcb109a..477267d 100644
+--- a/src/menu.c
++++ b/src/menu.c
+@@ -18,6 +18,17 @@
+ #include <libintl.h>
+ #define _(String) gettext (String)
+ 
++char ScreenObjNames[NUMSCREENPARTS+1][LONGEST_OBJ_NAME+1]; 
++int DESKTOP;
++int TITLE;
++int BASE;
++int MENU;
++int SELBAR;
++int SHADOW;
++int MENU_HI;
++int SELBAR_HI;
++int UNSEL_MENU;
++
+ /* Highlight the hotkey of a given menu item, if there is a hotkey. */
+ void HighlightHotkey (Menu_Type *m,int item,int highlight_color) {
+   if (m->items[item]->hotkey!=-1) {
+diff --git a/src/menu.h b/src/menu.h
+index 1b53e92..2aa44f0 100644
+--- a/src/menu.h
++++ b/src/menu.h
+@@ -4,16 +4,16 @@
+  */
+ 
+ /* This must be long enough for "selbarhi". */
+-char ScreenObjNames[NUMSCREENPARTS+1][LONGEST_OBJ_NAME+1]; 
+-int DESKTOP;
+-int TITLE;
+-int BASE;
+-int MENU;
+-int SELBAR;
+-int SHADOW;
+-int MENU_HI;
+-int SELBAR_HI;
+-int UNSEL_MENU;
++extern char ScreenObjNames[NUMSCREENPARTS+1][LONGEST_OBJ_NAME+1]; 
++extern int DESKTOP;
++extern int TITLE;
++extern int BASE;
++extern int MENU;
++extern int SELBAR;
++extern int SHADOW;
++extern int MENU_HI;
++extern int SELBAR_HI;
++extern int UNSEL_MENU;
+ 
+ void DrawMenu(Menu_Type *,int);
+ void SelMenuItem(Menu_Type *,int,int);
+diff --git a/src/pdmenu.c b/src/pdmenu.c
+index 7310dfc..46ea26f 100644
+--- a/src/pdmenu.c
++++ b/src/pdmenu.c
+@@ -24,6 +24,22 @@
+ #include <libintl.h>
+ #define _(String) gettext (String)
+ 
++Window_List_Type *CurrentWindow;
++Menu_Type *menus;
++Menu_Type *current_rc_menu;
++
++int Use_Color;
++int Q_Exits;
++int Unpark_Cursor;
++#ifdef GPM_SUPPORT
++int gpm_ok;
++#endif
++int Want_Screen_Resize;
++int Retro;
++int Lowbit;
++int Numeric;
++int Superhot;
++
+ /* Display usage info then quit */
+ void usage() {
+   printf (_("\
+diff --git a/src/screen.c b/src/screen.c
+index 46812c9..d803f15 100644
+--- a/src/screen.c
++++ b/src/screen.c
+@@ -22,6 +22,11 @@
+ #include <libintl.h>
+ #define _(String) gettext (String)
+ 
++char FG[NUMSCREENPARTS][COLORLEN];
++char BG[NUMSCREENPARTS][COLORLEN];
++
++char *ScreenTitle;
++
+ /* equals 1 if the screen is set up in slang mode */
+ int screen_is_setup=0;
+ 
+diff --git a/src/screen.h b/src/screen.h
+index 0839c82..9a0c200 100644
+--- a/src/screen.h
++++ b/src/screen.h
+@@ -12,10 +12,10 @@
+ 
+ /* must be long enough for "brightmagenta", our longest color name */
+ #define COLORLEN 13
+-char FG[NUMSCREENPARTS][COLORLEN];
+-char BG[NUMSCREENPARTS][COLORLEN];
++extern char FG[NUMSCREENPARTS][COLORLEN];
++extern char BG[NUMSCREENPARTS][COLORLEN];
+ 
+-char *ScreenTitle;
++extern char *ScreenTitle;
+ 
+ void DrawTitle(char *);
+ void DrawDesktop(void);
+-- 
+2.28.0
+
-- 
2.28.0
