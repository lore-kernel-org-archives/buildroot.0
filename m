From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Jan 2017 14:02:25 +0100
Subject: [Buildroot] [git commit] flac: fix benchmark linking issue with
	older glibc versions
Message-ID: <20170110130345.1051A80AED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7a2e115a75bd28dff4bb81d66a8667b12bfc368
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/b64/b643824d797050d7c001a3b72598158d8f1c6128/
http://autobuild.buildroot.net/results/a2f/a2f2d7b4e9e7b57bc8691e3ec29ecf818be3f79b/

The benchmark tool uses clock_gettime which is available in librt instead of
libc in older glibc versions.  The build system correctly links with -lrt on
Linux systems, but misdetects non-x86 linux systems as !linux, causing build
failures.

Add a patch to relax the linux OS detection to also work on non-x86 systems.

Patch submitted upstream:
http://lists.xiph.org/pipermail/flac-dev/2017-January/006103.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-configure.ac-relax-linux-OS-detection.patch | 35 ++++++++++++++++++++++
 package/flac/flac.mk                               |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/package/flac/0001-configure.ac-relax-linux-OS-detection.patch b/package/flac/0001-configure.ac-relax-linux-OS-detection.patch
new file mode 100644
index 0000000..baf07bc
--- /dev/null
+++ b/package/flac/0001-configure.ac-relax-linux-OS-detection.patch
@@ -0,0 +1,35 @@
+From 8589b44c573d4228a9df3ba7bffdfdf584e7b033 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Mon, 9 Jan 2017 21:38:29 +0100
+Subject: [PATCH] configure.ac: relax linux OS detection
+
+Not all linux hosts match the *-pc-linux-gnu wildcard, causing build
+failures for older glibc versions where we need to link with -lrt for
+clock_gettime - E.G.:
+
+ - arm-unknown-linux-musleabihf
+ - powerpc-unknown-linux-gnuspe
+ - bfin-linux-linux-uclibc
+ ..
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 070ab357..235d2717 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -186,7 +186,7 @@ esac
+ AM_CONDITIONAL(OS_IS_WINDOWS, test "x$os_is_windows" = xyes)
+ 
+ case "$host" in
+-	*-pc-linux-gnu)
++	*-linux-*)
+ 		sys_linux=true
+ 		AC_DEFINE(FLAC__SYS_LINUX)
+ 		AH_TEMPLATE(FLAC__SYS_LINUX, [define if building for Linux])
+-- 
+2.11.0
+
diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index 5020d8a..43e0410 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -11,6 +11,8 @@ FLAC_INSTALL_STAGING = YES
 FLAC_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 FLAC_LICENSE = Xiph BSD-like (libFLAC), GPLv2+ (tools), LGPLv2.1+ (other libraries)
 FLAC_LICENSE_FILES = COPYING.Xiph COPYING.GPL COPYING.LGPL
+# 0001-configure.ac-relax-linux-OS-detection.patch patches configure.ac
+FLAC_AUTORECONF = YES
 FLAC_CONF_OPTS = \
 	--disable-cpplibs \
 	--disable-xmms-plugin \
