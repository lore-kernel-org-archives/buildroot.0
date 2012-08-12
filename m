From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:54:03 +0200
Subject: [Buildroot] [PATCH 15/36] package/qemu: add option to
	enable/disable the VNC frontend
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-15-git-send-email-yann.morin.1998@free.fr>
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
index 4f678a7..bf24126 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -74,6 +74,13 @@ endif # BR2_PACKAGE_QEMU_CUSTOM_TARGETS == ""
 
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
index f210866..caed5ee 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -47,6 +47,12 @@ ifneq ($(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS)),)
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
@@ -79,7 +85,10 @@ define QEMU_CONFIGURE_CMDS
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
