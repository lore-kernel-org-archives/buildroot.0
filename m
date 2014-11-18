From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 21:58:54 +0100
Subject: [Buildroot] [git commit] package/qemu: add support for FDT
Message-ID: <20141118210108.6BA56B48EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=645b5763fac65dd7b9817d1788784d44220ff711
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

FDT is the Flat Device Tree, and allows QEMU to pass DTs to the VMs.

Fixes:
http://autobuild.buildroot.net/results/7e8/7e8c6fecbb22e8835269171b8bfe6d5bda300dcc/
http://autobuild.buildroot.net/results/5e0/5e0ec37894d3d88962fb0fee9a3753b83fe18b71/
http://autobuild.buildroot.net/results/936/936c565b6dc883beea4fac47c2cb2b47d3e84f66/
http://autobuild.buildroot.net/results/2ab/2abe26be5be5e72d6e166dd9b63b61523f63e2f5/

And many more.

[Peter: add autobuilder references]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/Config.in |   10 ++++++++++
 package/qemu/qemu.mk   |    8 +++++++-
 2 files changed, 17 insertions(+), 1 deletions(-)

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
