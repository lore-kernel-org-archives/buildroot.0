From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Jan 2015 23:37:10 +0100
Subject: [Buildroot] [PATCH 6/6 v4] package/weston: add support for the RDP
	compositor
In-Reply-To: <cover.1422225347.git.yann.morin.1998@free.fr>
References: <cover.1422225347.git.yann.morin.1998@free.fr>
Message-ID: <afeaa5c1b90c41b25a3ace3c6d9a29f33d161aa3.1422225347.git.yann.morin.1998@free.fr>
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
index 49130b4..755da94 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -40,6 +40,23 @@ config BR2_PACKAGE_WESTON_HAS_COMPOSITOR
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
index 9964b90..2829a10 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -32,6 +32,13 @@ else
 WESTON_CONF_OPTS += --disable-libinput-backend
 endif
 
+ifeq ($(BR2_PACKAGE_WESTON_RDP),y)
+WESTON_DEPENDENCIES += freerdp
+WESTON_CONF_OPTS += --enable-rdp-compositor
+else
+WESTON_CONF_OPTS += --disable-rdp-compositor
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 WESTON_DEPENDENCIES += libunwind
 else
-- 
1.9.1
