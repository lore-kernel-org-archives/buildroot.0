From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 15:56:55 +0200
Subject: [Buildroot] [git commit] libseccomp: introduce
	BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
Message-ID: <20170507140348.0466D8274E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d299298b1c102eaaa9cfab1f0221829d5aeed1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of duplicating the architecture dependency between the main
option and the Config.in comment, add a
BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS hidden option.

This is done in preparation to enabling libseccomp on ARM.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libseccomp/Config.in | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/libseccomp/Config.in b/package/libseccomp/Config.in
index ddfe9f0..35317ad 100644
--- a/package/libseccomp/Config.in
+++ b/package/libseccomp/Config.in
@@ -1,8 +1,13 @@
+config BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_powerpc64 || BR2_powerpc
+
 config BR2_PACKAGE_LIBSECCOMP
 	bool "libseccomp"
-	depends on BR2_aarch64 || BR2_mips || BR2_mipsel || BR2_mips64 || \
-		BR2_mips64el || BR2_i386 || BR2_x86_64 || BR2_powerpc64 || \
-		BR2_powerpc
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 	help
 	  High level interface to the Linux Kernel's seccomp filter
@@ -17,6 +22,5 @@ config BR2_PACKAGE_LIBSECCOMP
 	  https://github.com/seccomp/libseccomp
 
 comment "libseccomp needs a toolchain w/ headers >= 3.12"
-	depends on BR2_aarch64 || BR2_mips || BR2_mipsel || BR2_mips64 || \
-		BR2_mips64el || BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
