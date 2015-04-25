From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 10:17:01 +0200
Subject: [Buildroot] [git commit] QEMU: Enable package for MIPS targets
Message-ID: <20150425081715.A985180E42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b93fd39e2e20ffaeeb10cf1a3436c169413917e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow QEMU to be installed on MIPS targets. Also introduce a new
symbol (BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET) to hold the
architectures than can build and use QEMU on the target.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qemu/Config.in |    9 +++++++--
 package/qemu/qemu.mk   |    4 ++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index fff786d..25936e2 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -1,11 +1,16 @@
+config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
+	bool
+	# Only tested on these architectures
+	default y if BR2_i386 || BR2_mips || BR2_mipsel || BR2_x86_64
+
 comment "QEMU requires a toolchain with wchar, threads"
-	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
 	depends on BR2_USE_MMU
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR)
 
 config BR2_PACKAGE_QEMU
 	bool "QEMU"
-	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_USE_MMU # fork()
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index b73127b..decfc25 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -32,8 +32,8 @@ HOST_QEMU_DEPENDENCIES = host-pkgconf host-python host-zlib host-libglib2 host-p
 #       microblaze      microblaze
 #       mips            mips
 #       mipsel          mipsel
-#       mips64          ?
-#       mips64el        ?
+#       mips64          mips64
+#       mips64el        mips64el
 #       powerpc         ppc
 #       sh2a            not supported
 #       sh4             sh4
