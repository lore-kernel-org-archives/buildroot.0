From: Dan Nicolaescu <dann@ics.uci.edu>
Date: Fri, 08 Feb 2008 17:06:19 -0800
Subject: [Buildroot] [patch] libglib2 should not install glib-genmarshal in
	$STAGING_DIR/usr/bin
Message-ID: <200802090106.m1916Jlk009590@sallyv1.ics.uci.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libglib2 install glib-genmarshal in $STAGING_DIR, this is not good when
cross compiling because $STAGING_DIR/usr/bin is added to the path, and
it will generate failures later.  
The easiest think to do it to remove it from there after running make install. 

Please apply.

diff -u a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -113,6 +113,7 @@ $(LIBGLIB2_DIR)/glib/.libs/$(LIBGLIB2_BINARY): $(LIBGLIB2_DIR)/.configured
 
 $(STAGING_DIR)/lib/$(LIBGLIB2_BINARY): $(LIBGLIB2_DIR)/glib/.libs/$(LIBGLIB2_BINARY)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBGLIB2_DIR) install
+	/bin/rm -f $(STAGING_DIR)/usr/bin/glib-genmarshal
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libglib-2.0.la
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libgmodule-2.0.la
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libgobject-2.0.la
