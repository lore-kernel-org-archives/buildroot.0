From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Aug 2016 23:38:35 +0200
Subject: [Buildroot] [git commit] android-tools: disable on some
	architecture with old kernel headers
Message-ID: <20160828214316.CEAAE817EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2e178d6b45dfc5b8d1d50fcbbfc0bec5ebf1ae2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The android-tools code is somewhat ugly, and defines its own u64 typedef
becore including kernel headers. Unfortunately, there are specific cases
where that doesn't work properly.

The android-tools code defines u64 as "unsigned long long", which is now
correct in the kernel. However, it used to be a time where u64 was
defined as "unsigned long" on a few 64 bits architecture (at least
PowerPC64 and MIPS64). The kernel headers have introduced a
__SANE_USERSPACE_TYPES__ macro that userspace can define in order to get
the "sane" definition, i.e "unsigned long long" for u64.

Unfortunately, this __SANE_USERSPACE_TYPES__ mechanism only appeared in
3.10 on PowerPC64, and in 3.16 on MIPS64.

Since android-tools is not using the autotools, and there's no easy way
to test types with the C pre-processor, we simply add some more
Config.in dependencies. They are a bit convoluted, but that's what the
dependency really is.

In our autobuilders, this issue was only showing up with an old MIPS64
toolchain that uses 3.9 kernel headers.

Also, since the problem is limited to the "fastboot" tool, the
dependency is only added for fastboot. Both adb and adbd build fine with
this toolchain.

Fixes:

  http://autobuild.buildroot.net/results/ce45c995bd6abda6487ae3a11b4f45a7b9b3f8eb/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/android-tools/Config.in | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
index 2503a28..19772ad 100644
--- a/package/android-tools/Config.in
+++ b/package/android-tools/Config.in
@@ -17,6 +17,21 @@ config BR2_PACKAGE_ANDROID_TOOLS
 
 if BR2_PACKAGE_ANDROID_TOOLS
 
+# We need kernel headers that support the __SANE_USERSPACE_TYPES__
+# mechanism for 64 bits architectures, so that u64 gets defined as
+# "unsigned long long" and not "unsigned long". We know that >= 3.16
+# is needed for MIPS64 (kernel commit
+# f4b3aa7cd9d32407670e67238c5ee752bb98f481) and >= 3.10 is needed for
+# PowerPC64 (kernel commit
+# 2c9c6ce0199a4d252e20c531cfdc9d24e39235c0). Without this, the build
+# fails with a bad redefinition of u64 (the android-tools fastboot
+# code defines it as "unsigned long long").
+config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT_GOOD_KERNEL_HEADERS
+	bool
+	default y if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 && (BR2_powerpc64 || BR2_powerpc64le)
+	default y if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16 && (BR2_mips64 || BR2_mips64el)
+	default y if !BR2_powerpc64 && !BR2_powerpc64le && !BR2_mips64 && !BR2_mips64el
+
 config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
 	bool "fastboot"
 	select BR2_PACKAGE_LIBSELINUX
@@ -25,6 +40,7 @@ config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
 	depends on !BR2_STATIC_LIBS # libselinux
 	depends on BR2_TOOLCHAIN_USES_GLIBC # libselinux
 	depends on !BR2_arc # libselinux
+	depends on BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT_GOOD_KERNEL_HEADERS
 	help
 	  This option will build and install the fastboot utility for
 	  the target, which can be used to reflash other target devices
@@ -35,6 +51,10 @@ comment "fastboot needs a glibc toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_USES_GLIBC
 
+comment "fastboot needs headers >= 3.10 (PowerPC64), headers >= 3.16 (MIPS64)"
+	depends on !BR2_arc
+	depends on !BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT_GOOD_KERNEL_HEADERS
+
 config BR2_PACKAGE_ANDROID_TOOLS_ADB
 	bool "adb"
 	depends on BR2_USE_MMU # uses fork()
