From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 21:30:05 +0100
Subject: [Buildroot] [git commit] libvncserver: add config option for
	tightpng encoding support
Message-ID: <20141227203033.5C0D27FC5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d4a54ed5157472f8e3c72f58bd79ab014845f03f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TightPNG encoding speeds up HTML5 based VNC clients like noVNC.
libvncserver enables this encoding if both libpng and jpeg libraries
are available.

[Thomas: rewrap Config.in help text.]

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libvncserver/Config.in       |   14 ++++++++++++++
 package/libvncserver/libvncserver.mk |    6 ++++++
 2 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/libvncserver/Config.in b/package/libvncserver/Config.in
index 07b77f5..28fbaa5 100644
--- a/package/libvncserver/Config.in
+++ b/package/libvncserver/Config.in
@@ -5,3 +5,17 @@ config BR2_PACKAGE_LIBVNCSERVER
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
+	  TightPNG encoding speeds up HTML5 based VNC clients like
+	  noVNC.
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
