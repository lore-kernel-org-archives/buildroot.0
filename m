From: laird at uclibc.org <laird@uclibc.org>
Date: Fri, 29 Aug 2008 06:27:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: games
	games/ace_of_penguins games/gnuch etc...
Message-ID: <20080829132737.BF3503C864@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-08-29 06:27:37 -0700 (Fri, 29 Aug 2008)
New Revision: 23283

Log:
games: Move all games into games subdir

Moved all games into a subdir called games and
then updated makefiles as necessary.

If not one objects to this one then I will
probably do the same for audio next.

Daniel Laird


Added:
   trunk/buildroot/package/games/
   trunk/buildroot/package/games/Config.in
   trunk/buildroot/package/games/ace_of_penguins/
   trunk/buildroot/package/games/gnuchess/
   trunk/buildroot/package/games/lxdoom/
   trunk/buildroot/package/games/magiccube4d/
   trunk/buildroot/package/games/rubix/
   trunk/buildroot/package/games/vice/
   trunk/buildroot/package/games/xboard/

Removed:
   trunk/buildroot/package/ace_of_penguins/
   trunk/buildroot/package/gnuchess/
   trunk/buildroot/package/lxdoom/
   trunk/buildroot/package/magiccube4d/
   trunk/buildroot/package/rubix/
   trunk/buildroot/package/vice/
   trunk/buildroot/package/xboard/

Modified:
   trunk/buildroot/package/Config.in
   trunk/buildroot/package/games/ace_of_penguins/ace_of_penguins.mk
   trunk/buildroot/package/games/gnuchess/gnuchess.mk
   trunk/buildroot/package/games/lxdoom/lxdoom.mk
   trunk/buildroot/package/games/magiccube4d/magiccube4d.mk
   trunk/buildroot/package/games/rubix/rubix.mk
   trunk/buildroot/package/games/vice/vice.mk
   trunk/buildroot/package/games/xboard/xboard.mk


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-08-29 12:04:26 UTC (rev 23282)
+++ trunk/buildroot/package/Config.in	2008-08-29 13:27:37 UTC (rev 23283)
@@ -485,20 +485,7 @@
 # java support
 source "package/java/Config.in"
 
-menuconfig BR2_GAMES
-	bool "Games"
-	default y
-	help
-	  Support for games
+# various games packages
+source "package/games/Config.in"
 
-if BR2_GAMES
-source "package/lxdoom/Config.in"
-source "package/ace_of_penguins/Config.in"
-source "package/gnuchess/Config.in"
-source "package/xboard/Config.in"
-source "package/rubix/Config.in"
-source "package/magiccube4d/Config.in"
-source "package/vice/Config.in"
-endif
-
 endmenu

Added: trunk/buildroot/package/games/Config.in
===================================================================
--- trunk/buildroot/package/games/Config.in	                        (rev 0)
+++ trunk/buildroot/package/games/Config.in	2008-08-29 13:27:37 UTC (rev 23283)
@@ -0,0 +1,15 @@
+menuconfig BR2_GAMES
+	bool "Games"
+	default y
+	help
+	  Support for games
+
+if BR2_GAMES
+source "package/games/ace_of_penguins/Config.in"
+source "package/games/gnuchess/Config.in"
+source "package/games/lxdoom/Config.in"
+source "package/games/magiccube4d/Config.in"
+source "package/games/rubix/Config.in"
+source "package/games/vice/Config.in"
+source "package/games/xboard/Config.in"
+endif

Copied: trunk/buildroot/package/games/ace_of_penguins (from rev 23274, trunk/buildroot/package/ace_of_penguins)

Modified: trunk/buildroot/package/games/ace_of_penguins/ace_of_penguins.mk
===================================================================
--- trunk/buildroot/package/ace_of_penguins/ace_of_penguins.mk	2008-08-28 10:56:38 UTC (rev 23274)
+++ trunk/buildroot/package/games/ace_of_penguins/ace_of_penguins.mk	2008-08-29 13:27:37 UTC (rev 23283)
@@ -3,7 +3,6 @@
 # ace_of_penguins
 #
 #############################################################
