From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  7 Mar 2008 05:31:25 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl
Message-ID: <20080307133125.0D12A1201B3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-07 05:31:24 -0800 (Fri, 07 Mar 2008)
New Revision: 21270

Log:
sdl: cleanup configure args + sdl-config, fixup /lib vs /usr/lib


Modified:
   trunk/buildroot/package/sdl/sdl.mk


Changeset:
Modified: trunk/buildroot/package/sdl/sdl.mk
===================================================================
--- trunk/buildroot/package/sdl/sdl.mk	2008-03-07 13:31:16 UTC (rev 21269)
+++ trunk/buildroot/package/sdl/sdl.mk	2008-03-07 13:31:24 UTC (rev 21270)
@@ -55,18 +55,10 @@
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
+		--prefix=$(STAGING_DIR)/usr \
 		--exec-prefix=/usr \
-		--bindir=/bin \
-		--sbindir=/sbin \
-		--libdir=/lib \
-		--libexecdir=/lib \
 		--sysconfdir=/etc \
-		--datadir=/share \
 		--localstatedir=/var \
-		--includedir=/include \
-		--mandir=/man \
-		--infodir=/info \
 		--enable-pulseaudio=no \
 		--disable-arts \
 		--disable-esd \
@@ -91,11 +83,9 @@
 	touch $@
 
 $(STAGING_DIR)/usr/lib/libSDL.so: $(SDL_DIR)/.compiled
-	$(MAKE) DESTDIR=$(STAGING_DIR)/usr -C $(SDL_DIR) install
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)\',g" \
-		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" \
-		-e "s,-I/include/SDL,-I\'$(STAGING_DIR)/include/SDL\',g" \
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(SDL_DIR) install
+# sdl-config uses -Lexec_prefix/lib instead of -Lprefix/lib - fix it
+	$(SED) 's^-L\$${exec_prefix}^-L\$${prefix}^' \
 		$(STAGING_DIR)/usr/bin/sdl-config
 	touch -c $@
 
