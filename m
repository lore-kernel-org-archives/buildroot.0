From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Feb 2013 15:06:46 +0100
Subject: [Buildroot] [PATCH 09/29] package/qemu: add option to not install
	blobs
In-Reply-To: <cover.1359899108.git.yann.morin.1998@free.fr>
References: <cover.1359899108.git.yann.morin.1998@free.fr>
Message-ID: <d071ef2f6d949cc0ee9613f5e37f530b004cb423.1359899108.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |   16 ++++++++++++++++
 package/qemu/qemu.mk   |    4 ++++
 2 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index ef0d8f7..a33c700 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -99,4 +99,20 @@ config BR2_PACKAGE_QEMU_SDL
 	  Say 'y' to enable the SDL frontend, that is, a graphical window
 	  presenting the VM's display.
 
+comment "Misc. features"
+
+config BR2_PACKAGE_QEMU_BLOBS
+	bool "Install binary blobs"
+	default y
+	help
+	  Say 'y' here (the default) to install binary blobs (such as BIOS
+	  or firmwares for the different machines simulated by QEMU).
+	  Say 'n' to not install those blobs.
+	  
+	  Note: Some machines may be unbootable without those blobs.
+	        If unsure, say 'y'.
+	  
+	  Note2: This has nothing to do with the licensing of the blobs;
+	         some (most?) even have a free and/or open source license.
+
 endif # BR2_PACKAGE_QEMU
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index f05c7ec..59d759f 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -149,6 +149,10 @@ else
 QEMU_OPTS += --disable-sdl
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_BLOBS),)
+QEMU_OPTS += --disable-blobs
+endif
+
 define QEMU_CONFIGURE_CMDS
 	( cd $(@D);                                 \
 	    LIBS='$(QEMU_LIBS)'                     \
-- 
1.7.2.5
