From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Feb 2014 15:25:34 +0100
Subject: [Buildroot] [PATCH] arch: remove sh2, sh3 and sh3eb support
Message-ID: <1391523934-8394-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch removes the sh2, sh3 and sh3eb support, because the user
base is inexistent, and the Linux support for these architectures is
poor. The sh2a support is preserved, because at least one user
expressed interest in this architecture, and is actually using it:

  http://lists.busybox.net/pipermail/buildroot/2013-April/070399.html

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy          | 18 ++++++++++++++++++
 arch/Config.in.sh         | 15 ++-------------
 package/kexec/Config.in   |  2 +-
 package/mplayer/Config.in |  2 +-
 package/qemu/qemu.mk      |  3 ---
 package/uclibc/Config.in  |  1 -
 6 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 8918184..2fe9cf9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,24 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.02"
 
+config BR2_sh2
+	bool "sh2 support removed"
+	help
+	  Due to an inexistent user base and generally poor Linux
+	  support, the support for the SH2 architecture was removed.
+
+config BR2_sh3
+	bool "sh3 support removed"
+	help
+	  Due to an inexistent user base and generally poor Linux
+	  support, the support for the SH3 architecture was removed.
+
+config BR2_sh3eb
+	bool "sh3eb support removed"
+	help
+	  Due to an inexistent user base and generally poor Linux
+	  support, the support for the SH3eb architecture was removed.
+
 config BR2_PACKAGE_LZMA
 	bool "lzma target package has been removed"
 	select BR2_LEGACY
diff --git a/arch/Config.in.sh b/arch/Config.in.sh
index 10d4ef6..1bdea37 100644
--- a/arch/Config.in.sh
+++ b/arch/Config.in.sh
@@ -5,14 +5,8 @@ choice
 	help
 	  Specific CPU variant to use
 
-config BR2_sh2
-	bool "sh2 (SH2 big endian)"
 config BR2_sh2a
 	bool "sh2a (SH2A big endian)"
-config BR2_sh3
-	bool "sh3 (SH3 little endian)"
-config BR2_sh3eb
-	bool "sh3eb (SH3 big endian)"
 config BR2_sh4
 	bool "sh4 (SH4 little endian)"
 config BR2_sh4eb
@@ -24,10 +18,7 @@ config BR2_sh4aeb
 endchoice
 
 config BR2_ARCH
-	default "sh2"		if BR2_sh2
 	default "sh2a"		if BR2_sh2a
-	default "sh3"		if BR2_sh3
-	default "sh3eb"		if BR2_sh3eb
 	default "sh4"		if BR2_sh4
 	default "sh4eb"		if BR2_sh4eb
 	default "sh4a"		if BR2_sh4a
@@ -35,7 +26,5 @@ config BR2_ARCH
 	default "sh64"		if BR2_sh64
 
 config BR2_ENDIAN
-	default "LITTLE"	if BR2_sh3 || BR2_sh4 || BR2_sh4a || \
-				   BR2_sh64
-	default "BIG"		if BR2_sh2 || BR2_sh2a || BR2_sh3eb || \
-				   BR2_sh4eb || BR2_sh4aeb
+	default "LITTLE"	if BR2_sh4 || BR2_sh4a || BR2_sh64
+	default "BIG"		if BR2_sh2a || BR2_sh4eb || BR2_sh4aeb
diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index 955a5f4..0139c17 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_KEXEC
 	bool "kexec"
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
 		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
-		BR2_powerpc || BR2_sh4 || BR2_sh4a || BR2_sh3
+		BR2_powerpc || BR2_sh4 || BR2_sh4a
 	help
 	  Kexec is a user space utiltity for loading another kernel
 	  and asking the currently running kernel to do something with it.
diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index c8f1480..ae273e4 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MPLAYER
 	bool "mplayer"
 	# Those architectures are not supported by MPlayer
-	depends on !(BR2_sh2 || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
+	depends on !(BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
 			|| BR2_microblaze || BR2_aarch64 || BR2_nios2)
 	# Broken support for <ARMv5
 	depends on !(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t \
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index a89bf7d..093ae64 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -36,10 +36,7 @@ HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman
 #       mips64          ?
 #       mips64el        ?
 #       powerpc         ppc
-#       sh2             not supported
 #       sh2a            not supported
-#       sh3             not supported
-#       sh3eb           not supported
 #       sh4             sh4
 #       sh4eb           sh4eb
 #       sh4a            ?
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 77756e3..0565ee9 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -241,7 +241,6 @@ config BR2_UCLIBC_SH_TYPE
 	string
 	depends on BR2_UCLIBC_TARGET_ARCH = "sh"
 	default SH2A if BR2_sh2a
-	default SH3  if BR2_sh3 || BR2_sh3eb
 	default SH4  if BR2_sh4 || BR2_sh4eb
 
 config BR2_UCLIBC_SPARC_TYPE
-- 
1.8.3.2
