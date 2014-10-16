From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Oct 2014 13:52:57 +0200
Subject: [Buildroot] [git commit] libgtk3: ensure host version of pkg-config
	is used for native compilation
Message-ID: <20141016115711.2570CB3057@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=307df2883ed6f0ca583f8d6c9b87a9789d122507
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This already was in Eric's submission, but I removed it when committing
while cleaning up.  The package infrastructure already passes the correct
pkg-config to use for cross compilation, but NOT for building native tools,
so we ended up using the target variant and got wrong libraries/headers.

Fixes:

http://autobuild.buildroot.net/results/e0c/e0c2623e2d400ce66963eae23f136c0158556b36/
http://autobuild.buildroot.net/results/5bf/5bf66b8d16a3ddded24827bf278ad24b55ded6e7/
http://autobuild.buildroot.net/results/75f/75f93cea8ab59f052ddefa51c0bfc14c3df47a60/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgtk3/libgtk3.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index a9a681d..73b3e17 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -15,7 +15,8 @@ LIBGTK3_AUTORECONF = YES
 
 LIBGTK3_CONF_ENV = \
 	ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/usr/bin/gtk-update-icon-cache \
-	ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/usr/bin/gdk-pixbuf-csource
+	ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/usr/bin/gdk-pixbuf-csource \
+	PKG_CONFIG_FOR_BUILD=$(HOST_DIR)/usr/bin/pkgconf
 
 LIBGTK3_CONF_OPTS = --disable-glibtest \
 	--enable-explicit-deps=no \
