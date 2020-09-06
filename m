From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  6 Sep 2020 10:00:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: add
 BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS
Message-ID: <20200906080028.2351575-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

makedumpfile only defines KV_BASE in makedumpfile.h with the following
architectures:
 - aarch64
 - arm
 - x86
 - x86_64
 - powerpc32
 - s390
 - ia64
 - sparc64

Fixes:
 - http://autobuild.buildroot.org/results/0e20c17bd604ee1168cc379061c120a2d8263e5f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/makedumpfile/Config.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/makedumpfile/Config.in b/package/makedumpfile/Config.in
index 8ae8579cea..a90ccbdf3c 100644
--- a/package/makedumpfile/Config.in
+++ b/package/makedumpfile/Config.in
@@ -1,9 +1,19 @@
+config BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_sparc64
+
 comment "makedumpfile needs a uClibc or glibc toolchain w/ wchar, dynamic library"
+	depends on BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
 
 config BR2_PACKAGE_MAKEDUMPFILE
 	bool "makedumpfile"
+	depends on BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # dlopen
 	depends on BR2_USE_WCHAR
-- 
2.28.0
