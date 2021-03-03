From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Mar 2021 19:12:27 +0100
Subject: [Buildroot] [PATCH v2,
 1/2] package/sconeserver: drop unrecognized options
Message-ID: <20210303181228.1079557-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop Magick++-config, lettuce and ui options which are
not recognized since latest bump in commit
ca17e0c7a02298b0250cdc121bcacef0b58fffe1 (back in 2018).

Indeed:
- Magick++-config is not used since
  https://github.com/sconemad/sconeserver/commit/b025999b8a9a9715b72d0fc8ccbf0888e163388f
- Experimental UI and lettuce modules have been dropped since
  https://github.com/sconemad/sconeserver/commit/ccc1efdb8981fbef63a714ff6315c8a18372090a

Moreover, replace sconesite-image by image (broken since 2013 and
https://github.com/sconemad/sconeserver/commit/7693301fdb0076bf7676eb2db278c2f015ac7157)

As UI and lettuce options are broken since a long time, it does not seem
useful to add entries in Config.in.legacy

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sconeserver/Config.in      | 17 -----------------
 package/sconeserver/sconeserver.mk | 19 ++-----------------
 2 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index a42abd70b7..09cf5d459c 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -79,13 +79,6 @@ comment "location support needs a toolchain w/ theads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBRARY
 
-config BR2_PACKAGE_SCONESERVER_LETTUCE
-	bool "lettuce"
-	help
-	  Sconeserver module for Lettuce embedded automation platform
-
-	  http://www.sconemad.com/lettuce/
-
 config BR2_PACKAGE_SCONESERVER_MATHS
 	bool "maths"
 	select BR2_PACKAGE_MPFR
@@ -97,16 +90,6 @@ config BR2_PACKAGE_SCONESERVER_TESTBUILDER
 	help
 	  Testbuilder module for Sconeserver
 
-config BR2_PACKAGE_SCONESERVER_UI
-	bool "ui"
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBX11
-	help
-	  UI module for Sconeserver
-
-comment "ui module requires X.org"
-	depends on !BR2_PACKAGE_XORG7
-
 endif # BR2_PACKAGE_SCONESERVER
 
 comment "sconeserver needs a toolchain with dynamic library, C++, NPTL"
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 9d4713afea..b81134002e 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -44,11 +44,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE),y)
 SCONESERVER_DEPENDENCIES += imagemagick
-SCONESERVER_CONF_OPTS += \
-	--with-sconesite-image \
-	--with-Magick++-config="$(STAGING_DIR)/usr/bin/Magick++-config"
+SCONESERVER_CONF_OPTS += --with-image
 else
-SCONESERVER_CONF_OPTS += --without-sconesite-image --with-Magick++-config=no
+SCONESERVER_CONF_OPTS += --without-image
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_MYSQL),y)
@@ -82,12 +80,6 @@ else
 SCONESERVER_CONF_OPTS += --without-location
 endif
 
-ifeq ($(BR2_PACKAGE_SCONESERVER_LETTUCE),y)
-SCONESERVER_CONF_OPTS += --with-lettuce
-else
-SCONESERVER_CONF_OPTS += --without-lettuce
-endif
-
 ifeq ($(BR2_PACKAGE_SCONESERVER_MATHS),y)
 SCONESERVER_DEPENDENCIES += mpfr
 SCONESERVER_CONF_OPTS += --with-maths
@@ -101,11 +93,4 @@ else
 SCONESERVER_CONF_OPTS += --without-testbuilder
 endif
 
-ifeq ($(BR2_PACKAGE_SCONESERVER_UI),y)
-SCONESERVER_DEPENDENCIES += xlib_libX11
-SCONESERVER_CONF_OPTS += --with-ui
-else
-SCONESERVER_CONF_OPTS += --without-ui
-endif
-
 $(eval $(autotools-package))
-- 
2.30.0
