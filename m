From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 21:35:35 +0200
Subject: [Buildroot] [git commit] boot/uboot: default to kconfig buildsystem
 for latest version
Message-ID: <20180425193545.E793588D96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21e3ae8a18bb77943c0a2492ab9ebf14cab333f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, the builsystem for uboot defaults to 'legacy', while the
default version is very well capable of using the 'kconfig' buildsystem
instead.

Having the 'legacy' buildsystem be the default in that case makes it
quite inconvenient for users: they would expect to be able to use e.g.
uboot-menuconfig et al. with the default uboot version.

Switch to using 'kconfig' when we use the latest version. Keep the
'legacy' as default for everything else.

Also, invert the 'legacy' and 'kconfig' entries in the choice: it is
nicer to have the recent and future-proof entry first.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Petr Vorel <petr.vorel@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index b980745d1b..95c17e3986 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -6,20 +6,21 @@ config BR2_TARGET_UBOOT
 if BR2_TARGET_UBOOT
 choice
 	prompt "Build system"
+	default BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
 
-config BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
-	bool "Legacy"
-	help
-	  Select this option if you use an old U-Boot (older than
-	  2015.04), so that we use the old build system.
-
 config BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
 	bool "Kconfig"
 	help
 	  Select this option if you use a recent U-Boot version (2015.04
 	  or newer), so that we use the Kconfig build system.
 
+config BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
+	bool "Legacy"
+	help
+	  Select this option if you use an old U-Boot (older than
+	  2015.04), so that we use the old build system.
+
 endchoice
 
 if BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
