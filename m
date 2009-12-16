From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 16 Dec 2009 16:29:02 +0100
Subject: [Buildroot] [git commit master] hal: fix build,
	correct glib/udev/expat paths
Message-ID: <20091216153105.3088277738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ebe6ce42941b502fcd40967f53165418064d7d30
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/hal/hal.mk                                |   15 ++++++++-------
 package/hal/hal01-configure-buildroot-cross.patch |   10 ----------
 2 files changed, 8 insertions(+), 17 deletions(-)
 delete mode 100644 package/hal/hal01-configure-buildroot-cross.patch

diff --git a/package/hal/hal.mk b/package/hal/hal.mk
index a72bc63..754ed85 100644
--- a/package/hal/hal.mk
+++ b/package/hal/hal.mk
@@ -12,11 +12,11 @@ HAL_BINARY:=hald/hald
 HAL_TARGET_BINARY:=usr/sbin/hald
 
 GLIB_CFLAGS:=-I$(STAGING_DIR)/usr/include/glib-2.0 \
-	     -I$(STAGING_DIR)/lib/glib/include
-GLIB_LIBS:=$(STAGING_DIR)/lib/libglib-2.0.so \
-	   $(STAGING_DIR)/lib/libgmodule-2.0.so \
-	   $(STAGING_DIR)/lib/libgobject-2.0.so \
-	   $(STAGING_DIR)/lib/libgthread-2.0.so
+	     -I$(STAGING_DIR)/usr/lib/glib-2.0/include
+GLIB_LIBS:=$(STAGING_DIR)/usr/lib/libglib-2.0.so \
+	   $(STAGING_DIR)/usr/lib/libgmodule-2.0.so \
+	   $(STAGING_DIR)/usr/lib/libgobject-2.0.so \
+	   $(STAGING_DIR)/usr/lib/libgthread-2.0.so
 DBUS_GLIB_LIBS:=$(STAGING_DIR)/usr/lib/libdbus-glib-1.so
 
 $(DL_DIR)/$(HAL_SOURCE):
@@ -29,7 +29,7 @@ $(HAL_DIR)/.unpacked: $(DL_DIR)/$(HAL_SOURCE)
 	toolchain/patch-kernel.sh $(HAL_DIR) package/hal/ \*.patch
 	touch $(HAL_DIR)/.unpacked
 
-$(HAL_DIR)/.configured: $(HAL_DIR)/.unpacked /usr/bin/pkg-config
+$(HAL_DIR)/.configured: $(HAL_DIR)/.unpacked
 	(cd $(HAL_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
@@ -39,7 +39,7 @@ $(HAL_DIR)/.configured: $(HAL_DIR)/.unpacked /usr/bin/pkg-config
 		DBUS_CFLAGS="-I$(STAGING_DIR)/usr/include/dbus-1.0 -I$(STAGING_DIR)/usr/lib/dbus-1.0/include" \
 		DBUS_LIBS="$(STAGING_DIR)/usr/lib/libdbus-1.so" \
 		VOLUME_ID_CFLAGS="$(TARGET_CFLAGS)" \
-		VOLUME_ID_LIBS="$(STAGING_DIR)/usr/lib/libvolume_id.so" \
+		VOLUME_ID_LIBS="$(STAGING_DIR)/lib/libvolume_id.so" \
 		ac_cv_path_LIBUSB_CONFIG= \
 		./configure $(QUIET) \
 		--target=$(GNU_TARGET_NAME) \
@@ -49,6 +49,7 @@ $(HAL_DIR)/.configured: $(HAL_DIR)/.unpacked /usr/bin/pkg-config
 		--sysconfdir=/etc \
 		--localstatedir=/var \
 		--with-hwdata=$(TARGET_DIR)/usr/share/hwdata \
+		--with-expat=$(STAGING_DIR)/usr/ \
 		--disable-policy-kit \
 		--disable-gtk-doc \
 		--disable-static \
diff --git a/package/hal/hal01-configure-buildroot-cross.patch b/package/hal/hal01-configure-buildroot-cross.patch
deleted file mode 100644
index e97a775..0000000
--- a/package/hal/hal01-configure-buildroot-cross.patch
+++ /dev/null
@@ -1,10 +0,0 @@
-diff -ur hal-0.5.8/configure hal-0.5.8-patched/configure
---- hal-0.5.8/configure	2006-11-15 12:34:03.000000000 -0600
-+++ hal-0.5.8-patched/configure	2006-11-15 12:33:36.000000000 -0600
-@@ -22014,7 +22014,7 @@
- echo "$as_me:$LINENO: result: $ac_cv_lib_expat_XML_ParserCreate" >&5
- echo "${ECHO_T}$ac_cv_lib_expat_XML_ParserCreate" >&6
- if test $ac_cv_lib_expat_XML_ParserCreate = yes; then
--  EXPAT_LIB="-lexpat"
-+  EXPAT_LIB="\$(STAGING_DIR)/lib/libexpat.so"
- fi
-- 
1.6.3.3
