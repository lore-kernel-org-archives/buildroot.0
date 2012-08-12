From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:54:02 +0200
Subject: [Buildroot] [PATCH 14/36] package/qemu: add SDL frontends
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-14-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |    9 +++++++++
 package/qemu/qemu.mk   |    8 +++++++-
 2 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index ba9b1d6..4f678a7 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -72,6 +72,15 @@ config BR2_PACKAGE_QEMU_BSD_USER
 
 endif # BR2_PACKAGE_QEMU_CUSTOM_TARGETS == ""
 
+comment "Frontends"
+
+config BR2_PACKAGE_QEMU_SDL
+	bool "Enable SDL frontend"
+	select BR2_PACKAGE_SDL
+	help
+	  Say 'y' to enable the SDL frontend, that is, a graphical window
+	  presenting the VM's display.
+
 endif # BR2_PACKAGE_QEMU
 
 comment "QEMU requires python"
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index b1f7071..f210866 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -47,6 +47,13 @@ ifneq ($(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS)),)
 QEMU_OPTS += --target-list="$(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS))"
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_SDL),y)
+QEMU_OPTS += --enable-sdl
+QEMU_DEPENDENCIES += sdl
+else
+QEMU_OPTS += --disable-sdl
+endif
+
 #----------------------------------------------------------------------------
 # Package build process
 
@@ -72,7 +79,6 @@ define QEMU_CONFIGURE_CMDS
 	        --enable-vhost-net                  \
 	        --disable-xen                       \
 	        --disable-slirp                     \
-	        --disable-sdl                       \
 	        --disable-vnc                       \
 	        --disable-virtfs                    \
 	        --disable-brlapi                    \
-- 
1.7.2.5
