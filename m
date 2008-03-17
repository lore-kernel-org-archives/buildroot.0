From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 17 Mar 2008 09:39:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl
Message-ID: <20080317163904.07D8312C82C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-17 09:39:03 -0700 (Mon, 17 Mar 2008)
New Revision: 21369

Log:
sdl: Fix include files install.

Patch sdl-config rpath setting rather than setting exec-prefix and
using DESTDIR as the SDL makefile uses prefix for some files,
and exec-prefix for others leading to double $(STAGING_DIR) prefix.


Modified:
   trunk/buildroot/package/sdl/sdl.mk


Changeset:
Modified: trunk/buildroot/package/sdl/sdl.mk
===================================================================
--- trunk/buildroot/package/sdl/sdl.mk	2008-03-17 15:28:07 UTC (rev 21368)
+++ trunk/buildroot/package/sdl/sdl.mk	2008-03-17 16:39:03 UTC (rev 21369)
@@ -56,7 +56,6 @@
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=$(STAGING_DIR)/usr \
-		--exec-prefix=/usr \
 		--sysconfdir=/etc \
 		--localstatedir=/var \
 		--enable-pulseaudio=no \
@@ -83,9 +82,9 @@
 	touch $@
 
 $(STAGING_DIR)/usr/lib/libSDL.so: $(SDL_DIR)/.compiled
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(SDL_DIR) install
-# sdl-config uses -Lexec_prefix/lib instead of -Lprefix/lib - fix it
-	$(SED) 's^-L\$${exec_prefix}^-L\$${prefix}^' \
+	$(MAKE) -C $(SDL_DIR) install
+# use correct rpath for linking
+	$(SED) 's^libdir=\$${exec_prefix}^libdir=/usr^' \
 		$(STAGING_DIR)/usr/bin/sdl-config
 	touch -c $@
 
