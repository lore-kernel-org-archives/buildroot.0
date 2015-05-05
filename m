From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  5 May 2015 22:59:32 +0200
Subject: [Buildroot] [PATCH] cryptsetup: disable on broken NIOS 2 toolchains
Message-ID: <1430859572-30900-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package triggers the infamous _gp issue with the external NIOS 2
toolchains, so let's disable it.

Fixes:

  http://autobuild.buildroot.org/results/ff4/ff456344eb5bc8af619c1f5d88be0cb758dd5075/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cryptsetup/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 89cc4b5..3d3c47d 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -8,6 +8,9 @@ config BR2_PACKAGE_CRYPTSETUP
 	depends on BR2_USE_MMU # lvm2, e2fsprogs
 	depends on !BR2_STATIC_LIBS # lvm2
 	depends on BR2_USE_WCHAR # util-linux
+	# Triggers the _gp link issue
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	help
 	  This tool helps manipulate dm-crypt and luks partitions for
 	  on-disk encryption.
@@ -17,3 +20,5 @@ config BR2_PACKAGE_CRYPTSETUP
 comment "cryptsetup needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
-- 
2.1.0
