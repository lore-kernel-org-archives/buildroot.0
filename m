From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 28 Nov 2007 01:13:41 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/alsa-lib
Message-ID: <20071128091341.BA9BCA6813@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-28 01:13:41 -0800 (Wed, 28 Nov 2007)
New Revision: 20563

Log:
Make aapcs-linux abi, dependent on ARM arch

Modified:
   trunk/buildroot/package/alsa-lib/alsa-lib.mk


Changeset:
Modified: trunk/buildroot/package/alsa-lib/alsa-lib.mk
===================================================================
--- trunk/buildroot/package/alsa-lib/alsa-lib.mk	2007-11-28 08:59:17 UTC (rev 20562)
+++ trunk/buildroot/package/alsa-lib/alsa-lib.mk	2007-11-28 09:13:41 UTC (rev 20563)
@@ -11,6 +11,12 @@
 ALSA_LIB_BINARY:=libasound.so.2.0.0
 ALSA_LIB_TARGET_BINARY:=usr/lib/$(ALSA_LIB_BINARY)
 
+ifeq ($(BR2_arm),y)
+ALSA_LIB_ABI:=-mabi=aapcs-linux
+else
+ALSA_LIB_ABI:=
+endif
+
 $(DL_DIR)/$(ALSA_LIB_SOURCE):
 	$(WGET) -P $(DL_DIR) $(ALSA_LIB_SITE)/$(ALSA_LIB_SOURCE)
 
@@ -24,7 +30,7 @@
 	(cd $(ALSA_LIB_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS) -mabi=aapcs-linux" \
+		CFLAGS="$(TARGET_CFLAGS) $(ALSA_LIB_ABI)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
