From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 24 Apr 2008 03:35:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fbset
Message-ID: <20080424103557.D8C6B3C7F7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-24 03:35:57 -0700 (Thu, 24 Apr 2008)
New Revision: 21828

Log:
fbset: remove unneeded avr32 patch

Reported by Hans-Christian Egtvedt.


Removed:
   trunk/buildroot/package/fbset/fbset-2.1-support.patch.avr32


Changeset:
Deleted: trunk/buildroot/package/fbset/fbset-2.1-support.patch.avr32
===================================================================
--- trunk/buildroot/package/fbset/fbset-2.1-support.patch.avr32	2008-04-24 10:35:50 UTC (rev 21827)
+++ trunk/buildroot/package/fbset/fbset-2.1-support.patch.avr32	2008-04-24 10:35:57 UTC (rev 21828)
@@ -1,108 +0,0 @@
-diff -ru fbset-2.1/fb.h fbset-2.1-avr32/fb.h
---- fbset-2.1/fb.h	1999-06-23 16:09:48.000000000 +0200
-+++ fbset-2.1-avr32/fb.h	2005-12-09 16:00:07.000000000 +0100
-@@ -131,6 +131,7 @@
- 					/* vtotal = 144d/288n/576i => PAL  */
- 					/* vtotal = 121d/242n/484i => NTSC */
- #define FB_SYNC_ON_GREEN	32	/* sync on green */
-+#define FB_SYNC_PCLK_RISING     64      /* pixel data sampled on rising pclk */
- 
- #define FB_VMODE_NONINTERLACED  0	/* non interlaced */
- #define FB_VMODE_INTERLACED	1	/* interlaced	*/
-diff -ru fbset-2.1/fbset.c fbset-2.1-avr32/fbset.c
---- fbset-2.1/fbset.c	1999-06-23 16:11:46.000000000 +0200
-+++ fbset-2.1-avr32/fbset.c	2005-12-09 16:04:53.000000000 +0100
-@@ -85,6 +85,7 @@
- static const char *Opt_vsync = NULL;
- static const char *Opt_csync = NULL;
- static const char *Opt_gsync = NULL;
-+static const char *Opt_pclk = NULL;
- static const char *Opt_extsync = NULL;
- static const char *Opt_bcast = NULL;
- static const char *Opt_laced = NULL;
-@@ -122,6 +123,7 @@
-     { "-vsync", &Opt_vsync, 1 },
-     { "-csync", &Opt_csync, 1 },
-     { "-gsync", &Opt_gsync, 1 },
-+    { "-pclk", &Opt_pclk, 1 },
-     { "-extsync", &Opt_extsync, 1 },
-     { "-bcast", &Opt_bcast, 1 },
-     { "-laced", &Opt_laced, 1 },
-@@ -344,6 +346,8 @@
- 	var->sync |= FB_SYNC_COMP_HIGH_ACT;
-     if (vmode->gsync == HIGH)
- 	var->sync |= FB_SYNC_ON_GREEN;
-+    if (vmode->pclk == RISING)
-+	var->sync |= FB_SYNC_PCLK_RISING;
-     if (vmode->extsync == TRUE)
- 	var->sync |= FB_SYNC_EXT;
-     if (vmode->bcast == TRUE)
-@@ -389,6 +393,7 @@
-     vmode->vsync = var->sync & FB_SYNC_VERT_HIGH_ACT ? HIGH : LOW;
-     vmode->csync = var->sync & FB_SYNC_COMP_HIGH_ACT ? HIGH : LOW;
-     vmode->gsync = var->sync & FB_SYNC_ON_GREEN ? TRUE : FALSE;
-+    vmode->pclk = var->sync & FB_SYNC_PCLK_RISING ? RISING : FALLING;
-     vmode->extsync = var->sync & FB_SYNC_EXT ? TRUE : FALSE;
-     vmode->bcast = var->sync & FB_SYNC_BROADCAST ? TRUE : FALSE;
-     vmode->grayscale = var->grayscale;
-@@ -420,11 +425,11 @@
- 
-     if (!strcasecmp(var, "false") || !strcasecmp(var, "low") ||
- 	!strcasecmp(var, "no") || !strcasecmp(var, "off") ||
--	!strcmp(var, "0"))
-+	!strcmp(var, "0") || !strcasecmp(var, "falling"))
- 	value = 0;
-     else if (!strcasecmp(var, "true") || !strcasecmp(var, "high") ||
- 	     !strcasecmp(var, "yes") || !strcasecmp(var, "on") ||
--	     !strcmp(var, "1"))
-+	     !strcmp(var, "1") || !strcasecmp(var, "rising"))
- 	value = 1;
-     else
- 	Die("Invalid value `%s'\n", var);
-@@ -559,6 +564,8 @@
- 	vmode->csync = atoboolean(Opt_csync);
-     if (Opt_gsync)
- 	vmode->gsync = atoboolean(Opt_gsync);
-+    if (Opt_pclk)
-+	vmode->pclk = atoboolean(Opt_pclk);
-     if (Opt_extsync)
- 	vmode->extsync = atoboolean(Opt_extsync);
-     if (Opt_bcast)
-@@ -635,6 +642,8 @@
- 	    puts("    csync high");
- 	if (vmode->gsync)
- 	    puts("    gsync true");
-+	if (vmode->pclk)
-+	    puts("    pclk rising");
- 	if (vmode->extsync)
- 	    puts("    extsync true");
- 	if (vmode->bcast)
-@@ -875,6 +884,7 @@
- 	"    -vsync <value>     : vertical sync polarity (low or high)\n"
- 	"    -csync <value>     : composite sync polarity (low or high)\n"
- 	"    -gsync <value>     : synch on green (false or true)\n"
-+	"    -pclk <value>      : pclk edge on which pixeldata is valid (rising or falling)\n"
- 	"    -extsync <value>   : external sync enable (false or true)\n"
- 	"    -bcast <value>     : broadcast enable (false or true)\n"
- 	"    -laced <value>     : interlace enable (false or true)\n"
-diff -ru fbset-2.1/fbset.h fbset-2.1-avr32/fbset.h
---- fbset-2.1/fbset.h	1999-06-23 16:12:28.000000000 +0200
-+++ fbset-2.1-avr32/fbset.h	2005-12-09 16:05:25.000000000 +0100
-@@ -26,6 +26,9 @@
- #define LOW		(0)
- #define HIGH		(1)
- 
-+#define FALLING		(0)
-+#define RISING		(1)
-+
- #define FALSE		(0)
- #define TRUE		(1)
- 
-@@ -59,6 +62,7 @@
-     unsigned vsync : 1;
-     unsigned csync : 1;
-     unsigned gsync : 1;
-+    unsigned pclk : 1;
-     unsigned extsync : 1;
-     unsigned bcast : 1;
-     unsigned laced : 1;
