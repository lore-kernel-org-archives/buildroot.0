From: Floris Bos <bos@je-eigen-domein.nl>
Date: Fri, 26 Dec 2014 01:46:15 +0100
Subject: [Buildroot] [PATCH 2/2] libvncserver: add config option for
	tightpng encoding support
In-Reply-To: <1419554775-11560-1-git-send-email-bos@je-eigen-domein.nl>
References: <1419554775-11560-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <1419554775-11560-2-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
index b26d5b9..8479a62 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -56,4 +56,10 @@ else
 LIBVNCSERVER_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVNCSERVER_TIGHTPNG),y)
+LIBVNCSERVER_DEPENDENCIES += libpng
+else
+LIBVNCSERVER_CONF_OPTS += --without-png
+endif
+
 $(eval $(autotools-package))
-- 
1.9.1
