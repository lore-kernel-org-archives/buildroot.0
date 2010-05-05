From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 May 2010 12:21:21 +0200
Subject: [Buildroot] [git commit master] Remove gtk-doc documentations from
	target
Message-ID: <20100505102207.46D727FE31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d701a82321ad2f3e5bfa16639e93532294cad4ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On my target rootfs it is installed documentation for:
atk, cairo, gdk, gdk-pixbuf, gio, glib, gobject, gtk, pango

It ocupies 34M of space. Configure option --disable-gtk-doc doesn't
prevent installation of it. So we should remove them manually if
documentation is disabled.

[Peter: also remove manual rm's from hal/libxml2/libglade]
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                     |    1 +
 package/hal/hal.mk           |    1 -
 package/libglade/libglade.mk |    3 +--
 package/libxml2/libxml2.mk   |    4 +---
 4 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 607ec6d..5da21d8 100644
--- a/Makefile
+++ b/Makefile
@@ -410,6 +410,7 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/man
 	rm -rf $(TARGET_DIR)/usr/info $(TARGET_DIR)/usr/share/info
 	rm -rf $(TARGET_DIR)/usr/doc $(TARGET_DIR)/usr/share/doc
+	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 endif
 	find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
 	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
diff --git a/package/hal/hal.mk b/package/hal/hal.mk
index 0c362b0..746107b 100644
--- a/package/hal/hal.mk
+++ b/package/hal/hal.mk
@@ -63,7 +63,6 @@ $(HAL_DIR)/hald/hald: $(HAL_DIR)/.configured
 
 $(TARGET_DIR)/$(HAL_TARGET_BINARY): $(HAL_DIR)/hald/hald
 	$(MAKE) STAGING_DIR="$(STAGING_DIR)" DESTDIR="$(TARGET_DIR)" -C $(HAL_DIR) install
-	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 	rm -rf $(TARGET_DIR)/usr/share/hal/device-manager
 	rm -rf $(TARGET_DIR)/usr/lib/libhal*.so
 	rm -rf $(TARGET_DIR)/usr/lib/hal
diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
index 30b7521..31a579e 100644
--- a/package/libglade/libglade.mk
+++ b/package/libglade/libglade.mk
@@ -12,7 +12,6 @@ LIBGLADE_DEPENDENCIES = host-pkg-config libglib2 libgtk2 atk libxml2
 $(eval $(call AUTOTARGETS,package,libglade))
 
 $(LIBGLADE_HOOK_POST_INSTALL):
-	rm -rf $(TARGET_DIR)/usr/share/gtk-doc \
-	       $(TARGET_DIR)/usr/share/xml/libglade \
+	rm -rf $(TARGET_DIR)/usr/share/xml/libglade \
 	       $(TARGET_DIR)/usr/bin/libglade-convert
 	touch $@
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 7680aa6..3a3e007 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -34,9 +34,7 @@ $(eval $(call AUTOTARGETS,package,libxml2,host))
 $(LIBXML2_HOOK_POST_INSTALL):
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
 	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
-	rm -rf $(TARGET_DIR)/usr/share/aclocal \
-	       $(TARGET_DIR)/usr/share/doc/libxml2-$(LIBXML2_VERSION) \
-	       $(TARGET_DIR)/usr/share/gtk-doc
+	rm -rf $(TARGET_DIR)/usr/share/aclocal
 	touch $@
 
 # libxml2 for the host
-- 
1.6.3.3
