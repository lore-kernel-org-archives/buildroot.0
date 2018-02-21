From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Wed, 21 Feb 2018 17:55:52 +0100
Subject: [Buildroot] [PATCH] package/gpsd: disable profiling support on ARC
Message-ID: <1519232152-26469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 With the currently used ARC glibc version the profiling build fails with
linking error to __mcount. The ARC glibc version arc-2018.03-eng007+
fixes this, therefore when glibc is bumped, this restriction can be
removed.

Fixes:
    http://autobuild.buildroot.net/results/88870f5bf4aff557d8eac4e1cc5d3e397e607af0/

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/gpsd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index d9ab7b7..849d22f 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -38,6 +38,8 @@ config BR2_PACKAGE_GPSD_PROFILING
 	bool "profiling support"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_aarch64
+	# Needs glibc for ARC arc-2018.03-eng007+ for correct __mcount linking
+	depends on !BR2_arc
 
 comment "profiling support not available with uClibc-based toolchain"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
-- 
2.7.4
