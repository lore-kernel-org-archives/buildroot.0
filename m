From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Feb 2015 23:36:24 +0100
Subject: [Buildroot] [PATCH 11/11 v5] package/weston: add support for the
	RDP compositor
In-Reply-To: <cover.1424558036.git.yann.morin.1998@free.fr>
References: <cover.1424558036.git.yann.morin.1998@free.fr>
Message-ID: <3c9c14cd7d1baa7a1fbe865c0df0a8a7e2541b4b.1424558036.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using the RDP compositor, one can run a headless machine to serve remote
clients, using the RDP protocol.

Add an option to enable the rdp-backend.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 package/weston/Config.in | 17 +++++++++++++++++
 package/weston/weston.mk |  7 +++++++
 2 files changed, 24 insertions(+)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index b7f4f27..8983460 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -39,6 +39,23 @@ config BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 config BR2_PACKAGE_WESTON_FBDEV
 	bool "fbdev compositor"
 
+config BR2_PACKAGE_WESTON_RDP
+	bool "RDP compositor"
+	select BR2_PACKAGE_FREERDP
+	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
+	help
+	  This enables the RDP backend, which allows accessing weston
+	  through the network with any RDP-compliant client.
+
+	  Please note that one must pass those options to weston for RDP
+	  to be functional:
+	    --rdp-tls-cert=/path/to/server.crt
+	    --rdp-tls-key=/path/to/server.key
+
+	  By default, Buildroot installs such files in /etc/freerdp/server/
+	  so you may want to change them in a post-build script or a rootfs
+	  overlay.
+
 # rpi-userland is an EGL/GLES provider, so we can't select it
 config BR2_PACKAGE_WESTON_RPI
 	bool "RPi compositor"
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 8a5a891..bf49436 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -31,6 +31,13 @@ else
 WESTON_CONF_OPTS += --disable-libunwind
 endif
 
+ifeq ($(BR2_PACKAGE_WESTON_RDP),y)
+WESTON_DEPENDENCIES += freerdp
+WESTON_CONF_OPTS += --enable-rdp-compositor
+else
+WESTON_CONF_OPTS += --disable-rdp-compositor
+endif
+
 ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
 WESTON_CONF_OPTS += --enable-fbdev-compositor
 else
-- 
1.9.1
