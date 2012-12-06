From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu,  6 Dec 2012 15:12:50 +0000
Subject: [Buildroot] [PATCH] sconeserver: fix imagemagick build failures
Message-ID: <1354806770-1673-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The sconeserver configure script uses Magick++-config to obtain compiler and
linker arguments for the imagemagick libraries. This doesn't work in
Buildroot, and causes build failures such as the following

  http://autobuild.buildroot.net/results/7833edd60bbb2c291aea1efb5ccf407da7f4a51f/build-end.log

The upstream sconeserver code has been changed to use pkg-config directly,
instead of Magick++-config; this patch adapts the sconeserver package to
the upstream change.

Both this patch and the associated upstream change are based on a Buildroot
patch submitted by Samuel Martin: http://patchwork.ozlabs.org/patch/200901/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/sconeserver/sconeserver.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 15a1edc..ab3d1fc 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -5,7 +5,7 @@
 #############################################################
 # Release 0.6.0 doesn't build cleanly, so use a recent
 # Subversion trunk snapshot.
-SCONESERVER_VERSION = 180
+SCONESERVER_VERSION = 183
 SCONESERVER_SITE = \
 	https://sconeserver.svn.sourceforge.net/svnroot/sconeserver/trunk
 SCONESERVER_SITE_METHOD = svn
@@ -51,7 +51,7 @@ else
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE),y)
-	SCONESERVER_DEPENDENCIES += imagemagick
+	SCONESERVER_DEPENDENCIES += imagemagick host-pkgconf
 	SCONESERVER_CONF_OPT += --with-sconesite-image
 else
 	SCONESERVER_CONF_OPT += --without-sconesite-image
-- 
1.7.10.4
