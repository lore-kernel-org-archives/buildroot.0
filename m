From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2009 15:27:30 +0200
Subject: [Buildroot] Freetype not stripped on target
Message-ID: <20090330152730.5d36a4b1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

At revision 25734, you made the following change :

======================================================================================
--- freetype.mk (revision 25733)
+++ freetype.mk (revision 25734)
@@ -9,14 +9,13 @@
 FREETYPE_LIBTOOL_PATCH = NO
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_INSTALL_TARGET = YES
+FREETYPE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
 FREETYPE_DEPENDENCIES = uclibc host-pkgconfig $(if $(BR2_PACKAGE_ZLIB),zlib)
 
 $(eval $(call AUTOTARGETS,package,freetype))
 
-$(FREETYPE_TARGET_INSTALL_TARGET):
-       -cp -a $(FREETYPE_DIR)/objs/.libs/libfreetype.so* $(TARGET_DIR)/usr/lib/
-       $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libfreetype.so
+$(FREETYPE_HOOK_POST_INSTALL):
        $(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
                -e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
                -e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include/freetype2\',g" \
======================================================================================

With the comment
======================================================================================
r25734 | jacmet | 2009-03-18 22:21:56 +0100 (Wed, 18 Mar 2009) | 1 line

freetype: cleanup target install
======================================================================================

Any reason for giving a specific value to FREETYPE_INSTALL_TARGET_OPT
instead of keeping the default ? The default is install-strip, which
would have installed a stripped version of the freetype library to the
target. Is this a problem ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
