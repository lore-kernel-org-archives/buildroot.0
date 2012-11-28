From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Nov 2012 00:54:28 +0100
Subject: [Buildroot] [PATCH 29/51] package/qemu: add option to
	enable/disable the VNC frontend
In-Reply-To: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1354146890-27380-30-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |    7 +++++++
 package/qemu/qemu.mk   |   11 ++++++++++-
 2 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index baa7037..2648e71 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -81,6 +81,13 @@ endif # BR2_PACKAGE_QEMU_CUSTOM_TARGETS == ""
 
 comment "Frontends"
 
+config BR2_PACKAGE_QEMU_VNC
+	bool "Enable VNC frontend"
+	select BR2_PACKAGE_VNC
+	help
+	  Say 'y' to enable the VNC frontend, that is, QEMU will act as a
+	  VNC server presenting the VM's display.
+
 config BR2_PACKAGE_QEMU_SDL
 	bool "Enable SDL frontend"
 	select BR2_PACKAGE_SDL
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 75969d5..5640848 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -129,6 +129,12 @@ ifneq ($(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS)),)
 QEMU_OPTS += --target-list="$(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS))"
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_VNC),y)
+QEMU_OPTS += --enable-vnc
+else
+QEMU_OPTS += --disable-vnc
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_SDL),y)
 QEMU_OPTS += --enable-sdl
 QEMU_DEPENDENCIES += sdl
@@ -164,7 +170,10 @@ define QEMU_CONFIGURE_CMDS
 	        --enable-vhost-net                  \
 	        --disable-xen                       \
 	        --disable-slirp                     \
-	        --disable-vnc                       \
+	        --disable-vnc-jpeg                  \
+	        --disable-vnc-png                   \
+	        --disable-vnc-tls                   \
+	        --disable-vnc-sasl                  \
 	        --disable-virtfs                    \
 	        --disable-brlapi                    \
 	        --disable-curses                    \
-- 
1.7.2.5
