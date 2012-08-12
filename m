From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:54:06 +0200
Subject: [Buildroot] [PATCH 18/36] package/qemu: add option to not install
	blobs
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-18-git-send-email-yann.morin.1998@free.fr>
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
index a43012f..e34680c 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -109,6 +109,22 @@ config BR2_PACKAGE_QEMU_SDL
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
 
 comment "QEMU requires python"
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 020d1a2..cd473f8 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -81,6 +81,10 @@ else
 QEMU_OPTS += --disable-sdl
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_BLOBS),)
+QEMU_OPTS += --disable-blobs
+endif
+
 #----------------------------------------------------------------------------
 # Package build process
 
-- 
1.7.2.5
