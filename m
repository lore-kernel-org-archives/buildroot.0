From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 23:16:04 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/sconeserver:
 disable image
Message-ID: <20210426205012.0C65C7FB0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c958b484f94d3a4e1044767356fb59d481d67ac3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Build of http::sconesite::image module was silently broken until commit
d3b818c3cf0990117a8b59fcfc6c212f310ae6ec

However, sconeserver fails to build with ImageMagick because:
- it checks for ImageMagick++.pc instead of ImageMagick.pc
- it uses the transform function which has been removed from the public
  API since version 7.0.1-0 and
  https://github.com/ImageMagick/ImageMagick/commit/06f590165f0505d42005264893fe14a9e8a79986

As sconeserver does not seem to be maintained anymore, drop
BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE.

Fixes:
 - http://autobuild.buildroot.org/results/895ab582d1140f7677fc1c6934fa2e0c47c49f20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout: add legacy symbol. It costs us exactly nothing, and if someone
actually had that selected, they know what's going on.]
(cherry picked from commit fdb6fc2b4a5be747e7695f594cbbb1a941ceb05b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                   |  6 ++++++
 package/sconeserver/Config.in      |  8 --------
 package/sconeserver/sconeserver.mk | 15 +++++++--------
 3 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 937aed7399..af0c1ba50c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2021.02"
 
+config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE
+	bool "sconeserver http::sconesite::image removed"
+	help
+	  Sconeserver cannot be built with ImageMagick - it uses the
+	  "transofrm" function which is removed from public API.
+
 config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_EVDEV
 	bool "KDrive/TinyX evdev input driver removed"
 	select BR2_LEGACY
diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 429ac81fe1..d46ba85fbc 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -26,14 +26,6 @@ config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE
 	help
 	  http::sconesite module for Sconeserver
 
-config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE
-	bool "http::sconesite::image"
-	depends on BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE
-	depends on BR2_USE_MMU # imagemagick
-	select BR2_PACKAGE_IMAGEMAGICK
-	help
-	  http::sconesite::image module for Sconeserver
-
 config BR2_PACKAGE_SCONESERVER_MYSQL
 	bool "mysql"
 	depends on BR2_USE_MMU # mysql
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 62cc128d77..17407c29f5 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -14,10 +14,16 @@ SCONESERVER_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_PCRE),pcre) \
 	zlib
+# disable image as it fails to build with ImageMagick
 # disable markdown module because its git submodule cmark
 # https://github.com/sconemad/sconeserver/tree/master/markdown
 # has no cross-compile support provided by the sconeserver build system
-SCONESERVER_CONF_OPTS += --with-ip --with-local --with-ip6 --without-markdown
+SCONESERVER_CONF_OPTS += \
+	--with-ip \
+	--with-local \
+	--with-ip6 \
+	--without-image \
+	--without-markdown
 
 # Sconeserver configure script fails to find the libxml2 headers.
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
@@ -45,13 +51,6 @@ else
 SCONESERVER_CONF_OPTS += --without-sconesite
 endif
 
-ifeq ($(BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE),y)
-SCONESERVER_DEPENDENCIES += imagemagick
-SCONESERVER_CONF_OPTS += --with-image
-else
-SCONESERVER_CONF_OPTS += --without-image
-endif
-
 ifeq ($(BR2_PACKAGE_SCONESERVER_MYSQL),y)
 SCONESERVER_DEPENDENCIES += mysql
 SCONESERVER_CONF_OPTS += \
