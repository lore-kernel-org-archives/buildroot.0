From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 15:58:39 +0100
Subject: [Buildroot] [git commit branch/next] package/fltk: bump to 1.3.3
Message-ID: <20150221150005.60FFC80506@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81022211cefa0ae7dfcaea3e75d38f61a0855ca3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In this release two dependencies on xlib_libXcursor
and xlib_libXfixes have been added.

See http://www.fltk.org/articles.php?L1392

Also add hash file

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fltk/fltk.hash |    4 ++++
 package/fltk/fltk.mk   |   16 +++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/package/fltk/fltk.hash b/package/fltk/fltk.hash
new file mode 100644
index 0000000..7b9b67d
--- /dev/null
+++ b/package/fltk/fltk.hash
@@ -0,0 +1,4 @@
+# From http://www.fltk.org/software.php?VERSION=1.3.3
+md5	9ccdb0d19dc104b87179bd9fd10822e3	fltk-1.3.3-source.tar.gz
+# Locally generated
+sha256	f8398d98d7221d40e77bc7b19e761adaf2f1ef8bb0c30eceb7beb4f2273d0d97	fltk-1.3.3-source.tar.gz
diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index 44e0f97..a629b39 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLTK_VERSION = 1.3.2
+FLTK_VERSION = 1.3.3
 FLTK_SOURCE = fltk-$(FLTK_VERSION)-source.tar.gz
 FLTK_SITE = http://fltk.org/pub/fltk/$(FLTK_VERSION)
 FLTK_INSTALL_STAGING = YES
@@ -20,6 +20,20 @@ FLTK_CONF_OPTS += --enable-cairo
 FLTK_DEPENDENCIES += cairo
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
+FLTK_DEPENDENCIES += xlib_libXcursor
+FLTK_CONF_OPTS += --enable-xcursor
+else
+FLTK_CONF_OPTS += --disable-xcursor
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
+FLTK_DEPENDENCIES += xlib_libXfixes
+FLTK_CONF_OPTS += --enable-xfixes
+else
+FLTK_CONF_OPTS += --disable-xfixes
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
 FLTK_CONF_ENV += ac_cv_path_FTCONFIG=$(STAGING_DIR)/usr/bin/freetype-config
 FLTK_DEPENDENCIES += xlib_libXft
