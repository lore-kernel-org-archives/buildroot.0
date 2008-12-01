From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Mon,  1 Dec 2008 05:33:33 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/mplayer
Message-ID: <20081201133333.84D033C6F3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-01 05:33:33 -0800 (Mon, 01 Dec 2008)
New Revision: 24214

Log:
mplayer: use $(if ...) to add dependencies to mplayer

This patch will add needed libraries with $(if ...) syntax. This should ease
readability and make it easy for others to spot where the depencies are added.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/multimedia/mplayer/mplayer.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/mplayer/mplayer.mk
===================================================================
--- trunk/buildroot/package/multimedia/mplayer/mplayer.mk	2008-12-01 13:08:43 UTC (rev 24213)
+++ trunk/buildroot/package/multimedia/mplayer/mplayer.mk	2008-12-01 13:33:33 UTC (rev 24214)
@@ -17,12 +17,6 @@
 MPLAYER_ENDIAN:=--disable-big-endian
 endif
 
-MPLAYER_DEP_LIBS:=libmad
-
-ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
-MPLAYER_DEP_LIBS+=alsa-lib
-endif
-
 $(DL_DIR)/$(MPLAYER_SOURCE):
 	$(WGET) -P $(DL_DIR) $(MPLAYER_SITE)/$(MPLAYER_SOURCE)
 
@@ -66,7 +60,7 @@
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
 	touch -c $@
 
-mplayer: uclibc $(MPLAYER_DEP_LIBS) $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
+mplayer: uclibc $(if $(BR2_PACKAGE_LIBMAD),libmad) $(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib) $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY)
 
 mplayer-source: $(DL_DIR)/$(MPLAYER_SOURCE)
 
