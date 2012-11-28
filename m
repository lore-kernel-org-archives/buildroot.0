From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Nov 2012 00:54:27 +0100
Subject: [Buildroot] [PATCH 28/51] package/qemu: add SDL frontends
In-Reply-To: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1354146890-27380-29-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |    9 +++++++++
 package/qemu/qemu.mk   |   10 +++++++++-
 2 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 29fd513..baa7037 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -79,4 +79,13 @@ config BR2_PACKAGE_QEMU_BSD_USER
 
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
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index d77e3b8..75969d5 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -105,6 +105,7 @@ QEMU_OPTS =
 QEMU_VARS =                                                                         \
     PYTHON=$(HOST_DIR)/usr/bin/python                                               \
     PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages    \
+    SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config                                    \
 
 ifeq ($(BR2_PACKAGE_QEMU_SYSTEM),y)
 QEMU_OPTS += --enable-system
@@ -128,6 +129,14 @@ ifneq ($(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS)),)
 QEMU_OPTS += --target-list="$(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS))"
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_SDL),y)
+QEMU_OPTS += --enable-sdl
+QEMU_DEPENDENCIES += sdl
+QEMU_VARS += SDL_CONFIG=$(BR2_STAGING_DIR)/usr/bin/sdl-config
+else
+QEMU_OPTS += --disable-sdl
+endif
+
 # Note: although QEMU uses a ./configure script, it is not compatible with
 #       the traditional autotools options (eg. --target et al.), so we can
 #       not use the autotools-package infrastructure. So we have to use the
@@ -155,7 +164,6 @@ define QEMU_CONFIGURE_CMDS
 	        --enable-vhost-net                  \
 	        --disable-xen                       \
 	        --disable-slirp                     \
-	        --disable-sdl                       \
 	        --disable-vnc                       \
 	        --disable-virtfs                    \
 	        --disable-brlapi                    \
-- 
1.7.2.5
