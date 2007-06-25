From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 25 Jun 2007 08:38:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
Message-ID: <20070625153804.1BCACA45DC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-25 08:38:03 -0700 (Mon, 25 Jun 2007)
New Revision: 18931

Log:
- correct installation path


Modified:
   trunk/buildroot/package/ncurses/ncurses.mk


Changeset:
Modified: trunk/buildroot/package/ncurses/ncurses.mk
===================================================================
--- trunk/buildroot/package/ncurses/ncurses.mk	2007-06-25 15:07:25 UTC (rev 18930)
+++ trunk/buildroot/package/ncurses/ncurses.mk	2007-06-25 15:38:03 UTC (rev 18931)
@@ -29,6 +29,10 @@
 NCURSES_SOURCE:=ncurses-$(NCURSES_VER).tar.gz
 NCURSES_CAT:=$(ZCAT)
 
+ifneq ($(strip $(BR2_PACKAGE_NCURSES_TARGET_HEADERS)),y)
+NCURSES_WANT_STATIC=--disable-static
+endif
+
 $(DL_DIR)/$(NCURSES_SOURCE):
 	$(WGET) -P $(DL_DIR) $(NCURSES_SITE)/$(NCURSES_SOURCE)
 
@@ -56,11 +60,11 @@
 		--bindir=/usr/bin \
 		--sbindir=/usr/sbin \
 		--libdir=/lib \
-		--libexecdir=/lib \
+		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
+		--includedir=/usr/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--with-terminfo-dirs=/usr/share/terminfo \
@@ -71,6 +75,7 @@
 		--without-profile --without-debug --disable-rpath \
 		--enable-echo --enable-const --enable-overwrite \
 		--enable-broken_linker \
+		$(NCURSES_WANT_STATIC) \
 	);
 	touch $@
 
@@ -78,13 +83,13 @@
 	$(MAKE1) DESTDIR=$(STAGING_DIR) -C $(NCURSES_DIR) \
 		libs panel menu form headers
 
-$(STAGING_DIR)/lib/libncurses.a: $(NCURSES_DIR)/lib/libncurses.so.$(NCURSES_VER)
+$(STAGING_DIR)/usr/lib/libncurses.a: $(NCURSES_DIR)/lib/libncurses.so.$(NCURSES_VER)
 	$(MAKE1) \
 	    prefix=$(STAGING_DIR)/usr/ \
 	    exec_prefix=$(STAGING_DIR) \
 	    bindir=$(STAGING_DIR)/bin \
 	    sbindir=$(STAGING_DIR)/sbin \
-	    libexecdir=$(STAGING_DIR)/lib \
+	    libexecdir=$(STAGING_DIR)/usr/lib \
 	    datadir=$(STAGING_DIR)/usr/share \
 	    sysconfdir=$(STAGING_DIR)/etc \
 	    localstatedir=$(STAGING_DIR)/var \
@@ -98,8 +103,8 @@
 	chmod a-x $(NCURSES_DIR)/lib/libncurses.so*
 	touch -c $@
 
-$(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VER): $(STAGING_DIR)/lib/libncurses.a
-	cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/lib/
+$(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VER): $(STAGING_DIR)/usr/lib/libncurses.a
+	cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/usr/lib/
 	-cp -dpf $(STAGING_DIR)/usr/lib/terminfo $(TARGET_DIR)/usr/lib/
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/x
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/x/xterm $(TARGET_DIR)/usr/share/terminfo/x
@@ -142,6 +147,7 @@
 
 ncurses-clean:
 	rm -f $(STAGING_DIR)/lib/libncurses.so* $(TARGET_DIR)/lib/libncurses.so*
+	rm -f $(STAGING_DIR)/usr/lib/libncurses.so* $(TARGET_DIR)/usr/lib/libncurses.so*
 	rm -rf $(STAGING_DIR)/usr/share/tabset $(TARGET_DIR)/usr/share/tabset
 	rm -rf $(STAGING_DIR)/usr/share/terminfo $(TARGET_DIR)/usr/share/terminfo
 	-$(MAKE) -C $(NCURSES_DIR) clean
