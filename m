From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 20 Jan 2009 09:29:51 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/mplayer
Message-ID: <20090120092951.911B1770F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-20 09:29:50 +0000 (Tue, 20 Jan 2009)
New Revision: 24922

Log:
mplayer: fix non-largefile build

Added:
   trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-largefile.patch

Modified:
   trunk/buildroot/package/multimedia/mplayer/mplayer.mk


Changeset:
Added: trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-largefile.patch
===================================================================
--- trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-largefile.patch	                        (rev 0)
+++ trunk/buildroot/package/multimedia/mplayer/mplayer-1.0rc1-largefile.patch	2009-01-20 09:29:50 UTC (rev 24922)
@@ -0,0 +1,18 @@
+mplayer: don't unconditionally force largefile support for libraries
+---
+ common.mak |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: MPlayer-1.0rc1/common.mak
+===================================================================
+--- MPlayer-1.0rc1.orig/common.mak
++++ MPlayer-1.0rc1/common.mak
+@@ -5,7 +5,7 @@
+ SRC_DIR = $(SRC_PATH)/lib$(NAME)
+ VPATH = $(SRC_DIR)
+ 
+-CFLAGS += -DHAVE_AV_CONFIG_H -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE \
++CFLAGS += -DHAVE_AV_CONFIG_H \
+           -D_ISOC9X_SOURCE -I$(BUILD_ROOT) -I$(SRC_PATH) \
+           -I$(SRC_PATH)/libavutil $(OPTFLAGS)
+ SRCS := $(OBJS:.o=.c) $(ASM_OBJS:.o=.S) $(CPPOBJS:.o=.cpp)

Modified: trunk/buildroot/package/multimedia/mplayer/mplayer.mk
===================================================================
--- trunk/buildroot/package/multimedia/mplayer/mplayer.mk	2009-01-20 09:12:06 UTC (rev 24921)
+++ trunk/buildroot/package/multimedia/mplayer/mplayer.mk	2009-01-20 09:29:50 UTC (rev 24922)
@@ -17,6 +17,14 @@
 MPLAYER_ENDIAN:=--disable-big-endian
 endif
 
+# mplayer unfortunately uses --disable-largefileS, so we cannot use
+# DISABLE_LARGEFILE
+ifeq ($(BR2_LARGEFILE),y)
+MPLAYER_LARGEFILE:=--enable-largefiles
+else
+MPLAYER_LARGEFILE:=--disable-largefiles
+endif
+
 $(DL_DIR)/$(MPLAYER_SOURCE):
 	$(call DOWNLOAD,$(MPLAYER_SITE),$(MPLAYER_SOURCE))
 
@@ -45,6 +53,7 @@
 		--enable-mad \
 		--enable-fbdev \
 		$(MPLAYER_ENDIAN) \
+		$(MPLAYER_LARGEFILE) \
 		--enable-cross-compile \
 		--disable-mpdvdkit \
 		--disable-ivtv \