-
 ACE_OF_PENGUINS_VERSION = 1.2
 ACE_OF_PENGUINS_SOURCE = ace-$(ACE_OF_PENGUINS_VERSION).tar.gz
 ACE_OF_PENGUINS_SITE = http://www.delorie.com/store/ace/
@@ -13,4 +12,4 @@
 
 ACE_OF_PENGUINS_DEPENDENCIES = uclibc libpng $(XSERVER)
 
-$(eval $(call AUTOTARGETS,package,ace_of_penguins))
\ No newline at end of file
+$(eval $(call AUTOTARGETS,package/games,ace_of_penguins))

Copied: trunk/buildroot/package/games/gnuchess (from rev 23274, trunk/buildroot/package/gnuchess)

Modified: trunk/buildroot/package/games/gnuchess/gnuchess.mk
===================================================================
--- trunk/buildroot/package/gnuchess/gnuchess.mk	2008-08-28 10:56:38 UTC (rev 23274)
+++ trunk/buildroot/package/games/gnuchess/gnuchess.mk	2008-08-29 13:27:37 UTC (rev 23283)
@@ -6,7 +6,6 @@
 GNUCHESS_VERSION = 5.07
 GNUCHESS_SOURCE = gnuchess-$(GNUCHESS_VERSION).tar.gz
 GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
-GNUCHESS_AUTORECONF = NO
 GNUCHESS_INSTALL_STAGING = NO
 GNUCHESS_INSTALL_TARGET = YES
 
@@ -14,5 +13,5 @@
 
 GNUCHESS_DEPENDENCIES = uclibc
 
-$(eval $(call AUTOTARGETS,package,gnuchess))
+$(eval $(call AUTOTARGETS,package/games,gnuchess))
 

Copied: trunk/buildroot/package/games/lxdoom (from rev 23274, trunk/buildroot/package/lxdoom)

Modified: trunk/buildroot/package/games/lxdoom/lxdoom.mk
===================================================================
--- trunk/buildroot/package/lxdoom/lxdoom.mk	2008-08-28 10:56:38 UTC (rev 23274)
+++ trunk/buildroot/package/games/lxdoom/lxdoom.mk	2008-08-29 13:27:37 UTC (rev 23283)
@@ -3,11 +3,9 @@
 # lxdoom
 #
 #############################################################
-
 LXDOOM_VERSION = 1.4.4
 LXDOOM_SOURCE = lxdoom-$(LXDOOM_VERSION).tar.gz
 LXDOOM_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/lxdoom
-LXDOOM_AUTORECONF = NO
 LXDOOM_INSTALL_STAGING = NO
 LXDOOM_INSTALL_TARGET = YES
 LXDOOM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
@@ -19,4 +17,4 @@
 
 LXDOOM_DEPENDENCIES = uclibc
 
-$(eval $(call AUTOTARGETS,package,lxdoom))
\ No newline at end of file
+$(eval $(call AUTOTARGETS,package/games,lxdoom))

Copied: trunk/buildroot/package/games/magiccube4d (from rev 23274, trunk/buildroot/package/magiccube4d)

Modified: trunk/buildroot/package/games/magiccube4d/magiccube4d.mk
===================================================================
--- trunk/buildroot/package/magiccube4d/magiccube4d.mk	2008-08-28 10:56:38 UTC (rev 23274)
+++ trunk/buildroot/package/games/magiccube4d/magiccube4d.mk	2008-08-29 13:27:37 UTC (rev 23283)
@@ -6,12 +6,11 @@
 MAGICCUBE4D_VERSION = 2_2
 MAGICCUBE4D_SOURCE = magiccube4d-src-$(MAGICCUBE4D_VERSION).tar.gz
 MAGICCUBE4D_SITE = http://avr32linux.org/twiki/pub/Main/MagicCube4D
