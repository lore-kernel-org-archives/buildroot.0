From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Dec 2012 17:35:00 +0100
Subject: [Buildroot] [PATCH 27/51] package/qemu: add option to
	enable/disable the VNC frontend
In-Reply-To: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1355070924-8009-28-git-send-email-yann.morin.1998@free.fr>
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
index 2533e4d..0e9f717 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -80,6 +80,13 @@ endif # BR2_PACKAGE_QEMU_CUSTOM_TARGETS == ""
 
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
index 2d86d90..9296a87 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -114,6 +114,12 @@ ifneq ($(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS)),)
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
@@ -145,7 +151,10 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-bsd-user                  \
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
