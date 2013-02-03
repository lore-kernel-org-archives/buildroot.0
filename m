From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Feb 2013 15:06:44 +0100
Subject: [Buildroot] [PATCH 07/29] package/qemu: add VNC jpeg and png
	compression
In-Reply-To: <cover.1359899108.git.yann.morin.1998@free.fr>
References: <cover.1359899108.git.yann.morin.1998@free.fr>
Message-ID: <8cfa05850f57edcc0fc6514f4900748d53ec9b2b.1359899108.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |   10 ++++++++++
 package/qemu/qemu.mk   |   16 ++++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index ec9bcc6..1c2af6d 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -71,6 +71,16 @@ config BR2_PACKAGE_QEMU_VNC
 	  Say 'y' to enable the VNC frontend, that is, QEMU will act as a
 	  VNC server presenting the VM's display.
 
+config BR2_PACKAGE_QEMU_VNC_PNG
+	bool "PNG compression"
+	depends on BR2_PACKAGE_QEMU_VNC
+	select BR2_PACKAGE_LIBPNG
+
+config BR2_PACKAGE_QEMU_VNC_JPEG
+	bool "JPEG compression"
+	depends on BR2_PACKAGE_QEMU_VNC
+	select BR2_PACKAGE_JPEG
+
 config BR2_PACKAGE_QEMU_SDL
 	bool "Enable SDL frontend"
 	select BR2_PACKAGE_SDL
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 7ca5966..bf892df 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -120,6 +120,20 @@ else
 QEMU_OPTS += --disable-vnc
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_VNC_PNG),y)
+QEMU_OPTS += --enable-vnc-png
+QEMU_DEPENDENCIES += libpng
+else
+QEMU_OPTS += --disable-vnc-png
+endif
+
+ifeq ($(BR2_PACKAGE_QEMU_VNC_JPEG),y)
+QEMU_OPTS += --enable-vnc-jpeg
+QEMU_DEPENDENCIES += jpeg
+else
+QEMU_OPTS += --disable-vnc-jpeg
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_SDL),y)
 QEMU_OPTS += --enable-sdl
 QEMU_DEPENDENCIES += sdl
@@ -147,8 +161,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-bsd-user                  \
 	        --disable-xen                       \
 	        --disable-slirp                     \
-	        --disable-vnc-jpeg                  \
-	        --disable-vnc-png                   \
 	        --disable-vnc-tls                   \
 	        --disable-vnc-sasl                  \
 	        --disable-virtfs                    \
-- 
1.7.2.5