-MAGICCUBE4D_AUTORECONF = NO
 MAGICCUBE4D_INSTALL_STAGING = NO
 MAGICCUBE4D_INSTALL_TARGET = YES
 MAGICCUBE4D_INSTALL_TARGET_OPT = GAMESDIR=$(TARGET_DIR)/usr/games install
 
 MAGICCUBE4D_DEPENDENCIES = uclibc
 
-$(eval $(call AUTOTARGETS,package,magiccube4d))
+$(eval $(call AUTOTARGETS,package/games,magiccube4d))
 

Copied: trunk/buildroot/package/games/rubix (from rev 23274, trunk/buildroot/package/rubix)

Modified: trunk/buildroot/package/games/rubix/rubix.mk
===================================================================
--- trunk/buildroot/package/rubix/rubix.mk	2008-08-28 10:56:38 UTC (rev 23274)
+++ trunk/buildroot/package/games/rubix/rubix.mk	2008-08-29 13:27:37 UTC (rev 23283)
@@ -6,7 +6,6 @@
 RUBIX_VERSION = 1.0.5
 RUBIX_SOURCE = rubix-$(RUBIX_VERSION).tar.bz2
 RUBIX_SITE = http://avr32linux.org/twiki/pub/Main/Rubix
-RUBIX_AUTORECONF = NO
 RUBIX_INSTALL_STAGING = NO
 RUBIX_INSTALL_TARGET = YES
 RUBIX_INSTALL_TARGET_OPT = GAMESDIR=$(TARGET_DIR)/usr/games install
@@ -15,5 +14,5 @@
 
 RUBIX_DEPENDENCIES = uclibc
 
-$(eval $(call AUTOTARGETS,package,rubix))
+$(eval $(call AUTOTARGETS,package/games,rubix))
 

Copied: trunk/buildroot/package/games/vice (from rev 23274, trunk/buildroot/package/vice)

Modified: trunk/buildroot/package/games/vice/vice.mk
===================================================================
--- trunk/buildroot/package/vice/vice.mk	2008-08-28 10:56:38 UTC (rev 23274)
+++ trunk/buildroot/package/games/vice/vice.mk	2008-08-29 13:27:37 UTC (rev 23283)
@@ -6,7 +6,6 @@
 VICE_VERSION = 1.22
 VICE_SOURCE = vice-$(VICE_VERSION).tar.gz
 VICE_SITE = http://www.viceteam.org/online
-VICE_AUTORECONF = NO
 VICE_INSTALL_STAGING = NO
 VICE_INSTALL_TARGET = YES
 
@@ -14,5 +13,5 @@
 
 VICE_DEPENDENCIES = uclibc
 
-$(eval $(call AUTOTARGETS,package,vice))
+$(eval $(call AUTOTARGETS,package/games,vice))
 

Copied: trunk/buildroot/package/games/xboard (from rev 23274, trunk/buildroot/package/xboard)

Modified: trunk/buildroot/package/games/xboard/xboard.mk
===================================================================
--- trunk/buildroot/package/xboard/xboard.mk	2008-08-28 10:56:38 UTC (rev 23274)
+++ trunk/buildroot/package/games/xboard/xboard.mk	2008-08-29 13:27:37 UTC (rev 23283)
@@ -6,7 +6,6 @@
 XBOARD_VERSION = 4.2.7
 XBOARD_SOURCE = xboard-$(XBOARD_VERSION).tar.gz
 XBOARD_SITE = $(BR2_GNU_MIRROR)/xboard
-XBOARD_AUTORECONF = NO
 XBOARD_INSTALL_STAGING = NO
 XBOARD_INSTALL_TARGET = YES
 XBOARD_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
@@ -15,5 +14,5 @@
 
 XBOARD_DEPENDENCIES = uclibc gnuchess
 
-$(eval $(call AUTOTARGETS,package,xboard))
+$(eval $(call AUTOTARGETS,package/games,xboard))
 
