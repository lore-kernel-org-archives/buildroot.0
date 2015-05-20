From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 May 2015 23:20:53 +0200
Subject: [Buildroot] [git commit] package/freerdp: fix build with gstreamer
	support
Message-ID: <20150520212100.184BD81DCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ffee06d2e3c81db0dde4c29ea6ddb047116d3296
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

FreeRDP with gstreamer support enabled needs gstreamer and gst-plugins-base
with gstapp.

Fixes:
  http://autobuild.buildroot.net/results/937/9373d4238bc3f027e571581bd3531018c4faed91/
  http://autobuild.buildroot.org/results/f77/f77a2c9eea7973b54a22e12ab33ee8964adaddfd/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Tested-by: Gergely Imreh <imrehg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/Config.in  |    2 ++
 package/freerdp/freerdp.mk |    3 ++-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index 2e879b4..f7d6550 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_FREERDP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_GST_PLUGINS_BASE if BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP if BR2_PACKAGE_GSTREAMER
 	help
 	  FreeRDP is a free implementation of the Remote Desktop
 	  Protocol (RDP), released under the Apache license
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index c7c933e..0d10ef8 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -17,7 +17,8 @@ FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev
 
 ifeq ($(BR2_PACKAGE_GSTREAMER),y)
 FREERDP_CONF_OPTS += -DWITH_GSTREAMER=ON
-FREERDP_DEPENDENCIES += gstreamer
+# freerdp needs gstinterface and gstapp from gst-plugins-base
+FREERDP_DEPENDENCIES += gstreamer gst-plugins-base
 else
 FREERDP_CONF_OPTS += -DWITH_GSTREAMER=OFF
 endif
