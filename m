From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  1 Feb 2009 19:37:14 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/alsa-lib
Message-ID: <20090201193714.8F6F97653E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-01 19:37:14 +0000 (Sun, 01 Feb 2009)
New Revision: 25209

Log:
alsa-lib: clean up makefile

As discussed on the list. I suspect the ARM abi thing isn't needed anymore
now we use the correct abi in the first place, but I'll leave it in until
after the release.

Modified:
   trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk
===================================================================
--- trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk	2009-02-01 19:37:09 UTC (rev 25208)
+++ trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk	2009-02-01 19:37:14 UTC (rev 25209)
@@ -11,16 +11,14 @@
 ALSA_LIB_BINARY:=libasound.so.2.0.0
 ALSA_LIB_TARGET_BINARY:=usr/lib/$(ALSA_LIB_BINARY)
 
+ALSA_LIB_CFLAGS=$(TARGET_CFLAGS)
+
 ifeq ($(BR2_arm),y)
-ALSA_LIB_ABI+=-mabi=aapcs-linux
-else
-ALSA_LIB_ABI+=
+ALSA_LIB_CFLAGS+=-mabi=aapcs-linux
 endif
 
 ifeq ($(BR2_avr32),y)
-ALSA_LIB_ABI+=-DAVR32_INLINE_BUG
-else
-ALSA_LIB_ABI+=
+ALSA_LIB_CFLAGS+=-DAVR32_INLINE_BUG
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PYTHON),y)
@@ -47,7 +45,7 @@
 	(cd $(ALSA_LIB_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS) $(ALSA_LIB_ABI)" \
+		CFLAGS="$(ALSA_LIB_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS) -lm" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
