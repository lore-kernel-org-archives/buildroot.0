From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2015 09:09:28 +0200
Subject: [Buildroot] [git commit] package/freerdp: re-add support for
	gstreamer
Message-ID: <20151003071222.F214080585@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c7f3b28e694da032a80cc5f55ef124f2c6e81ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previously, we expected the user to select gstreamer-0.x on his own,
to enable gstreamer support in FreeRDP. This could have been a bit
confusing to the user, as he may have enabled gst-1.x but FreeRDP did
only support gst-0.x.

Also, gstreamer support needs xlib-libxrandr, which was missing in
FreeRDP's dependencies, so it was never enabled (AFAICS).

(Re-)introduce support for gstreamer-0.x and gstreamer-1.x, since both
are supported.

We're doing it in a choice, and select whichever version the user chooses,
rather than automatically detect it as previosuly done.  We can select the
gstreamer packages, as their dependencies are anyway already covered by the
ones of FreeRDP.

This also now requires xlib-libxrandr, so hide the choice if X.org is
not enabled, still offer the option of not using gstreamer if it is.

[Peter: Hide option if gstreamer{,1} aren't enabled,
	Default to gstreamer{,1} support enabled
	GStreamer 0.10 support needs host-pkgconf and libxml2]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/Config.in  |   31 +++++++++++++++++++++++++++++++
 package/freerdp/freerdp.mk |   14 +++++++++++++-
 2 files changed, 44 insertions(+), 1 deletions(-)

diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index ab8c3f5..12619a5 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -23,6 +23,37 @@ config BR2_PACKAGE_FREERDP
 
 if BR2_PACKAGE_FREERDP
 
+choice
+	bool "gstreamer support"
+	depends on BR2_PACKAGE_XORG7 # xlib-libxrandr
+	depends on BR2_PACKAGE_GSTREAMER || BR2_PACKAGE_GSTREAMER1
+
+config BR2_PACKAGE_FREERDP_GSTREAMER1
+	bool "gstreamer-1.x"
+	depends on BR2_PACKAGE_GSTREAMER1
+	# gstreamer-1.x dependencies already dependencies of FreeRDP
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+
+config BR2_PACKAGE_FREERDP_GSTREAMER
+	bool "gstreamer-0.x"
+	depends on BR2_PACKAGE_GSTREAMER
+	# gstreamer-0.x dependencies already dependencies of FreeRDP
+	select BR2_PACKAGE_GST_PLUGINS_BASE
+	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_LIBXML2
+
+config BR2_PACKAGE_FREERDP_GSTREAMER_NO
+	bool "none"
+
+endchoice
+
+comment "gstreamer support needs X.Org"
+	depends on !BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_GSTREAMER || BR2_PACKAGE_GSTREAMER1
+
 config BR2_PACKAGE_FREERDP_SERVER
 	bool "server"
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 9205169..30108b6 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -15,7 +15,19 @@ FREERDP_INSTALL_STAGING = YES
 
 FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev
 
-FREERDP_CONF_OPTS += -DWITH_GSTREAMER_0_10=OFF -DWITH_GSTREAMER_1_0=OFF
+ifeq ($(BR2_PACKAGE_FREERDP_GSTREAMER),y)
+FREERDP_CONF_OPTS += -DWITH_GSTREAMER_0_10=ON
+FREERDP_DEPENDENCIES += gstreamer gst-plugins-base libxml2 host-pkgconf
+else
+FREERDP_CONF_OPTS += -DWITH_GSTREAMER_0_10=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_FREERDP_GSTREAMER1),y)
+FREERDP_CONF_OPTS += -DWITH_GSTREAMER_1_0=ON
+FREERDP_DEPENDENCIES += gstreamer1 gst1-plugins-base
+else
+FREERDP_CONF_OPTS += -DWITH_GSTREAMER_1_0=OFF
+endif
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
 FREERDP_CONF_OPTS += -DWITH_CUPS=ON
