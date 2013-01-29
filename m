From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jan 2013 23:43:50 +0100
Subject: [Buildroot] [PATCH 06/29] package/qemu: add option to
	enable/disable the VNC frontend
In-Reply-To: <cover.1359498903.git.yann.morin.1998@free.fr>
References: <cover.1359498903.git.yann.morin.1998@free.fr>
Message-ID: <daea1b92113c38f8037cbdb6bdda7ec06eeaa10e.1359498903.git.yann.morin.1998@free.fr>
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
index ad934ae..d904566 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -78,6 +78,13 @@ endif # BR2_PACKAGE_QEMU_CUSTOM_TARGETS == ""
 
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
index 1dd0c98..c122be7 100644
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
@@ -146,7 +152,10 @@ define QEMU_CONFIGURE_CMDS
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
