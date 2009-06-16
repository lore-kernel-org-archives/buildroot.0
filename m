From: Will Newton <will.newton@gmail.com>
Date: Tue, 16 Jun 2009 21:33:56 +0100
Subject: [Buildroot] [git commit] gstreamer: Allow libxml2 dependency to be
	configured.
Message-ID: <20090618085944.9E9D577820@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9310e12d5bbb5e10f899672980fb63bd24382bd1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


gstreamer uses libxml2 to support the plugin registry and pipeline
load/save features. This change allows the user to build gstreamer without
libxml2 which saves a large amount of space on the target.

Closes #373.

Signed-off-by: Will Newton <will.newton@gmail.com>
---
 package/multimedia/gstreamer/Config.in    |    7 ++++++-
 package/multimedia/gstreamer/gstreamer.mk |   10 +++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/gstreamer/Config.in b/package/multimedia/gstreamer/Config.in
index 213d650..8c80801 100644
--- a/package/multimedia/gstreamer/Config.in
+++ b/package/multimedia/gstreamer/Config.in
@@ -1,8 +1,13 @@
 config BR2_PACKAGE_GSTREAMER
 	bool "gstreamer"
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBXML2
 	help
 	  GStreamer is an open source multimedia framework.
 
 	  http://gstreamer.freedesktop.org/
+
+config BR2_PACKAGE_GSTREAMER_LIBXML2
+	bool "require libxml2 for registry and load/save"
+	default y
+	select BR2_PACKAGE_LIBXML2
+	depends on BR2_PACKAGE_GSTREAMER
diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index 8b30209..821a233 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -24,6 +24,14 @@ GSTREAMER_CONF_OPT = \
 		--disable-tests \
 		--disable-failing-tests
 
-GSTREAMER_DEPENDENCIES = libglib2 libxml2 host-pkgconfig
+GSTREAMER_DEPENDENCIES = libglib2 host-pkgconfig
+
+ifeq ($(BR2_PACKAGE_GSTREAMER_LIBXML2),y)
+GSTREAMER_DEPENDENCIES += libxml2
+else
+GSTREAMER_CONF_OPT += \
+	--disable-registry \
+	--disable-loadsave
+endif
 
 $(eval $(call AUTOTARGETS,package/multimedia,gstreamer))
-- 
1.6.0.6
