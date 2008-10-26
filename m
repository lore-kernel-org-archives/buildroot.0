From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sun, 26 Oct 2008 18:59:50 +0100
Subject: [Buildroot] package: remove redundant pkg-config variables
Message-ID: <200810261859.50684.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove some redundant or predefined configure/make args in these
packages.
---
 package/dbus-glib/dbus-glib.mk      |    2 --
 package/gqview/gqview.mk            |    2 --
 package/hal/hal.mk                  |    2 --
 package/java/classpath/classpath.mk |   13 ++++---------
 package/java/jamvm/jamvm.mk         |   15 ++++-----------
 package/kismet/kismet.mk            |    5 -----
 package/matchbox/matchbox.mk        |   18 +++++++++---------
 package/metacity/metacity.mk        |    1 -
 package/midori/midori.mk            |    5 -----
 package/pcmanfm/pcmanfm.mk          |    1 -
 package/sylpheed/sylpheed.mk        |    1 -
 11 files changed, 17 insertions(+), 48 deletions(-)

diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 60bc109..66e72ba 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -32,13 +32,11 @@ $(DBUS_GLIB_DIR)/.configured: $(DBUS_GLIB_DIR)/.unpacked
 		DBUS_LIBS="$(STAGING_DIR)/usr/lib/libdbus-1.so" \
 		DBUS_GLIB_CFLAGS="-I$(STAGING_DIR)/usr/include/glib-2.0 -I$(STAGING_DIR)/usr/lib/glib-2.0/include" \
 		DBUS_GLIB_LIBS="$(STAGING_DIR)/lib/libglib-2.0.so $(STAGING_DIR)/lib/libgobject-2.0.so $(STAGING_DIR)/lib/libgmodule-2.0.so $(STAGING_DIR)/lib/libgthread-2.0.so" \
-		PKG_CONFIG=/usr/bin/pkg-config \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		--exec-prefix=/usr \
 		--localstatedir=/var \
 		--program-prefix="" \
 		--disable-tests \
diff --git a/package/gqview/gqview.mk b/package/gqview/gqview.mk
index 4bfb9a0..cb3dfb2 100644
--- a/package/gqview/gqview.mk
+++ b/package/gqview/gqview.mk
@@ -10,8 +10,6 @@ GQVIEW_AUTORECONF = NO
 GQVIEW_INSTALL_STAGING = NO
 GQVIEW_INSTALL_TARGET = YES
 
-GQVIEW_CONF_OPT = PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
-
 GQVIEW_DEPENDENCIES = uclibc pkgconfig libgtk2
 
 $(eval $(call AUTOTARGETS,package,gqview))
diff --git a/package/hal/hal.mk b/package/hal/hal.mk
index 27a5cd6..2d73050 100644
--- a/package/hal/hal.mk
+++ b/package/hal/hal.mk
@@ -40,14 +40,12 @@ $(HAL_DIR)/.configured: $(HAL_DIR)/.unpacked /usr/bin/pkg-config
 		DBUS_LIBS="$(STAGING_DIR)/usr/lib/libdbus-1.so" \
 		VOLUME_ID_CFLAGS="$(TARGET_CFLAGS)" \
 		VOLUME_ID_LIBS="$(STAGING_DIR)/usr/lib/libvolume_id.so" \
-		PKG_CONFIG=/usr/bin/pkg-config \
 		ac_cv_path_LIBUSB_CONFIG= \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		--datadir=/usr/share \
 		--sysconfdir=/etc \
 		--localstatedir=/var \
 		--with-hwdata=$(TARGET_DIR)/usr/share/hwdata \
diff --git a/package/java/classpath/classpath.mk b/package/java/classpath/classpath.mk
index ace57dd..02f2fbe 100644
--- a/package/java/classpath/classpath.mk
+++ b/package/java/classpath/classpath.mk
@@ -29,7 +29,7 @@ CLASSPATH_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		ac_cv_func_strerror_r_char_p=no jm_cv_func_svid_putenv=yes \
 		ac_cv_func_getcwd_null=yes ac_cv_func_getdelim=yes \
 		ac_cv_func_mkstemp=yes utils_cv_func_mkstemp_limitations=no \
-		utils_cv_func_mkdir_trailing_slash_bug=no ac_cv_func_memcmp_working=yes \
+		utils_cv_func_mkdir_trailing_slash_bug=no \
 		ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes \
 		ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes \
 		ac_cv_func_realloc_0_nonnull=yes jm_cv_func_gettimeofday_clobber=no \
