From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 6 Sep 2011 15:19:57 +0200
Subject: [Buildroot] [git commit] libsoup: add option to enable HTTPS (SSL)
	support
Message-ID: <20110906152206.40BD08D421@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bd387486ad871164e4fbe86eb6570775086acfbe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By selecting BR2_PACKAGE_LIBSOUP_SSL the gnutls package is selected
and libsoup will be compiled with SSL support.

[Peter: pass --with-libgcrypt-prefix so configure finds it]
Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libsoup/Config.in  |    7 +++++++
 package/libsoup/libsoup.mk |    8 +++++++-
 2 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 2264b63..347687c 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -12,5 +12,12 @@ config BR2_PACKAGE_LIBSOUP
 
 	  http://live.gnome.org/LibSoup
 
+config BR2_PACKAGE_LIBSOUP_SSL
+	bool "https support"
+	select BR2_PACKAGE_GNUTLS
+	depends on BR2_PACKAGE_LIBSOUP
+	help
+	  Enable HTTPS (SSL) support.
+
 comment "libsoup requires a toolchain with WCHAR support"
 	depends on !BR2_USE_WCHAR
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 11bfadd..79a8d55 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -19,9 +19,15 @@ endif
 LIBSOUP_CONF_OPT = \
 	--disable-explicit-deps \
 	--disable-glibtest	\
-	--disable-ssl		\
 	--without-gnome
 
 LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-pkg-config host-libglib2 libglib2 libxml2
 
+ifeq ($(BR2_PACKAGE_LIBSOUP_SSL),y)
+LIBSOUP_DEPENDENCIES += gnutls
+LIBSOUP_CONF_OPT += --enable-ssl --with-libgcrypt-prefix=$(STAGING_DIR)/usr
+else
+LIBSOUP_CONF_OPT += --disable-ssl
+endif
+
 $(eval $(call AUTOTARGETS,package,libsoup))
-- 
1.7.3.4
