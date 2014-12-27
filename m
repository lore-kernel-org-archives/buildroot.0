From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sat, 27 Dec 2014 20:12:54 +0100
Subject: [Buildroot] [PATCH v2 1/1] libvncserver: add config option for
	tightpng encoding support
Message-ID: <1419707574-32280-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TightPNG encoding speeds up HTML5 based VNC clients like noVNC.
libvncserver enables this encoding if both libpng and jpeg libraries
are available.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/libvncserver/Config.in       | 13 +++++++++++++
 package/libvncserver/libvncserver.mk |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/package/libvncserver/Config.in b/package/libvncserver/Config.in
index 07b77f5..7d8272f 100644
--- a/package/libvncserver/Config.in
+++ b/package/libvncserver/Config.in
@@ -5,3 +5,16 @@ config BR2_PACKAGE_LIBVNCSERVER
 	  libvncserver is a VNC server/client library.
 
 	  http://libvncserver.sourceforge.net/
+
+if BR2_PACKAGE_LIBVNCSERVER
+
+config BR2_PACKAGE_LIBVNCSERVER_TIGHTPNG
+	bool "TightPNG encoding support"
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBPNG
+	help
+	  TightPNG encoding speeds up HTML5 based VNC clients like noVNC.
+
+	  http://wiki.qemu.org/VNC_Tight_PNG
+
+endif
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index a8389b4..ed6b64d 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -58,6 +58,12 @@ else
 LIBVNCSERVER_CONF_OPTS += --without-jpeg
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+LIBVNCSERVER_DEPENDENCIES += libpng
+else
+LIBVNCSERVER_CONF_OPTS += --without-png
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBVNCSERVER_DEPENDENCIES += zlib
 else
-- 
1.9.1
