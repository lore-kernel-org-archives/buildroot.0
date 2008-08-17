From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 17 Aug 2008 06:20:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/speex
Message-ID: <20080817132031.BC496F800B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-17 06:20:31 -0700 (Sun, 17 Aug 2008)
New Revision: 23098

Log:
speex: fix target install

Use install-strip and clean up documentation files instead of
install-exec so files get stripped and manpages installed if
requested.

Modified:
   trunk/buildroot/package/speex/speex.mk


Changeset:
Modified: trunk/buildroot/package/speex/speex.mk
===================================================================
--- trunk/buildroot/package/speex/speex.mk	2008-08-17 13:20:28 UTC (rev 23097)
+++ trunk/buildroot/package/speex/speex.mk	2008-08-17 13:20:31 UTC (rev 23098)
@@ -9,6 +9,7 @@
 SPEEX_AUTORECONF = NO
 SPEEX_INSTALL_STAGING = YES
 SPEEX_INSTALL_TARGET = YES
+SPEEX_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
 SPEEX_DEPENDENCIES = libogg
 SPEEX_CONF_OPT = --with-ogg-libraries=$(STAGING_DIR)/usr/lib --with-ogg-includes=$(STAGING_DIR)/usr/include \
 		--disable-static --enable-fixed-point $(DISABLE_NLS)
@@ -25,3 +26,7 @@
 	$(SED) 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' $(SPEEX_DIR)/libtool
 	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_MAKE_OPT) -C $(@D)/$($(PKG)_SUBDIR)
 	$(Q)touch $@
+
+$(SPEEX_HOOK_POST_INSTALL): $(SPEEX_TARGET_INSTALL_TARGET)
+	rm -rf $(TARGET_DIR)/usr/share/doc/speex $(TARGET_DIR)/usr/share/aclocal
+	touch $@
