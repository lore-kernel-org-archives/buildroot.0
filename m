From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 Aug 2009 22:15:12 +0200
Subject: [Buildroot] [git commit] webkit: Update to WebKit svn r44552.
Message-ID: <20090802201804.E6366777C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=81f9990e021011146537c106190116d728477329
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #427

- Fix generation of configure script and Makefiles.
 - Add dependencies on libsoup and enchant.
 - Allow configuration of rendering target (currently X11 or DirectFB).

Signed-off-by: Will Newton <will.newton@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    1 +
 package/webkit/Config.in |   21 +++++++++++++++++++--
 package/webkit/webkit.mk |   23 ++++++++++++++++++++---
 3 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4c3d403..58e5709 100644
--- a/CHANGES
+++ b/CHANGES
@@ -44,6 +44,7 @@
 	#417: New package spawn-fcgi
 	#419: Bump lighttpd package to 1.4.23
 	#421: toolchain: Clean up toolchain locale support menu
+	#427: webkit: Update to WebKit svn r44552
 	#451: Upgrade from unmaintained dosfstools-2.11 to dosfstools-3.0.3
 	#467: DirectFB 1.4.1
 	#473: memstat_0.5.tar.gz has install with -D and that fails "make"
diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 9e3419a..e436f9a 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -8,10 +8,27 @@ config BR2_PACKAGE_WEBKIT
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_ENCHANT
+	select BR2_PACKAGE_LIBSOUP
 	help
-		WebKit is an open source, standards compliant web browser engine.
+	  WebKit is an open source, standards compliant web browser engine.
 
-		http://webkit.org/
+	  http://webkit.org/
 
 comment "webkit requires a toolchain with C++ support and WCHAR enabled"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+
+choice
+	prompt "Rendering target"
+	default BR2_PACKAGE_WEBKIT_X
+	help
+	  Selects which rendering target will be used.
+
+config BR2_PACKAGE_WEBKIT_X11
+	bool "X11"
+
+config BR2_PACKAGE_WEBKIT_DIRECTFB
+	bool "DirectFB"
+	select BR2_PACKAGE_DIRECTFB
+
+endchoice
diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index b070c1d..17f1318 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -3,7 +3,7 @@
 # webkit
 #
 #############################################################
-WEBKIT_VERSION = r31321
+WEBKIT_VERSION = r44552
 WEBKIT_SOURCE = WebKit-$(WEBKIT_VERSION).tar.bz2
 WEBKIT_SITE = http://nightly.webkit.org/files/trunk/src/
 
@@ -11,7 +11,24 @@ WEBKIT_INSTALL_STAGING = YES
 WEBKIT_INSTALL_TARGET = YES
 WEBKIT_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
 
-WEBKIT_AUTORECONF = YES
-WEBKIT_DEPENDENCIES = icu curl libxml2 libxslt libgtk2 sqlite
+WEBKIT_DEPENDENCIES = icu curl libxml2 libxslt libgtk2 sqlite enchant \
+			libsoup
+
+ifeq ($(BR2_PACKAGE_WEBKIT_X11),y)
+WEBKIT_CONF_OPT = --with-target=x11
+endif
+
+ifeq ($(BR2_PACKAGE_WEBKIT_DIRECTFB),y)
+WEBKIT_CONF_OPT = --with-target=directfb
+endif
+
+WEBKIT_CONF_OPT += --disable-video
 
 $(eval $(call AUTOTARGETS,package,webkit))
+
+$(WEBKIT_HOOK_POST_EXTRACT):
+	$(SED) 's/AUTOMAKE_FLAGS=.*/AUTOMAKE_FLAGS="--foreign --add-missing --copy"/' $(WEBKIT_DIR)/autogen.sh
+	$(SED) 's/LIBTOOLIZE_FLAGS=.*/LIBTOOLIZE_FLAGS="--force --automake --copy"/' $(WEBKIT_DIR)/autogen.sh
+	# Don't run the configure step yet
+	cd $(WEBKIT_DIR); AUTOGEN_CONFIGURE_ARGS=--version ./autogen.sh
+	touch $@
-- 
1.6.3.3