@@ -45,17 +45,12 @@ CLASSPATH_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		ac_cv_prog_F77=no ac_cv_prog_CXX=no ac_cv_path_CUPS_CONFIG=no
 
 
-CLASSPATH_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) --prefix=/usr \
-		--exec-prefix=/usr --bindir=/usr/bin \
-		--sbindir=/usr/sbin --libdir=/usr/lib \
-		--libexecdir=/usr/lib --sysconfdir=/etc \
-		--datadir=/usr/share --localstatedir=/var \
-		--includedir=/usr/include --mandir=/usr/man \
+CLASSPATH_CONF_OPT = \
+		--libexecdir=/usr/lib --localstatedir=/var --mandir=/usr/man \
 		--infodir=/usr/info --enable-shared \
 		--enable-static \
 		--disable-glibtest --enable-explicit-deps=no \
-		--disable-debug PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+		--disable-debug \
 		--disable-gconf-peer --disable-examples --disable-plugin
 
 CLASSPATH_DEPENDENCIES = uclibc pkgconfig png jpeg tiff
diff --git a/package/java/jamvm/jamvm.mk b/package/java/jamvm/jamvm.mk
index c79c31d..869b38b 100644
--- a/package/java/jamvm/jamvm.mk
+++ b/package/java/jamvm/jamvm.mk
@@ -9,7 +9,6 @@ JAMVM_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/jam
 JAMVM_AUTORECONF = NO
 JAMVM_INSTALL_STAGING = YES
 JAMVM_INSTALL_TARGET = YES
-JAMVM_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
 JAMVM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 JAMVM_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
@@ -28,7 +27,7 @@ JAMVM_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		ac_cv_func_strerror_r_char_p=no jm_cv_func_svid_putenv=yes \
 		ac_cv_func_getcwd_null=yes ac_cv_func_getdelim=yes \
 		ac_cv_func_mkstemp=yes utils_cv_func_mkstemp_limitations=no \
-		utils_cv_func_mkdir_trailing_slash_bug=no ac_cv_func_memcmp_working=yes \
+		utils_cv_func_mkdir_trailing_slash_bug=no \
 		ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes \
 		ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes \
 		ac_cv_func_realloc_0_nonnull=yes jm_cv_func_gettimeofday_clobber=no \
@@ -43,18 +42,12 @@ JAMVM_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal \
 		ac_cv_prog_F77=no ac_cv_prog_CXX=no ac_cv_path_CUPS_CONFIG=no
 
-JAMVM_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) --prefix=/usr \
-		--exec-prefix=/usr --bindir=/usr/bin \
-		--sbindir=/usr/sbin --libdir=/usr/lib \
-		--libexecdir=/usr/lib --sysconfdir=/etc \
-		--datadir=/usr/share --localstatedir=/var \
-		--includedir=/usr/include --mandir=/usr/man \
+JAMVM_CONF_OPT = \
+		--libexecdir=/usr/lib --localstatedir=/var --mandir=/usr/man \
 		--infodir=/usr/info --enable-shared \
 		--enable-static \
 		--disable-glibtest --enable-explicit-deps=no \
-		--disable-debug PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
-		--with-classpath-install-dir=/usr \
+		--disable-debug --with-classpath-install-dir=/usr
 
 
 JAMVM_DEPENDENCIES = uclibc pkgconfig classpath
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 97198bc..d18e359 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -29,19 +29,14 @@ $(KISMET_DIR)/.configured: $(KISMET_DIR)/.patched
 		DBUS_LIBS="$(STAGING_DIR)/usr/lib/libdbus-1.so" \
 		DBUS_GLIB_CFLAGS="-I$(STAGING_DIR)/usr/include/glib-2.0 -I$(STAGING_DIR)/usr/lib/glib-2.0/include" \
 		DBUS_GLIB_LIBS="$(STAGING_DIR)/lib/libglib-2.0.so $(STAGING_DIR)/lib/libgobject-2.0.so $(STAGING_DIR)/lib/libgmodule-2.0.so $(STAGING_DIR)/lib/libgthread-2.0.so" \
-		PKG_CONFIG=/usr/bin/pkg-config \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
 		--libdir=/lib \
 		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
