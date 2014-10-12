From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 19:14:47 +0200
Subject: [Buildroot] [git commit] package/qemu: add SDL frontends
Message-ID: <20141012172417.DA8FBB03FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8956c336eb5d1dc29faa3a003fb58170682a4d6d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use BR2_PACKAGE_QEMU_HAS_EMULS, only add SDL_CONFIG once]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/Config.in |   17 +++++++++++++++++
 package/qemu/qemu.mk   |    9 ++++++++-
 2 files changed, 25 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index f29f848..cd7fed7 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -64,4 +64,21 @@ config BR2_PACKAGE_QEMU_LINUX_USER
 
 endif # BR2_PACKAGE_QEMU_CUSTOM_TARGETS == ""
 
+config BR2_PACKAGE_QEMU_HAS_EMULS
+    def_bool y
+    depends on BR2_PACKAGE_QEMU_SYSTEM || BR2_PACKAGE_QEMU_LINUX_USER || BR2_PACKAGE_QEMU_CUSTOM_TARGETS != ""
+
+if BR2_PACKAGE_QEMU_HAS_EMULS
+
+comment "Frontends"
+
+config BR2_PACKAGE_QEMU_SDL
+	bool "Enable SDL frontend"
+	select BR2_PACKAGE_SDL
+	help
+	  Say 'y' to enable the SDL frontend, that is, a graphical window
+	  presenting the VM's display.
+
+endif # BR2_PACKAGE_QEMU_HAS_EMULS
+
 endif # BR2_PACKAGE_QEMU
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 5d9fd48..8735b46 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -115,6 +115,14 @@ ifneq ($(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS)),)
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
 define QEMU_CONFIGURE_CMDS
 	( cd $(@D);                                 \
 	    LIBS='$(QEMU_LIBS)'                     \
@@ -132,7 +140,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-bsd-user                  \
 	        --disable-xen                       \
 	        --disable-slirp                     \
-	        --disable-sdl                       \
 	        --disable-vnc                       \
 	        --disable-virtfs                    \
 	        --disable-brlapi                    \
