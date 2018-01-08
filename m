From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 20:57:25 +0100
Subject: [Buildroot] [git commit] rygel: fix UI build
Message-ID: <20180108195747.532CD83574@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fbd28e217a3ee64b3864cca3a3ac554493d979f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to avoid failing on a configure error if UI example can't be
built if libgtk3 is available but not gst1-plugins-base (gstreamer-video
is only needed for UI example, not for rygel UI)

Fixes:
 - http://autobuild.buildroot.net/results/6c659aadfc418c0a27a93284eb34d75e2b0dc169

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...01-Allow-UI-build-without-gstreamer-video.patch | 37 ++++++++++++++++++++++
 package/rygel/rygel.mk                             |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/package/rygel/0001-Allow-UI-build-without-gstreamer-video.patch b/package/rygel/0001-Allow-UI-build-without-gstreamer-video.patch
new file mode 100644
index 0000000..6e1f528
--- /dev/null
+++ b/package/rygel/0001-Allow-UI-build-without-gstreamer-video.patch
@@ -0,0 +1,37 @@
+From f3a49ad1a4ba172e97bd860bc067f7e9ebe69509 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 8 Jan 2018 13:27:42 +0100
+Subject: [PATCH] Allow UI build without gstreamer-video
+
+If EXAMPLE_UI dependencies are not met, only display a warning.
+Indeed, currently, we can't build rygel UI without gstreamer-video which
+is only a dependency of fullscreen-renderer application.
+
+fullscreen-renderer won't be build without gstreamer as HAVE_GSTREAMER
+has to be true to check HAVE_UI in examples/Makefile.am
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 00b94da..d140a27 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -359,7 +359,11 @@ if test x$try_ui = xyes ; then
+                           [$RYGEL_COMMON_MODULES gio-2.0 >= $GIO_REQUIRED
+                            gssdp-1.0 >= $GSSDP_REQUIRED
+                            gstreamer-video-1.0 >= $GSTREAMER_REQUIRED
+-                           gtk+-3.0 >= $GTK_REQUIRED])
++                           gtk+-3.0 >= $GTK_REQUIRED],,
++                          [
++                           AC_MSG_WARN([Example UI dependencies not found.])
++                           AC_MSG_WARN([Example UI applications will not be built.])
++                          ])
+       ],
+       [
+         AC_MSG_WARN([UI dependencies not found.])
+-- 
+2.7.4
+
diff --git a/package/rygel/rygel.mk b/package/rygel/rygel.mk
index e892df7..cd8897c 100644
--- a/package/rygel/rygel.mk
+++ b/package/rygel/rygel.mk
@@ -16,6 +16,8 @@ RYGEL_DEPENDENCIES = \
 	libmediaart \
 	sqlite
 RYGEL_INSTALL_STAGING = YES
+# We're patching configure.ac
+RYGEL_AUTORECONF = YES
 
 RYGEL_CONF_OPTS += \
 	--disable-apidocs \
