From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  4 Mar 2017 10:17:39 +0100
Subject: [Buildroot] [PATCH] qemu: disable Qemu user-land emulation for
	uClibc toolchains
Message-ID: <1488619059-1499-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fixes:
http://autobuild.buildroot.org/results/69c/69c66f1876f0d8dba1bd71ee109df371577d8dda
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/qemu/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index f4a75fc..3036743 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -72,13 +72,15 @@ config BR2_PACKAGE_QEMU_LINUX_USER
 	bool "Enable all Linux user-land emulation"
 	# Incompatible "struct sigevent" definition on musl
 	depends on !BR2_TOOLCHAIN_USES_MUSL
+	# Incompatible "struct sigcontext" definition on uClibc
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	help
 	  Say 'y' to build all Linux user-land emulators that QEMU supports.
 
 # Note: bsd-user can not be build on Linux
 
-comment "Linux user-land emulation needs a glibc or uClibc toolchain"
-	depends on BR2_TOOLCHAIN_USES_MUSL
+comment "Linux user-land emulation needs a glibc toolchain"
+	depends on BR2_TOOLCHAIN_USES_MUSL ||?BR2_TOOLCHAIN_USES_UCLIBC
 
 endif # BR2_PACKAGE_QEMU_CUSTOM_TARGETS == ""
 
-- 
2.7.4
