From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 25 Oct 2008 23:19:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: audio/libogg
	audio/libvorbis docker edit etc...
Message-ID: <20081026061944.0F6DE3C2B3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-25 23:19:43 -0700 (Sat, 25 Oct 2008)
New Revision: 23794

Log:
package: cleanup PKG_CONFIG_SYSROOT

PKG_CONFIG_SYSROOT_DIR and friends get set in package/Makefile.in,
so there's no need to set it in the makefiles of the individual
packages as well.

Based on a patch by Markus Heidelberg.

Modified:
   trunk/buildroot/package/audio/libogg/libogg.mk
   trunk/buildroot/package/audio/libvorbis/libvorbis.mk
   trunk/buildroot/package/docker/docker.mk
   trunk/buildroot/package/editors/vim/vim.mk


Changeset:
Modified: trunk/buildroot/package/audio/libogg/libogg.mk
===================================================================
--- trunk/buildroot/package/audio/libogg/libogg.mk	2008-10-26 06:03:23 UTC (rev 23793)
+++ trunk/buildroot/package/audio/libogg/libogg.mk	2008-10-26 06:19:43 UTC (rev 23794)
@@ -24,9 +24,6 @@
 		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		PKG_CONFIG_PATH="$(STAGING_DIR)/lib/pkconfig:$(STAGING_DIR)/usr/lib/pkgconfig" \
-		PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
-		PKG_CONFIG_SYSROOT=$(STAGING_DIR) \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/audio/libvorbis/libvorbis.mk
===================================================================
--- trunk/buildroot/package/audio/libvorbis/libvorbis.mk	2008-10-26 06:03:23 UTC (rev 23793)
+++ trunk/buildroot/package/audio/libvorbis/libvorbis.mk	2008-10-26 06:19:43 UTC (rev 23794)
@@ -23,9 +23,6 @@
 		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		PKG_CONFIG_PATH="$(STAGING_DIR)/lib/pkconfig:$(STAGING_DIR)/usr/lib/pkgconfig" \
-		PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
-		PKG_CONFIG_SYSROOT=$(STAGING_DIR) \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/docker/docker.mk
===================================================================
--- trunk/buildroot/package/docker/docker.mk	2008-10-26 06:03:23 UTC (rev 23793)
+++ trunk/buildroot/package/docker/docker.mk	2008-10-26 06:19:43 UTC (rev 23794)
@@ -14,10 +14,7 @@
 					CFLAGS="-I$(STAGING_DIR)/usr/include \
 						-I$(STAGING_DIR)/usr/include/glib-2.0 \
 						-I$(STAGING_DIR)/usr/lib/glib-2.0/include" \
-					LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib" \
-					PKGCONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
-					PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
-					PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
+					LDFLAGS="-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib"
 
 DOCKER_INSTALL_TARGET_OPT = PREFIX=$(TARGET_DIR)/usr install
 

Modified: trunk/buildroot/package/editors/vim/vim.mk
===================================================================
--- trunk/buildroot/package/editors/vim/vim.mk	2008-10-26 06:03:23 UTC (rev 23793)
+++ trunk/buildroot/package/editors/vim/vim.mk	2008-10-26 06:19:43 UTC (rev 23794)
@@ -36,14 +36,8 @@
 
 $(VIM_DIR)/.configured: $(VIM_DIR)/.patched
 	(cd $(VIM_DIR)/src; \
-		PATH=$(TARGET_PATH) \
-		CC="$(TARGET_CC)" \
-		CPP="$(TARGET_CPP)" \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		STRIP="$(TARGET_STRIP)" \
-		PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
-		PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
-		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
 		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 		PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
         $(TARGET_CONFIGURE_ARGS) \
