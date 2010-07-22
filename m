From: Malte Starostik <m-starostik@versanet.de>
Date: Thu, 22 Jul 2010 10:59:09 +0200
Subject: [Buildroot] [PATCH] Purge libglib2 dev files from target
Message-ID: <1279789149-16142-1-git-send-email-m-starostik@versanet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Don't install libglib2 development binaries and to target unless
  BR2_HAVE_DEVFILES is set
* Don't install gdb plugins unless BR2_TARGET_GDB is set
* Remove $(TARGET_DIR)/usr/share/aclocal from target-finalize when not
  installing devfiles
* Same for /usr/share/gdb in the absence of BR2_TARGET_GDB
* Remove some redundant cleanup from individual packages

Signed-off-by: Malte Starostik <m-starostik@versanet.de>
---
 Makefile                          |    5 ++++-
 package/gettext/gettext.mk        |    2 --
 package/libglib2/libglib2.mk      |   20 ++++++++++++++++++++
 package/libxml2/libxml2.mk        |    3 +--
 package/multimedia/speex/speex.mk |    2 +-
 5 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index f6e02bc..0ee03b8 100644
--- a/Makefile
+++ b/Makefile
@@ -395,10 +395,13 @@ target-finalize:
 ifeq ($(BR2_HAVE_DEVFILES),y)
 	( scripts/copy.sh $(STAGING_DIR) $(TARGET_DIR) )
 else
-	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/lib/pkgconfig
+	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/aclocal
 	find $(TARGET_DIR)/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/usr/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
 endif
+ifneq ($(BR2_HAVE_PACKAGE_GDB),y)
+	rm -rf $(TARGET_DIR)/usr/share/gdb
+endif
 ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/man
 	rm -rf $(TARGET_DIR)/usr/info $(TARGET_DIR)/usr/share/info
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 80215c8..2b308c8 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -135,8 +135,6 @@ gettext-dirclean:
 gettext-target: $(GETTEXT_DIR)/$(GETTEXT_BINARY)
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(GETTEXT_DIR) install
 	chmod +x $(TARGET_DIR)/usr/lib/libintl.so* # identify as needing to be stripped
-	rm -rf $(addprefix $(TARGET_DIR),/usr/share/aclocal /usr/include/libintl.h)
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/include
 
 $(TARGET_DIR)/usr/lib/libintl.so: $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
 	cp -dpf $(STAGING_DIR)/usr/lib/libgettext*.so* \
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 43b1a89..d7cd828 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -68,6 +68,26 @@ LIBGLIB2_CONF_OPT += --with-libiconv=gnu
 LIBGLIB2_DEPENDENCIES+=libiconv
 endif
 
+define LIBGLIB2_REMOVE_DEV_FILES
+	rm -rf $(TARGET_DIR)/usr/lib/glib-2.0
+	rm -rf $(TARGET_DIR)/usr/share/glib-2.0/gettext
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/glib-2.0
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,glib-genmarshal glib-gettextize glib-mkenums gobject-query gtester gtester-report)
+endef
+
+ifneq ($(BR2_HAVE_DEVFILES),y)
+LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_DEV_FILES
+endif
+
+define LIBGLIB2_REMOVE_GDB_FILES
+	rm -rf $(TARGET_DIR)/usr/share/glib-2.0/gdb
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/glib-2.0
+endef
+
+ifneq ($(BR2_PACKAGE_GDB),y)
+LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_GDB_FILES
+endif
+
 $(eval $(call AUTOTARGETS,package,libglib2))
 $(eval $(call AUTOTARGETS,package,libglib2,host))
 
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 3a3e007..8f25136 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -34,8 +34,7 @@ $(eval $(call AUTOTARGETS,package,libxml2,host))
 $(LIBXML2_HOOK_POST_INSTALL):
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
 	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
-	rm -rf $(TARGET_DIR)/usr/share/aclocal
 	touch $@
 
 # libxml2 for the host
-LIBXML2_HOST_BINARY:=$(HOST_DIR)/usr/bin/xmllint
\ No newline at end of file
+LIBXML2_HOST_BINARY:=$(HOST_DIR)/usr/bin/xmllint
diff --git a/package/multimedia/speex/speex.mk b/package/multimedia/speex/speex.mk
index 6943ad7..e246b24 100644
--- a/package/multimedia/speex/speex.mk
+++ b/package/multimedia/speex/speex.mk
@@ -32,5 +32,5 @@ $(SPEEX_TARGET_BUILD): $(SPEEX_TARGET_CONFIGURE)
 	$(Q)touch $@
 
 $(SPEEX_HOOK_POST_INSTALL): $(SPEEX_TARGET_INSTALL_TARGET)
-	rm -rf $(TARGET_DIR)/usr/share/doc/speex $(TARGET_DIR)/usr/share/aclocal
+	rm -rf $(TARGET_DIR)/usr/share/doc/speex
 	touch $@
-- 
1.7.1
