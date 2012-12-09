From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Dec 2012 17:35:03 +0100
Subject: [Buildroot] [PATCH 30/51] package/qemu: add option to not install
	blobs
In-Reply-To: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1355070924-8009-31-git-send-email-yann.morin.1998@free.fr>
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
index c85568d..8d647c9 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -115,4 +115,20 @@ config BR2_PACKAGE_QEMU_SDL
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
index eb95611..1100621 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -149,6 +149,10 @@ else
 QEMU_OPTS += --disable-sdl
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_BLOBS),)
+QEMU_OPTS += --disable-blobs
+endif
+
 # Note: although QEMU uses a ./configure script, it is not compatible with
 #       the traditional autotools options (eg. --target et al.), so we have
 #       to override the default provided by the autotools-package infra, and
-- 
1.7.2.5
