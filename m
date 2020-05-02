From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 May 2020 18:34:30 +0200
Subject: [Buildroot] [git commit] package/proj: bump to version 7.0.1
Message-ID: <20200502163126.1DF4090D15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81ac873097ea052c7fe11e88e6cefd6117ea39b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- curl and tiff are optional dependencies since version 7.0.0 and
  https://github.com/OSGeo/PROJ/commit/db31b6dfa9c8fe37d5706d95ce81012b8db3c3b9
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/proj/proj.hash |  8 ++++----
 package/proj/proj.mk   | 16 +++++++++++++++-
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/package/proj/proj.hash b/package/proj/proj.hash
index ade9502b67..ac3d12b271 100644
--- a/package/proj/proj.hash
+++ b/package/proj/proj.hash
@@ -1,5 +1,5 @@
-# Fetched from http://download.osgeo.org/proj/proj-6.3.0.tar.gz.md5
-md5 09243feb4f243a2bdd455035a2007384 proj-6.3.0.tar.gz
+# Fetched from http://download.osgeo.org/proj/proj-7.0.1.tar.gz.md5
+md5  5ba7536b579a6c9e0ad822dbdd455985  proj-7.0.1.tar.gz
 # Locally calculated
-sha256 68ce9ba0005d442c2c1d238a3b9bc6654c358159b4af467b91e8d5b407c79c77 proj-6.3.0.tar.gz
-sha256 2dcac4af6990093ef48b896bfb81452d46a31b08d46cce34b27e83f93b2e37f6 COPYING
+sha256  a7026d39c9c80d51565cfc4b33d22631c11e491004e19020b3ff5a0791e1779f  proj-7.0.1.tar.gz
+sha256  2dcac4af6990093ef48b896bfb81452d46a31b08d46cce34b27e83f93b2e37f6  COPYING
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index 2be0004023..1c8f3f77c5 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROJ_VERSION = 6.3.0
+PROJ_VERSION = 7.0.1
 PROJ_SITE = http://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
@@ -23,4 +23,18 @@ PROJ_CONF_ENV = \
 	CFLAGS="$(PROJ_CFLAGS)" \
 	CXXFLAGS="$(PROJ_CXXFLAGS)"
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+PROJ_DEPENDENCIES += libcurl
+PROJ_CONF_OPTS += --with-curl=$(STAGING_DIR)/usr/bin/curl-config
+else
+PROJ_CONF_OPTS += --without-curl
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+PROJ_DEPENDENCIES += tiff
+PROJ_CONF_OPTS += --enable-tiff
+else
+PROJ_CONF_OPTS += --disable-tiff
+endif
+
 $(eval $(autotools-package))
