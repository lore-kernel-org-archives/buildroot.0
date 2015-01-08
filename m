From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  8 Jan 2015 15:18:58 -0300
Subject: [Buildroot] [PATCH] dillo: zlib is a mandatory dependency
Message-ID: <1420741138-11738-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/10f/10f7ba386a13753c942139b8bc13ca74d8932f3a/

Also reorder variables a bit and ditch duplicate addition.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dillo/Config.in | 1 +
 package/dillo/dillo.mk  | 7 ++-----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/dillo/Config.in b/package/dillo/Config.in
index 5c2cc62..d06f2d1 100644
--- a/package/dillo/Config.in
+++ b/package/dillo/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_DILLO
 	depends on BR2_USE_MMU # fltk fork()
 	select BR2_PACKAGE_FLTK
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_ZLIB
 	help
 	  Dillo is a multi-platform graphical web browser known
 	  for its speed and small footprint.
diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
index c216322..9bdd56f 100644
--- a/package/dillo/dillo.mk
+++ b/package/dillo/dillo.mk
@@ -11,13 +11,10 @@ DILLO_LICENSE = GPLv3+
 DILLO_LICENSE_FILES = COPYING
 # For 0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch
 DILLO_AUTORECONF = YES
-
-DILLO_DEPENDENCIES = fltk
-
+DILLO_DEPENDENCIES = fltk zlib \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 DILLO_CONF_ENV = ac_cv_path_FLTK_CONFIG=$(STAGING_DIR)/usr/bin/fltk-config
 
-DILLO_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	DILLO_CONF_OPTS += --enable-ssl
 	DILLO_DEPENDENCIES += openssl
-- 
2.0.5
