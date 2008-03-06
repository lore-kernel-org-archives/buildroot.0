From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:23:13 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  rubix
Message-ID: <20080306182313.8B1221201BC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:23:13 -0800 (Thu, 06 Mar 2008)
New Revision: 21224

Log:
added rubix game

Added:
   trunk/buildroot/package/rubix/
   trunk/buildroot/package/rubix/Config.in
   trunk/buildroot/package/rubix/rubix-1.0.5.patch
   trunk/buildroot/package/rubix/rubix.mk


Changeset:
Added: trunk/buildroot/package/rubix/Config.in
===================================================================
--- trunk/buildroot/package/rubix/Config.in	                        (rev 0)
+++ trunk/buildroot/package/rubix/Config.in	2008-03-06 18:23:13 UTC (rev 21224)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_RUBIX
+	bool "rubix"
+	default n
+	help
+	  A 3D rubiks cube game for X
+
+	  http://avr32linux.org/twiki/pub/Main/Rubix

Added: trunk/buildroot/package/rubix/rubix-1.0.5.patch
===================================================================
--- trunk/buildroot/package/rubix/rubix-1.0.5.patch	                        (rev 0)
+++ trunk/buildroot/package/rubix/rubix-1.0.5.patch	2008-03-06 18:23:13 UTC (rev 21224)
@@ -0,0 +1,135 @@
+diff -Nrup rubix-1.0.5/fillpoly.c rubix-1.0.5-avr32/fillpoly.c
+--- rubix-1.0.5/fillpoly.c	2003-10-12 15:41:43.000000000 -0400
++++ rubix-1.0.5-avr32/fillpoly.c	2008-02-29 12:39:51.000000000 -0500
+@@ -435,7 +435,7 @@ void fill_lines(device *d, int thecol)
+ 			);
+ #endif
+     }
+-  } else if (d->depth==16) { /* here 16bpp */
++  } else if ((d->depth==16) | (d->depth==15)) { /* here 16bpp */
+     register int i;
+ #ifndef PC_ARCHI
+     register int j;
+diff -Nrup rubix-1.0.5/line.c rubix-1.0.5-avr32/line.c
+--- rubix-1.0.5/line.c	2003-10-12 14:15:19.000000000 -0400
++++ rubix-1.0.5-avr32/line.c	2008-02-29 12:39:51.000000000 -0500
+@@ -1317,7 +1317,7 @@ void drawline(device *d, line *l)
+ #endif
+   if (d->depth==8)
+     drawline8(d, l);
+-  else if (d->depth==16)
++  else if ((d->depth==16) | (d->depth==15))
+     drawline16(d, l);
+   else if (d->depth==24)
+     drawline24(d, l);
+diff -Nrup rubix-1.0.5/Makefile rubix-1.0.5-avr32/Makefile
+--- rubix-1.0.5/Makefile	2003-12-04 14:27:58.000000000 -0500
++++ rubix-1.0.5-avr32/Makefile	2008-02-29 12:58:30.000000000 -0500
+@@ -11,21 +11,17 @@
+ # Customize to fit your needs (especially if it does not work for now).
+ 
+ LANGUAGE=ENGLISH
+-GAMESDIR=/usr/games
+ 
+ #architecture=-DPC_ARCHI
+ 
+ # For Solaris
+ #EXTRALIBS=-lsocket
+ 
+-CC=gcc
+ CFLAGS=-Wall -O3 -fomit-frame-pointer -ffast-math \
+    -DGAMESDIR="\"$(GAMESDIR)\"" \
+    -D$(LANGUAGE) $(architecture)
+ 
+ #CFLAGS=-Wall -g -ffast-math -Iplayer $(architecture)
+-XINC=-I/usr/X11R6/include
+-XLIB=-L/usr/X11R6/lib -lX11
+ 
+ #the following should not be changed.
+ 
+@@ -37,7 +33,7 @@ rubix : $(OBJ)
+ 
+ install :
+ 	mkdir -p $(GAMESDIR)
+-	install -c -s rubix $(GAMESDIR)
++	install -c rubix $(GAMESDIR)
+ 
+ clean :
+ 	rm -f *.o *~ core *.bak *.dat gmon.out
+diff -Nrup rubix-1.0.5/screen.c rubix-1.0.5-avr32/screen.c
+--- rubix-1.0.5/screen.c	2004-04-26 04:26:05.000000000 -0400
++++ rubix-1.0.5-avr32/screen.c	2008-02-29 12:39:51.000000000 -0500
+@@ -80,11 +80,17 @@ void error_statement(SCREEN *s)
+ 
+ int reset_data_buffers(SCREEN *s)
+ {     
++  int temp;
+ 
+   if (s->im)
+     XDestroyImage(s->im);
++  if (s->depth == 15) {
++		temp=16;
++  } else {
++		temp=s->depth;
++  }
+ 
+-  s->buffer=(char *)malloc(((SCREEN_X+7)/8)*SCREEN_Y*s->depth);
++  s->buffer=(char *)malloc(((SCREEN_X+7)/8)*SCREEN_Y*temp);
+ 
+   if (!s->buffer) {
+     error_statement(s);
+@@ -106,7 +112,7 @@ int reset_data_buffers(SCREEN *s)
+    */
+   /* Sed - december 2003 - no it has to be 8 */
+   s->im=XCreateImage(s->d, DefaultVisual(s->d, DefaultScreen(s->d)), 
+-		     s->depth==32?24:s->depth, ZPixmap,
++		     s->depth, ZPixmap,
+ 		     0, s->buffer, SCREEN_X, SCREEN_Y, 8, 0);
+ 
+   if (!s->im) {
+@@ -139,8 +145,8 @@ int init_screen(SCREEN *s)
+ 
+   s->depth=DefaultDepth(s->d, DefaultScreen(s->d));
+   
+-  if (s->depth!=8 && s->depth!=16 && s->depth!=24) {
+-    fprintf(stderr, "screen depth not supported (only 8, 16 and 24bpp (which means 32bpp too) handled\n");
++  if (s->depth!=8 && s->depth!=15 && s->depth!=16 && s->depth!=24) {
++    fprintf(stderr, "screen depth not supported (only 8, 15, 16 and 24bpp (which means 32bpp too) handled\n");
+     XCloseDisplay(s->d);
+     s->d=(Display *)0;
+     return -1;
+@@ -182,10 +188,10 @@ int init_screen(SCREEN *s)
+    
+   /* let's create and map our window */
+   s->w=XCreateWindow(s->d, DefaultRootWindow(s->d), 0, 0, 
+-		       SCREEN_X, SCREEN_Y, 3, s->depth==32?24:s->depth,
++		       SCREEN_X, SCREEN_Y, 3, s->depth,
+ 		       CopyFromParent, CopyFromParent, 0, NULL);
+   s->h=XCreateWindow(s->d, DefaultRootWindow(s->d), 0, 0, 
+-		       HELP_X, HELP_Y, 3, s->depth==32?24:s->depth,
++		       HELP_X, HELP_Y, 3, s->depth,
+ 		       CopyFromParent, CopyFromParent, 0, NULL);     
+    
+   xch.res_name = "rubix";
+@@ -946,13 +952,18 @@ void close_screen(SCREEN *s)
+ void clear_screen(SCREEN *s)
+ {
+   /* fill s->im with pixel[10], avoid XPutPixel which is rather slow... */
+-  int i, w, dw;
++  int i, w, dw, temp;
++  if (s->depth == 15) {
++	temp = 16;
++  } else {
++	temp = s->depth;
++  }
+   w = (SCREEN_X+7)/8;
+-  dw = s->depth/8;
++  dw = temp/8;
+   XPutPixel(s->im, 0, 0, pixel[10]);
+   for (i=1; i<8*w; i++)
+      memcpy(s->buffer + i*dw, s->buffer, dw);
+-  w = w * s->depth;
++  w = w * temp;
+   for (i=1; i<SCREEN_Y; i++)
+      memcpy(s->buffer + i*w, s->buffer, w);
+ }

Added: trunk/buildroot/package/rubix/rubix.mk
===================================================================
--- trunk/buildroot/package/rubix/rubix.mk	                        (rev 0)
+++ trunk/buildroot/package/rubix/rubix.mk	2008-03-06 18:23:13 UTC (rev 21224)
@@ -0,0 +1,19 @@
+#############################################################
+#
+# rubix
+#
+#############################################################
+RUBIX_VERSION = 1.0.5
+RUBIX_SOURCE = rubix-$(RUBIX_VERSION).tar.bz2
+RUBIX_SITE = http://avr32linux.org/twiki/pub/Main/Rubix
+RUBIX_AUTORECONF = NO
+RUBIX_INSTALL_STAGING = NO
+RUBIX_INSTALL_TARGET = YES
+RUBIX_INSTALL_TARGET_OPT = GAMESDIR=$(TARGET_DIR)/usr/games install
+
+RUBIX_MAKE_OPT = CC=$(TARGET_CC) XINC="-I$(STAGING_DIR)/usr/include/X11" XLIB="-L$(STAGING_DIR)/usr/lib -lX11" 
+
+RUBIX_DEPENDENCIES = uclibc 
+
+$(eval $(call AUTOTARGETS,package,rubix))
+
