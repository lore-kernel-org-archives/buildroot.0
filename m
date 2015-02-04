From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed,  4 Feb 2015 01:34:04 +0100
Subject: [Buildroot] [PATCH 06/21] qemu: add missing indirect dependency on
	dynamic library for fdt
In-Reply-To: <1423010059-23446-1-git-send-email-arnout@mind.be>
References: <1423010059-23446-1-git-send-email-arnout@mind.be>
Message-ID: <1423010059-23446-7-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qemu/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 5882571..65421c0 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -54,10 +54,14 @@ comment "... or you can select emulator families to enable, below:"
 
 config BR2_PACKAGE_QEMU_SYSTEM
 	bool "Enable all systems emulation"
+	depends on !BR2_STATIC_LIBS # dtc
 	select BR2_PACKAGE_QEMU_FDT
 	help
 	  Say 'y' to build all system emulators/virtualisers that QEMU supports.
 
+comment "systems emulation needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_QEMU_LINUX_USER
 	bool "Enable all Linux user-land emulation"
 	help
@@ -86,11 +90,15 @@ comment "Misc. features"
 
 config BR2_PACKAGE_QEMU_FDT
 	bool "Enable FDT"
+	depends on !BR2_STATIC_LIBS # dtc
 	select BR2_PACKAGE_DTC
 	help
 	  Say 'y' here to have QEMU capable of constructing Device Trees,
 	  and passing them to the VMs.
 
+comment "FDT support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 endif # BR2_PACKAGE_QEMU_HAS_EMULS
 
 endif # BR2_PACKAGE_QEMU
-- 
2.1.4
