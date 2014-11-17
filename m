From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Nov 2014 22:25:40 +0100
Subject: [Buildroot] [PATCH] package/qemu: add support for FDT
Message-ID: <1416259540-25482-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FDT is the Flat Device Tree, and allows QEMU to pass DTs to the VMs.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Although this looks like a feature patch, it does fix quite a number
of autobuild failures, so I think it is still worth going in for the
release.

It was due to my testing my full series, so I did not notice that
newer versions of Qemu needed FDT support for some of its system
emulations.

---
 package/qemu/Config.in | 10 ++++++++++
 package/qemu/qemu.mk   |  8 +++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index ebd2684..ff11208 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -54,6 +54,7 @@ comment "... or you can select emulator families to enable, below:"
 
 config BR2_PACKAGE_QEMU_SYSTEM
 	bool "Enable all systems emulation"
+	select BR2_PACKAGE_QEMU_FDT
 	help
 	  Say 'y' to build all system emulators/virtualisers that QEMU supports.
 
@@ -81,6 +82,15 @@ config BR2_PACKAGE_QEMU_SDL
 	  Say 'y' to enable the SDL frontend, that is, a graphical window
 	  presenting the VM's display.
 
+comment "Misc. features"
+
+config BR2_PACKAGE_QEMU_FDT
+        bool "Enable FDT"
+        select BR2_PACKAGE_DTC
+        help
+          Say 'y' here to have QEMU capable of constructing Device Trees,
+          and passing them to the VMs.
+
 endif # BR2_PACKAGE_QEMU_HAS_EMULS
 
 endif # BR2_PACKAGE_QEMU
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 253b2b8..9cff5ed 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -133,6 +133,13 @@ else
 QEMU_OPTS += --disable-sdl
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_FDT),y)
+QEMU_OPTS += --enable-fdt
+QEMU_DEPENDENCIES += dtc
+else
+QEMU_OPTS += --disable-fdt
+endif
+
 define QEMU_CONFIGURE_CMDS
 	( cd $(@D);                                     \
 		LIBS='$(QEMU_LIBS)'                     \
@@ -155,7 +162,6 @@ define QEMU_CONFIGURE_CMDS
 			--disable-brlapi                \
 			--disable-curses                \
 			--disable-curl                  \
-			--disable-fdt                   \
 			--disable-bluez                 \
 			--disable-guest-base            \
 			--disable-uuid                  \
-- 
1.9.1
