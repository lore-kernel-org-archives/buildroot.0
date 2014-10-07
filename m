From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Oct 2014 00:38:16 +0200
Subject: [Buildroot] [PATCH 07/30] package/qemu: add option to
	enable/disable the VNC frontend
In-Reply-To: <cover.1412719495.git.yann.morin.1998@free.fr>
References: <cover.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <c6dd8b966482249f72c956413b15125f817f93d6.1412719495.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |  7 +++++++
 package/qemu/qemu.mk   | 11 ++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index f81b6ca..1c359e4 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -70,6 +70,13 @@ if QEMU_HAS_EMULS
 
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
index 24fc535..872bbb5 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -116,6 +116,12 @@ ifneq ($(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS)),)
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
@@ -141,7 +147,10 @@ define QEMU_CONFIGURE_CMDS
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
1.9.1