-		--datadir=/usr/share \
 		--localstatedir=/var \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index 1a2bf91..4bcfc60 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -214,7 +214,7 @@ endif
 $(MATCHBOX_LIB_DIR)/.configured: $(MATCHBOX_LIB_DIR)/.unpacked xlib_libXext-install-staging
 	(cd $(MATCHBOX_LIB_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
@@ -241,7 +241,7 @@ $(MATCHBOX_LIB_DIR)/.configured: $(MATCHBOX_LIB_DIR)/.unpacked xlib_libXext-inst
 $(MATCHBOX_SNOTIFY_DIR)/.configured: $(MATCHBOX_SNOTIFY_DIR)/.unpacked
 	(cd $(MATCHBOX_SNOTIFY_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	lf_cv_sane_realloc=no \
 	./configure \
@@ -264,7 +264,7 @@ $(MATCHBOX_SNOTIFY_DIR)/.configured: $(MATCHBOX_SNOTIFY_DIR)/.unpacked
 $(MATCHBOX_WM_DIR)/.configured: $(MATCHBOX_WM_DIR)/.unpacked
 	(cd $(MATCHBOX_WM_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
@@ -291,7 +291,7 @@ $(MATCHBOX_WM_DIR)/.configured: $(MATCHBOX_WM_DIR)/.unpacked
 $(MATCHBOX_SM_DIR)/.configured: $(MATCHBOX_SM_DIR)/.unpacked
 	(cd $(MATCHBOX_SM_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
@@ -317,7 +317,7 @@ $(MATCHBOX_SM_DIR)/.configured: $(MATCHBOX_SM_DIR)/.unpacked
 $(MATCHBOX_CN_DIR)/.configured: $(MATCHBOX_CN_DIR)/.unpacked
 	(cd $(MATCHBOX_CN_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
@@ -342,7 +342,7 @@ $(MATCHBOX_CN_DIR)/.configured: $(MATCHBOX_CN_DIR)/.unpacked
 $(MATCHBOX_PL_DIR)/.configured: $(MATCHBOX_PL_DIR)/.unpacked
 	(cd $(MATCHBOX_PL_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
@@ -368,7 +368,7 @@ $(MATCHBOX_PL_DIR)/.configured: $(MATCHBOX_PL_DIR)/.unpacked
 $(MATCHBOX_DP_DIR)/.configured: $(MATCHBOX_DP_DIR)/.unpacked
 	(cd $(MATCHBOX_DP_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
@@ -394,7 +394,7 @@ $(MATCHBOX_DP_DIR)/.configured: $(MATCHBOX_DP_DIR)/.unpacked
 $(MATCHBOX_FK_DIR)/.configured: $(MATCHBOX_FK_DIR)/.unpacked
 	(cd $(MATCHBOX_FK_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
@@ -420,7 +420,7 @@ $(MATCHBOX_FK_DIR)/.configured: $(MATCHBOX_FK_DIR)/.unpacked
 $(MATCHBOX_KB_DIR)/.configured: $(MATCHBOX_KB_DIR)/.unpacked
 	(cd $(MATCHBOX_KB_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
 	LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
index 25fc5e4..1593210 100644
--- a/package/metacity/metacity.mk
+++ b/package/metacity/metacity.mk
@@ -38,7 +38,6 @@ $(METACITY_DIR)/.configured: $(METACITY_DIR)/.unpacked
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \
-		PKG_CONFIG=$(STAGING_DIR)/usr/bin/pkg-config \
 		GLIB_CONFIG=$(STAGING_DIR)/bin/glib-config \
 		ac_cv_func_posix_getpwuid_r=yes \
 		glib_cv_stack_grows=no \
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 498ae43..c3c190e 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -11,11 +11,6 @@ MIDORI_AUTORECONF = YES
 MIDORI_INSTALL_STAGING = NO
 MIDORI_INSTALL_TARGET = YES
 
-MIDORI_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME)  --prefix=/usr --sysconfdir=/etc \
-		PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
-
-
 MIDORI_DEPENDENCIES = uclibc pkgconfig webkit libsexy $(XSERVER)
 
 $(eval $(call AUTOTARGETS,package,midori))
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index eb816d9..0c73c48 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -10,7 +10,6 @@ PCMANFM_AUTORECONF = NO
 PCMANFM_INSTALL_STAGING = NO
 PCMANFM_INSTALL_TARGET = YES
 
-PCMANFM_CONF_ENV = PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
 PCMANFM_CONF_OPT = --disable-hal
 
 PCMANFM_DEPENDENCIES = uclibc pkgconfig libgtk2 gamin startup-notification
diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index 7611780..150ba04 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -11,7 +11,6 @@ SYLPHEED_INSTALL_STAGING = NO
 SYLPHEED_INSTALL_TARGET = YES
 SYLPHEED_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-SYLPHEED_CONF_ENV = PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
 SYLPHEED_CONF_OPT = --disable-gtkspell --program-prefix=""
 
 SYLPHEED_DEPENDENCIES = uclibc pkgconfig
