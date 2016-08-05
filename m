From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 21:08:16 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: fix broken dependency
	for the hls plugin
Message-ID: <20160805191109.1BFC88222D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=707f718339699ece871d46c602378e4d57a62d3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

HLS plugin can be built with nettle or libgcrypt or openssl
cryptographic backend. But current dependency on gnutls is incorrect.
It has been working so far because gnutls depends on nettle.

gst-plugins-bad's build system for HLS allows user to choose which
cryptographic backend to use. If that is not specified, it internally
checks for nettle or libgcrypt or openssl in order. If none of the
cryptographic backend is available, HLS plugin gets disabled internally.

Select cryptographic backend according to which cryptographic packages
are available. If both libgcrypt or openssl are not available, choose
nettle by default.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           |  2 +-
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 0f9fb15..2f288ca 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -530,7 +530,7 @@ comment "gl needs the gst1-plugins-bad opengl library"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS
 	bool "hls"
-	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_NETTLE if !(BR2_PACKAGE_LIBGCRYPT || BR2_PACKAGE_OPENSSL)
 	help
 	  Fragmented streaming plugins
 
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 8f739ec..3ffdd10 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -650,7 +650,19 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-hls
-GST1_PLUGINS_BAD_DEPENDENCIES += gnutls
+
+ifeq ($(BR2_PACKAGE_NETTLE),y)
+GST1_PLUGINS_BAD_DEPENDENCIES += nettle
+GST1_PLUGINS_BAD_CONF_OPTS += --with-hls-crypto=nettle
+else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+GST1_PLUGINS_BAD_DEPENDENCIES += libgcrypt
+GST1_PLUGINS_BAD_CONF_OPTS += --with-hls-crypto=libgcrypt \
+	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
+else
+GST1_PLUGINS_BAD_DEPENDENCIES += openssl
+GST1_PLUGINS_BAD_CONF_OPTS += --with-hls-crypto=openssl
+endif
+
 else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-hls
 endif
