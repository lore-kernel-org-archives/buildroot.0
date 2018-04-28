From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 15:24:38 +0200
Subject: [Buildroot] [git commit] qemu: introduce
 BR2_PACKAGE_HOST_QEMU_{SYSTEM, USER}_ARCH_SUPPORTS
Message-ID: <20180428132513.BE4CE88F56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7f74dced987a81ebd98de8dd2f70f5effda7463
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Not all architectures are supported by both the system emulation and
user-mode emulation in Qemu, so a single
BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS doesn't work very well.

Therefore, this commit introduces the
BR2_PACKAGE_HOST_QEMU_{SYSTEM,USER}_ARCH_SUPPORTS hidden options. We
keep the BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS option for the (numerous)
architectures supported by both system emulation and user-mode
emulation.

The 'select' logic to make sure that at least either system emulation
or user-mode emulation is selected is reworked, and done carefully to
avoid recursive Kconfig dependencies.

For now BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS and
BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS are the same, but they will
become different in a follow-up commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/Config.in.host | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 160778c834..78ff052983 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -19,11 +19,21 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_x86_64
 	depends on !BR2_powerpc_620 && !BR2_powerpc_630 && !BR2_powerpc_970
 
+config BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS
+	bool
+	default y if BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
+
+config BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
+	bool
+	default y if BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
+
 config BR2_PACKAGE_HOST_QEMU
 	bool "host qemu"
-	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS || BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE \
-		if !BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE
+		if !BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE && BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE \
+		if !BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 	help
 	  QEMU is a generic and open source machine emulator and
 	  virtualizer.
@@ -38,12 +48,14 @@ comment "Emulators selection"
 
 config BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE
 	bool "Enable system emulation"
+	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS
 	help
 	  Enables the build of the system emulator, which allows to
 	  boot an entire system in Qemu.
 
 config BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
 	bool "Enable Linux user-land emulation"
+	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 	help
 	  Enables the build of the user-land emulator, which allows to
 	  run user-space applications.
