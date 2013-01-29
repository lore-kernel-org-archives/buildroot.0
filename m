From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jan 2013 23:43:51 +0100
Subject: [Buildroot] [PATCH 07/29] package/qemu: add VNC jpeg and png
	compression
In-Reply-To: <cover.1359498903.git.yann.morin.1998@free.fr>
References: <cover.1359498903.git.yann.morin.1998@free.fr>
Message-ID: <511776afd608622c852ed740c14cfbedc20eb37c.1359498903.git.yann.morin.1998@free.fr>
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
index d904566..82546a6 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -85,6 +85,16 @@ config BR2_PACKAGE_QEMU_VNC
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
index c122be7..7563e24 100644
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
@@ -152,8 +166,6 @@ define QEMU_CONFIGURE_CMDS
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
