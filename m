From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Oct 2014 00:38:19 +0200
Subject: [Buildroot] [PATCH 10/30] package/qemu: add option to not install
	blobs
In-Reply-To: <cover.1412719495.git.yann.morin.1998@free.fr>
References: <cover.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <2e97ba16cf2b98d168b6df82be15ea676c5789f3.1412719495.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in | 16 ++++++++++++++++
 package/qemu/qemu.mk   |  4 ++++
 2 files changed, 20 insertions(+)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 9c92388..1118eec 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -105,6 +105,22 @@ config BR2_PACKAGE_QEMU_SDL
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
 endif # QEMU_HAS_EMULS
 
 endif # BR2_PACKAGE_QEMU
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 10022cf..ab9862a 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -151,6 +151,10 @@ else
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
1.9.1
