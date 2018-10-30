From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Oct 2018 21:02:51 +0100
Subject: [Buildroot] [git commit] qemu: switch to sdl2
Message-ID: <20181030201013.11EEA835D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0646d67c1d8e5ba4a1376a215d0c7e69751835df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 2.12.0 and
https://github.com/qemu/qemu/commit/e52c6ba34149b4f39c3fd60e59ee32b809db2bfa,
SDL 1.2 is deprecated so switch to SDL 2.0 as SDL 1.2 will be removed in
the last release of 2018

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/Config.in | 8 +++++---
 package/qemu/qemu.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index d7390141f9..33d4cccd7b 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -118,13 +118,15 @@ comment "Frontends"
 
 config BR2_PACKAGE_QEMU_SDL
 	bool "Enable SDL frontend"
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_SDL
-	select BR2_PACKAGE_SDL_X11
+	depends on !BR2_STATIC_LIBS # sdl2
+	select BR2_PACKAGE_SDL2
 	help
 	  Say 'y' to enable the SDL frontend, that is, a graphical
 	  window presenting the VM's display.
 
+comment "SDL frontend needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 comment "Misc. features"
 
 config BR2_PACKAGE_QEMU_FDT
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 968c8073e4..5bdf390bc9 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -62,8 +62,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_QEMU_SDL),y)
 QEMU_OPTS += --enable-sdl
-QEMU_DEPENDENCIES += sdl
-QEMU_VARS += SDL_CONFIG=$(BR2_STAGING_DIR)/usr/bin/sdl-config
+QEMU_DEPENDENCIES += sdl2
+QEMU_VARS += SDL2_CONFIG=$(BR2_STAGING_DIR)/usr/bin/sdl2-config
 else
 QEMU_OPTS += --disable-sdl
 endif
