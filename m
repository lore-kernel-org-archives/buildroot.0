From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Feb 2017 21:34:58 +0100
Subject: [Buildroot] [PATCH] cbootimage: disable on musl
Message-ID: <1487104498-30443-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cbootimage uses non-standard u_intXX_t types instead of the C99 types
uintXX_t types, which prevents it from building with the musl C library.

A patch to fix this has been submitted upstream, but since there are
many many occurences of such types, the patch is a bit large to carry in
Buildroot, especially compared to the fact that having this package
building against musl is probably not a top priority.

So for now, simply disable this package on musl, until upstream fixes
the issue and releases a new version.

Fixes:

  http://autobuild.buildroot.net/results/61bdfb7e0ff9628190d9eb86e40c4c90e768b8e2

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cbootimage/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/cbootimage/Config.in b/package/cbootimage/Config.in
index 1a7fef0..b798e5d 100644
--- a/package/cbootimage/Config.in
+++ b/package/cbootimage/Config.in
@@ -1,9 +1,16 @@
 config BR2_PACKAGE_CBOOTIMAGE
 	bool "cbootimage"
 	depends on BR2_arm || BR2_armeb
+	# uses non-standard u_intXX_t types
+	# https://github.com/NVIDIA/cbootimage/pull/7
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  This project provides a tool which compiles BCT (Boot
 	  Configuration Table) images to place into the boot flash of
 	  a Tegra-based device.
 
 	  https://github.com/NVIDIA/cbootimage
+
+comment "cbootimage needs a glibc or uClibc toolchain"
+	depends on BR2_arm || BR2_armeb
+	depends on BR2_TOOLCHAIN_USES_MUSL
-- 
2.7.4
